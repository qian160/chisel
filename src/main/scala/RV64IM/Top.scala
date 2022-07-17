
package RV64

import org.scalatest._
import chisel3._
import chisel3.iotesters._
import chisel3.util._
import chisel3.util.experimental.loadMemoryFromFile

class Top extends RawModule{
    val io = IO(new Bundle{
        //debug
        val clk   = Input(Clock())
        val reset = Input(Bool())
        val o1 = Output(UInt(64.W))
        val o2 = Output(UInt(32.W))
        val o3 = Output(UInt(64.W))
        val o4 = Output(UInt(64.W))
    })
    val PC          = withClockAndReset(io.clk,io.reset){Module(new Pc)}

    val IF          = withClockAndReset(io.clk,io.reset){Module(new If())}
    val INST_ROM    = withClockAndReset(io.clk,io.reset){Module(new Inst_Rom())}
    val REGFILE     = withClockAndReset(io.clk,io.reset){Module(new Regfile())}
    val IF_ID       = withClockAndReset(io.clk,io.reset){Module(new If_Id())}
    val ID          = withClockAndReset(io.clk,io.reset){Module(new Id())}
    val ID_EX       = withClockAndReset(io.clk,io.reset){Module(new Id_Ex())}
    val EX          = withClockAndReset(io.clk,io.reset){Module(new Ex())}
    val EX_MEM      = withClockAndReset(io.clk,io.reset){Module(new Ex_Mem())}
    val MEM         = withClockAndReset(io.clk,io.reset){Module(new Memory())}
    val MEM_WB      = withClockAndReset(io.clk,io.reset){Module(new Mem_Wb())}
    val WB          = withClockAndReset(io.clk,io.reset){Module(new Wb())}


//reset
    PC.io.reset         := io.reset
    INST_ROM.io.reset   := io.reset
    IF.io.reset         := io.reset
    IF_ID.io.reset      := io.reset
    ID_EX.io.reset      := io.reset
    EX_MEM.io.reset     := io.reset
    MEM_WB.io.reset     := io.reset

    IF.io.pc_i          := PC.io.pc
    IF.io.inst_i        := INST_ROM.io.inst_o
    INST_ROM.io.addr_i  := IF.io.pc_o
    IF_ID.io.if_inst_i  := IF.io.inst_o

    ID.io.id_inst_i     := IF_ID.io.if_inst_o

    REGFILE.io.id2Rf        <>  ID.io.id2Rf
    ID.io.rf2Id             <>  REGFILE.io.rf2Id

    ID_EX.io.exInfo_i       <>  ID.io.exInfo

    EX.io.exInfo            <>  ID_EX.io.exInfo_o
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