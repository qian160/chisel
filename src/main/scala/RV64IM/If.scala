package RV64
import chisel3._
import chisel3.util._
import chisel3.util.experimental.loadMemoryFromFileInline

/*
class Pc extends Module{    //maybe this doesn't need a flush?...
    val io = IO(new Bundle{
        val stall       = Input(Bool())
        val branchOp    = Input(new branchOp)
        val reset       = Input(Bool())
        val pc          = Output(Bits(64.W))     //add more input ports in later design
    })
    val pc       = RegInit(0.U(64.W))
    when(io.reset){
        pc  :=  0.U
    }.elsewhen(io.stall){ 
        pc  := pc 
    }.elsewhen(io.branchOp.taken){
        pc  := io.branchOp.target
    }.otherwise{
        pc  := pc + 4.U
    }
    io.pc   := pc

}
*/
class If extends Module{
    val io = IO(new Bundle{
        val reset      = Input(Bool())
        val stall      = Input(Bool())
        val flush      = Input(Bool())
//        val pc_i       = Input(Bits(64.W))
//        val inst_i     = Input(Bits(32.W))
        val branchOp   = Input(new branchOp)

        val pc_o       = Output(UInt(64.W))
        val inst_o     = Output(Bits(32.W))
    })
    val inst_rom  = SyncReadMem(8 * 1024 , Bits(32.W))
    loadMemoryFromFileInline(inst_rom,"/home/s081/Downloads/chisel-template/src/main/scala/RV64IM/Inst_Rom.data")

    //test the flush
    val pc        = RegInit(0.U(64.W))
    val flush     = RegNext(io.flush)       //delay a cycle, need to be improved
    io.inst_o    := Mux(io.reset | flush, 0.U, inst_rom(pc >> 2))
    //when a branch is taken, the previous fetched inst will be flushed, which acts like inserting a bubble
    when(io.reset){
        pc  :=  0.U
    }.elsewhen(io.stall){ 
        pc  := pc 
    }.elsewhen(io.branchOp.taken){
        pc  := io.branchOp.target
    }.otherwise{
        pc  := pc + 4.U
    }

    //io.inst_o   := Mux(io.reset, 0.U, io.inst_i)
    io.pc_o     := pc

}
