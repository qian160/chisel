circuit BoothEncoder2 :
  module BoothEncoder2 :
    input clock : Clock
    input reset : UInt<1>
    input io_data : UInt<3>
    output io_weight : UInt<2>
    output io_neg : UInt<1>

    node _io_weight_tmp_T = bits(io_data, 2, 2) @[Mult.scala 282:26]
    node _io_weight_tmp_T_1 = mux(_io_weight_tmp_T, UInt<2>("h2"), UInt<1>("h0")) @[Mult.scala 282:21]
    node _io_weight_tmp_T_2 = bits(io_data, 1, 1) @[Mult.scala 282:53]
    node _io_weight_tmp_T_3 = add(_io_weight_tmp_T_1, _io_weight_tmp_T_2) @[Mult.scala 282:47]
    node _io_weight_tmp_T_4 = tail(_io_weight_tmp_T_3, 1) @[Mult.scala 282:47]
    node _io_weight_tmp_T_5 = bits(io_data, 0, 0) @[Mult.scala 282:63]
    node _io_weight_tmp_T_6 = add(_io_weight_tmp_T_4, _io_weight_tmp_T_5) @[Mult.scala 282:57]
    node io_weight_tmp = tail(_io_weight_tmp_T_6, 1) @[Mult.scala 282:57]
    node _io_weight_T = bits(io_data, 2, 2) @[Mult.scala 283:20]
    node _io_weight_T_1 = sub(UInt<3>("h4"), io_weight_tmp) @[Mult.scala 283:29]
    node _io_weight_T_2 = tail(_io_weight_T_1, 1) @[Mult.scala 283:29]
    node _io_weight_T_3 = mux(_io_weight_T, _io_weight_T_2, io_weight_tmp) @[Mult.scala 283:12]
    node _io_neg_T = bits(io_data, 2, 2) @[Mult.scala 291:25]
    io_weight <= bits(_io_weight_T_3, 1, 0) @[Mult.scala 290:15]
    io_neg <= _io_neg_T @[Mult.scala 291:15]
