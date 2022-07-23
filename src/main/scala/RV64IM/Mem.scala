package RV64

import chisel3._
import chisel3.util._

//Mem is a chisel identifier, so we can't use this as class name
class Memory extends Module{
    def checkMem(width:UInt, addr:UInt):Bool = {
        //don't do load or store when use an illegal address
        MuxLookup(width, false.B, Seq(
            0.U ->  true.B,                 /*LB, always aligned*/
            1.U ->  ~addr(0),               /*LH, the LSB should be 0*/
            2.U ->  (~addr(0) & ~addr(1)),  /*LW, shoud end with 00*/
            //3.U 
        ))
    }
    val io = IO(new Bundle{
        val writeRfOp_i   = Input(new writeRfOp)
        val loadOp        = Input(new loadOp)
        val storeOp       = Input(new storeOp)
        val memForwarding = Output(new Forwarding)
        val writeRfOp_o   = Output(new writeRfOp)
    })

    val ram       = SyncReadMem(1024 , Bits(8.W))    //1 kb

    val laddr     = io.loadOp.addr
    val lwidth    = io.loadOp.Width
    val legalLoad = checkMem(lwidth, laddr)
    //add alignment check later
    val loadVal  =   MuxLookup(lwidth, 0.U, Seq(
        //fixpoint: s and u extension
        0.U ->  ram(laddr),                         //LB
        1.U ->  Cat(ram(laddr), ram(laddr + 1.U)),  //LH
        2.U ->  Cat(ram(laddr), ram(laddr + 1.U),ram(laddr + 2.U), ram(laddr + 3.U)),  //Lw
        //3.U  ->  Cat(ram(laddr), ...)       //LD
    ))    
    //illegal address will trigger an exception. we havn't implemented taht yet so just use a 0
    val ldata   = Mux(legalLoad, loadVal, 0.U)

    val saddr      = io.storeOp.addr
    val sval       = io.storeOp.data
    val swidth     = io.storeOp.Width
    val legalStore = checkMem(swidth, saddr)

    //bug: read after load. load's ex stage don't generate the wdata, so bypass may fail
    when(io.storeOp.en & legalStore){
        switch(io.storeOp.Width){
            is(0.U){
                ram(saddr)      := sval(7,0)
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
    io.writeRfOp_o.data   := Mux(io.loadOp.isLoad, ldata, io.writeRfOp_i.data)
    io.writeRfOp_o.en     := io.writeRfOp_i.en
    io.writeRfOp_o.addr   := io.writeRfOp_i.addr

    io.memForwarding.addr := io.writeRfOp_i.addr
    io.memForwarding.data := Mux(io.loadOp.isLoad, loadVal, io.writeRfOp_i.data)
}