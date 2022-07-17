package RV64
import chisel3._
import chisel3.util._
import OptCode._

class Ex extends RawModule{
    val io = IO(new Bundle{
        val exInfo         = Input(new exInfo())

        val exForwarding   = Output(new Forwarding)
        val writeRfOp      = Output(new writeRfOp)
        val loadOp         = Output(new loadOp)
        val storeOp        = Output(new storeOp)
    })

    val oprand1 =  io.exInfo.oprand1
    val oprand2 =  io.exInfo.oprand2
    io.storeOp  := io.exInfo.storeOp
    io.loadOp   := io.exInfo.loadOp
    //ALU'S job, always produce one result
    val aluRes = MuxLookup(io.exInfo.aluop,0.U, Seq(
        ADD  -> (oprand1 + oprand2),
        SUB  -> (oprand1 - oprand2),
        SLT  -> Mux(oprand1.asSInt < oprand2.asSInt, 1.U, 0.U),
        SLTU -> Mux(oprand1 < oprand2, 1.U, 0.U),
        XOR  -> (oprand1 ^ oprand2),
        OR   -> (oprand1 | oprand2),
        AND  -> (oprand1 & oprand2),
        SLL  -> (oprand1 << oprand2(4,0)),    //shift left don't cause extension problems
        SRL  -> (oprand1 >> oprand2(4,0)),
        SRA  -> (oprand1.asSInt >> oprand2(4,0)).asUInt,

        //calculate the address
        LB   -> (oprand1 + oprand2),
        LH   -> (oprand1 + oprand2),
        LW   -> (oprand1 + oprand2),
        LBU  -> (oprand1 + oprand2),
        LHU  -> (oprand1 + oprand2),
        SB   -> (oprand1 + oprand2),
        SH   -> (oprand1 + oprand2),
        SW   -> (oprand1 + oprand2),
        )
    )
    //load and general alu arith are treated similarily
    //how do ex knows it's a load or store operation?
    //here we use the spare eencoding space in aluop
    //maybe try to improve this
    io.writeRfOp    := 0.U.asTypeOf(new writeRfOp)    
    //choose the result, can be improved
    switch(io.exInfo.opcode){
        is(alu_reg) {
            io.writeRfOp.data  := aluRes
            io.writeRfOp.en    := true.B
            io.writeRfOp.addr  := io.exInfo.rd
        }
        is(alu_imm){
            io.writeRfOp.data  := aluRes
            io.writeRfOp.en    := true.B
            io.writeRfOp.addr  := io.exInfo.rd
        }
        is(Load){       //need to write RF and read ram
            io.writeRfOp.data  := DontCare  //EX STAGE DOESN'T HAS THE DATA YET
            io.writeRfOp.en    := true.B
            io.writeRfOp.addr  := io.exInfo.rd

            io.loadOp.addr     := aluRes
        }
        is(Store){
            io.storeOp.addr    := aluRes
            //Width, en and data have already be confirmed in id stage
        }

    }
    //to ID, data hazard
    io.exForwarding.data   := aluRes
    io.exForwarding.addr   := io.exInfo.rd
}