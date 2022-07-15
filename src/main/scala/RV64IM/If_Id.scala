package RV64

import chisel3._
import chisel3.util._

class If_Id extends Module{
    val io = IO(new Bundle{
        val reset     = Input(Bool())
        val if_inst_i    = Input (Bits(32.W))
        val if_inst_o    = Output(Bits(32.W))
    })

    val inst = RegNext(io.if_inst_i)

    when(io.reset){
        io.if_inst_o := 0.U
    }.otherwise{
        io.if_inst_o := inst
    }

}