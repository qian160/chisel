package RV64
import chisel3._
import chisel3.util._
import OptCode._

class Ex extends RawModule{
    val io = IO(new Bundle{
        val exInfo         = Input(new exInfo())

        val exForwarding   = Flipped(new Forwarding)
        val writeRfOp      = Flipped(new writeRfOp)
    })

    val oprand1 = io.exInfo.oprand1
    val oprand2 = io.exInfo.oprand2
    
    //ALU'S job, always produce one result
    val aluRes = MuxLookup(io.exInfo.aluop,0.U, Seq(
        ADD  -> (oprand1 + oprand2),
        SUB  -> (oprand1 - oprand2),
        SLT  -> Mux(oprand1.asSInt < oprand2.asSInt, 1.U, 0.U),
        SLTU -> Mux(oprand1 < oprand2, 1.U, 0.U),
        XOR  -> (oprand1 ^ oprand2),
        OR   -> (oprand1 | oprand2),
        AND  -> (oprand1 & oprand2),
        SLL  -> (oprand1 << oprand2(4,0)),
        SRL  -> (oprand1 >> oprand2(4,0)),
        SRA  -> (oprand1.asSInt >> oprand2(4,0)).asUInt

        )
    )
    //DEFAULT
    io.writeRfOp    := 0.U.asTypeOf(new writeRfOp)
    //choose the result
    switch(io.exInfo.opcode){
        is(alu_reg) {
            io.writeRfOp.data  := aluRes
            io.writeRfOp.en    := true.B
            io.writeRfOp.addr  := io.exInfo.rd
        }

    }
    io.exForwarding.data   := aluRes
    io.exForwarding.addr   := io.exInfo.rd
}