package Adder 

import chisel3._
import chisel3.iotesters._
import scala.util.Random
//import org.scalatest._
import chiseltest._
//import chiseltest.iotesters._
import org.scalatest.freespec.AnyFreeSpec


class Adder extends Module {
    val io = IO(new Bundle {
        val a = Input(SInt(8.W))
        val b = Input(SInt(8.W))
        val out = Output(SInt(8.W))
    } )

    io.out := io.a + io.b
}

class TesterMain(dut: Adder) extends
    PeekPokeTester(dut) {
    val Rnd = new Random()
    while(true){
        poke(dut.io.a, ((Rnd.nextInt())%100).S)
        poke(dut.io.b, ((Rnd.nextInt())%100).S)
        step (1)

//        expect(dut.io.out,dut.io.a + dut.io.b)
        println("Result is "+peek(dut.io.out).toString)
    }
}

class TesterSpec extends AnyFreeSpec with ChiselScalatestTester{
    "tester should return signed values " in{
         chisel3.iotesters.Driver ( () => new Adder()) {
            c => new TesterMain (c) 
        }
    }
}

object TesterMain extends App {

//old codes
    println(getVerilogString(new Adder))
/*    
    println("generate vcd...")
    chisel3.iotesters.Driver.execute(Array("--fint-write-vcd"),() => new Adder) {
        c => new TesterSimple(c)
    }
*/    
    println("start tests...")
    chisel3.iotesters.Driver ( () => new Adder()) {
        c => new TesterMain(c) 
    }


    


}
