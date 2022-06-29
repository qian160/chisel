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

class TesterSpec extends AnyFlatSpec with ChiselScalatestTester{
    //this is so convenient!! run with sbt "testOnly RV64.TesterSpec"
    val Rnd = new Random()      //for test use...
    val prefix = "\u001b[40;35m[test]\u001b[0m"
    println("\u001b[40;32mgenerate verilog code...\u001b[0m")
    
//    (new chisel3.stage.ChiselStage).emitVerilog(
//        new BoothEncoder8() ,Array("--target-dir","Verilog"))
    
    println(getVerilogString(new BoothEncoder8))
    var cnt = 0
    "test" should "pass" in{
        test(new BoothEncoder8){ dut => 

            for(a <- 0 to 511/*; b <- 0 to 9*/){
                dut.io.data.poke(a)
                dut.clock.step(1)
                println(prefix +cnt.toString +" :")
                cnt = cnt + 1
                print("weight = " + dut.io.weight.peek().toString + ",\t")
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