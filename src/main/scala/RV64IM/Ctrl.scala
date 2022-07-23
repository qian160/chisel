package RV64

import chisel3._
import chisel3.util._
//when a pipeline register is given a stall, then in the *next* coming clock cycle,
//it will give nop operation whatever the inputs are
class Ctrl extends Module{
    val io = IO(new Bundle{
        val id_stall_req   = Input(Bool())     //READ AFTER LOAD 
        val id_flush_req   = Input(Bool())     //READ AFTER LOAD 
        //add more requests later
        val stall    = Output(Bits(5.W))     //pc and 4 pipe regs
        val flush    = Output(Bits(5.W))     //Inst_Rom and 4 pipe regs
    })
    io.stall    := 0.U
    io.flush    := 0.U
    when(io.id_stall_req){
        io.stall    :=  "b00011".U     //pc, if/id
    }
    when(io.id_flush_req){
        //the only possible (at least now) is that a branch is taken
        //need to clear the previous if stage
        io.flush    :=  "b00111".U       //IF, IF/ID, ...
    }


}