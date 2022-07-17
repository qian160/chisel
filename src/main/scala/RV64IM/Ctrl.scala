package RV64

import chisel3._
import chisel3.util._
//output stall's width =[4], and assign stall[0] to pc
class Ctrl extends Module{
    val io = IO(new Bundle{
        val id_req  = Input(Bool())     //READ AFTER LOAD 
        //add more requests later
        val stall   = Output(Bits(5.W))     //pc and 4 pipe regs
    })
    io.stall    := 0.U
    when(io.id_req){
        io.stall    :=  "b00011".U
    }


}