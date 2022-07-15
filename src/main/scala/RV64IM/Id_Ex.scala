package RV64

import chisel3._
import chisel3.util._

class Id_Ex extends Module{
    val io = IO(new Bundle{
        val reset           = Input(Bool())
        val exInfo_i        = Input(new exInfo())
        val exInfo_o        = Flipped(new exInfo)
    })

    val exInfo  = RegNext(io.exInfo_i)
    when(io.reset){
        io.exInfo_o    := 0.U.asTypeOf(new exInfo)
    }.otherwise{
        io.exInfo_o    <>   exInfo
    }
}
