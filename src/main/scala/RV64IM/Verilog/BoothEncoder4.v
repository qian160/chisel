module BoothEncoder4(
  input        clock,
  input        reset,
  input  [4:0] io_data,
  output       io_neg,
  output [3:0] io_weight
);
  wire [1:0] _io_weight_T_3 = 5'h2 == io_data ? 2'h2 : {{1'd0}, 5'h1 == io_data}; // @[Mux.scala 81:58]
  wire [1:0] _io_weight_T_5 = 5'h3 == io_data ? 2'h3 : _io_weight_T_3; // @[Mux.scala 81:58]
  wire [2:0] _io_weight_T_7 = 5'h4 == io_data ? 3'h4 : {{1'd0}, _io_weight_T_5}; // @[Mux.scala 81:58]
  wire [2:0] _io_weight_T_9 = 5'h5 == io_data ? 3'h5 : _io_weight_T_7; // @[Mux.scala 81:58]
  wire [2:0] _io_weight_T_11 = 5'h6 == io_data ? 3'h6 : _io_weight_T_9; // @[Mux.scala 81:58]
  wire [2:0] _io_weight_T_13 = 5'h7 == io_data ? 3'h7 : _io_weight_T_11; // @[Mux.scala 81:58]
  wire [3:0] _io_weight_T_15 = 5'h8 == io_data ? 4'h8 : {{1'd0}, _io_weight_T_13}; // @[Mux.scala 81:58]
  wire [3:0] _io_weight_T_17 = 5'h9 == io_data ? 4'h9 : _io_weight_T_15; // @[Mux.scala 81:58]
  wire [3:0] _io_weight_T_19 = 5'ha == io_data ? 4'ha : _io_weight_T_17; // @[Mux.scala 81:58]
  wire [3:0] _io_weight_T_21 = 5'hb == io_data ? 4'hb : _io_weight_T_19; // @[Mux.scala 81:58]
  wire [3:0] _io_weight_T_23 = 5'hc == io_data ? 4'hc : _io_weight_T_21; // @[Mux.scala 81:58]
  wire [3:0] _io_weight_T_25 = 5'hd == io_data ? 4'hd : _io_weight_T_23; // @[Mux.scala 81:58]
  wire [3:0] _io_weight_T_27 = 5'he == io_data ? 4'he : _io_weight_T_25; // @[Mux.scala 81:58]
  wire [3:0] _io_weight_T_29 = 5'hf == io_data ? 4'hf : _io_weight_T_27; // @[Mux.scala 81:58]
  wire [3:0] _io_weight_T_31 = 5'h10 == io_data ? 4'hf : _io_weight_T_29; // @[Mux.scala 81:58]
  wire [3:0] _io_weight_T_33 = 5'h11 == io_data ? 4'he : _io_weight_T_31; // @[Mux.scala 81:58]
  wire [3:0] _io_weight_T_35 = 5'h12 == io_data ? 4'hd : _io_weight_T_33; // @[Mux.scala 81:58]
  wire [3:0] _io_weight_T_37 = 5'h13 == io_data ? 4'hc : _io_weight_T_35; // @[Mux.scala 81:58]
  wire [3:0] _io_weight_T_39 = 5'h14 == io_data ? 4'hb : _io_weight_T_37; // @[Mux.scala 81:58]
  wire [3:0] _io_weight_T_41 = 5'h15 == io_data ? 4'ha : _io_weight_T_39; // @[Mux.scala 81:58]
  wire [3:0] _io_weight_T_43 = 5'h16 == io_data ? 4'h9 : _io_weight_T_41; // @[Mux.scala 81:58]
  wire [3:0] _io_weight_T_45 = 5'h17 == io_data ? 4'h8 : _io_weight_T_43; // @[Mux.scala 81:58]
  wire [3:0] _io_weight_T_47 = 5'h18 == io_data ? 4'h7 : _io_weight_T_45; // @[Mux.scala 81:58]
  wire [3:0] _io_weight_T_49 = 5'h19 == io_data ? 4'h6 : _io_weight_T_47; // @[Mux.scala 81:58]
  wire [3:0] _io_weight_T_51 = 5'h1a == io_data ? 4'h5 : _io_weight_T_49; // @[Mux.scala 81:58]
  wire [3:0] _io_weight_T_53 = 5'h1b == io_data ? 4'h4 : _io_weight_T_51; // @[Mux.scala 81:58]
  wire [3:0] _io_weight_T_55 = 5'h1c == io_data ? 4'h3 : _io_weight_T_53; // @[Mux.scala 81:58]
  wire [3:0] _io_weight_T_57 = 5'h1d == io_data ? 4'h2 : _io_weight_T_55; // @[Mux.scala 81:58]
  wire [3:0] _io_weight_T_59 = 5'h1e == io_data ? 4'h1 : _io_weight_T_57; // @[Mux.scala 81:58]
  assign io_neg = io_data > 5'hf; // @[BoothEncoder4.scala 49:27]
  assign io_weight = 5'h1f == io_data ? 4'h0 : _io_weight_T_59; // @[Mux.scala 81:58]
endmodule
