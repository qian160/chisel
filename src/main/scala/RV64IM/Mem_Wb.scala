package RV64

import chisel3._

class Mem_Wb extends Module{
    val io = IO(new Bundle{
        val reset       = Input(Bool())
        val writeRfOp_i = Input(new writeRfOp)

        val writeRfOp_o = Flipped(new writeRfOp)
    })

    val writeRfOp   = RegNext(io.writeRfOp_i)
    when(io.reset){
        io.writeRfOp_o  := 0.U.asTypeOf(new writeRfOp)
    }.otherwise{
        io.writeRfOp_o  <> writeRfOp
    }

}