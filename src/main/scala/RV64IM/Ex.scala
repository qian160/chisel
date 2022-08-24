import Arith._
import Helpers._
import chisel3._
import chisel3.util._
import OptCode._

class Ex extends RawModule{
    val io = IO(new Bundle{
        val decInfo        = Input(new decInfo())
        val divRes         = Input(new divRes)
        val exception_i    = Input(new exception)

        val rf_fwd         = Output(new rf_fwd)
        val csr_fwd        = Output(new csr_fwd)
        //decInfo's influence to the latter stages
        val writeRfOp      = Output(new writeRfOp)  //used in wb
        val writeCSROp     = Output(new writeCSROp) //used in wb
        val loadOp         = Output(new loadOp)     //used in mem
        val storeOp        = Output(new storeOp)    //used in mem
        val divOP          = Output(new divOP)
        val stall_req      = Output(Bool())
        val exception_o    = Output(new exception)
    })

    val a =  io.decInfo.oprand1
    val b =  io.decInfo.oprand2
    val aluop   =  io.decInfo.aluop
    io.storeOp  := io.decInfo.storeOp
    //ALU'S job, always produce one result. mul not connected yet
    val aluRes = MuxLookup(aluop, a + b, Seq(
        ADD  -> (a + b),
        SUB  -> (a - b),
        SLT  -> Mux(a.asSInt < b.asSInt, 1.U, 0.U),
        SLTU -> Mux(a < b, 1.U, 0.U),
        MUL  -> (a * b)(63,0),
        MULH -> (a * b)(127,64),
        XOR  -> (a ^ b),
        OR   -> (a | b),
        AND  -> (a & b),
        SLL  -> (a << b(5,0)),    //shift left don't cause extension problems
        SRL  -> (a >> b(5,0)),
        SRA  -> (a.asSInt >> b(5,0)).asUInt,

        ADDW -> Util.signExtend(a(31,0) + b(31,0), 64),
        SUBW -> Util.signExtend(a(31,0) - b(31,0), 64),
        MULW -> Util.signExtend(a(31,0) * b(31,0)(31,0), 64),
        SLLW -> Util.signExtend((a << b(4,0))(31,0), 64),
        SRLW -> Util.signExtend((a << b(4,0))(31,0), 64),
        SRAW -> Util.signExtend((a(31,0).asSInt >> b(4,0)).asUInt, 64),


        //the rest are about calculating the address, use the default add
        )
    )
    //division
    io.stall_req    := false.B
    val isDiv   = ((aluop === DIV) | (aluop === DIVU) | (aluop === REM) | (aluop === REMU))
    val divRes  = Wire(Bits(64.W));  divRes := 0.U
    io.divOP   := 0.U.asTypeOf(new divOP)
    when(isDiv){
        io.divOP.start    := Mux(io.divRes.finish, false.B, true.B)
        io.divOP.a        := a
        io.divOP.b        := b
        when(aluop === DIV){
            io.divOP.sign   := true.B
        }.otherwise{
            io.divOP.sign   := false.B
        }
        io.stall_req      := true.B
        when(io.divRes.finish){
            divRes  :=  MuxLookup(aluop, 0.U, Seq(
                DIV  ->  io.divRes.quo,
                DIVU ->  io.divRes.quo,
                REM  ->  io.divRes.rem,
                REMU ->  io.divRes.rem
            ))
            io.stall_req    := false.B
        }
    }

    io.writeRfOp    := 0.U.asTypeOf(new writeRfOp)    
    switch(io.decInfo.InstType){
        is(InstType.R) {
            io.writeRfOp.data  := Mux(isDiv, divRes, aluRes)
            io.writeRfOp.en    := true.B
            io.writeRfOp.addr  := io.decInfo.rd
        }
        is(InstType.I){     
            io.writeRfOp.data  := aluRes        //WILL BE MODIFIED IN MEM FOR LOAD
            io.writeRfOp.en    := true.B
            io.writeRfOp.addr  := io.decInfo.rd
            //io.loadOp.addr     := aluRes
        }
        is(InstType.S){
            io.storeOp.addr    := aluRes
            //Width, en and data have already be confirmed in id stage
        }
        is(InstType.J){
            io.writeRfOp.data  := aluRes
            io.writeRfOp.en    := true.B
            io.writeRfOp.addr  := io.decInfo.rd
        }
        is(InstType.SYS){
            when(io.writeCSROp.en){
                io.writeRfOp.data  := aluRes
                io.writeRfOp.en    := true.B
                io.writeRfOp.addr  := io.decInfo.rd
            }
            
        }
    }

    io.writeCSROp    := io.decInfo.writeCSROp   //ex just passes it, don't progress

    io.loadOp.addr   := aluRes
    io.loadOp.isLoad := io.decInfo.loadOp.isLoad
    io.loadOp.Width  := io.decInfo.loadOp.Width
    io.loadOp.sign   := io.decInfo.loadOp.sign

    //read after load: in this case ex's fwd data is just an address instead of a reg opdata, but since there is a stall, the wrong bypass won't be TAKEN
    io.rf_fwd.data   := aluRes        
    io.rf_fwd.addr   := io.decInfo.rd

    io.csr_fwd.data  := io.writeCSROp.data
    io.csr_fwd.addr  := io.writeCSROp.addr

    io.exception_o   := io.exception_i
}