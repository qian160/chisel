package RV64

import chisel3._

class Wb extends RawModule{
    val io = IO(new Bundle{
        val writeRfOp_i     = Input(new writeRfOp)

        val wbForwarding    = Flipped(new Forwarding)
        val writeRfOp_o     = Flipped(new writeRfOp)
    })

    io.writeRfOp_o  := io.writeRfOp_i
    io.wbForwarding := io.writeRfOp_i
}