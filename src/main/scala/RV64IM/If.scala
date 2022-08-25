import chisel3._
import chisel3.util._
import chisel3.util.experimental.loadMemoryFromFileInline
//the first inst after _start should be nop because it won't be execuated
class If extends Module{
    val io = IO(new Bundle{
        val stall      = Input(Bool())
        val excep      = Input(new IF_excep)
        val branchOp   = Input(new branchOp)
        val fromCSR    = Input(new CSR_2_IF)

        val inst_o     = Output(Bits(32.W))
        val exception  = Output(new exception)
    })
    //flush is not needed. Since IF/ID will do the flush job whatever IF gives
    val inst_rom  = Mem( 0x1000 , Bits(32.W))
    loadMemoryFromFileInline(inst_rom, CONST.RV_HOME + "Inst_Rom.data")

    val pc      = RegInit(CONST.PC_INIT)
    val error   = pc(0) | pc(1)
    val next_pc = PriorityMux(Seq(
        (reset.asBool,          0.U),
        (io.excep.happen,       io.excep.new_pc),
        (io.branchOp.taken,     io.branchOp.target),    //when stall and branch both appear, if we check stall first, we will lose the branch information in the next cycle
        (io.stall,              pc),
        (true.B,                pc + 4.U)
    ))
    pc  :=  next_pc

    io.inst_o    := Mux(reset.asBool, 0.U, inst_rom(pc >> 2))
    //default. Could be modified along the way
    io.exception.pc     := pc       //to write xepc, and also used in ID
    io.exception.happen := Mux(error, true.B, false.B)
    io.exception.int    := false.B
    io.exception.cause  := Mux(error, Cause.InstAddrMisaligned, 0.U)
    io.exception.xtval  := 0.U      //bad inst or address
    io.exception.new_pc := io.fromCSR.xtvec
    io.exception.priv   := io.fromCSR.priv
}
