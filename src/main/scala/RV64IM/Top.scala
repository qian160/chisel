
package RV64

import org.scalatest._
import chisel3._
import chisel3.iotesters._
import chisel3.util._
import chisel3.util.experimental.loadMemoryFromFile

class Top extends RawModule{
    val io = IO(new Bundle{
        val clk   = Input(Clock())
        val reset = Input(Bool())
        //debug
        val o1 = Output(UInt(64.W))
        val o2 = Output(UInt(32.W))
        val o3 = Output(UInt(64.W))
        val o4 = Output(UInt(64.W))
    })
    //val PC          = withClockAndReset(io.clk,io.reset){Module(new Pc())}

    val IF          = withClockAndReset(io.clk,io.reset){Module(new If())}
    //val INST_ROM    = withClockAndReset(io.clk,io.reset){Module(new Inst_Rom())}
    val REGFILE     = withClockAndReset(io.clk,io.reset){Module(new Regfile())}
    val IF_ID       = withClockAndReset(io.clk,io.reset){Module(new If_Id())}
    val ID          = withClockAndReset(io.clk,io.reset){Module(new Id())}
    val ID_EX       = withClockAndReset(io.clk,io.reset){Module(new Id_Ex())}
    val EX          = withClockAndReset(io.clk,io.reset){Module(new Ex())}
    val EX_MEM      = withClockAndReset(io.clk,io.reset){Module(new Ex_Mem())}
    val MEM         = withClockAndReset(io.clk,io.reset){Module(new Memory())}
    val MEM_WB      = withClockAndReset(io.clk,io.reset){Module(new Mem_Wb())}
    val WB          = withClockAndReset(io.clk,io.reset){Module(new Wb())}
    val CTRL        = withClockAndReset(io.clk,io.reset){Module(new Ctrl())}

//reset, stall && flush
    //PC.io.reset         := io.reset
    //INST_ROM.io.reset   := io.reset
    IF.io.reset         := io.reset
    IF_ID.io.reset      := io.reset
    ID_EX.io.reset      := io.reset
    EX_MEM.io.reset     := io.reset
    MEM_WB.io.reset     := io.reset

    //PC.io.stall         := CTRL.io.stall(0)
    IF.io.stall         := CTRL.io.stall(0)
    IF_ID.io.stall      := CTRL.io.stall(1)
    ID_EX.io.stall      := CTRL.io.stall(2)
    EX_MEM.io.stall     := CTRL.io.stall(3)
    MEM_WB.io.stall     := CTRL.io.stall(4)

    //INST_ROM.io.flush   := CTRL.io.flush(0)
    /*+*/IF.io.flush    := CTRL.io.flush(0)
    IF_ID.io.flush      := CTRL.io.flush(1)
    ID_EX.io.flush      := CTRL.io.flush(2)
    EX_MEM.io.flush     := CTRL.io.flush(3)
    MEM_WB.io.flush     := CTRL.io.flush(4)

    //PC.io.branchOp      := ID.io.branchOp
    IF.io.branchOp      := ID.io.branchOp

    //IF.io.pc_i          := PC.io.pc
    //IF.io.inst_i        := INST_ROM.io.inst_o
    //INST_ROM.io.addr_i  := IF.io.pc_o
    IF_ID.io.inst_i     := IF.io.inst_o

    ID.io.inst_i        := IF_ID.io.inst_o
    IF_ID.io.pc_i       := IF.io.pc_o
    ID.io.pc            := IF_ID.io.pc_o

    REGFILE.io.id2Rf        <>  ID.io.id2Rf
    ID.io.rf2Id             <>  REGFILE.io.rf2Id

    ID_EX.io.decInfo_i      <>  ID.io.decInfo
    ID_EX.io.prev_is_load_i :=  ID.io.decInfo.loadOp.isLoad
    ID.io.load_dest         :=  ID_EX.io.load_dest_o
    ID.io.prev_is_load      :=  ID_EX.io.prev_is_load_o

    EX.io.decInfo           <>  ID_EX.io.decInfo_o
    EX.io.loadOp            <>  EX_MEM.io.loadOp_i
    EX.io.storeOp           <>  EX_MEM.io.storeOp_i

    EX_MEM.io.writeRfOp_i   <>  EX.io.writeRfOp
    EX_MEM.io.loadOp_o      <>  MEM.io.loadOp
    EX_MEM.io.storeOp_o     <>  MEM.io.storeOp

    MEM.io.writeRfOp_i      <>  EX_MEM.io.writeRfOp_o

    MEM_WB.io.writeRfOp_i   <>  MEM.io.writeRfOp_o

    WB.io.writeRfOp_i       <>  MEM_WB.io.writeRfOp_o

    REGFILE.io.writeRfOp    <>  WB.io.writeRfOp_o

//forwarding

    ID.io.wbForwarding      <> WB.io.wbForwarding
    ID.io.memForwarding     <> MEM.io.memForwarding
    ID.io.exForwarding      <> EX.io.exForwarding

    CTRL.io.id_stall_req    := ID.io.stall_req
    CTRL.io.id_flush_req    := ID.io.flush_req

//DEBUG
/*
    io.o1 := WB.io.writeRfOp_o.data
    io.o2 := IF.io.inst_o
    io.o3 := ID.io.rs1
    io.o4 := ID.io.rs2
*/
io.o1 := WB.io.writeRfOp_o.data
io.o2 := 0.U
io.o3 := 0.U
io.o4 := 0.U


}