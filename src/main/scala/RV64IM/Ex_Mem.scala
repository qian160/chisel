package RV64

import chisel3._
import chisel3.util._

class Ex_Mem extends Module{
    val io = IO(new Bundle{
        val reset         = Input(Bool())
        val loadOp_i      = Input(new loadOp)
        val storeOp_i     = Input(new storeOp)
        val writeRfOp_i   = Input(new writeRfOp)

        val loadOp_o      = Flipped(new loadOp)
        val storeOp_o     = Flipped(new storeOp)
        val writeRfOp_o   = Flipped(new writeRfOp)
    })

    val writeRfOp      = RegNext(io.writeRfOp_i)
    val loadOp         = RegNext(io.loadOp_i)
    val storeOp        = RegNext(io.storeOp_i)

    when(io.reset){
        io.writeRfOp_o    := 0.U.asTypeOf(new writeRfOp)
        io.loadOp_o       := 0.U.asTypeOf(new loadOp)
        io.storeOp_o      := 0.U.asTypeOf(new storeOp)
    }.otherwise{
        io.writeRfOp_o    := writeRfOp
        io.loadOp_o       := loadOp
        io.storeOp_o      := storeOp
    }
}