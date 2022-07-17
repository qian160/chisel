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
        val id_inst_i     = Input(Bits(32.W))
        val rf2Id         = Input(new rf2Id())              //REG OPRAND
        
        val exForwarding  = Input(new Forwarding)
        val memForwarding = Input(new Forwarding)
        val wbForwarding  = Input(new Forwarding)

        val id2Rf         = Flipped(new id2Rf)      //READ INDEX
        val exInfo        = Flipped(new exInfo)

    })


    val oprand1  = Wire(Bits(64.W));    oprand1     := 0.U
    val oprand2  = Wire(Bits(64.W));    oprand2     := 0.U
    val wreg     = Wire(Bool());        wreg        := false.B

    val inst     = io.id_inst_i

    //information about reg oprands
    val regData1 = io.rf2Id.RegData1
    val regData2 = io.rf2Id.RegData2
    val rd       = inst(11,7)
    val rs1      = inst(19,15)
    val rs2      = inst(24,20)
    val imm_I    = inst(31,20)      //range [0, 4095]
    val imm_S    = Cat(inst(31,25), inst(11,7))

    val decRes   = ListLookup(inst,DecTable.defaultDec,DecTable.decMap)     //returns list(instType,opt)
    val instType = decRes(DecTable.TYPE)
    val aluop    = decRes(DecTable.OPT)

    val rs1Val  = PriorityMux(Seq(
        (rs1 === 0.U,                    0.U),                   // reading x0 always gives 0
        (rs1 === io.wbForwarding.addr,   io.wbForwarding.data),  // forwarding from EX
        (rs1 === io.memForwarding.addr,  io.memForwarding.data), // forwarding from MEM
        (rs1 === io.exForwarding.addr,   io.exForwarding.data),  // forwarding from MEM
        (true.B,                         regData1))              // from the register file
    )

    val rs2Val  = PriorityMux(Seq(
        (rs2 === 0.U,                    0.U),                   // reading x0 always gives 0
        (rs2 === io.wbForwarding.addr,   io.wbForwarding.data),  // forwarding from EX
        (rs2 === io.memForwarding.addr,  io.memForwarding.data), // forwarding from MEM
        (rs2 === io.exForwarding.addr,   io.exForwarding.data),  // forwarding from MEM
        (true.B,                         regData2))              // from the register file
    )    

    //default
    io.exInfo.storeOp       := 0.U.asTypeOf(new storeOp)

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
        is(InstType.I){     //CALCULATE THE ADDRESS IN EX
            oprand1         := rs1Val
            oprand2         := imm_I
            wreg            := true.B
            //if load , like lb rd, imm(rs1),use rs1 and imm to calculate the address. rd is just like others
        }
        is(InstType.S){
            //sb rs2, imm(rs1)
            oprand1         := rs1Val
            oprand2         := imm_S
            wreg            := false.B
            //store address is not yet known
            io.exInfo.storeOp.data  :=  rs2Val
            io.exInfo.storeOp.en    :=  true.B
            io.exInfo.storeOp.Width :=  MuxLookup(aluop, 0.U, Seq(
                SB  ->  0.U,    SH  ->  1.U,    SW  ->  2.U,//    SD  ->  3.U
            ))
        }
    }

    io.exInfo.oprand1   := oprand1
    io.exInfo.oprand2   := oprand2
    io.exInfo.rd        := rd
    io.exInfo.opcode    := inst(6,0)
    io.exInfo.aluop     := aluop
    io.exInfo.wreg      := wreg

    io.id2Rf.ReadIdx1   := rs1
    io.id2Rf.ReadIdx2   := rs2

}