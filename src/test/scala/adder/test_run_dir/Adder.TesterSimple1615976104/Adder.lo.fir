circuit Adder :
  module Adder :
    input clock : Clock
    input reset : UInt<1>
    input io_a : SInt<8>
    input io_b : SInt<8>
    output io_out : SInt<8>
  
    node _T = add(io_a, io_b) @[Adder.scala 15:20]
    node _T_1 = tail(_T, 1) @[Adder.scala 15:20]
    node _T_2 = asSInt(_T_1) @[Adder.scala 15:20]
    io_out <= _T_2 @[Adder.scala 15:12]
