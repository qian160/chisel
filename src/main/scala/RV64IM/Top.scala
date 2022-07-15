
package RV64

import org.scalatest._
import chisel3._
import chisel3.iotesters._
import chisel3.util._
import chisel3.util.experimental.loadMemoryFromFile

class Top extends Module{
    val io = IO(new Bundle{
        //debug
        val o1 = Output(UInt(64.W))
        val o2 = Output(UInt(32.W))
        val o3 = Output(UInt(64.W))
        val o4 = Output(UInt(64.W))
    })

    val IF          = Module(new If())
    val INST_ROM    = Module(new Inst_Rom())
    val REGFILE     = Module(new Regfile())
    val IF_ID       = Module(new If_Id())
    val ID          = Module(new Id())
    val ID_EX       = Module(new Id_Ex())
    val EX          = Module(new Ex())
    val EX_MEM      = Module(new Ex_Mem())
    val MEM         = Module(new Memory())
    val MEM_WB      = Module(new Mem_Wb())
    val WB          = Module(new Wb())

//reset

    INST_ROM.io.reset   := false.B
    IF.io.reset         := false.B
    IF_ID.io.reset      := false.B
    ID_EX.io.reset      := false.B
    EX_MEM.io.reset     := false.B
    MEM_WB.io.reset     := false.B
    dontTouch(INST_ROM.io.reset)
    dontTouch(IF.io.reset)
    dontTouch(IF_ID.io.reset)
    dontTouch(ID_EX.io.reset)
    dontTouch(EX_MEM.io.reset)
    dontTouch(MEM_WB.io.reset)

    IF.io.inst_i        := INST_ROM.io.inst_o
    INST_ROM.io.addr_i  := IF.io.pc_o
    IF_ID.io.if_inst_i  := IF.io.inst_o

    ID.io.id_inst_i     := IF_ID.io.if_inst_o

    REGFILE.io.id2Rf        <>  ID.io.id2Rf
    ID.io.rf2Id             <>  REGFILE.io.rf2Id

    ID_EX.io.exInfo_i       <>  ID.io.exInfo

    EX.io.exInfo            <>  ID_EX.io.exInfo_o

    EX_MEM.io.writeRfOp_i   <>  EX.io.writeRfOp

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