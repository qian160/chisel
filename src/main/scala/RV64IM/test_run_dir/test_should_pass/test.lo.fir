circuit test :
  module test :
    input clock : Clock
    input reset : UInt<1>
    input io_i : UInt<5>
    output io_o : UInt<10>

    node _io_o_T = asSInt(io_i) @[helpers.scala 7:47]
    node _io_o_T_1 = pad(_io_o_T, 10) @[helpers.scala 7:57]
    node _io_o_T_2 = asUInt(_io_o_T_1) @[helpers.scala 7:62]
    io_o <= _io_o_T_2 @[Tester.scala 33:10]
