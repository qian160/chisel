package RV64

import chisel3._
import chisel3.util._

//Mem is a chisel identifier, so we can't use this as class name
class Memory extends Module{
    val io = IO(new Bundle{
        val writeRfOp_i   = Input(new writeRfOp)
        val loadOp        = Input(new loadOp)
        val storeOp       = Input(new storeOp)
        val memForwarding = Flipped(new Forwarding)
        val writeRfOp_o   = Flipped(new writeRfOp)

    })

    //consider raid?
    val ram = SyncReadMem(1024 * 1024 * 4, Bits(8.W))    //4 MB

    val laddr   = io.loadOp.addr
    //add alignment check later
    val loadVal  =   MuxLookup(io.loadOp.Width, 0.U, Seq(
        0.U ->  ram(laddr),                         //LB
        1.U ->  Cat(ram(laddr), ram(laddr + 1.U)),  //LH
        2.U ->  Cat(ram(laddr), ram(laddr + 1.U),ram(laddr + 2.U), ram(laddr + 3.U)),  //Lw
        //3.U  ->  ram(laddr)       //LD
    ))
    val saddr   = io.storeOp.addr
    val sval    = io.storeOp.data
    when(io.storeOp.en){
        switch(io.storeOp.Width){
            is(0.U){
                ram(saddr)  := sval(7,0)
            }
            is(1.U){
                ram(saddr)      := sval(7,0)
                ram(saddr+1.U)  := sval(15,8)
            }
            is(2.U){
                ram(saddr)      := sval(7,0)
                ram(saddr+1.U)  := sval(15,8)
                ram(saddr+2.U)  := sval(23,16)
                ram(saddr+3.U)  := sval(31,24)
            }
        }
    }
    //load from memory or just come from previous arithmetical oper
    io.writeRfOp_o.data   := Mux(io.loadOp.isLoad, loadVal, io.writeRfOp_i.data)
    io.writeRfOp_o.en     := io.writeRfOp_i.en
    io.writeRfOp_o.addr   := io.writeRfOp_i.addr

    io.memForwarding.addr := io.writeRfOp_i.addr
    io.memForwarding.data := io.writeRfOp_i.data
}