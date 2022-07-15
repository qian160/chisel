package RV64

import chisel3._
import chisel3.util._
import chisel3.iotesters._
import chisel3.util.experimental.loadMemoryFromFileInline

class Inst_Rom extends Module{
    val io = IO(new Bundle{
        val reset  = Input(Bool())
        val addr_i = Input(UInt(64.W))
        val inst_o = Output(Bits(32.W))
    })

    val mem  = SyncReadMem(8 * 1024 , Bits(32.W))
    loadMemoryFromFileInline(mem,"Inst_Rom.data")
    io.inst_o := Mux(io.reset, 0.U, mem(io.addr_i >> 2))
}