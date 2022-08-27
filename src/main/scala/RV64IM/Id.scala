import OptCode._
import Helpers._
import chisel3._
import chisel3.util._

class Id extends RawModule{
    val io = IO(new Bundle{
        val inst_i        = Input(Bits(32.W))
        val rf2Id         = Input(new rf2Id())      //REG OPERAND
        val fwd           = Input(new fwd)          //the newest rf and csr values
        val CSR_2_ID      = Input(new CSR_2_ID)
        val exception_i   = Input(new exception)
        //read after load, need a stall
        val prev_is_load  = Input(Bool())
        val prev_rd       = Input(Bits(5.W))

        val ID_2_CSR      = Output(new ID_2_CSR)
        val id2Rf         = Output(new id2Rf)       //read regfile
        val decInfo       = Output(new decInfo)     //all the information decoded
        val flush_req     = Output(Bool())
        val stall_req     = Output(Bool())          //read after load 
        val exception_o   = Output(new exception)
    })

    val pc       = io.exception_i.pc
    val inst     = io.inst_i
    val funct3   = inst(14,12)
    val csrAddr  = inst(31,20)
    val priv     = io.exception_i.priv
    val xtvec    = io.exception_i.new_pc    //default is xtvec
    val xepc     = io.CSR_2_ID.xepc

    //information about reg oprands
    val regData1 = io.rf2Id.RegData1
    val regData2 = io.rf2Id.RegData2
    val rs1      = inst(19,15)
    val rs2      = inst(24,20)
    val rd       = inst(11,7)

    val imm_I    = Util.signExtend(inst(31,20), 64)
    val imm_S    = Util.signExtend(Cat(inst(31,25), inst(11,7)), 64)
    val imm_B    = Util.signExtend(Cat(inst(31), inst(7), inst(30,25), inst(11,8), 0.U(1.W)),64)
    val imm_J    = Util.signExtend(Cat(inst(31), inst(19,12), inst(20), inst(30,21), 0.U(1.W)),64)
    val imm_U    = Util.signExtend(inst(31,12),64)
    val uimm     = inst(19,15)  //used in csrr{w/s/c}i. zero-extending

    val branch_target   = imm_B + pc
    val jal_target      = imm_J + pc
    val jalr_target     = imm_I + pc

    val decRes   = ListLookup(inst,DecTable.defaultDec,DecTable.decMap)     //returns list(instType,opt)
    val instType = decRes(DecTable.TYPE)    //R I S B J U
    val decOpt   = decRes(DecTable.OPT)     //sometimes useless,like InstType.B

    val rs1Val  = PriorityMux(Seq(          //solve the data hazard here
        (rs1 === 0.U,                 0.U),                   // reading x0 always gives 0
        (rs1 === io.fwd.rf.wb.addr,   io.fwd.rf.wb.data),     // forwarding from WB
        (rs1 === io.fwd.rf.mem.addr,  io.fwd.rf.mem.data),    // forwarding from MEM
        (rs1 === io.fwd.rf.ex.addr,   io.fwd.rf.ex.data),     // forwarding from EX
        (true.B,                      regData1))              // from the register file
    )

    val rs2Val  = PriorityMux(Seq(
        (rs2 === 0.U,                 0.U),                   // reading x0 always gives 0
        (rs2 === io.fwd.rf.wb.addr,   io.fwd.rf.wb.data),     // forwarding from WB
        (rs2 === io.fwd.rf.mem.addr,  io.fwd.rf.mem.data),    // forwarding from MEM
        (rs2 === io.fwd.rf.ex.addr,   io.fwd.rf.ex.data),     // forwarding from EX
        (true.B,                      regData2))              // from the register file
    )
    //csr
    val csrVal  = PriorityMux(Seq(           //the newest csr value
        (csrAddr === io.fwd.csr.wb.addr,     io.fwd.csr.wb.data),
        (csrAddr === io.fwd.csr.mem.addr,    io.fwd.csr.mem.data),
        (csrAddr === io.fwd.csr.ex.addr,     io.fwd.csr.ex.data),
        (true.B,                             io.CSR_2_ID.data)
    ))
    val csr_legalWrite  = io.CSR_2_ID.legalWrite
    val csr_legalRead   = io.CSR_2_ID.legalRead
    val csr_useImm  = funct3(2)
    val rsVal       = Mux(csr_useImm, uimm, rs1Val)
    val csrNewVal   = MuxLookup(funct3, 0.U, Seq(
        (CSRMODE.RW, rs1Val),
        (CSRMODE.RS, csrVal |  rsVal), //rs1 is used as a bit mask
        (CSRMODE.RC, csrVal & ~rsVal)
    ))
//default
    io.decInfo          := 0.U.asTypeOf(new decInfo)
    io.flush_req        := false.B
    io.stall_req        := false.B
    io.ID_2_CSR         := 0.U.asTypeOf(new ID_2_CSR)
    io.decInfo.aluop    := decOpt
    io.decInfo.InstType := instType
    io.exception_o      := io.exception_i
    //load
    when(inst(6,0) === "b0000011".U ){
        //add sign
        io.decInfo.loadOp.isLoad := true.B
        io.decInfo.loadOp.Width  :=  MuxLookup(funct3,0.U,Seq(
            LB  ->  0.U,    LH  ->  1.U,    LW  ->  2.U,    //LD  ->  3.U
            LBU ->  0.U,    LHU ->  1.U,    LWU ->  2.U
        ))
        io.decInfo.loadOp.sign   :=  MuxLookup(funct3,0.U,Seq(
            LB  -> true.B,  LH  -> true.B,  LW  -> true.B,
            LBU -> false.B, LHU -> false.B, LWU -> false.B
        ))
        //addr is 0 now. let EX calculate that
    }

