circuit Ppg8 :
  module Ppg8 :
    input clock : Clock
    input reset : UInt<1>
    input io_weight : UInt<8>
    input io_data : UInt<128>
    input io_neg : UInt<1>
    output io_output : UInt<128>

    node _tmp_T = not(io_data) @[Mult.scala 125:30]
    node _tmp_T_1 = add(_tmp_T, UInt<1>("h1")) @[Mult.scala 125:41]
    node _tmp_T_2 = tail(_tmp_T_1, 1) @[Mult.scala 125:41]
    node tmp = mux(io_neg, _tmp_T_2, io_data) @[Mult.scala 125:21]
    node _io_output_T = mul(io_weight, tmp) @[Mult.scala 126:28]
    io_output <= bits(_io_output_T, 127, 0) @[Mult.scala 126:15]
