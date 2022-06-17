module FullAdder(
  input   clock,
  input   reset,
  input   io_a,
  input   io_b,
  input   io_cin,
  output  io_cout,
  output  io_carry
);
  assign io_cout = io_a ^ io_b ^ io_cin; // @[FullAdder.scala 15:29]
  assign io_carry = io_a & io_b | io_a & io_cin | io_b & io_cin; // @[FullAdder.scala 16:49]
endmodule
