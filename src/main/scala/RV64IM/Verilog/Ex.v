module Ex(
  input  [63:0] io_exInfo_oprand1,
  input  [63:0] io_exInfo_oprand2,
  input  [4:0]  io_exInfo_rd,
  input         io_exInfo_wreg,
  input  [6:0]  io_exInfo_opcode,
  input  [4:0]  io_exInfo_aluop,
  output [4:0]  io_exForwarding_addr,
  output [63:0] io_exForwarding_data,
  output        io_writeRfOp_en,
  output [63:0] io_writeRfOp_data,
  output [4:0]  io_writeRfOp_addr
);
  wire [64:0] _aluRes_T = io_exInfo_oprand1 + io_exInfo_oprand2; // @[Ex.scala 19:26]
  wire [63:0] _aluRes_T_1 = io_exInfo_oprand1 + io_exInfo_oprand2; // @[Ex.scala 19:26]
  wire [64:0] _aluRes_T_2 = io_exInfo_oprand1 - io_exInfo_oprand2; // @[Ex.scala 20:26]
  wire [63:0] _aluRes_T_3 = io_exInfo_oprand1 - io_exInfo_oprand2; // @[Ex.scala 20:26]
  wire [63:0] _aluRes_T_4 = io_exInfo_oprand1; // @[Ex.scala 21:29]
  wire [63:0] _aluRes_T_5 = io_exInfo_oprand2; // @[Ex.scala 21:46]
  wire  _aluRes_T_6 = $signed(io_exInfo_oprand1) < $signed(io_exInfo_oprand2); // @[Ex.scala 21:36]
  wire  _aluRes_T_7 = $signed(io_exInfo_oprand1) < $signed(io_exInfo_oprand2); // @[Ex.scala 21:20]
  wire  _aluRes_T_8 = io_exInfo_oprand1 < io_exInfo_oprand2; // @[Ex.scala 22:29]
  wire  _aluRes_T_9 = io_exInfo_oprand1 < io_exInfo_oprand2; // @[Ex.scala 22:20]
  wire [63:0] _aluRes_T_10 = io_exInfo_oprand1 ^ io_exInfo_oprand2; // @[Ex.scala 23:26]
  wire [63:0] _aluRes_T_11 = io_exInfo_oprand1 | io_exInfo_oprand2; // @[Ex.scala 24:26]
  wire [63:0] _aluRes_T_12 = io_exInfo_oprand1 & io_exInfo_oprand2; // @[Ex.scala 25:26]
  wire [4:0] _aluRes_T_13 = io_exInfo_oprand2[4:0]; // @[Ex.scala 26:36]
  wire [94:0] _GEN_3 = {{31'd0}, io_exInfo_oprand1}; // @[Ex.scala 26:26]
  wire [94:0] _aluRes_T_14 = _GEN_3 << io_exInfo_oprand2[4:0]; // @[Ex.scala 26:26]
  wire [4:0] _aluRes_T_15 = io_exInfo_oprand2[4:0]; // @[Ex.scala 27:36]
  wire [63:0] _aluRes_T_16 = io_exInfo_oprand1 >> io_exInfo_oprand2[4:0]; // @[Ex.scala 27:26]
  wire [63:0] _aluRes_T_17 = io_exInfo_oprand1; // @[Ex.scala 28:26]
  wire [4:0] _aluRes_T_18 = io_exInfo_oprand2[4:0]; // @[Ex.scala 28:43]
  wire [63:0] _aluRes_T_19 = $signed(io_exInfo_oprand1) >>> io_exInfo_oprand2[4:0]; // @[Ex.scala 28:33]
  wire [63:0] _aluRes_T_20 = $signed(io_exInfo_oprand1) >>> io_exInfo_oprand2[4:0]; // @[Ex.scala 28:50]
  wire  _aluRes_T_21 = 5'h0 == io_exInfo_aluop; // @[Mux.scala 81:61]
  wire [63:0] _aluRes_T_22 = 5'h0 == io_exInfo_aluop ? _aluRes_T_1 : 64'h0; // @[Mux.scala 81:58]
  wire  _aluRes_T_23 = 5'h1 == io_exInfo_aluop; // @[Mux.scala 81:61]
  wire [63:0] _aluRes_T_24 = 5'h1 == io_exInfo_aluop ? _aluRes_T_3 : _aluRes_T_22; // @[Mux.scala 81:58]
  wire  _aluRes_T_25 = 5'h2 == io_exInfo_aluop; // @[Mux.scala 81:61]
  wire [63:0] _aluRes_T_26 = 5'h2 == io_exInfo_aluop ? {{63'd0}, _aluRes_T_6} : _aluRes_T_24; // @[Mux.scala 81:58]
  wire  _aluRes_T_27 = 5'h3 == io_exInfo_aluop; // @[Mux.scala 81:61]
  wire [63:0] _aluRes_T_28 = 5'h3 == io_exInfo_aluop ? {{63'd0}, _aluRes_T_8} : _aluRes_T_26; // @[Mux.scala 81:58]
  wire  _aluRes_T_29 = 5'h4 == io_exInfo_aluop; // @[Mux.scala 81:61]
  wire [63:0] _aluRes_T_30 = 5'h4 == io_exInfo_aluop ? _aluRes_T_10 : _aluRes_T_28; // @[Mux.scala 81:58]
  wire  _aluRes_T_31 = 5'h5 == io_exInfo_aluop; // @[Mux.scala 81:61]
  wire [63:0] _aluRes_T_32 = 5'h5 == io_exInfo_aluop ? _aluRes_T_11 : _aluRes_T_30; // @[Mux.scala 81:58]
  wire  _aluRes_T_33 = 5'h6 == io_exInfo_aluop; // @[Mux.scala 81:61]
  wire [63:0] _aluRes_T_34 = 5'h6 == io_exInfo_aluop ? _aluRes_T_12 : _aluRes_T_32; // @[Mux.scala 81:58]
  wire  _aluRes_T_35 = 5'h7 == io_exInfo_aluop; // @[Mux.scala 81:61]
  wire [94:0] _aluRes_T_36 = 5'h7 == io_exInfo_aluop ? _aluRes_T_14 : {{31'd0}, _aluRes_T_34}; // @[Mux.scala 81:58]
  wire  _aluRes_T_37 = 5'h8 == io_exInfo_aluop; // @[Mux.scala 81:61]
  wire [94:0] _aluRes_T_38 = 5'h8 == io_exInfo_aluop ? {{31'd0}, _aluRes_T_16} : _aluRes_T_36; // @[Mux.scala 81:58]
  wire  _aluRes_T_39 = 5'h9 == io_exInfo_aluop; // @[Mux.scala 81:61]
  wire [94:0] aluRes = 5'h9 == io_exInfo_aluop ? {{31'd0}, _aluRes_T_20} : _aluRes_T_38; // @[Mux.scala 81:58]
  wire  _T = 7'h33 == io_exInfo_opcode; // @[Ex.scala 35:29]
  wire [63:0] _io_writeRfOp_WIRE_data = 64'h0; // @[Ex.scala 33:{36,36}]
  wire [94:0] _GEN_0 = 7'h33 == io_exInfo_opcode ? aluRes : 95'h0; // @[Ex.scala 33:21 35:29 37:32]
  wire  _io_writeRfOp_WIRE_en = 1'h0; // @[Ex.scala 33:{36,36}]
  wire  _GEN_1 = 7'h33 == io_exInfo_opcode; // @[Ex.scala 33:21 35:29 38:32]
  wire [4:0] _io_writeRfOp_WIRE_addr = 5'h0; // @[Ex.scala 33:{36,36}]
  wire [4:0] _GEN_2 = 7'h33 == io_exInfo_opcode ? io_exInfo_rd : 5'h0; // @[Ex.scala 33:21 35:29 39:32]
  assign io_exForwarding_addr = io_exInfo_rd; // @[Ex.scala 44:28]
  assign io_exForwarding_data = aluRes[63:0]; // @[Ex.scala 43:28]
  assign io_writeRfOp_en = 7'h33 == io_exInfo_opcode; // @[Ex.scala 35:29]
  assign io_writeRfOp_data = _GEN_0[63:0];
  assign io_writeRfOp_addr = 7'h33 == io_exInfo_opcode ? io_exInfo_rd : 5'h0; // @[Ex.scala 33:21 35:29 39:32]
endmodule
