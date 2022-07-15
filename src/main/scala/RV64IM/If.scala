package RV64
import chisel3._
import chisel3.util._

class If extends Module{
    val io = IO(new Bundle{ 
        val reset      = Input(Bool())
        val inst_i     = Input(Bits(32.W))

        val pc_o       = Output(UInt(64.W))
        val inst_o     = Output(Bits(32.W))
    })

    val pc = RegInit(0.U(64.W))

    when(io.reset){
        io.pc_o     := 0.U
        io.inst_o   := 0.U
    
    }.otherwise{
        io.pc_o     := pc
        io.inst_o   := io.inst_i
        pc          := pc + 4.U    //the actual index should be pc / 4
    }
}
