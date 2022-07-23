package Adder 

import chisel3._
import chisel3.iotesters._
import scala.util.Random
import org.scalatest._

class Adder extends Module {
    val io = IO(new Bundle {
        val a = Input(SInt(8.W))
        val b = Input(SInt(8.W))
        val out = Output(SInt(8.W))
    } )

    io.out := io.a + io.b
}
class TesterSimple(dut: Adder) extends
    PeekPokeTester(dut) {
    val Rnd = new Random()
    while(true){
        poke(dut.io.a, ((Rnd.nextInt)%100).S)
        poke(dut.io.b, ((Rnd.nextInt)%100).S)
        step (1)
        println("Result is "+peek(dut.io.out).toString)
    }
}
//notice that the tb class has the same name as this object 
object TesterSimple extends App {
/*
    //generate verilog code into the file
    (new chisel3.stage.ChiselStage).emitVerilog(new Adder(),
        Array("--target-dir","generated") )
    
    //print the Verilog code 
    println(getVerilogString(new Adder))
*/
//    println(getVerilogString(new Adder))
    chisel3.iotesters.Driver ( () => new Adder()) {
        c => new TesterSimple (c) 
    }
/*    failed to generate vcd.
      generate it in verilator instead

    chisel3.iotesters.Driver.execute(Array("−−generate−vcd−output","on"),
        () => new Adder( ) ){
        c =>new TesterSimple(c)
    }
*/
}
