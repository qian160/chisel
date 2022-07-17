package RV64
import chisel3._
import chisel3.util._

class Pc extends Module{
    val io = IO(new Bundle{
        val reset = Input(Bool())
        val pc    = Output(Bits(64.W))     //add more input ports in later design
    })
    val pc       = RegInit(0.U(64.W))   //dont need reset signal anymore.reginit will perform the reset job
    //pc    := Mux(pc + 4.U, ...)
    pc          := pc + 4.U
    io.pc       := pc

}

class If extends Module{
    val io = IO(new Bundle{
        val reset      = Input(Bool())
        val pc_i       = Input(Bits(64.W))
        val inst_i     = Input(Bits(32.W))

        val pc_o       = Output(UInt(64.W))
        val inst_o     = Output(Bits(32.W))
    })

    io.inst_o   := Mux(io.reset, 0.U, io.inst_i)
    io.pc_o     := Mux(io.reset, 0.U, io.pc_i)
/*
    when(io.reset){
        io.pc_o     := 0.U
        io.inst_o   := 0.U

    }.otherwise{
        io.pc_o     := pc
        io.inst_o   := io.inst_i
        pc          := pc + 4.U    //the actual index should be pc / 4
    }
*/
}
