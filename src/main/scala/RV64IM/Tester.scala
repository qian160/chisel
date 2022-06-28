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
//modify the dut name to use
//old ways.better use test
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
    val Rnd = new Random()      //for test use...

    println("\u001b[40;33mgenerate verilog code...\u001b[0m")
    (new chisel3.stage.ChiselStage).emitVerilog(
        new BoothEncoder4() ,Array("--target-dir","test"))
    
    println(getVerilogString(new BoothEncoder4))

    "test" should "pass" in{
        test(new BoothEncoder4){ dut => 

            for(a <- 0 to 31/*; b <- 0 to 9*/){
//                dut.io.i1.poke(1.U)
//                dut.io.i2.poke(0.U)
//                if(a<1)dut.io.en.poke(true.B)
                //else   dut.io.en.poke(false.B)
                dut.io.data.poke(a.U)
                dut.clock.step(1)
                println("weight = " + dut.io.weight.peek().toString)
                println("neg = " + dut.io.neg.peek().toString)
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