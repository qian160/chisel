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

    def risingedge(x: Bool) = x && !RegNext(x)
}

class simple extends Module{
    val io = IO(new Bundle{})
}

class TesterSpec extends AnyFlatSpec with ChiselScalatestTester{
    val Rnd = new Random()
    val Purple = "\u001b[40;35m[pass!]\u001b[0m"
    val Yellow = "\u001b[40;33m[pass!]\u001b[0m"
    val Blue   = "\u001b[40;34m[pass!]\u001b[0m"
    val Red    = "\u001b[40;31m[fail!]\u001b[0m"
    val Green  = "\u001b[40;32m[pass!]\u001b[0m"
    println("\u001b[40;32mgenerate verilog code...\u001b[0m")
    println(getVerilogString(new Mult))
    /*
    "test data hazard" should "$2 get 0x114514" in{
        test(new Mult){dut => 
        var success = 0.0
        var fail    = 0.0
        var cnt     = 0
            for(i <- 0 until 10000000){
                dut.io.a.poke((Rnd.nextLong()).abs.U)
                dut.io.b.poke((Rnd.nextLong()).abs.U)

                val v1 = dut.io.result.peek().toString
                val v2 = dut.io.signed.peek().toString
                val v3 = dut.io.unsigned.peek().toString
                println(s" $v1 \n $v2 \n $v3 \n\n")
                print(s"$cnt: ")
                if(v1 == v2 || v1 == v3){
                    println(Green)
                    success = success + 1.0
                }
                else{
                    println(Red)
                    fail = fail + 1.0
                }
                cnt = cnt + 1
            }
            println("success rate: "+D.purple + "%"+success/100000.0 + D.ed)
            println("failure times: " + fail)
        }

    }
    */
    /*
        r1 = 114514
        add 2 0 1
        add 3 2 2
    */
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