import chisel3._
import chisel3.util._
import chisel3.util.experimental.loadMemoryFromFileInline
//add exceptions
class If extends Module{
    val io = IO(new Bundle{
        val stall      = Input(Bool())
        val flush      = Input(Bool())
        val excep      = Input(new IF_excep)
        val branchOp   = Input(new branchOp)

        val pc_o       = Output(UInt(64.W))
        val inst_o     = Output(Bits(32.W))
    })
    val inst_rom  = Mem( 0x1000 , Bits(32.W))
    loadMemoryFromFileInline(inst_rom, CONST.RV_HOME + "Inst_Rom.data")
    //IF is combinational logic, but some control signals arrives earlier, so need to be latched
//    val flush     = RegNext(io.flush)               //need to delay a cycle. because flush is used in combinational logic and it is sent to IF earlier
/*
    val next_pc   = RegInit(CONST.PC_INIT)          //updated pc in the next cycle
    val curr_pc   = RegNext(next_pc)                //the pc being used currently
    next_pc  := PriorityMux(Seq(
        (reset.asBool,          0.U),
        (io.excep,              io.xtvec),
        (io.branchOp.taken,     io.branchOp.target),    //when stall and branch both appear, if we check stall first, we will lose the branch information in the next cycle
        (io.stall,              next_pc),
        (true.B,                next_pc + 4.U)
    ))
    //small problem: branch after div. Then stall, flush and taken could appear at the same time
    curr_pc  := PriorityMux(Seq(
        (reset.asBool,          0.U),
        (io.stall & ~flush,     curr_pc),   //not true only when branch after div
        (true.B,                next_pc)
    ))
    */
    val pc      = RegInit(CONST.PC_INIT)
    val next_pc = PriorityMux(Seq(
        (reset.asBool,          0.U),
        (io.excep.happen,       io.excep.new_pc),
        (io.branchOp.taken,     io.branchOp.target),    //when stall and branch both appear, if we check stall first, we will lose the branch information in the next cycle
        (io.stall,              pc),
        (true.B,                pc + 4.U)
    ))
    pc  :=  next_pc
    //the first inst after _start should be nop
    //use curr_pc
    //io.inst_o    := Mux(reset.asBool | flush, 0.U, inst_rom(pc >> 2))
    io.inst_o    := Mux(reset.asBool, 0.U, inst_rom(pc >> 2))
    io.pc_o      := pc
}
