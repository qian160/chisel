circuit FullAdder :
  module FullAdder :
    input clock : Clock
    input reset : UInt<1>
    output io : { flip a : UInt<1>, flip b : UInt<1>, flip cin : UInt<1>, cout : UInt<1>, carry : UInt<1>}

    node _io_cout_T = xor(io.a, io.b) @[FullAdder.scala 15:22]
    node _io_cout_T_1 = xor(_io_cout_T, io.cin) @[FullAdder.scala 15:29]
    io.cout <= _io_cout_T_1 @[FullAdder.scala 15:14]
    node _io_carry_T = and(io.a, io.b) @[FullAdder.scala 16:23]
    node _io_carry_T_1 = and(io.a, io.cin) @[FullAdder.scala 16:39]
    node _io_carry_T_2 = or(_io_carry_T, _io_carry_T_1) @[FullAdder.scala 16:31]
    node _io_carry_T_3 = and(io.b, io.cin) @[FullAdder.scala 16:57]
    node _io_carry_T_4 = or(_io_carry_T_2, _io_carry_T_3) @[FullAdder.scala 16:49]
    io.carry <= _io_carry_T_4 @[FullAdder.scala 16:14]

