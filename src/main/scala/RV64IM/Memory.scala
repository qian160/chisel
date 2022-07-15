package RV64

import chisel3._
//Mem is a chisel identifier, so we can't use this name
class Memory extends RawModule{
    val io = IO(new Bundle{
        val writeRfOp_i   = Input(new writeRfOp)

        val memForwarding = Flipped(new Forwarding)
        val writeRfOp_o   = Flipped(new writeRfOp)

    })
    io.writeRfOp_o        := io.writeRfOp_i
    io.memForwarding.addr := io.writeRfOp_i.addr
    io.memForwarding.data := io.writeRfOp_i.data
}