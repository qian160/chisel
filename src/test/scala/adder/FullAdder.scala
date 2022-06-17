package FA
import chiseltest._
import chisel3._

class FullAdder extends Module    //DUT
{
    val io = IO(new Bundle{
        val a     =  Input(UInt(1.W))
        val b     =  Input(UInt(1.W))
        val cin   =  Input(UInt(1.W))
        val cout  =  Output(UInt(1.W))
        val carry =  Output(UInt(1.W))
    })

    io.cout  := io.a ^ io.b ^ io.cin
    io.carry := (io.a & io.b) | (io.a & io.cin) | (io.b & io.cin)
}

object FullAdderTest              //TB
{
    def main(args:Array[String]):Unit=
    {
        (new chisel3.stage.ChiselStage).emitVerilog(new FullAdder(), Array("--target-dir", "generated"))
/*        
        val fa = new FullAdder()
        fa.io.a.poke(1.U)
        fa.io.b.poke(1.U)
        fa.io.cin.poke(1.U)
*/        
    }
}
