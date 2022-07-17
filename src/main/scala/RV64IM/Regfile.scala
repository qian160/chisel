package RV64

import chisel3._
import chisel3.util._

class Regfile extends Module{
    val io = IO(new Bundle{
        val id2Rf        = new id2Rf   //readIndex
        //wb to rf
        val writeRfOp    = new writeRfOp

        val rf2Id        = Flipped(new rf2Id)
    })
    //val rf = SyncReadMem(32,UInt(64.W))
    val rf    = RegInit(VecInit(Seq.fill(31)(0.U(64.W))))
    rf(0) := 0.U

    when(io.writeRfOp.en){     
        if(io.writeRfOp.addr!= 0.U)   
            rf(io.writeRfOp.addr) := io.writeRfOp.data
    }
    //read
    io.rf2Id.RegData1 := rf(io.id2Rf.ReadIdx1)
    io.rf2Id.RegData2 := rf(io.id2Rf.ReadIdx2)    
}