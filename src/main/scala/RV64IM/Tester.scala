package RV64
import Wallace._
import org.scalatest.flatspec.AnyFlatSpec
import scala.io.StdIn
import chisel3._                //basic data types
import chisel3.iotesters._      //peek poke 
import scala.util.Random        
import chiseltest._             //test
import chisel3.util._

object D{       //debug
    val red    = "\u001b[40;31m"
    val green  = "\u001b[40;32m"
    val yellow = "\u001b[40;33m"
    val blue   = "\u001b[40;34m"
    val purple = "\u001b[40;35m"
    val ed     = "\u001b[0m"

    val Purple = "\u001b[40;35m[pass!]\u001b[0m"
    val Yellow = "\u001b[40;33m[pass!]\u001b[0m"
    val Blue   = "\u001b[40;34m[pass!]\u001b[0m"
    val Red    = "\u001b[40;31m[fail!]\u001b[0m"
    val Green  = "\u001b[40;32m[pass!]\u001b[0m"
    def risingedge(x: Bool) = x && !RegNext(x)
}

class simple extends Module{
    val io = IO(new Bundle{
        val o = Output(Bits(32.W))
    })
    val ram = SyncReadMem(100,UInt(8.W))
    ram(0)  := 0.U
    ram(1)  := 1.U
    ram(2)  := 2.U
    ram(3)  := 3.U
    io.o := Cat(ram(0),ram(1),ram(2),ram(3))
    //io.o := DontCare
}

class TesterSpec extends AnyFlatSpec with ChiselScalatestTester{
    val Rnd = new Random()
    println("\u001b[40;32mgenerate verilog code...\u001b[0m")
    println(getVerilogString(new Top))

    "test" should "pass " in{
        test(new simple){dut => 
            val v = dut.io.o.peek()
            println(s"$v")
        }
    }
}

object TesterGen {
    def main(args:Array[String]):Unit = {
        args foreach println
        println(D.yellow+"generate verilog... "+D.ed)
        (new chisel3.stage.ChiselStage).emitVerilog(new Top,args)

    }
}
/*
PeekPokeTester:
    poke(port,value):   set the input port
    peek:               read the output port
    expect:             check the output port
    step:               advance the dut's clock
*/

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