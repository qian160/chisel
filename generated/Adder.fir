circuit Adder :
  module Adder :
    input clock : Clock
    input reset : UInt<1>
    output io : { flip a : SInt<8>, flip b : SInt<8>, out : SInt<8>}

    node _io_out_T = add(io.a, io.b) @[Adder.scala 15:20]
    node _io_out_T_1 = tail(_io_out_T, 1) @[Adder.scala 15:20]
    node _io_out_T_2 = asSInt(_io_out_T_1) @[Adder.scala 15:20]
    io.out <= _io_out_T_2 @[Adder.scala 15:12]