    //read after load
    when(io.prev_is_load){
        when(io.prev_rd === rs1 | io.prev_rd === rs2){
            io.stall_req    := true.B
        }
    }
    //default is all 0. just modify the needed information
    switch(instType){       //update xepc, xcause, xtval, xstatus
        is(InstType.BAD){
            //under reset or flush, a zero inst will be given, but no exception is actually happening
            //need to be improved. Zero inst may also be a bad inst not just because of flush or reset
            io.exception_o.happen   := Mux(inst === 0.U, false.B, true.B)
            io.exception_o.cause    := Cause.IllegalInst
            io.exception_o.xtval    := inst
        }
        is(InstType.R){
            io.decInfo.oprand1      := rs1Val
            io.decInfo.oprand2      := rs2Val
            io.decInfo.wreg         := true.B
            io.decInfo.rd           := rd
        }
        is(InstType.I){     //the 2 oprands are used to calculate the address in ex
            io.decInfo.oprand1      := rs1Val
            io.decInfo.oprand2      := imm_I/*.asSInt.asUInt*/
            io.decInfo.wreg         := true.B
            io.decInfo.rd           := rd
            //JALR is also I type
            when(decRes(DecTable.OPT) === OptCode.JALR){        //rd = pc + 4, pc = imm + rs1
                io.decInfo.oprand1  := pc
                io.decInfo.oprand2  := 4.U
                io.decInfo.branchOp.taken   := true.B
                io.decInfo.branchOp.target  := jalr_target
                io.flush_req        := true.B
            }
        }
        is(InstType.S){
            io.decInfo.oprand1       := rs1Val
            io.decInfo.oprand2       := imm_S
            //store address is not yet known
            io.decInfo.storeOp.data  :=  rs2Val
            io.decInfo.storeOp.en    :=  true.B
            io.decInfo.storeOp.Width :=  MuxLookup(funct3, 0.U, Seq(
                SB  ->  0.U,    SH  ->  1.U,    SW  ->  2.U,    SD  ->  3.U
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
            io.decInfo.branchOp.taken   := taken
            io.decInfo.branchOp.target  := branch_target
            io.flush_req        := Mux(taken, true.B, false.B)
        }
        is(InstType.J){     //jal,  rd = pc + 4, pc += imm.
            io.decInfo.oprand1          :=  pc
            io.decInfo.oprand2          :=  4.U
            io.decInfo.wreg             :=  true.B
            io.decInfo.branchOp.taken   :=  true.B
            io.decInfo.branchOp.target  :=  jal_target
            io.flush_req                :=  true.B
        }
        is(InstType.U){     //LUI, rd = imm << 12, AUIPC, rd = pc + imm << 12 IF OPCODE(5) = 1, THEN LUI
            io.decInfo.oprand1  :=  Mux(inst(5), 0.U, pc)
            io.decInfo.oprand2  :=  imm_U << 12
            io.decInfo.wreg     :=  true.B
            io.decInfo.rd       :=  rd
        }
        is(InstType.SYS){       //csr , ecall, ebreak, xret
            //fence is not needed for single core processor. But what about qemu?
            when(funct3.orR){   //csr inst, compute the result here. csrr{w/s/c} rd, csr, rs1
                io.decInfo.rd               :=  Mux(csr_legalRead, rd, 0.U)
                io.decInfo.wreg             :=  true.B
                io.decInfo.oprand1          :=  csrVal
                io.decInfo.oprand2          :=  0.U

                io.decInfo.writeCSROp.data  :=  Mux(csr_legalWrite, csrNewVal, 0.U)
                io.decInfo.writeCSROp.addr  :=  Mux(csr_legalWrite, csrAddr, 0.U)
                io.decInfo.writeCSROp.en    :=  Mux(csr_legalWrite, true.B, false.B)
            }.otherwise{        //xret, ecall, ebreak
                val inst_p2         = inst(21, 20)  //or maybe (24, 20)? XRet, ecall, ebreak
                val X               = inst(29, 28)
                io.exception_o.happen := true.B
                //xret is very similar to exceptions: cancel all the next insts' execuations and jump to a target
                switch(inst_p2){
                    is(SYS_INST.XRet){
                        val cause       =  Mux(priv >= X, Cause.XRet(X), Cause.IllegalInst)
                        val new_pc_Sel  =  cause(4)     //XRet could become illegal for privilege reason
                        //xepc + 4 is determined by handler. We need no concern
                        io.exception_o.cause  :=  cause
                        io.exception_o.new_pc :=  Mux(new_pc_Sel, xepc, xtvec)
                    }
                    is(SYS_INST.ecall){
                        io.exception_o.new_pc :=  CONST.OS_ADDR
                        io.exception_o.cause  :=  Cause.ecallX(priv)
                    }
                    is(SYS_INST.ebreak){
                        io.exception_o.new_pc :=  CONST.DEBUGGER_ADDR
                        io.exception_o.cause  :=  Cause.BreakPoint
                    }
                }
            }
        }
    }

    io.id2Rf.ReadIdx1   := rs1
    io.id2Rf.ReadIdx2   := rs2

    io.ID_2_CSR.addr    := csrAddr
    io.ID_2_CSR.wdata   := Mux(instType === InstType.SYS, csrNewVal, 0.U)    //to check whether it's a legal write
}