import Arith._
import Helpers._

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
    def risingedge(x: Bool) = x && !RegNext(x)  //x: input signal Reg: stored signal, previous value
}
object s{
    val x = 0.U
    val a = 1.U
    val b = 2.U
    val c = 3.U
}
class simple extends Module{
    val io = IO(new Bundle{
        val i = Input(Bool())
        val d = Input(Bits(4.W))
        val o = Output(Bits(4.W))
    })
    val mem = Mem(4, UInt(4.W))
    when(reset.asBool){
        for(i <- 0 to 3){
            mem(i)  := io.d
        }
    }
    io.o := mem(0)
}

class Tester extends AnyFlatSpec with ChiselScalatestTester{
    val Rnd = new Random()
    println(D.yellow + "enerate verilog code..." + D.ed)
    println(getVerilogString(new simple))
    var cnt = 0
    "test" should "pass " in{
        test(new simple){ t => ()}
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
old method

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
