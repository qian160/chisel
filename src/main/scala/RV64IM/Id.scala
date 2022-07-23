package RV64
import OptCode._

import chisel3._
import chisel3.util._
/*
    JUST LET EX STAGE TO KNOW WHAT TO DO
*/
//need to interact with regfile to get the oprand
class Id extends Module{
    val io = IO(new Bundle{
        val pc            = Input(Bits(64.W))
        val inst_i        = Input(Bits(32.W))
        val rf2Id         = Input(new rf2Id())              //REG OPRAND
        //read after load, maybe wrapped into a bundle is better? 
        val prev_is_load  = Input(Bool())
        val load_dest     = Input(Bits(5.W))
        
        val exForwarding  = Input(new Forwarding)
        val memForwarding = Input(new Forwarding)
        val wbForwarding  = Input(new Forwarding)

        val stall_req     = Output(Bool())         //read after load 
        val id2Rf         = Output(new id2Rf)      //READ regfile
        val decInfo       = Output(new decInfo)
        val branchOp      = Output(new branchOp)
        val flush_req     = Output(Bool())
    })

    val oprand1  = Wire(Bits(64.W));    oprand1     := 0.U
    val oprand2  = Wire(Bits(64.W));    oprand2     := 0.U
    val wreg     = Wire(Bool());        wreg        := false.B

    val inst     = io.inst_i
    val funct3   = inst(14,12)

    //information about reg oprands
    val regData1 = io.rf2Id.RegData1
    val regData2 = io.rf2Id.RegData2
    val rd       = inst(11,7)
    val rs1      = inst(19,15)
    val rs2      = inst(24,20)

    val imm_I    = inst(31,20)      //range [0, 4095]
    val imm_S    = Cat(inst(31,25), inst(11,7))
    val imm_B    = Cat(inst(31), inst(7), inst(30,25), inst(11,8)) << 1

    val branch_target   = imm_B + io.pc - 4.U   /*minus 4 is necessary*/

    val decRes   = ListLookup(inst,DecTable.defaultDec,DecTable.decMap)     //returns list(instType,opt)
    val instType = decRes(DecTable.TYPE)    //R I S B J U
    val decOpt   = decRes(DecTable.OPT)     //sometimes useless,like InstType.B

    val rs1Val  = PriorityMux(Seq(
        (rs1 === 0.U,                    0.U),                   // reading x0 always gives 0
        (rs1 === io.wbForwarding.addr,   io.wbForwarding.data),  // forwarding from WB
        (rs1 === io.memForwarding.addr,  io.memForwarding.data), // forwarding from MEM
        (rs1 === io.exForwarding.addr,   io.exForwarding.data),  // forwarding from EX
        (true.B,                         regData1))              // from the register file
    )

    val rs2Val  = PriorityMux(Seq(
        (rs2 === 0.U,                    0.U),                   // reading x0 always gives 0
        (rs2 === io.wbForwarding.addr,   io.wbForwarding.data),  // forwarding from WB
        (rs2 === io.memForwarding.addr,  io.memForwarding.data), // forwarding from MEM
        (rs2 === io.exForwarding.addr,   io.exForwarding.data),  // forwarding from EX
        (true.B,                         regData2))              // from the register file
    )
    //default is all 0. just modify the needed information in the next steps
    io.decInfo      := 0.U.asTypeOf(new decInfo)
    io.branchOp     := 0.U.asTypeOf(new branchOp)
    io.flush_req    := false.B
    io.stall_req    := false.B
    //load
    when(inst(6,0) === "b0000011".U ){
        io.decInfo.loadOp.isLoad := true.B
        //io.decInfo.loadOp.addr := ?   not known yet, let ex fill this
        io.decInfo.loadOp.Width  :=  MuxLookup(decOpt,0.U,Seq(
            LB  ->  0.U,    LH  ->  1.U,    LW  ->  2.U,    //LD  ->  3.U
        ))
        io.decInfo.loadOp.dest   := rd
    }

    //read after load
    when(io.prev_is_load){
        when(io.load_dest === rs1 | io.load_dest === rs2){
            io.stall_req    := true.B
        }
    }

    //offer different op information according to the InstType
    switch(instType){
        is(InstType.BAD){
            oprand1         := 0.U 
            oprand2         := 0.U 
            wreg            := false.B
        }
        is(InstType.R){
            oprand1         := rs1Val
            oprand2         := rs2Val
            wreg            := true.B
        }
        is(InstType.I){     //the 2 oprands are used to calculate the address in ex
            oprand1         := rs1Val
            oprand2         := imm_I
            wreg            := true.B
            //JALR is also I type, and need special care
            when(decRes(DecTable.OPT) === OptCode.JALR){
                oprand1     := io.pc
                oprand2     := 4.U
                wreg        := true.B
            }
        }
        is(InstType.S){
            //sb rs2, imm(rs1)
            oprand1         := rs1Val
            oprand2         := imm_S
            wreg            := false.B
            io.decInfo.rd   := 0.U      //avoid incorrect bypass
            //store address is not yet known
            io.decInfo.storeOp.data  :=  rs2Val
            io.decInfo.storeOp.en    :=  true.B
            io.decInfo.storeOp.Width :=  MuxLookup(decOpt, 0.U, Seq(
                SB  ->  0.U,    SH  ->  1.U,    SW  ->  2.U,//    SD  ->  3.U
            ))
        }
        is(InstType.B){
            val taken   = MuxLookup(funct3, false.B, Seq(
                BEQ  ->  (rs1Val  === rs2Val),
                BNE  ->  (rs1Val  =/= rs2Val),
                BLT  ->  (rs1Val.asSInt <  rs2Val.asSInt),
                BGE  ->  (rs1Val.asSInt >= rs2Val.asSInt),
                BLTU ->  (rs1Val  <  rs2Val),
                BGEU ->  (rs1Val  >= rs2Val),
            ))
            io.branchOp.taken   := taken
            io.branchOp.target  := branch_target
            io.flush_req        := Mux(taken, true.B, false.B)
        }
    }

    io.decInfo.oprand1   := oprand1
    io.decInfo.oprand2   := oprand2
    io.decInfo.rd        := rd
    io.decInfo.InstType  := instType
    io.decInfo.aluop     := decOpt
    io.decInfo.wreg      := wreg

    io.id2Rf.ReadIdx1   := rs1
    io.id2Rf.ReadIdx2   := rs2

}