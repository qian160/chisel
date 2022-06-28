package RV64

import org.scalatest._
import org.scalatest.flatspec.AnyFlatSpec
import chisel3._
import chisel3.iotesters._
import chisel3.util._
import scala.util.Random
import chiseltest._

/*
PeekPokeTester:
    poke(port,value):   set the input port
    peek:               read the output port
    expect:             check the output port
    step:               advance the dut's clock
*/
//modify the dut name to use
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

class TesterSpec extends AnyFlatSpec with ChiselScalatestTester{
    //not so beautiful?...
    val DUT = new Inst_Rom()
    val Rnd = new Random()
    println(getVerilogString(DUT)
    "test" should "pass" in{
        test(DUT){ dut => 

            for(a <- 0 to 1; b <- 0 to 9){
//                dut.io.i1.poke(1.U)
//                dut.io.i2.poke(0.U)
                if(a<1)dut.io.en.poke(true.B)
                else   dut.io.en.poke(false.B)
                dut.io.addr_i.poke(b.U)
                dut.clock.step(1)
                println("inst = " + dut.io.inst_o.peek().toString)
            }   

        }
    }
}

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
