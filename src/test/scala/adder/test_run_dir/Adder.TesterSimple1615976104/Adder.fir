;buildInfoPackage: chisel3, version: 3.3.1, scalaVersion: 2.12.11, sbtVersion: 1.3.10
circuit Adder : 
  module Adder : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip a : SInt<8>, flip b : SInt<8>, out : SInt<8>}
    
    node _T = add(io.a, io.b) @[Adder.scala 15:20]
    node _T_1 = tail(_T, 1) @[Adder.scala 15:20]
    node _T_2 = asSInt(_T_1) @[Adder.scala 15:20]
    io.out <= _T_2 @[Adder.scala 15:12]
    
