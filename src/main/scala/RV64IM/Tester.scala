package RV64
import Wallace._
//import org.scalatest._
import org.scalatest.flatspec.AnyFlatSpec
import chisel3._
import chisel3.iotesters._
//import chisel3.util._
import scala.util.Random
import chiseltest._

/*
PeekPokeTester:
    poke(port,value):   set the input port
    peek:               read the output port
    expect:             check the output port
    step:               advance the dut's clock
*/

class simple extends Module{
    val io = IO(new Bundle{
        val i = Input(UInt(8.W))
        val o = Output(SInt(16.W))
    })
    io.o := io.i.asSInt() * io.i.asSInt()
}

class TesterSpec extends AnyFlatSpec with ChiselScalatestTester{
    val Rnd = new Random()      //for test use...

    val purple = "\u001b[40;35m[test]\u001b[0m"
    val yellow = "\u001b[40;33m[test]\u001b[0m"
    val blue   = "\u001b[40;34m[test]\u001b[0m"
    val red    = "\u001b[40;31m[test]\u001b[0m"
    val green  = "\u001b[40;32m[test]\u001b[0m"

    println("\u001b[40;32mgenerate verilog code...\u001b[0m")
/*
    (new chisel3.stage.ChiselStage).emitVerilog(
        new BoothEncoder8() ,Array("--target-dir","Verilog"))
*/
    println(getVerilogString(new BoothEncoder8()))
    var cnt = 0
    "test Booth-8" should "pass" in{
        test(new BoothEncoder8()){ dut => 
        var cnt = 0
            for(b <- 0 to 1; a <- 0  to 511 ){
                dut.io.sign.poke(if(b == 0)true.B else false.B)
                dut.io.data.poke(a)
                val v1 = dut.io.weight.peek()
                val v2 = dut.io.neg.peek()
                cnt = cnt + 1
                println(s"$purple $cnt \t $v1 \t $v2")
            }
        }
    }
}
/*
object Tester {
    def main(args:Array[String]):Unit = {
        println("start testing...")

        println("generate verilog code...")
        //println((new chisel3.stage.ChiselStage).emitVerilog(new Inst_Rom() ),Array("--target-dir","test"))
        println("run tests...")

        chisel3.iotesters.Driver ( () => new Inst_Rom()) {
            c => new TesterPP (c)
        }

        println("success!")
    }
}
*/

/*
    old methods, should avoid to use!
class TesterPP(dut:Inst_Rom) extends PeekPokeTester(dut) {
    val Rnd = new Random()
    //val cnt = RegInit(0.U)
    //cnt := cnt + 1.U
    while(true){
        //dut.io.addr_i := cnt
        //poke(dut.io.addr_i,cnt)
        step (1)
        //println("Result is "+peek(dut.io.inst_o.toString))
    }
}
*/