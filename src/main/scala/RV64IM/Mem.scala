import Helpers._
import chisel3._
import chisel3.util._

//Mem is a chisel identifier, so we can't use this as class name
class MEM extends Module{
    def checkMem(width:UInt, addr:UInt):Bool = {
        //don't do load or store when use an illegal address
        MuxLookup(width, false.B, Seq(
            0.U ->  true.B,                 /*LB, always aligned*/
            1.U ->  ~addr(0),               /*LH, should end with 0*/
            2.U ->  (~addr(0) & ~addr(1)),  /*LW, should end with 00*/
            3.U ->  (~addr(0) & ~addr(1) & ~addr(2))
        ))
    }
    val io = IO(new Bundle{
        val writeRfOp_i   = Input(new writeRfOp)
        val writeCSROp_i  = Input(new writeCSROp)
        val loadOp        = Input(new loadOp)
        val storeOp       = Input(new storeOp)
        val exception_i   = Input(new exception)

        val rf_fwd        = Output(new rf_fwd)
        val csr_fwd       = Output(new csr_fwd)
        val writeRfOp_o   = Output(new writeRfOp)
        val writeCSROp_o  = Output(new writeCSROp)
        val exception_o   = Output(new exception)
    })

    val ram       = Mem(1024 , Bits(8.W))    //1 kb

    val isLoad      = io.loadOp.isLoad
    val laddr       = io.loadOp.addr
    val lwidth      = io.loadOp.Width
    val LoadIsLegal = checkMem(lwidth, laddr)
    val sign        = io.loadOp.sign

    val BYTE        = ram(laddr)
    val HALFWORD    = Cat(ram(laddr), ram(laddr + 1.U))
    val WORD        = Cat(ram(laddr), ram(laddr + 1.U),ram(laddr + 2.U), ram(laddr + 3.U))
    val DWORD       = Cat(ram(laddr), ram(laddr + 1.U),ram(laddr + 2.U), ram(laddr + 3.U),ram(laddr+4.U), ram(laddr + 5.U),ram(laddr + 6.U), ram(laddr + 7.U))
    //add alignment check later
    val loadVal  =   MuxLookup(lwidth, 0.U, Seq(
        0.U ->  Mux(sign, Util.signExtend(BYTE,64), BYTE),          //LB
        1.U ->  Mux(sign, Util.signExtend(HALFWORD,64), HALFWORD),  //LH
        2.U ->  Mux(sign, Util.signExtend(WORD,64), WORD),          //Lw
        3.U  -> DWORD                                               //LD
    ))    
    //illegal address will trigger an exception. we havn't implemented thAt yet so just use a 0
    val ldata   = Mux(LoadIsLegal, loadVal, 0.U)

    val saddr        = io.storeOp.addr
    val sval         = io.storeOp.data
    val swidth       = io.storeOp.Width
    val StoreIsLegal = checkMem(swidth, saddr)

    when(io.storeOp.en & StoreIsLegal){
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

    io.writeRfOp_o.data   := Mux(isLoad, ldata, io.writeRfOp_i.data)    //if load, then the previous alures(writeRfOp.data) is just an address
    io.writeRfOp_o.en     := io.writeRfOp_i.en
    io.writeRfOp_o.addr   := io.writeRfOp_i.addr

    io.writeCSROp_o       := io.writeCSROp_i

    io.rf_fwd.addr := io.writeRfOp_i.addr
    io.rf_fwd.data := Mux(isLoad, loadVal, io.writeRfOp_i.data)

    io.csr_fwd.data  := io.writeCSROp_o.data
    io.csr_fwd.addr  := io.writeCSROp_o.addr

    io.exception_o   := io.exception_i
}