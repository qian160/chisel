module If(
  input         clock,
  input         reset,
  input         io_reset,
  input         io_stall,
  input         io_flush,
  input         io_branchOp_taken,
  input  [63:0] io_branchOp_target,
  output [63:0] io_pc_o,
  output [31:0] io_inst_o
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [63:0] _RAND_2;
  reg [31:0] _RAND_3;
`endif // RANDOMIZE_REG_INIT
  reg [31:0] inst_rom [0:8191]; // @[If.scala 40:32]
  wire  inst_rom_io_inst_o_MPORT_en; // @[If.scala 40:32]
  wire [12:0] inst_rom_io_inst_o_MPORT_addr; // @[If.scala 40:32]
  wire [31:0] inst_rom_io_inst_o_MPORT_data; // @[If.scala 40:32]
  reg  inst_rom_io_inst_o_MPORT_en_pipe_0;
  reg [12:0] inst_rom_io_inst_o_MPORT_addr_pipe_0;
  reg [63:0] pc; // @[If.scala 44:28]
  reg  flush; // @[If.scala 45:28]
  wire [63:0] _pc_T_1 = pc + 64'h4; // @[If.scala 55:19]
  assign inst_rom_io_inst_o_MPORT_en = inst_rom_io_inst_o_MPORT_en_pipe_0;
  assign inst_rom_io_inst_o_MPORT_addr = inst_rom_io_inst_o_MPORT_addr_pipe_0;
  assign inst_rom_io_inst_o_MPORT_data = inst_rom[inst_rom_io_inst_o_MPORT_addr]; // @[If.scala 40:32]
  assign io_pc_o = io_reset ? 64'h0 : pc; // @[If.scala 59:23]
  assign io_inst_o = io_reset | flush ? 32'h0 : inst_rom_io_inst_o_MPORT_data; // @[If.scala 46:24]
  always @(posedge clock) begin
    inst_rom_io_inst_o_MPORT_en_pipe_0 <= 1'h1;
    if (1'h1) begin
      inst_rom_io_inst_o_MPORT_addr_pipe_0 <= pc[14:2];
    end
    if (reset) begin // @[If.scala 44:28]
      pc <= 64'h0; // @[If.scala 44:28]
    end else if (io_reset) begin // @[If.scala 48:19]
      pc <= 64'h0; // @[If.scala 49:13]
    end else if (!(io_stall)) begin // @[If.scala 50:25]
      if (io_branchOp_taken) begin // @[If.scala 52:34]
        pc <= io_branchOp_target; // @[If.scala 53:13]
      end else begin
        pc <= _pc_T_1; // @[If.scala 55:13]
      end
    end
    flush <= io_flush; // @[If.scala 45:28]
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
  integer initvar;
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  inst_rom_io_inst_o_MPORT_en_pipe_0 = _RAND_0[0:0];
  _RAND_1 = {1{`RANDOM}};
  inst_rom_io_inst_o_MPORT_addr_pipe_0 = _RAND_1[12:0];
  _RAND_2 = {2{`RANDOM}};
  pc = _RAND_2[63:0];
  _RAND_3 = {1{`RANDOM}};
  flush = _RAND_3[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
  $readmemh("/home/s081/Downloads/chisel-template/src/main/scala/RV64IM/Inst_Rom.data", inst_rom);
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module Regfile(
  input         clock,
  input         reset,
  input  [4:0]  io_id2Rf_ReadIdx1,
  input  [4:0]  io_id2Rf_ReadIdx2,
  input         io_writeRfOp_en,
  input  [63:0] io_writeRfOp_data,
  input  [4:0]  io_writeRfOp_addr,
  output [63:0] io_rf2Id_RegData1,
  output [63:0] io_rf2Id_RegData2
);
`ifdef RANDOMIZE_REG_INIT
  reg [63:0] _RAND_0;
  reg [63:0] _RAND_1;
  reg [63:0] _RAND_2;
  reg [63:0] _RAND_3;
  reg [63:0] _RAND_4;
  reg [63:0] _RAND_5;
  reg [63:0] _RAND_6;
  reg [63:0] _RAND_7;
  reg [63:0] _RAND_8;
  reg [63:0] _RAND_9;
  reg [63:0] _RAND_10;
  reg [63:0] _RAND_11;
  reg [63:0] _RAND_12;
  reg [63:0] _RAND_13;
  reg [63:0] _RAND_14;
  reg [63:0] _RAND_15;
  reg [63:0] _RAND_16;
  reg [63:0] _RAND_17;
  reg [63:0] _RAND_18;
  reg [63:0] _RAND_19;
  reg [63:0] _RAND_20;
  reg [63:0] _RAND_21;
  reg [63:0] _RAND_22;
  reg [63:0] _RAND_23;
  reg [63:0] _RAND_24;
  reg [63:0] _RAND_25;
  reg [63:0] _RAND_26;
  reg [63:0] _RAND_27;
  reg [63:0] _RAND_28;
  reg [63:0] _RAND_29;
  reg [63:0] _RAND_30;
`endif // RANDOMIZE_REG_INIT
  reg [63:0] rf_0; // @[Regfile.scala 15:24]
  reg [63:0] rf_1; // @[Regfile.scala 15:24]
  reg [63:0] rf_2; // @[Regfile.scala 15:24]
  reg [63:0] rf_3; // @[Regfile.scala 15:24]
  reg [63:0] rf_4; // @[Regfile.scala 15:24]
  reg [63:0] rf_5; // @[Regfile.scala 15:24]
  reg [63:0] rf_6; // @[Regfile.scala 15:24]
  reg [63:0] rf_7; // @[Regfile.scala 15:24]
  reg [63:0] rf_8; // @[Regfile.scala 15:24]
  reg [63:0] rf_9; // @[Regfile.scala 15:24]
  reg [63:0] rf_10; // @[Regfile.scala 15:24]
  reg [63:0] rf_11; // @[Regfile.scala 15:24]
  reg [63:0] rf_12; // @[Regfile.scala 15:24]
  reg [63:0] rf_13; // @[Regfile.scala 15:24]
  reg [63:0] rf_14; // @[Regfile.scala 15:24]
  reg [63:0] rf_15; // @[Regfile.scala 15:24]
  reg [63:0] rf_16; // @[Regfile.scala 15:24]
  reg [63:0] rf_17; // @[Regfile.scala 15:24]
  reg [63:0] rf_18; // @[Regfile.scala 15:24]
  reg [63:0] rf_19; // @[Regfile.scala 15:24]
  reg [63:0] rf_20; // @[Regfile.scala 15:24]
  reg [63:0] rf_21; // @[Regfile.scala 15:24]
  reg [63:0] rf_22; // @[Regfile.scala 15:24]
  reg [63:0] rf_23; // @[Regfile.scala 15:24]
  reg [63:0] rf_24; // @[Regfile.scala 15:24]
  reg [63:0] rf_25; // @[Regfile.scala 15:24]
  reg [63:0] rf_26; // @[Regfile.scala 15:24]
  reg [63:0] rf_27; // @[Regfile.scala 15:24]
  reg [63:0] rf_28; // @[Regfile.scala 15:24]
  reg [63:0] rf_29; // @[Regfile.scala 15:24]
  reg [63:0] rf_30; // @[Regfile.scala 15:24]
  wire [63:0] _GEN_63 = 5'h1 == io_id2Rf_ReadIdx1 ? rf_1 : rf_0; // @[Regfile.scala 23:{23,23}]
  wire [63:0] _GEN_64 = 5'h2 == io_id2Rf_ReadIdx1 ? rf_2 : _GEN_63; // @[Regfile.scala 23:{23,23}]
  wire [63:0] _GEN_65 = 5'h3 == io_id2Rf_ReadIdx1 ? rf_3 : _GEN_64; // @[Regfile.scala 23:{23,23}]
  wire [63:0] _GEN_66 = 5'h4 == io_id2Rf_ReadIdx1 ? rf_4 : _GEN_65; // @[Regfile.scala 23:{23,23}]
  wire [63:0] _GEN_67 = 5'h5 == io_id2Rf_ReadIdx1 ? rf_5 : _GEN_66; // @[Regfile.scala 23:{23,23}]
  wire [63:0] _GEN_68 = 5'h6 == io_id2Rf_ReadIdx1 ? rf_6 : _GEN_67; // @[Regfile.scala 23:{23,23}]
  wire [63:0] _GEN_69 = 5'h7 == io_id2Rf_ReadIdx1 ? rf_7 : _GEN_68; // @[Regfile.scala 23:{23,23}]
  wire [63:0] _GEN_70 = 5'h8 == io_id2Rf_ReadIdx1 ? rf_8 : _GEN_69; // @[Regfile.scala 23:{23,23}]
  wire [63:0] _GEN_71 = 5'h9 == io_id2Rf_ReadIdx1 ? rf_9 : _GEN_70; // @[Regfile.scala 23:{23,23}]
  wire [63:0] _GEN_72 = 5'ha == io_id2Rf_ReadIdx1 ? rf_10 : _GEN_71; // @[Regfile.scala 23:{23,23}]
  wire [63:0] _GEN_73 = 5'hb == io_id2Rf_ReadIdx1 ? rf_11 : _GEN_72; // @[Regfile.scala 23:{23,23}]
  wire [63:0] _GEN_74 = 5'hc == io_id2Rf_ReadIdx1 ? rf_12 : _GEN_73; // @[Regfile.scala 23:{23,23}]
  wire [63:0] _GEN_75 = 5'hd == io_id2Rf_ReadIdx1 ? rf_13 : _GEN_74; // @[Regfile.scala 23:{23,23}]
  wire [63:0] _GEN_76 = 5'he == io_id2Rf_ReadIdx1 ? rf_14 : _GEN_75; // @[Regfile.scala 23:{23,23}]
  wire [63:0] _GEN_77 = 5'hf == io_id2Rf_ReadIdx1 ? rf_15 : _GEN_76; // @[Regfile.scala 23:{23,23}]
  wire [63:0] _GEN_78 = 5'h10 == io_id2Rf_ReadIdx1 ? rf_16 : _GEN_77; // @[Regfile.scala 23:{23,23}]
  wire [63:0] _GEN_79 = 5'h11 == io_id2Rf_ReadIdx1 ? rf_17 : _GEN_78; // @[Regfile.scala 23:{23,23}]
  wire [63:0] _GEN_80 = 5'h12 == io_id2Rf_ReadIdx1 ? rf_18 : _GEN_79; // @[Regfile.scala 23:{23,23}]
  wire [63:0] _GEN_81 = 5'h13 == io_id2Rf_ReadIdx1 ? rf_19 : _GEN_80; // @[Regfile.scala 23:{23,23}]
  wire [63:0] _GEN_82 = 5'h14 == io_id2Rf_ReadIdx1 ? rf_20 : _GEN_81; // @[Regfile.scala 23:{23,23}]
  wire [63:0] _GEN_83 = 5'h15 == io_id2Rf_ReadIdx1 ? rf_21 : _GEN_82; // @[Regfile.scala 23:{23,23}]
  wire [63:0] _GEN_84 = 5'h16 == io_id2Rf_ReadIdx1 ? rf_22 : _GEN_83; // @[Regfile.scala 23:{23,23}]
  wire [63:0] _GEN_85 = 5'h17 == io_id2Rf_ReadIdx1 ? rf_23 : _GEN_84; // @[Regfile.scala 23:{23,23}]
  wire [63:0] _GEN_86 = 5'h18 == io_id2Rf_ReadIdx1 ? rf_24 : _GEN_85; // @[Regfile.scala 23:{23,23}]
  wire [63:0] _GEN_87 = 5'h19 == io_id2Rf_ReadIdx1 ? rf_25 : _GEN_86; // @[Regfile.scala 23:{23,23}]
  wire [63:0] _GEN_88 = 5'h1a == io_id2Rf_ReadIdx1 ? rf_26 : _GEN_87; // @[Regfile.scala 23:{23,23}]
  wire [63:0] _GEN_89 = 5'h1b == io_id2Rf_ReadIdx1 ? rf_27 : _GEN_88; // @[Regfile.scala 23:{23,23}]
  wire [63:0] _GEN_90 = 5'h1c == io_id2Rf_ReadIdx1 ? rf_28 : _GEN_89; // @[Regfile.scala 23:{23,23}]
  wire [63:0] _GEN_91 = 5'h1d == io_id2Rf_ReadIdx1 ? rf_29 : _GEN_90; // @[Regfile.scala 23:{23,23}]
  wire [63:0] _GEN_94 = 5'h1 == io_id2Rf_ReadIdx2 ? rf_1 : rf_0; // @[Regfile.scala 24:{23,23}]
  wire [63:0] _GEN_95 = 5'h2 == io_id2Rf_ReadIdx2 ? rf_2 : _GEN_94; // @[Regfile.scala 24:{23,23}]
  wire [63:0] _GEN_96 = 5'h3 == io_id2Rf_ReadIdx2 ? rf_3 : _GEN_95; // @[Regfile.scala 24:{23,23}]
  wire [63:0] _GEN_97 = 5'h4 == io_id2Rf_ReadIdx2 ? rf_4 : _GEN_96; // @[Regfile.scala 24:{23,23}]
  wire [63:0] _GEN_98 = 5'h5 == io_id2Rf_ReadIdx2 ? rf_5 : _GEN_97; // @[Regfile.scala 24:{23,23}]
  wire [63:0] _GEN_99 = 5'h6 == io_id2Rf_ReadIdx2 ? rf_6 : _GEN_98; // @[Regfile.scala 24:{23,23}]
  wire [63:0] _GEN_100 = 5'h7 == io_id2Rf_ReadIdx2 ? rf_7 : _GEN_99; // @[Regfile.scala 24:{23,23}]
  wire [63:0] _GEN_101 = 5'h8 == io_id2Rf_ReadIdx2 ? rf_8 : _GEN_100; // @[Regfile.scala 24:{23,23}]
  wire [63:0] _GEN_102 = 5'h9 == io_id2Rf_ReadIdx2 ? rf_9 : _GEN_101; // @[Regfile.scala 24:{23,23}]
  wire [63:0] _GEN_103 = 5'ha == io_id2Rf_ReadIdx2 ? rf_10 : _GEN_102; // @[Regfile.scala 24:{23,23}]
  wire [63:0] _GEN_104 = 5'hb == io_id2Rf_ReadIdx2 ? rf_11 : _GEN_103; // @[Regfile.scala 24:{23,23}]
  wire [63:0] _GEN_105 = 5'hc == io_id2Rf_ReadIdx2 ? rf_12 : _GEN_104; // @[Regfile.scala 24:{23,23}]
  wire [63:0] _GEN_106 = 5'hd == io_id2Rf_ReadIdx2 ? rf_13 : _GEN_105; // @[Regfile.scala 24:{23,23}]
  wire [63:0] _GEN_107 = 5'he == io_id2Rf_ReadIdx2 ? rf_14 : _GEN_106; // @[Regfile.scala 24:{23,23}]
  wire [63:0] _GEN_108 = 5'hf == io_id2Rf_ReadIdx2 ? rf_15 : _GEN_107; // @[Regfile.scala 24:{23,23}]
  wire [63:0] _GEN_109 = 5'h10 == io_id2Rf_ReadIdx2 ? rf_16 : _GEN_108; // @[Regfile.scala 24:{23,23}]
  wire [63:0] _GEN_110 = 5'h11 == io_id2Rf_ReadIdx2 ? rf_17 : _GEN_109; // @[Regfile.scala 24:{23,23}]
  wire [63:0] _GEN_111 = 5'h12 == io_id2Rf_ReadIdx2 ? rf_18 : _GEN_110; // @[Regfile.scala 24:{23,23}]
  wire [63:0] _GEN_112 = 5'h13 == io_id2Rf_ReadIdx2 ? rf_19 : _GEN_111; // @[Regfile.scala 24:{23,23}]
  wire [63:0] _GEN_113 = 5'h14 == io_id2Rf_ReadIdx2 ? rf_20 : _GEN_112; // @[Regfile.scala 24:{23,23}]
  wire [63:0] _GEN_114 = 5'h15 == io_id2Rf_ReadIdx2 ? rf_21 : _GEN_113; // @[Regfile.scala 24:{23,23}]
  wire [63:0] _GEN_115 = 5'h16 == io_id2Rf_ReadIdx2 ? rf_22 : _GEN_114; // @[Regfile.scala 24:{23,23}]
  wire [63:0] _GEN_116 = 5'h17 == io_id2Rf_ReadIdx2 ? rf_23 : _GEN_115; // @[Regfile.scala 24:{23,23}]
  wire [63:0] _GEN_117 = 5'h18 == io_id2Rf_ReadIdx2 ? rf_24 : _GEN_116; // @[Regfile.scala 24:{23,23}]
  wire [63:0] _GEN_118 = 5'h19 == io_id2Rf_ReadIdx2 ? rf_25 : _GEN_117; // @[Regfile.scala 24:{23,23}]
  wire [63:0] _GEN_119 = 5'h1a == io_id2Rf_ReadIdx2 ? rf_26 : _GEN_118; // @[Regfile.scala 24:{23,23}]
  wire [63:0] _GEN_120 = 5'h1b == io_id2Rf_ReadIdx2 ? rf_27 : _GEN_119; // @[Regfile.scala 24:{23,23}]
  wire [63:0] _GEN_121 = 5'h1c == io_id2Rf_ReadIdx2 ? rf_28 : _GEN_120; // @[Regfile.scala 24:{23,23}]
  wire [63:0] _GEN_122 = 5'h1d == io_id2Rf_ReadIdx2 ? rf_29 : _GEN_121; // @[Regfile.scala 24:{23,23}]
  assign io_rf2Id_RegData1 = 5'h1e == io_id2Rf_ReadIdx1 ? rf_30 : _GEN_91; // @[Regfile.scala 23:{23,23}]
  assign io_rf2Id_RegData2 = 5'h1e == io_id2Rf_ReadIdx2 ? rf_30 : _GEN_122; // @[Regfile.scala 24:{23,23}]
  always @(posedge clock) begin
    if (reset) begin // @[Regfile.scala 15:24]
      rf_0 <= 64'h0; // @[Regfile.scala 15:24]
    end else if (io_writeRfOp_en) begin // @[Regfile.scala 18:26]
      if (5'h0 == io_writeRfOp_addr) begin // @[Regfile.scala 20:35]
        rf_0 <= io_writeRfOp_data; // @[Regfile.scala 20:35]
      end else begin
        rf_0 <= 64'h0; // @[Regfile.scala 16:11]
      end
    end else begin
      rf_0 <= 64'h0; // @[Regfile.scala 16:11]
    end
    if (reset) begin // @[Regfile.scala 15:24]
      rf_1 <= 64'h0; // @[Regfile.scala 15:24]
    end else if (io_writeRfOp_en) begin // @[Regfile.scala 18:26]
      if (5'h1 == io_writeRfOp_addr) begin // @[Regfile.scala 20:35]
        rf_1 <= io_writeRfOp_data; // @[Regfile.scala 20:35]
      end
    end
    if (reset) begin // @[Regfile.scala 15:24]
      rf_2 <= 64'h0; // @[Regfile.scala 15:24]
    end else if (io_writeRfOp_en) begin // @[Regfile.scala 18:26]
      if (5'h2 == io_writeRfOp_addr) begin // @[Regfile.scala 20:35]
        rf_2 <= io_writeRfOp_data; // @[Regfile.scala 20:35]
      end
    end
    if (reset) begin // @[Regfile.scala 15:24]
      rf_3 <= 64'h0; // @[Regfile.scala 15:24]
    end else if (io_writeRfOp_en) begin // @[Regfile.scala 18:26]
      if (5'h3 == io_writeRfOp_addr) begin // @[Regfile.scala 20:35]
        rf_3 <= io_writeRfOp_data; // @[Regfile.scala 20:35]
      end
    end
    if (reset) begin // @[Regfile.scala 15:24]
      rf_4 <= 64'h0; // @[Regfile.scala 15:24]
    end else if (io_writeRfOp_en) begin // @[Regfile.scala 18:26]
      if (5'h4 == io_writeRfOp_addr) begin // @[Regfile.scala 20:35]
        rf_4 <= io_writeRfOp_data; // @[Regfile.scala 20:35]
      end
    end
    if (reset) begin // @[Regfile.scala 15:24]
      rf_5 <= 64'h0; // @[Regfile.scala 15:24]
    end else if (io_writeRfOp_en) begin // @[Regfile.scala 18:26]
      if (5'h5 == io_writeRfOp_addr) begin // @[Regfile.scala 20:35]
        rf_5 <= io_writeRfOp_data; // @[Regfile.scala 20:35]
      end
    end
    if (reset) begin // @[Regfile.scala 15:24]
      rf_6 <= 64'h0; // @[Regfile.scala 15:24]
    end else if (io_writeRfOp_en) begin // @[Regfile.scala 18:26]
      if (5'h6 == io_writeRfOp_addr) begin // @[Regfile.scala 20:35]
        rf_6 <= io_writeRfOp_data; // @[Regfile.scala 20:35]
      end
    end
    if (reset) begin // @[Regfile.scala 15:24]
      rf_7 <= 64'h0; // @[Regfile.scala 15:24]
    end else if (io_writeRfOp_en) begin // @[Regfile.scala 18:26]
      if (5'h7 == io_writeRfOp_addr) begin // @[Regfile.scala 20:35]
        rf_7 <= io_writeRfOp_data; // @[Regfile.scala 20:35]
      end
    end
    if (reset) begin // @[Regfile.scala 15:24]
      rf_8 <= 64'h0; // @[Regfile.scala 15:24]
    end else if (io_writeRfOp_en) begin // @[Regfile.scala 18:26]
      if (5'h8 == io_writeRfOp_addr) begin // @[Regfile.scala 20:35]
        rf_8 <= io_writeRfOp_data; // @[Regfile.scala 20:35]
      end
    end
    if (reset) begin // @[Regfile.scala 15:24]
      rf_9 <= 64'h0; // @[Regfile.scala 15:24]
    end else if (io_writeRfOp_en) begin // @[Regfile.scala 18:26]
      if (5'h9 == io_writeRfOp_addr) begin // @[Regfile.scala 20:35]
        rf_9 <= io_writeRfOp_data; // @[Regfile.scala 20:35]
      end
    end
    if (reset) begin // @[Regfile.scala 15:24]
      rf_10 <= 64'h0; // @[Regfile.scala 15:24]
    end else if (io_writeRfOp_en) begin // @[Regfile.scala 18:26]
      if (5'ha == io_writeRfOp_addr) begin // @[Regfile.scala 20:35]
        rf_10 <= io_writeRfOp_data; // @[Regfile.scala 20:35]
      end
    end
    if (reset) begin // @[Regfile.scala 15:24]
      rf_11 <= 64'h0; // @[Regfile.scala 15:24]
    end else if (io_writeRfOp_en) begin // @[Regfile.scala 18:26]
      if (5'hb == io_writeRfOp_addr) begin // @[Regfile.scala 20:35]
        rf_11 <= io_writeRfOp_data; // @[Regfile.scala 20:35]
      end
    end
    if (reset) begin // @[Regfile.scala 15:24]
      rf_12 <= 64'h0; // @[Regfile.scala 15:24]
    end else if (io_writeRfOp_en) begin // @[Regfile.scala 18:26]
      if (5'hc == io_writeRfOp_addr) begin // @[Regfile.scala 20:35]
        rf_12 <= io_writeRfOp_data; // @[Regfile.scala 20:35]
      end
    end
    if (reset) begin // @[Regfile.scala 15:24]
      rf_13 <= 64'h0; // @[Regfile.scala 15:24]
    end else if (io_writeRfOp_en) begin // @[Regfile.scala 18:26]
      if (5'hd == io_writeRfOp_addr) begin // @[Regfile.scala 20:35]
        rf_13 <= io_writeRfOp_data; // @[Regfile.scala 20:35]
      end
    end
    if (reset) begin // @[Regfile.scala 15:24]
      rf_14 <= 64'h0; // @[Regfile.scala 15:24]
    end else if (io_writeRfOp_en) begin // @[Regfile.scala 18:26]
      if (5'he == io_writeRfOp_addr) begin // @[Regfile.scala 20:35]
        rf_14 <= io_writeRfOp_data; // @[Regfile.scala 20:35]
      end
    end
    if (reset) begin // @[Regfile.scala 15:24]
      rf_15 <= 64'h0; // @[Regfile.scala 15:24]
    end else if (io_writeRfOp_en) begin // @[Regfile.scala 18:26]
      if (5'hf == io_writeRfOp_addr) begin // @[Regfile.scala 20:35]
        rf_15 <= io_writeRfOp_data; // @[Regfile.scala 20:35]
      end
    end
    if (reset) begin // @[Regfile.scala 15:24]
      rf_16 <= 64'h0; // @[Regfile.scala 15:24]
    end else if (io_writeRfOp_en) begin // @[Regfile.scala 18:26]
      if (5'h10 == io_writeRfOp_addr) begin // @[Regfile.scala 20:35]
        rf_16 <= io_writeRfOp_data; // @[Regfile.scala 20:35]
      end
    end
    if (reset) begin // @[Regfile.scala 15:24]
      rf_17 <= 64'h0; // @[Regfile.scala 15:24]
    end else if (io_writeRfOp_en) begin // @[Regfile.scala 18:26]
      if (5'h11 == io_writeRfOp_addr) begin // @[Regfile.scala 20:35]
        rf_17 <= io_writeRfOp_data; // @[Regfile.scala 20:35]
      end
    end
    if (reset) begin // @[Regfile.scala 15:24]
      rf_18 <= 64'h0; // @[Regfile.scala 15:24]
    end else if (io_writeRfOp_en) begin // @[Regfile.scala 18:26]
      if (5'h12 == io_writeRfOp_addr) begin // @[Regfile.scala 20:35]
        rf_18 <= io_writeRfOp_data; // @[Regfile.scala 20:35]
      end
    end
    if (reset) begin // @[Regfile.scala 15:24]
      rf_19 <= 64'h0; // @[Regfile.scala 15:24]
    end else if (io_writeRfOp_en) begin // @[Regfile.scala 18:26]
      if (5'h13 == io_writeRfOp_addr) begin // @[Regfile.scala 20:35]
        rf_19 <= io_writeRfOp_data; // @[Regfile.scala 20:35]
      end
    end
    if (reset) begin // @[Regfile.scala 15:24]
      rf_20 <= 64'h0; // @[Regfile.scala 15:24]
    end else if (io_writeRfOp_en) begin // @[Regfile.scala 18:26]
      if (5'h14 == io_writeRfOp_addr) begin // @[Regfile.scala 20:35]
        rf_20 <= io_writeRfOp_data; // @[Regfile.scala 20:35]
      end
    end
    if (reset) begin // @[Regfile.scala 15:24]
      rf_21 <= 64'h0; // @[Regfile.scala 15:24]
    end else if (io_writeRfOp_en) begin // @[Regfile.scala 18:26]
      if (5'h15 == io_writeRfOp_addr) begin // @[Regfile.scala 20:35]
        rf_21 <= io_writeRfOp_data; // @[Regfile.scala 20:35]
      end
    end
    if (reset) begin // @[Regfile.scala 15:24]
      rf_22 <= 64'h0; // @[Regfile.scala 15:24]
    end else if (io_writeRfOp_en) begin // @[Regfile.scala 18:26]
      if (5'h16 == io_writeRfOp_addr) begin // @[Regfile.scala 20:35]
        rf_22 <= io_writeRfOp_data; // @[Regfile.scala 20:35]
      end
    end
    if (reset) begin // @[Regfile.scala 15:24]
      rf_23 <= 64'h0; // @[Regfile.scala 15:24]
    end else if (io_writeRfOp_en) begin // @[Regfile.scala 18:26]
      if (5'h17 == io_writeRfOp_addr) begin // @[Regfile.scala 20:35]
        rf_23 <= io_writeRfOp_data; // @[Regfile.scala 20:35]
      end
    end
    if (reset) begin // @[Regfile.scala 15:24]
      rf_24 <= 64'h0; // @[Regfile.scala 15:24]
    end else if (io_writeRfOp_en) begin // @[Regfile.scala 18:26]
      if (5'h18 == io_writeRfOp_addr) begin // @[Regfile.scala 20:35]
        rf_24 <= io_writeRfOp_data; // @[Regfile.scala 20:35]
      end
    end
    if (reset) begin // @[Regfile.scala 15:24]
      rf_25 <= 64'h0; // @[Regfile.scala 15:24]
    end else if (io_writeRfOp_en) begin // @[Regfile.scala 18:26]
      if (5'h19 == io_writeRfOp_addr) begin // @[Regfile.scala 20:35]
        rf_25 <= io_writeRfOp_data; // @[Regfile.scala 20:35]
      end
    end
    if (reset) begin // @[Regfile.scala 15:24]
      rf_26 <= 64'h0; // @[Regfile.scala 15:24]
    end else if (io_writeRfOp_en) begin // @[Regfile.scala 18:26]
      if (5'h1a == io_writeRfOp_addr) begin // @[Regfile.scala 20:35]
        rf_26 <= io_writeRfOp_data; // @[Regfile.scala 20:35]
      end
    end
    if (reset) begin // @[Regfile.scala 15:24]
      rf_27 <= 64'h0; // @[Regfile.scala 15:24]
    end else if (io_writeRfOp_en) begin // @[Regfile.scala 18:26]
      if (5'h1b == io_writeRfOp_addr) begin // @[Regfile.scala 20:35]
        rf_27 <= io_writeRfOp_data; // @[Regfile.scala 20:35]
      end
    end
    if (reset) begin // @[Regfile.scala 15:24]
      rf_28 <= 64'h0; // @[Regfile.scala 15:24]
    end else if (io_writeRfOp_en) begin // @[Regfile.scala 18:26]
      if (5'h1c == io_writeRfOp_addr) begin // @[Regfile.scala 20:35]
        rf_28 <= io_writeRfOp_data; // @[Regfile.scala 20:35]
      end
    end
    if (reset) begin // @[Regfile.scala 15:24]
      rf_29 <= 64'h0; // @[Regfile.scala 15:24]
    end else if (io_writeRfOp_en) begin // @[Regfile.scala 18:26]
      if (5'h1d == io_writeRfOp_addr) begin // @[Regfile.scala 20:35]
        rf_29 <= io_writeRfOp_data; // @[Regfile.scala 20:35]
      end
    end
    if (reset) begin // @[Regfile.scala 15:24]
      rf_30 <= 64'h0; // @[Regfile.scala 15:24]
    end else if (io_writeRfOp_en) begin // @[Regfile.scala 18:26]
      if (5'h1e == io_writeRfOp_addr) begin // @[Regfile.scala 20:35]
        rf_30 <= io_writeRfOp_data; // @[Regfile.scala 20:35]
      end
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {2{`RANDOM}};
  rf_0 = _RAND_0[63:0];
  _RAND_1 = {2{`RANDOM}};
  rf_1 = _RAND_1[63:0];
  _RAND_2 = {2{`RANDOM}};
  rf_2 = _RAND_2[63:0];
  _RAND_3 = {2{`RANDOM}};
  rf_3 = _RAND_3[63:0];
  _RAND_4 = {2{`RANDOM}};
  rf_4 = _RAND_4[63:0];
  _RAND_5 = {2{`RANDOM}};
  rf_5 = _RAND_5[63:0];
  _RAND_6 = {2{`RANDOM}};
  rf_6 = _RAND_6[63:0];
  _RAND_7 = {2{`RANDOM}};
  rf_7 = _RAND_7[63:0];
  _RAND_8 = {2{`RANDOM}};
  rf_8 = _RAND_8[63:0];
  _RAND_9 = {2{`RANDOM}};
  rf_9 = _RAND_9[63:0];
  _RAND_10 = {2{`RANDOM}};
  rf_10 = _RAND_10[63:0];
  _RAND_11 = {2{`RANDOM}};
  rf_11 = _RAND_11[63:0];
  _RAND_12 = {2{`RANDOM}};
  rf_12 = _RAND_12[63:0];
  _RAND_13 = {2{`RANDOM}};
  rf_13 = _RAND_13[63:0];
  _RAND_14 = {2{`RANDOM}};
  rf_14 = _RAND_14[63:0];
  _RAND_15 = {2{`RANDOM}};
  rf_15 = _RAND_15[63:0];
  _RAND_16 = {2{`RANDOM}};
  rf_16 = _RAND_16[63:0];
  _RAND_17 = {2{`RANDOM}};
  rf_17 = _RAND_17[63:0];
  _RAND_18 = {2{`RANDOM}};
  rf_18 = _RAND_18[63:0];
  _RAND_19 = {2{`RANDOM}};
  rf_19 = _RAND_19[63:0];
  _RAND_20 = {2{`RANDOM}};
  rf_20 = _RAND_20[63:0];
  _RAND_21 = {2{`RANDOM}};
  rf_21 = _RAND_21[63:0];
  _RAND_22 = {2{`RANDOM}};
  rf_22 = _RAND_22[63:0];
  _RAND_23 = {2{`RANDOM}};
  rf_23 = _RAND_23[63:0];
  _RAND_24 = {2{`RANDOM}};
  rf_24 = _RAND_24[63:0];
  _RAND_25 = {2{`RANDOM}};
  rf_25 = _RAND_25[63:0];
  _RAND_26 = {2{`RANDOM}};
  rf_26 = _RAND_26[63:0];
  _RAND_27 = {2{`RANDOM}};
  rf_27 = _RAND_27[63:0];
  _RAND_28 = {2{`RANDOM}};
  rf_28 = _RAND_28[63:0];
  _RAND_29 = {2{`RANDOM}};
  rf_29 = _RAND_29[63:0];
  _RAND_30 = {2{`RANDOM}};
  rf_30 = _RAND_30[63:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module If_Id(
  input         clock,
  input         io_stall,
  input         io_reset,
  input         io_flush,
  input  [63:0] io_pc_i,
  input  [31:0] io_inst_i,
  output [63:0] io_pc_o,
  output [31:0] io_inst_o
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [63:0] _RAND_1;
`endif // RANDOMIZE_REG_INIT
  reg [31:0] inst; // @[pipeline-registers.scala 18:23]
  reg [63:0] pc; // @[pipeline-registers.scala 19:23]
  assign io_pc_o = pc; // @[pipeline-registers.scala 29:15]
  assign io_inst_o = inst; // @[pipeline-registers.scala 28:15]
  always @(posedge clock) begin
    if (io_reset | io_flush) begin // @[pipeline-registers.scala 21:30]
      inst <= 32'h0; // @[pipeline-registers.scala 22:17]
    end else if (!(io_stall)) begin // @[pipeline-registers.scala 24:25]
      inst <= io_inst_i; // @[pipeline-registers.scala 18:23]
    end
    if (io_reset | io_flush) begin // @[pipeline-registers.scala 21:30]
      pc <= 64'h0; // @[pipeline-registers.scala 23:17]
    end else if (!(io_stall)) begin // @[pipeline-registers.scala 24:25]
      pc <= io_pc_i; // @[pipeline-registers.scala 19:23]
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  inst = _RAND_0[31:0];
  _RAND_1 = {2{`RANDOM}};
  pc = _RAND_1[63:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module Id(
  input  [63:0] io_pc,
  input  [31:0] io_inst_i,
  input  [63:0] io_rf2Id_RegData1,
  input  [63:0] io_rf2Id_RegData2,
  input         io_prev_is_load,
  input  [4:0]  io_load_dest,
  input  [4:0]  io_exForwarding_addr,
  input  [63:0] io_exForwarding_data,
  input  [4:0]  io_memForwarding_addr,
  input  [63:0] io_memForwarding_data,
  input  [4:0]  io_wbForwarding_addr,
  input  [63:0] io_wbForwarding_data,
  output        io_stall_req,
  output [4:0]  io_id2Rf_ReadIdx1,
  output [4:0]  io_id2Rf_ReadIdx2,
  output [63:0] io_decInfo_oprand1,
  output [63:0] io_decInfo_oprand2,
  output [4:0]  io_decInfo_rd,
  output [2:0]  io_decInfo_InstType,
  output [4:0]  io_decInfo_aluop,
  output        io_decInfo_storeOp_en,
  output [63:0] io_decInfo_storeOp_data,
  output [1:0]  io_decInfo_storeOp_Width,
  output        io_decInfo_loadOp_isLoad,
  output [1:0]  io_decInfo_loadOp_Width,
  output [4:0]  io_decInfo_loadOp_dest,
  output        io_branchOp_taken,
  output [63:0] io_branchOp_target,
  output        io_flush_req
);
  wire [2:0] funct3 = io_inst_i[14:12]; // @[Id.scala 35:24]
  wire [4:0] rd = io_inst_i[11:7]; // @[Id.scala 40:24]
  wire [4:0] rs1 = io_inst_i[19:15]; // @[Id.scala 41:24]
  wire [4:0] rs2 = io_inst_i[24:20]; // @[Id.scala 42:24]
  wire [11:0] imm_I = io_inst_i[31:20]; // @[Id.scala 44:24]
  wire [11:0] imm_S = {io_inst_i[31:25],rd}; // @[Cat.scala 31:58]
  wire [11:0] _imm_B_T_4 = {io_inst_i[31],io_inst_i[7],io_inst_i[30:25],io_inst_i[11:8]}; // @[Cat.scala 31:58]
  wire [12:0] imm_B = {_imm_B_T_4, 1'h0}; // @[Id.scala 46:68]
  wire [63:0] _GEN_51 = {{51'd0}, imm_B}; // @[Id.scala 48:33]
  wire [63:0] _branch_target_T_1 = _GEN_51 + io_pc; // @[Id.scala 48:33]
  wire [63:0] branch_target = _branch_target_T_1 - 64'h4; // @[Id.scala 48:41]
  wire [31:0] _decRes_T = io_inst_i & 32'hfe00707f; // @[Lookup.scala 31:38]
  wire  _decRes_T_1 = 32'h33 == _decRes_T; // @[Lookup.scala 31:38]
  wire  _decRes_T_3 = 32'h40000033 == _decRes_T; // @[Lookup.scala 31:38]
  wire  _decRes_T_5 = 32'h1033 == _decRes_T; // @[Lookup.scala 31:38]
  wire  _decRes_T_7 = 32'h2033 == _decRes_T; // @[Lookup.scala 31:38]
  wire  _decRes_T_9 = 32'h3033 == _decRes_T; // @[Lookup.scala 31:38]
  wire  _decRes_T_11 = 32'h4033 == _decRes_T; // @[Lookup.scala 31:38]
  wire  _decRes_T_13 = 32'h5033 == _decRes_T; // @[Lookup.scala 31:38]
  wire  _decRes_T_15 = 32'h40005033 == _decRes_T; // @[Lookup.scala 31:38]
  wire  _decRes_T_17 = 32'h6033 == _decRes_T; // @[Lookup.scala 31:38]
  wire  _decRes_T_19 = 32'h7033 == _decRes_T; // @[Lookup.scala 31:38]
  wire [31:0] _decRes_T_20 = io_inst_i & 32'h707f; // @[Lookup.scala 31:38]
  wire  _decRes_T_21 = 32'h13 == _decRes_T_20; // @[Lookup.scala 31:38]
  wire  _decRes_T_23 = 32'h2013 == _decRes_T_20; // @[Lookup.scala 31:38]
  wire  _decRes_T_25 = 32'h3013 == _decRes_T_20; // @[Lookup.scala 31:38]
  wire  _decRes_T_27 = 32'h4013 == _decRes_T_20; // @[Lookup.scala 31:38]
  wire  _decRes_T_29 = 32'h6013 == _decRes_T_20; // @[Lookup.scala 31:38]
  wire  _decRes_T_31 = 32'h7013 == _decRes_T_20; // @[Lookup.scala 31:38]
  wire  _decRes_T_33 = 32'h1013 == _decRes_T; // @[Lookup.scala 31:38]
  wire  _decRes_T_35 = 32'h5013 == _decRes_T; // @[Lookup.scala 31:38]
  wire  _decRes_T_37 = 32'h40005013 == _decRes_T; // @[Lookup.scala 31:38]
  wire  _decRes_T_39 = 32'h3 == _decRes_T_20; // @[Lookup.scala 31:38]
  wire  _decRes_T_41 = 32'h1003 == _decRes_T_20; // @[Lookup.scala 31:38]
  wire  _decRes_T_43 = 32'h2003 == _decRes_T_20; // @[Lookup.scala 31:38]
  wire  _decRes_T_45 = 32'h4003 == _decRes_T_20; // @[Lookup.scala 31:38]
  wire  _decRes_T_47 = 32'h5003 == _decRes_T_20; // @[Lookup.scala 31:38]
  wire  _decRes_T_49 = 32'h23 == _decRes_T_20; // @[Lookup.scala 31:38]
  wire  _decRes_T_51 = 32'h1023 == _decRes_T_20; // @[Lookup.scala 31:38]
  wire  _decRes_T_53 = 32'h2023 == _decRes_T_20; // @[Lookup.scala 31:38]
  wire  _decRes_T_55 = 32'h2000033 == _decRes_T; // @[Lookup.scala 31:38]
  wire  _decRes_T_57 = 32'h2001033 == _decRes_T; // @[Lookup.scala 31:38]
  wire  _decRes_T_59 = 32'h2002033 == _decRes_T; // @[Lookup.scala 31:38]
  wire  _decRes_T_61 = 32'h2004033 == _decRes_T; // @[Lookup.scala 31:38]
  wire  _decRes_T_63 = 32'h2005033 == _decRes_T; // @[Lookup.scala 31:38]
  wire  _decRes_T_65 = 32'h2006033 == _decRes_T; // @[Lookup.scala 31:38]
  wire  _decRes_T_67 = 32'h2007033 == _decRes_T; // @[Lookup.scala 31:38]
  wire  _decRes_T_69 = 32'h63 == _decRes_T_20; // @[Lookup.scala 31:38]
  wire  _decRes_T_71 = 32'h1063 == _decRes_T_20; // @[Lookup.scala 31:38]
  wire  _decRes_T_73 = 32'h4063 == _decRes_T_20; // @[Lookup.scala 31:38]
  wire  _decRes_T_75 = 32'h5063 == _decRes_T_20; // @[Lookup.scala 31:38]
  wire  _decRes_T_77 = 32'h6063 == _decRes_T_20; // @[Lookup.scala 31:38]
  wire  _decRes_T_79 = 32'h7063 == _decRes_T_20; // @[Lookup.scala 31:38]
  wire [31:0] _decRes_T_80 = io_inst_i & 32'h7f; // @[Lookup.scala 31:38]
  wire  _decRes_T_81 = 32'h6f == _decRes_T_80; // @[Lookup.scala 31:38]
  wire  _decRes_T_83 = 32'h67 == _decRes_T_20; // @[Lookup.scala 31:38]
  wire [3:0] _decRes_T_84 = _decRes_T_83 ? 4'h2 : 4'h0; // @[Lookup.scala 34:39]
  wire [3:0] _decRes_T_85 = _decRes_T_81 ? 4'h6 : _decRes_T_84; // @[Lookup.scala 34:39]
  wire [3:0] _decRes_T_86 = _decRes_T_79 ? 4'h4 : _decRes_T_85; // @[Lookup.scala 34:39]
  wire [3:0] _decRes_T_87 = _decRes_T_77 ? 4'h4 : _decRes_T_86; // @[Lookup.scala 34:39]
  wire [3:0] _decRes_T_88 = _decRes_T_75 ? 4'h4 : _decRes_T_87; // @[Lookup.scala 34:39]
  wire [3:0] _decRes_T_89 = _decRes_T_73 ? 4'h4 : _decRes_T_88; // @[Lookup.scala 34:39]
  wire [3:0] _decRes_T_90 = _decRes_T_71 ? 4'h4 : _decRes_T_89; // @[Lookup.scala 34:39]
  wire [3:0] _decRes_T_91 = _decRes_T_69 ? 4'h4 : _decRes_T_90; // @[Lookup.scala 34:39]
  wire [3:0] _decRes_T_92 = _decRes_T_67 ? 4'h1 : _decRes_T_91; // @[Lookup.scala 34:39]
  wire [3:0] _decRes_T_93 = _decRes_T_65 ? 4'h1 : _decRes_T_92; // @[Lookup.scala 34:39]
  wire [3:0] _decRes_T_94 = _decRes_T_63 ? 4'h1 : _decRes_T_93; // @[Lookup.scala 34:39]
  wire [3:0] _decRes_T_95 = _decRes_T_61 ? 4'h1 : _decRes_T_94; // @[Lookup.scala 34:39]
  wire [3:0] _decRes_T_96 = _decRes_T_59 ? 4'h1 : _decRes_T_95; // @[Lookup.scala 34:39]
  wire [3:0] _decRes_T_97 = _decRes_T_57 ? 4'h1 : _decRes_T_96; // @[Lookup.scala 34:39]
  wire [3:0] _decRes_T_98 = _decRes_T_55 ? 4'h1 : _decRes_T_97; // @[Lookup.scala 34:39]
  wire [3:0] _decRes_T_99 = _decRes_T_53 ? 4'h3 : _decRes_T_98; // @[Lookup.scala 34:39]
  wire [3:0] _decRes_T_100 = _decRes_T_51 ? 4'h3 : _decRes_T_99; // @[Lookup.scala 34:39]
  wire [3:0] _decRes_T_101 = _decRes_T_49 ? 4'h3 : _decRes_T_100; // @[Lookup.scala 34:39]
  wire [3:0] _decRes_T_102 = _decRes_T_47 ? 4'h2 : _decRes_T_101; // @[Lookup.scala 34:39]
  wire [3:0] _decRes_T_103 = _decRes_T_45 ? 4'h2 : _decRes_T_102; // @[Lookup.scala 34:39]
  wire [3:0] _decRes_T_104 = _decRes_T_43 ? 4'h2 : _decRes_T_103; // @[Lookup.scala 34:39]
  wire [3:0] _decRes_T_105 = _decRes_T_41 ? 4'h2 : _decRes_T_104; // @[Lookup.scala 34:39]
  wire [3:0] _decRes_T_106 = _decRes_T_39 ? 4'h2 : _decRes_T_105; // @[Lookup.scala 34:39]
  wire [3:0] _decRes_T_107 = _decRes_T_37 ? 4'h2 : _decRes_T_106; // @[Lookup.scala 34:39]
  wire [3:0] _decRes_T_108 = _decRes_T_35 ? 4'h2 : _decRes_T_107; // @[Lookup.scala 34:39]
  wire [3:0] _decRes_T_109 = _decRes_T_33 ? 4'h2 : _decRes_T_108; // @[Lookup.scala 34:39]
  wire [3:0] _decRes_T_110 = _decRes_T_31 ? 4'h2 : _decRes_T_109; // @[Lookup.scala 34:39]
  wire [3:0] _decRes_T_111 = _decRes_T_29 ? 4'h2 : _decRes_T_110; // @[Lookup.scala 34:39]
  wire [3:0] _decRes_T_112 = _decRes_T_27 ? 4'h2 : _decRes_T_111; // @[Lookup.scala 34:39]
  wire [3:0] _decRes_T_113 = _decRes_T_25 ? 4'h2 : _decRes_T_112; // @[Lookup.scala 34:39]
  wire [3:0] _decRes_T_114 = _decRes_T_23 ? 4'h2 : _decRes_T_113; // @[Lookup.scala 34:39]
  wire [3:0] _decRes_T_115 = _decRes_T_21 ? 4'h2 : _decRes_T_114; // @[Lookup.scala 34:39]
  wire [3:0] _decRes_T_116 = _decRes_T_19 ? 4'h1 : _decRes_T_115; // @[Lookup.scala 34:39]
  wire [3:0] _decRes_T_117 = _decRes_T_17 ? 4'h1 : _decRes_T_116; // @[Lookup.scala 34:39]
  wire [3:0] _decRes_T_118 = _decRes_T_15 ? 4'h1 : _decRes_T_117; // @[Lookup.scala 34:39]
  wire [3:0] _decRes_T_119 = _decRes_T_13 ? 4'h1 : _decRes_T_118; // @[Lookup.scala 34:39]
  wire [3:0] _decRes_T_120 = _decRes_T_11 ? 4'h1 : _decRes_T_119; // @[Lookup.scala 34:39]
  wire [3:0] _decRes_T_121 = _decRes_T_9 ? 4'h1 : _decRes_T_120; // @[Lookup.scala 34:39]
  wire [3:0] _decRes_T_122 = _decRes_T_7 ? 4'h1 : _decRes_T_121; // @[Lookup.scala 34:39]
  wire [3:0] _decRes_T_123 = _decRes_T_5 ? 4'h1 : _decRes_T_122; // @[Lookup.scala 34:39]
  wire [3:0] _decRes_T_124 = _decRes_T_3 ? 4'h1 : _decRes_T_123; // @[Lookup.scala 34:39]
  wire [3:0] decRes_0 = _decRes_T_1 ? 4'h1 : _decRes_T_124; // @[Lookup.scala 34:39]
  wire [4:0] _decRes_T_125 = _decRes_T_83 ? 5'ha : 5'h0; // @[Lookup.scala 34:39]
  wire [4:0] _decRes_T_126 = _decRes_T_81 ? 5'h0 : _decRes_T_125; // @[Lookup.scala 34:39]
  wire [4:0] _decRes_T_127 = _decRes_T_79 ? 5'h7 : _decRes_T_126; // @[Lookup.scala 34:39]
  wire [4:0] _decRes_T_128 = _decRes_T_77 ? 5'h6 : _decRes_T_127; // @[Lookup.scala 34:39]
  wire [4:0] _decRes_T_129 = _decRes_T_75 ? 5'h5 : _decRes_T_128; // @[Lookup.scala 34:39]
  wire [4:0] _decRes_T_130 = _decRes_T_73 ? 5'h4 : _decRes_T_129; // @[Lookup.scala 34:39]
  wire [4:0] _decRes_T_131 = _decRes_T_71 ? 5'h1 : _decRes_T_130; // @[Lookup.scala 34:39]
  wire [4:0] _decRes_T_132 = _decRes_T_69 ? 5'h0 : _decRes_T_131; // @[Lookup.scala 34:39]
  wire [4:0] _decRes_T_133 = _decRes_T_67 ? 5'h12 : _decRes_T_132; // @[Lookup.scala 34:39]
  wire [4:0] _decRes_T_134 = _decRes_T_65 ? 5'h11 : _decRes_T_133; // @[Lookup.scala 34:39]
  wire [4:0] _decRes_T_135 = _decRes_T_63 ? 5'h10 : _decRes_T_134; // @[Lookup.scala 34:39]
  wire [4:0] _decRes_T_136 = _decRes_T_61 ? 5'hf : _decRes_T_135; // @[Lookup.scala 34:39]
  wire [4:0] _decRes_T_137 = _decRes_T_59 ? 5'hd : _decRes_T_136; // @[Lookup.scala 34:39]
  wire [4:0] _decRes_T_138 = _decRes_T_57 ? 5'hc : _decRes_T_137; // @[Lookup.scala 34:39]
  wire [4:0] _decRes_T_139 = _decRes_T_55 ? 5'hb : _decRes_T_138; // @[Lookup.scala 34:39]
  wire [4:0] _decRes_T_140 = _decRes_T_53 ? 5'h14 : _decRes_T_139; // @[Lookup.scala 34:39]
  wire [4:0] _decRes_T_141 = _decRes_T_51 ? 5'h15 : _decRes_T_140; // @[Lookup.scala 34:39]
  wire [4:0] _decRes_T_142 = _decRes_T_49 ? 5'h16 : _decRes_T_141; // @[Lookup.scala 34:39]
  wire [4:0] _decRes_T_143 = _decRes_T_47 ? 5'h1b : _decRes_T_142; // @[Lookup.scala 34:39]
  wire [4:0] _decRes_T_144 = _decRes_T_45 ? 5'h1d : _decRes_T_143; // @[Lookup.scala 34:39]
  wire [4:0] _decRes_T_145 = _decRes_T_43 ? 5'h18 : _decRes_T_144; // @[Lookup.scala 34:39]
  wire [4:0] _decRes_T_146 = _decRes_T_41 ? 5'h1a : _decRes_T_145; // @[Lookup.scala 34:39]
  wire [4:0] _decRes_T_147 = _decRes_T_39 ? 5'h1c : _decRes_T_146; // @[Lookup.scala 34:39]
  wire [4:0] _decRes_T_148 = _decRes_T_37 ? 5'h9 : _decRes_T_147; // @[Lookup.scala 34:39]
  wire [4:0] _decRes_T_149 = _decRes_T_35 ? 5'h8 : _decRes_T_148; // @[Lookup.scala 34:39]
  wire [4:0] _decRes_T_150 = _decRes_T_33 ? 5'h7 : _decRes_T_149; // @[Lookup.scala 34:39]
  wire [4:0] _decRes_T_151 = _decRes_T_31 ? 5'h6 : _decRes_T_150; // @[Lookup.scala 34:39]
  wire [4:0] _decRes_T_152 = _decRes_T_29 ? 5'h5 : _decRes_T_151; // @[Lookup.scala 34:39]
  wire [4:0] _decRes_T_153 = _decRes_T_27 ? 5'h4 : _decRes_T_152; // @[Lookup.scala 34:39]
  wire [4:0] _decRes_T_154 = _decRes_T_25 ? 5'h3 : _decRes_T_153; // @[Lookup.scala 34:39]
  wire [4:0] _decRes_T_155 = _decRes_T_23 ? 5'h2 : _decRes_T_154; // @[Lookup.scala 34:39]
  wire [4:0] _decRes_T_156 = _decRes_T_21 ? 5'h0 : _decRes_T_155; // @[Lookup.scala 34:39]
  wire [4:0] _decRes_T_157 = _decRes_T_19 ? 5'h6 : _decRes_T_156; // @[Lookup.scala 34:39]
  wire [4:0] _decRes_T_158 = _decRes_T_17 ? 5'h5 : _decRes_T_157; // @[Lookup.scala 34:39]
  wire [4:0] _decRes_T_159 = _decRes_T_15 ? 5'h9 : _decRes_T_158; // @[Lookup.scala 34:39]
  wire [4:0] _decRes_T_160 = _decRes_T_13 ? 5'h8 : _decRes_T_159; // @[Lookup.scala 34:39]
  wire [4:0] _decRes_T_161 = _decRes_T_11 ? 5'h4 : _decRes_T_160; // @[Lookup.scala 34:39]
  wire [4:0] _decRes_T_162 = _decRes_T_9 ? 5'h3 : _decRes_T_161; // @[Lookup.scala 34:39]
  wire [4:0] _decRes_T_163 = _decRes_T_7 ? 5'h2 : _decRes_T_162; // @[Lookup.scala 34:39]
  wire [4:0] _decRes_T_164 = _decRes_T_5 ? 5'h7 : _decRes_T_163; // @[Lookup.scala 34:39]
  wire [4:0] _decRes_T_165 = _decRes_T_3 ? 5'h1 : _decRes_T_164; // @[Lookup.scala 34:39]
  wire [4:0] decOpt = _decRes_T_1 ? 5'h0 : _decRes_T_165; // @[Lookup.scala 34:39]
  wire  _rs1Val_T = rs1 == 5'h0; // @[Id.scala 55:14]
  wire  _rs1Val_T_1 = rs1 == io_wbForwarding_addr; // @[Id.scala 56:14]
  wire  _rs1Val_T_2 = rs1 == io_memForwarding_addr; // @[Id.scala 57:14]
  wire  _rs1Val_T_3 = rs1 == io_exForwarding_addr; // @[Id.scala 58:14]
  wire [63:0] _rs1Val_T_4 = _rs1Val_T_3 ? io_exForwarding_data : io_rf2Id_RegData1; // @[Mux.scala 47:70]
  wire [63:0] _rs1Val_T_5 = _rs1Val_T_2 ? io_memForwarding_data : _rs1Val_T_4; // @[Mux.scala 47:70]
  wire [63:0] _rs1Val_T_6 = _rs1Val_T_1 ? io_wbForwarding_data : _rs1Val_T_5; // @[Mux.scala 47:70]
  wire [63:0] rs1Val = _rs1Val_T ? 64'h0 : _rs1Val_T_6; // @[Mux.scala 47:70]
  wire  _rs2Val_T = rs2 == 5'h0; // @[Id.scala 63:14]
  wire  _rs2Val_T_1 = rs2 == io_wbForwarding_addr; // @[Id.scala 64:14]
  wire  _rs2Val_T_2 = rs2 == io_memForwarding_addr; // @[Id.scala 65:14]
  wire  _rs2Val_T_3 = rs2 == io_exForwarding_addr; // @[Id.scala 66:14]
  wire [63:0] _rs2Val_T_4 = _rs2Val_T_3 ? io_exForwarding_data : io_rf2Id_RegData2; // @[Mux.scala 47:70]
  wire [63:0] _rs2Val_T_5 = _rs2Val_T_2 ? io_memForwarding_data : _rs2Val_T_4; // @[Mux.scala 47:70]
  wire [63:0] _rs2Val_T_6 = _rs2Val_T_1 ? io_wbForwarding_data : _rs2Val_T_5; // @[Mux.scala 47:70]
  wire [63:0] rs2Val = _rs2Val_T ? 64'h0 : _rs2Val_T_6; // @[Mux.scala 47:70]
  wire [1:0] _io_decInfo_loadOp_Width_T_5 = 5'h18 == decOpt ? 2'h2 : {{1'd0}, 5'h1a == decOpt}; // @[Mux.scala 81:58]
  wire  _T_4 = io_load_dest == rs1 | io_load_dest == rs2; // @[Id.scala 86:35]
  wire [63:0] _GEN_5 = decOpt == 5'ha ? io_pc : rs1Val; // @[Id.scala 104:29 108:56 109:29]
  wire [11:0] _GEN_6 = decOpt == 5'ha ? 12'h4 : imm_I; // @[Id.scala 105:29 108:56 110:29]
  wire [1:0] _io_decInfo_storeOp_Width_T_5 = 5'h14 == decOpt ? 2'h2 : {{1'd0}, 5'h15 == decOpt}; // @[Mux.scala 81:58]
  wire  _taken_T = rs1Val == rs2Val; // @[Id.scala 130:35]
  wire  _taken_T_1 = rs1Val != rs2Val; // @[Id.scala 131:35]
  wire [63:0] _taken_T_2 = _rs1Val_T ? 64'h0 : _rs1Val_T_6; // @[Id.scala 132:34]
  wire [63:0] _taken_T_3 = _rs2Val_T ? 64'h0 : _rs2Val_T_6; // @[Id.scala 132:51]
  wire  _taken_T_4 = $signed(_taken_T_2) < $signed(_taken_T_3); // @[Id.scala 132:41]
  wire  _taken_T_7 = $signed(_taken_T_2) >= $signed(_taken_T_3); // @[Id.scala 133:41]
  wire  _taken_T_8 = rs1Val < rs2Val; // @[Id.scala 134:35]
  wire  _taken_T_9 = rs1Val >= rs2Val; // @[Id.scala 135:35]
  wire  _taken_T_13 = 3'h1 == funct3 ? _taken_T_1 : 3'h0 == funct3 & _taken_T; // @[Mux.scala 81:58]
  wire  _taken_T_15 = 3'h4 == funct3 ? _taken_T_4 : _taken_T_13; // @[Mux.scala 81:58]
  wire  _taken_T_17 = 3'h5 == funct3 ? _taken_T_7 : _taken_T_15; // @[Mux.scala 81:58]
  wire  _taken_T_19 = 3'h6 == funct3 ? _taken_T_8 : _taken_T_17; // @[Mux.scala 81:58]
  wire  taken = 3'h7 == funct3 ? _taken_T_9 : _taken_T_19; // @[Mux.scala 81:58]
  wire  _GEN_8 = 4'h4 == decRes_0 & taken; // @[Id.scala 92:21 137:33 71:21]
  wire [63:0] _GEN_9 = 4'h4 == decRes_0 ? branch_target : 64'h0; // @[Id.scala 92:21 138:33 71:21]
  wire [63:0] _GEN_11 = 4'h3 == decRes_0 ? rs1Val : 64'h0; // @[Id.scala 92:21 116:29 30:53]
  wire [11:0] _GEN_12 = 4'h3 == decRes_0 ? imm_S : 12'h0; // @[Id.scala 92:21 117:29 31:53]
  wire [63:0] _GEN_15 = 4'h3 == decRes_0 ? rs2Val : 64'h0; // @[Id.scala 92:21 121:38 70:21]
  wire [1:0] _GEN_17 = 4'h3 == decRes_0 ? _io_decInfo_storeOp_Width_T_5 : 2'h0; // @[Id.scala 92:21 123:38 70:21]
  wire  _GEN_18 = 4'h3 == decRes_0 ? 1'h0 : _GEN_8; // @[Id.scala 71:21 92:21]
  wire [63:0] _GEN_19 = 4'h3 == decRes_0 ? 64'h0 : _GEN_9; // @[Id.scala 71:21 92:21]
  wire [63:0] _GEN_21 = 4'h2 == decRes_0 ? _GEN_5 : _GEN_11; // @[Id.scala 92:21]
  wire [11:0] _GEN_22 = 4'h2 == decRes_0 ? _GEN_6 : _GEN_12; // @[Id.scala 92:21]
  wire [63:0] _GEN_25 = 4'h2 == decRes_0 ? 64'h0 : _GEN_15; // @[Id.scala 70:21 92:21]
  wire  _GEN_26 = 4'h2 == decRes_0 ? 1'h0 : 4'h3 == decRes_0; // @[Id.scala 70:21 92:21]
  wire [1:0] _GEN_27 = 4'h2 == decRes_0 ? 2'h0 : _GEN_17; // @[Id.scala 70:21 92:21]
  wire  _GEN_28 = 4'h2 == decRes_0 ? 1'h0 : _GEN_18; // @[Id.scala 71:21 92:21]
  wire [63:0] _GEN_29 = 4'h2 == decRes_0 ? 64'h0 : _GEN_19; // @[Id.scala 71:21 92:21]
  wire [63:0] _GEN_31 = 4'h1 == decRes_0 ? rs1Val : _GEN_21; // @[Id.scala 92:21 99:29]
  wire [63:0] _GEN_32 = 4'h1 == decRes_0 ? rs2Val : {{52'd0}, _GEN_22}; // @[Id.scala 92:21 100:29]
  wire [63:0] _GEN_35 = 4'h1 == decRes_0 ? 64'h0 : _GEN_25; // @[Id.scala 70:21 92:21]
  wire  _GEN_36 = 4'h1 == decRes_0 ? 1'h0 : _GEN_26; // @[Id.scala 70:21 92:21]
  wire [1:0] _GEN_37 = 4'h1 == decRes_0 ? 2'h0 : _GEN_27; // @[Id.scala 70:21 92:21]
  wire  _GEN_38 = 4'h1 == decRes_0 ? 1'h0 : _GEN_28; // @[Id.scala 71:21 92:21]
  wire [63:0] _GEN_39 = 4'h1 == decRes_0 ? 64'h0 : _GEN_29; // @[Id.scala 71:21 92:21]
  assign io_stall_req = io_prev_is_load & _T_4; // @[Id.scala 73:21 85:26]
  assign io_id2Rf_ReadIdx1 = io_inst_i[19:15]; // @[Id.scala 41:24]
  assign io_id2Rf_ReadIdx2 = io_inst_i[24:20]; // @[Id.scala 42:24]
  assign io_decInfo_oprand1 = 4'h0 == decRes_0 ? 64'h0 : _GEN_31; // @[Id.scala 92:21 94:29]
  assign io_decInfo_oprand2 = 4'h0 == decRes_0 ? 64'h0 : _GEN_32; // @[Id.scala 92:21 95:29]
  assign io_decInfo_rd = io_inst_i[11:7]; // @[Id.scala 40:24]
  assign io_decInfo_InstType = decRes_0[2:0]; // @[Id.scala 146:26]
  assign io_decInfo_aluop = _decRes_T_1 ? 5'h0 : _decRes_T_165; // @[Lookup.scala 34:39]
  assign io_decInfo_storeOp_en = 4'h0 == decRes_0 ? 1'h0 : _GEN_36; // @[Id.scala 70:21 92:21]
  assign io_decInfo_storeOp_data = 4'h0 == decRes_0 ? 64'h0 : _GEN_35; // @[Id.scala 70:21 92:21]
  assign io_decInfo_storeOp_Width = 4'h0 == decRes_0 ? 2'h0 : _GEN_37; // @[Id.scala 70:21 92:21]
  assign io_decInfo_loadOp_isLoad = io_inst_i[6:0] == 7'h3; // @[Id.scala 75:20]
  assign io_decInfo_loadOp_Width = io_inst_i[6:0] == 7'h3 ? _io_decInfo_loadOp_Width_T_5 : 2'h0; // @[Id.scala 70:21 75:38 78:34]
  assign io_decInfo_loadOp_dest = io_inst_i[6:0] == 7'h3 ? rd : 5'h0; // @[Id.scala 70:21 75:38 81:34]
  assign io_branchOp_taken = 4'h0 == decRes_0 ? 1'h0 : _GEN_38; // @[Id.scala 71:21 92:21]
  assign io_branchOp_target = 4'h0 == decRes_0 ? 64'h0 : _GEN_39; // @[Id.scala 71:21 92:21]
  assign io_flush_req = 4'h0 == decRes_0 ? 1'h0 : _GEN_38; // @[Id.scala 72:21 92:21]
endmodule
module Id_Ex(
  input         clock,
  input         io_stall,
  input         io_flush,
  input         io_reset,
  input         io_prev_is_load_i,
  input  [63:0] io_decInfo_i_oprand1,
  input  [63:0] io_decInfo_i_oprand2,
  input  [4:0]  io_decInfo_i_rd,
  input  [2:0]  io_decInfo_i_InstType,
  input  [4:0]  io_decInfo_i_aluop,
  input         io_decInfo_i_storeOp_en,
  input  [63:0] io_decInfo_i_storeOp_data,
  input  [1:0]  io_decInfo_i_storeOp_Width,
  input         io_decInfo_i_loadOp_isLoad,
  input  [1:0]  io_decInfo_i_loadOp_Width,
  input  [4:0]  io_decInfo_i_loadOp_dest,
  output [63:0] io_decInfo_o_oprand1,
  output [63:0] io_decInfo_o_oprand2,
  output [4:0]  io_decInfo_o_rd,
  output [2:0]  io_decInfo_o_InstType,
  output [4:0]  io_decInfo_o_aluop,
  output        io_decInfo_o_storeOp_en,
  output [63:0] io_decInfo_o_storeOp_data,
  output [1:0]  io_decInfo_o_storeOp_Width,
  output        io_decInfo_o_loadOp_isLoad,
  output [1:0]  io_decInfo_o_loadOp_Width,
  output        io_prev_is_load_o,
  output [4:0]  io_load_dest_o
);
`ifdef RANDOMIZE_REG_INIT
  reg [63:0] _RAND_0;
  reg [63:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [63:0] _RAND_6;
  reg [31:0] _RAND_7;
  reg [31:0] _RAND_8;
  reg [31:0] _RAND_9;
  reg [31:0] _RAND_10;
  reg [31:0] _RAND_11;
`endif // RANDOMIZE_REG_INIT
  reg [63:0] decInfo_oprand1; // @[pipeline-registers.scala 46:32]
  reg [63:0] decInfo_oprand2; // @[pipeline-registers.scala 46:32]
  reg [4:0] decInfo_rd; // @[pipeline-registers.scala 46:32]
  reg [2:0] decInfo_InstType; // @[pipeline-registers.scala 46:32]
  reg [4:0] decInfo_aluop; // @[pipeline-registers.scala 46:32]
  reg  decInfo_storeOp_en; // @[pipeline-registers.scala 46:32]
  reg [63:0] decInfo_storeOp_data; // @[pipeline-registers.scala 46:32]
  reg [1:0] decInfo_storeOp_Width; // @[pipeline-registers.scala 46:32]
  reg  decInfo_loadOp_isLoad; // @[pipeline-registers.scala 46:32]
  reg [1:0] decInfo_loadOp_Width; // @[pipeline-registers.scala 46:32]
  reg  prev_is_load; // @[pipeline-registers.scala 47:32]
  reg [4:0] load_dest; // @[pipeline-registers.scala 48:32]
  assign io_decInfo_o_oprand1 = decInfo_oprand1; // @[pipeline-registers.scala 59:24]
  assign io_decInfo_o_oprand2 = decInfo_oprand2; // @[pipeline-registers.scala 59:24]
  assign io_decInfo_o_rd = decInfo_rd; // @[pipeline-registers.scala 59:24]
  assign io_decInfo_o_InstType = decInfo_InstType; // @[pipeline-registers.scala 59:24]
  assign io_decInfo_o_aluop = decInfo_aluop; // @[pipeline-registers.scala 59:24]
  assign io_decInfo_o_storeOp_en = decInfo_storeOp_en; // @[pipeline-registers.scala 59:24]
  assign io_decInfo_o_storeOp_data = decInfo_storeOp_data; // @[pipeline-registers.scala 59:24]
  assign io_decInfo_o_storeOp_Width = decInfo_storeOp_Width; // @[pipeline-registers.scala 59:24]
  assign io_decInfo_o_loadOp_isLoad = decInfo_loadOp_isLoad; // @[pipeline-registers.scala 59:24]
  assign io_decInfo_o_loadOp_Width = decInfo_loadOp_Width; // @[pipeline-registers.scala 59:24]
  assign io_prev_is_load_o = prev_is_load; // @[pipeline-registers.scala 60:24]
  assign io_load_dest_o = load_dest; // @[pipeline-registers.scala 61:24]
  always @(posedge clock) begin
    if (io_reset | io_flush) begin // @[pipeline-registers.scala 50:30]
      decInfo_oprand1 <= 64'h0; // @[pipeline-registers.scala 51:24]
    end else if (!(io_stall)) begin // @[pipeline-registers.scala 54:25]
      decInfo_oprand1 <= io_decInfo_i_oprand1; // @[pipeline-registers.scala 46:32]
    end
    if (io_reset | io_flush) begin // @[pipeline-registers.scala 50:30]
      decInfo_oprand2 <= 64'h0; // @[pipeline-registers.scala 51:24]
    end else if (!(io_stall)) begin // @[pipeline-registers.scala 54:25]
      decInfo_oprand2 <= io_decInfo_i_oprand2; // @[pipeline-registers.scala 46:32]
    end
    if (io_reset | io_flush) begin // @[pipeline-registers.scala 50:30]
      decInfo_rd <= 5'h0; // @[pipeline-registers.scala 51:24]
    end else if (!(io_stall)) begin // @[pipeline-registers.scala 54:25]
      decInfo_rd <= io_decInfo_i_rd; // @[pipeline-registers.scala 46:32]
    end
    if (io_reset | io_flush) begin // @[pipeline-registers.scala 50:30]
      decInfo_InstType <= 3'h0; // @[pipeline-registers.scala 51:24]
    end else if (!(io_stall)) begin // @[pipeline-registers.scala 54:25]
      decInfo_InstType <= io_decInfo_i_InstType; // @[pipeline-registers.scala 46:32]
    end
    if (io_reset | io_flush) begin // @[pipeline-registers.scala 50:30]
      decInfo_aluop <= 5'h0; // @[pipeline-registers.scala 51:24]
    end else if (!(io_stall)) begin // @[pipeline-registers.scala 54:25]
      decInfo_aluop <= io_decInfo_i_aluop; // @[pipeline-registers.scala 46:32]
    end
    if (io_reset | io_flush) begin // @[pipeline-registers.scala 50:30]
      decInfo_storeOp_en <= 1'h0; // @[pipeline-registers.scala 51:24]
    end else if (!(io_stall)) begin // @[pipeline-registers.scala 54:25]
      decInfo_storeOp_en <= io_decInfo_i_storeOp_en; // @[pipeline-registers.scala 46:32]
    end
    if (io_reset | io_flush) begin // @[pipeline-registers.scala 50:30]
      decInfo_storeOp_data <= 64'h0; // @[pipeline-registers.scala 51:24]
    end else if (!(io_stall)) begin // @[pipeline-registers.scala 54:25]
      decInfo_storeOp_data <= io_decInfo_i_storeOp_data; // @[pipeline-registers.scala 46:32]
    end
    if (io_reset | io_flush) begin // @[pipeline-registers.scala 50:30]
      decInfo_storeOp_Width <= 2'h0; // @[pipeline-registers.scala 51:24]
    end else if (!(io_stall)) begin // @[pipeline-registers.scala 54:25]
      decInfo_storeOp_Width <= io_decInfo_i_storeOp_Width; // @[pipeline-registers.scala 46:32]
    end
    if (io_reset | io_flush) begin // @[pipeline-registers.scala 50:30]
      decInfo_loadOp_isLoad <= 1'h0; // @[pipeline-registers.scala 51:24]
    end else if (!(io_stall)) begin // @[pipeline-registers.scala 54:25]
      decInfo_loadOp_isLoad <= io_decInfo_i_loadOp_isLoad; // @[pipeline-registers.scala 46:32]
    end
    if (io_reset | io_flush) begin // @[pipeline-registers.scala 50:30]
      decInfo_loadOp_Width <= 2'h0; // @[pipeline-registers.scala 51:24]
    end else if (!(io_stall)) begin // @[pipeline-registers.scala 54:25]
      decInfo_loadOp_Width <= io_decInfo_i_loadOp_Width; // @[pipeline-registers.scala 46:32]
    end
    if (io_reset | io_flush) begin // @[pipeline-registers.scala 50:30]
      prev_is_load <= 1'h0; // @[pipeline-registers.scala 52:24]
    end else if (!(io_stall)) begin // @[pipeline-registers.scala 54:25]
      prev_is_load <= io_prev_is_load_i; // @[pipeline-registers.scala 47:32]
    end
    if (io_reset | io_flush) begin // @[pipeline-registers.scala 50:30]
      load_dest <= 5'h0; // @[pipeline-registers.scala 53:24]
    end else if (!(io_stall)) begin // @[pipeline-registers.scala 54:25]
      load_dest <= io_decInfo_i_loadOp_dest; // @[pipeline-registers.scala 48:32]
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {2{`RANDOM}};
  decInfo_oprand1 = _RAND_0[63:0];
  _RAND_1 = {2{`RANDOM}};
  decInfo_oprand2 = _RAND_1[63:0];
  _RAND_2 = {1{`RANDOM}};
  decInfo_rd = _RAND_2[4:0];
  _RAND_3 = {1{`RANDOM}};
  decInfo_InstType = _RAND_3[2:0];
  _RAND_4 = {1{`RANDOM}};
  decInfo_aluop = _RAND_4[4:0];
  _RAND_5 = {1{`RANDOM}};
  decInfo_storeOp_en = _RAND_5[0:0];
  _RAND_6 = {2{`RANDOM}};
  decInfo_storeOp_data = _RAND_6[63:0];
  _RAND_7 = {1{`RANDOM}};
  decInfo_storeOp_Width = _RAND_7[1:0];
  _RAND_8 = {1{`RANDOM}};
  decInfo_loadOp_isLoad = _RAND_8[0:0];
  _RAND_9 = {1{`RANDOM}};
  decInfo_loadOp_Width = _RAND_9[1:0];
  _RAND_10 = {1{`RANDOM}};
  prev_is_load = _RAND_10[0:0];
  _RAND_11 = {1{`RANDOM}};
  load_dest = _RAND_11[4:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module Ex(
  input  [63:0] io_decInfo_oprand1,
  input  [63:0] io_decInfo_oprand2,
  input  [4:0]  io_decInfo_rd,
  input  [2:0]  io_decInfo_InstType,
  input  [4:0]  io_decInfo_aluop,
  input         io_decInfo_storeOp_en,
  input  [63:0] io_decInfo_storeOp_data,
  input  [1:0]  io_decInfo_storeOp_Width,
  input         io_decInfo_loadOp_isLoad,
  input  [1:0]  io_decInfo_loadOp_Width,
  output [4:0]  io_exForwarding_addr,
  output [63:0] io_exForwarding_data,
  output        io_writeRfOp_en,
  output [63:0] io_writeRfOp_data,
  output [4:0]  io_writeRfOp_addr,
  output        io_loadOp_isLoad,
  output [63:0] io_loadOp_addr,
  output [1:0]  io_loadOp_Width,
  output        io_storeOp_en,
  output [63:0] io_storeOp_addr,
  output [63:0] io_storeOp_data,
  output [1:0]  io_storeOp_Width
);
  wire [63:0] _aluRes_T_1 = io_decInfo_oprand1 + io_decInfo_oprand2; // @[Ex.scala 21:54]
  wire [63:0] _aluRes_T_5 = io_decInfo_oprand1 - io_decInfo_oprand2; // @[Ex.scala 23:26]
  wire  _aluRes_T_8 = $signed(io_decInfo_oprand1) < $signed(io_decInfo_oprand2); // @[Ex.scala 24:36]
  wire  _aluRes_T_10 = io_decInfo_oprand1 < io_decInfo_oprand2; // @[Ex.scala 25:29]
  wire [63:0] _aluRes_T_12 = io_decInfo_oprand1 ^ io_decInfo_oprand2; // @[Ex.scala 26:26]
  wire [63:0] _aluRes_T_13 = io_decInfo_oprand1 | io_decInfo_oprand2; // @[Ex.scala 27:26]
  wire [63:0] _aluRes_T_14 = io_decInfo_oprand1 & io_decInfo_oprand2; // @[Ex.scala 28:26]
  wire [94:0] _GEN_2 = {{31'd0}, io_decInfo_oprand1}; // @[Ex.scala 29:26]
  wire [94:0] _aluRes_T_16 = _GEN_2 << io_decInfo_oprand2[4:0]; // @[Ex.scala 29:26]
  wire [63:0] _aluRes_T_18 = io_decInfo_oprand1 >> io_decInfo_oprand2[4:0]; // @[Ex.scala 30:26]
  wire [63:0] _aluRes_T_22 = $signed(io_decInfo_oprand1) >>> io_decInfo_oprand2[4:0]; // @[Ex.scala 31:50]
  wire [63:0] _aluRes_T_24 = 5'h0 == io_decInfo_aluop ? _aluRes_T_1 : _aluRes_T_1; // @[Mux.scala 81:58]
  wire [63:0] _aluRes_T_26 = 5'h1 == io_decInfo_aluop ? _aluRes_T_5 : _aluRes_T_24; // @[Mux.scala 81:58]
  wire [63:0] _aluRes_T_28 = 5'h2 == io_decInfo_aluop ? {{63'd0}, _aluRes_T_8} : _aluRes_T_26; // @[Mux.scala 81:58]
  wire [63:0] _aluRes_T_30 = 5'h3 == io_decInfo_aluop ? {{63'd0}, _aluRes_T_10} : _aluRes_T_28; // @[Mux.scala 81:58]
  wire [63:0] _aluRes_T_32 = 5'h4 == io_decInfo_aluop ? _aluRes_T_12 : _aluRes_T_30; // @[Mux.scala 81:58]
  wire [63:0] _aluRes_T_34 = 5'h5 == io_decInfo_aluop ? _aluRes_T_13 : _aluRes_T_32; // @[Mux.scala 81:58]
  wire [63:0] _aluRes_T_36 = 5'h6 == io_decInfo_aluop ? _aluRes_T_14 : _aluRes_T_34; // @[Mux.scala 81:58]
  wire [94:0] _aluRes_T_38 = 5'h7 == io_decInfo_aluop ? _aluRes_T_16 : {{31'd0}, _aluRes_T_36}; // @[Mux.scala 81:58]
  wire [94:0] _aluRes_T_40 = 5'h8 == io_decInfo_aluop ? {{31'd0}, _aluRes_T_18} : _aluRes_T_38; // @[Mux.scala 81:58]
  wire [94:0] aluRes = 5'h9 == io_decInfo_aluop ? {{31'd0}, _aluRes_T_22} : _aluRes_T_40; // @[Mux.scala 81:58]
  wire [3:0] _GEN_11 = {{1'd0}, io_decInfo_InstType}; // @[Ex.scala 39:32]
  wire [94:0] _GEN_0 = 4'h3 == _GEN_11 ? aluRes : 95'h0; // @[Ex.scala 18:17 39:32 54:32]
  wire [94:0] _GEN_1 = 4'h2 == _GEN_11 ? aluRes : 95'h0; // @[Ex.scala 37:21 39:32 48:32]
  wire [4:0] _GEN_3 = 4'h2 == _GEN_11 ? io_decInfo_rd : 5'h0; // @[Ex.scala 37:21 39:32 50:32]
  wire [94:0] _GEN_5 = 4'h2 == _GEN_11 ? 95'h0 : _GEN_0; // @[Ex.scala 18:17 39:32]
  wire [94:0] _GEN_6 = 4'h1 == _GEN_11 ? aluRes : _GEN_1; // @[Ex.scala 39:32 41:32]
  wire [94:0] _GEN_9 = 4'h1 == _GEN_11 ? 95'h0 : _GEN_1; // @[Ex.scala 19:17 39:32]
  wire [94:0] _GEN_10 = 4'h1 == _GEN_11 ? 95'h0 : _GEN_5; // @[Ex.scala 18:17 39:32]
  assign io_exForwarding_addr = io_decInfo_loadOp_isLoad ? 5'h0 : io_decInfo_rd; // @[Ex.scala 61:34]
  assign io_exForwarding_data = aluRes[63:0]; // @[Ex.scala 60:28]
  assign io_writeRfOp_en = 4'h1 == _GEN_11 | 4'h2 == _GEN_11; // @[Ex.scala 39:32 42:32]
  assign io_writeRfOp_data = _GEN_6[63:0];
  assign io_writeRfOp_addr = 4'h1 == _GEN_11 ? io_decInfo_rd : _GEN_3; // @[Ex.scala 39:32 43:32]
  assign io_loadOp_isLoad = io_decInfo_loadOp_isLoad; // @[Ex.scala 19:17]
  assign io_loadOp_addr = _GEN_9[63:0];
  assign io_loadOp_Width = io_decInfo_loadOp_Width; // @[Ex.scala 19:17]
  assign io_storeOp_en = io_decInfo_storeOp_en; // @[Ex.scala 18:17]
  assign io_storeOp_addr = _GEN_10[63:0];
  assign io_storeOp_data = io_decInfo_storeOp_data; // @[Ex.scala 18:17]
  assign io_storeOp_Width = io_decInfo_storeOp_Width; // @[Ex.scala 18:17]
endmodule
module Ex_Mem(
  input         clock,
  input         io_stall,
  input         io_flush,
  input         io_reset,
  input         io_loadOp_i_isLoad,
  input  [63:0] io_loadOp_i_addr,
  input  [1:0]  io_loadOp_i_Width,
  input         io_storeOp_i_en,
  input  [63:0] io_storeOp_i_addr,
  input  [63:0] io_storeOp_i_data,
  input  [1:0]  io_storeOp_i_Width,
  input         io_writeRfOp_i_en,
  input  [63:0] io_writeRfOp_i_data,
  input  [4:0]  io_writeRfOp_i_addr,
  output        io_loadOp_o_isLoad,
  output [63:0] io_loadOp_o_addr,
  output [1:0]  io_loadOp_o_Width,
  output        io_storeOp_o_en,
  output [63:0] io_storeOp_o_addr,
  output [63:0] io_storeOp_o_data,
  output [1:0]  io_storeOp_o_Width,
  output        io_writeRfOp_o_en,
  output [63:0] io_writeRfOp_o_data,
  output [4:0]  io_writeRfOp_o_addr
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [63:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [63:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
  reg [63:0] _RAND_7;
  reg [63:0] _RAND_8;
  reg [31:0] _RAND_9;
`endif // RANDOMIZE_REG_INIT
  reg  writeRfOp_en; // @[pipeline-registers.scala 79:33]
  reg [63:0] writeRfOp_data; // @[pipeline-registers.scala 79:33]
  reg [4:0] writeRfOp_addr; // @[pipeline-registers.scala 79:33]
  reg  loadOp_isLoad; // @[pipeline-registers.scala 80:33]
  reg [63:0] loadOp_addr; // @[pipeline-registers.scala 80:33]
  reg [1:0] loadOp_Width; // @[pipeline-registers.scala 80:33]
  reg  storeOp_en; // @[pipeline-registers.scala 81:33]
  reg [63:0] storeOp_addr; // @[pipeline-registers.scala 81:33]
  reg [63:0] storeOp_data; // @[pipeline-registers.scala 81:33]
  reg [1:0] storeOp_Width; // @[pipeline-registers.scala 81:33]
  assign io_loadOp_o_isLoad = loadOp_isLoad; // @[pipeline-registers.scala 93:23]
  assign io_loadOp_o_addr = loadOp_addr; // @[pipeline-registers.scala 93:23]
  assign io_loadOp_o_Width = loadOp_Width; // @[pipeline-registers.scala 93:23]
  assign io_storeOp_o_en = storeOp_en; // @[pipeline-registers.scala 94:23]
  assign io_storeOp_o_addr = storeOp_addr; // @[pipeline-registers.scala 94:23]
  assign io_storeOp_o_data = storeOp_data; // @[pipeline-registers.scala 94:23]
  assign io_storeOp_o_Width = storeOp_Width; // @[pipeline-registers.scala 94:23]
  assign io_writeRfOp_o_en = writeRfOp_en; // @[pipeline-registers.scala 92:23]
  assign io_writeRfOp_o_data = writeRfOp_data; // @[pipeline-registers.scala 92:23]
  assign io_writeRfOp_o_addr = writeRfOp_addr; // @[pipeline-registers.scala 92:23]
  always @(posedge clock) begin
    if (io_reset | io_flush) begin // @[pipeline-registers.scala 83:30]
      writeRfOp_en <= 1'h0; // @[pipeline-registers.scala 84:22]
    end else if (!(io_stall)) begin // @[pipeline-registers.scala 87:25]
      writeRfOp_en <= io_writeRfOp_i_en; // @[pipeline-registers.scala 79:33]
    end
    if (io_reset | io_flush) begin // @[pipeline-registers.scala 83:30]
      writeRfOp_data <= 64'h0; // @[pipeline-registers.scala 84:22]
    end else if (!(io_stall)) begin // @[pipeline-registers.scala 87:25]
      writeRfOp_data <= io_writeRfOp_i_data; // @[pipeline-registers.scala 79:33]
    end
    if (io_reset | io_flush) begin // @[pipeline-registers.scala 83:30]
      writeRfOp_addr <= 5'h0; // @[pipeline-registers.scala 84:22]
    end else if (!(io_stall)) begin // @[pipeline-registers.scala 87:25]
      writeRfOp_addr <= io_writeRfOp_i_addr; // @[pipeline-registers.scala 79:33]
    end
    if (io_reset | io_flush) begin // @[pipeline-registers.scala 83:30]
      loadOp_isLoad <= 1'h0; // @[pipeline-registers.scala 85:22]
    end else if (!(io_stall)) begin // @[pipeline-registers.scala 87:25]
      loadOp_isLoad <= io_loadOp_i_isLoad; // @[pipeline-registers.scala 80:33]
    end
    if (io_reset | io_flush) begin // @[pipeline-registers.scala 83:30]
      loadOp_addr <= 64'h0; // @[pipeline-registers.scala 85:22]
    end else if (!(io_stall)) begin // @[pipeline-registers.scala 87:25]
      loadOp_addr <= io_loadOp_i_addr; // @[pipeline-registers.scala 80:33]
    end
    if (io_reset | io_flush) begin // @[pipeline-registers.scala 83:30]
      loadOp_Width <= 2'h0; // @[pipeline-registers.scala 85:22]
    end else if (!(io_stall)) begin // @[pipeline-registers.scala 87:25]
      loadOp_Width <= io_loadOp_i_Width; // @[pipeline-registers.scala 80:33]
    end
    if (io_reset | io_flush) begin // @[pipeline-registers.scala 83:30]
      storeOp_en <= 1'h0; // @[pipeline-registers.scala 86:22]
    end else if (!(io_stall)) begin // @[pipeline-registers.scala 87:25]
      storeOp_en <= io_storeOp_i_en; // @[pipeline-registers.scala 81:33]
    end
    if (io_reset | io_flush) begin // @[pipeline-registers.scala 83:30]
      storeOp_addr <= 64'h0; // @[pipeline-registers.scala 86:22]
    end else if (!(io_stall)) begin // @[pipeline-registers.scala 87:25]
      storeOp_addr <= io_storeOp_i_addr; // @[pipeline-registers.scala 81:33]
    end
    if (io_reset | io_flush) begin // @[pipeline-registers.scala 83:30]
      storeOp_data <= 64'h0; // @[pipeline-registers.scala 86:22]
    end else if (!(io_stall)) begin // @[pipeline-registers.scala 87:25]
      storeOp_data <= io_storeOp_i_data; // @[pipeline-registers.scala 81:33]
    end
    if (io_reset | io_flush) begin // @[pipeline-registers.scala 83:30]
      storeOp_Width <= 2'h0; // @[pipeline-registers.scala 86:22]
    end else if (!(io_stall)) begin // @[pipeline-registers.scala 87:25]
      storeOp_Width <= io_storeOp_i_Width; // @[pipeline-registers.scala 81:33]
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  writeRfOp_en = _RAND_0[0:0];
  _RAND_1 = {2{`RANDOM}};
  writeRfOp_data = _RAND_1[63:0];
  _RAND_2 = {1{`RANDOM}};
  writeRfOp_addr = _RAND_2[4:0];
  _RAND_3 = {1{`RANDOM}};
  loadOp_isLoad = _RAND_3[0:0];
  _RAND_4 = {2{`RANDOM}};
  loadOp_addr = _RAND_4[63:0];
  _RAND_5 = {1{`RANDOM}};
  loadOp_Width = _RAND_5[1:0];
  _RAND_6 = {1{`RANDOM}};
  storeOp_en = _RAND_6[0:0];
  _RAND_7 = {2{`RANDOM}};
  storeOp_addr = _RAND_7[63:0];
  _RAND_8 = {2{`RANDOM}};
  storeOp_data = _RAND_8[63:0];
  _RAND_9 = {1{`RANDOM}};
  storeOp_Width = _RAND_9[1:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module Memory(
  input         clock,
  input         io_writeRfOp_i_en,
  input  [63:0] io_writeRfOp_i_data,
  input  [4:0]  io_writeRfOp_i_addr,
  input         io_loadOp_isLoad,
  input  [63:0] io_loadOp_addr,
  input  [1:0]  io_loadOp_Width,
  input         io_storeOp_en,
  input  [63:0] io_storeOp_addr,
  input  [63:0] io_storeOp_data,
  input  [1:0]  io_storeOp_Width,
  output [4:0]  io_memForwarding_addr,
  output [63:0] io_memForwarding_data,
  output        io_writeRfOp_o_en,
  output [63:0] io_writeRfOp_o_data,
  output [4:0]  io_writeRfOp_o_addr
);
`ifdef RANDOMIZE_MEM_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
  reg [31:0] _RAND_7;
  reg [31:0] _RAND_8;
  reg [31:0] _RAND_9;
  reg [31:0] _RAND_10;
  reg [31:0] _RAND_11;
  reg [31:0] _RAND_12;
  reg [31:0] _RAND_13;
  reg [31:0] _RAND_14;
`endif // RANDOMIZE_REG_INIT
  reg [7:0] ram [0:1023]; // @[Mem.scala 25:26]
  wire  ram_loadVal_MPORT_en; // @[Mem.scala 25:26]
  wire [9:0] ram_loadVal_MPORT_addr; // @[Mem.scala 25:26]
  wire [7:0] ram_loadVal_MPORT_data; // @[Mem.scala 25:26]
  wire  ram_loadVal_MPORT_1_en; // @[Mem.scala 25:26]
  wire [9:0] ram_loadVal_MPORT_1_addr; // @[Mem.scala 25:26]
  wire [7:0] ram_loadVal_MPORT_1_data; // @[Mem.scala 25:26]
  wire  ram_loadVal_MPORT_2_en; // @[Mem.scala 25:26]
  wire [9:0] ram_loadVal_MPORT_2_addr; // @[Mem.scala 25:26]
  wire [7:0] ram_loadVal_MPORT_2_data; // @[Mem.scala 25:26]
  wire  ram_loadVal_MPORT_3_en; // @[Mem.scala 25:26]
  wire [9:0] ram_loadVal_MPORT_3_addr; // @[Mem.scala 25:26]
  wire [7:0] ram_loadVal_MPORT_3_data; // @[Mem.scala 25:26]
  wire  ram_loadVal_MPORT_4_en; // @[Mem.scala 25:26]
  wire [9:0] ram_loadVal_MPORT_4_addr; // @[Mem.scala 25:26]
  wire [7:0] ram_loadVal_MPORT_4_data; // @[Mem.scala 25:26]
  wire  ram_loadVal_MPORT_5_en; // @[Mem.scala 25:26]
  wire [9:0] ram_loadVal_MPORT_5_addr; // @[Mem.scala 25:26]
  wire [7:0] ram_loadVal_MPORT_5_data; // @[Mem.scala 25:26]
  wire  ram_loadVal_MPORT_6_en; // @[Mem.scala 25:26]
  wire [9:0] ram_loadVal_MPORT_6_addr; // @[Mem.scala 25:26]
  wire [7:0] ram_loadVal_MPORT_6_data; // @[Mem.scala 25:26]
  wire [7:0] ram_MPORT_data; // @[Mem.scala 25:26]
  wire [9:0] ram_MPORT_addr; // @[Mem.scala 25:26]
  wire  ram_MPORT_mask; // @[Mem.scala 25:26]
  wire  ram_MPORT_en; // @[Mem.scala 25:26]
  wire [7:0] ram_MPORT_1_data; // @[Mem.scala 25:26]
  wire [9:0] ram_MPORT_1_addr; // @[Mem.scala 25:26]
  wire  ram_MPORT_1_mask; // @[Mem.scala 25:26]
  wire  ram_MPORT_1_en; // @[Mem.scala 25:26]
  wire [7:0] ram_MPORT_2_data; // @[Mem.scala 25:26]
  wire [9:0] ram_MPORT_2_addr; // @[Mem.scala 25:26]
  wire  ram_MPORT_2_mask; // @[Mem.scala 25:26]
  wire  ram_MPORT_2_en; // @[Mem.scala 25:26]
  wire [7:0] ram_MPORT_3_data; // @[Mem.scala 25:26]
  wire [9:0] ram_MPORT_3_addr; // @[Mem.scala 25:26]
  wire  ram_MPORT_3_mask; // @[Mem.scala 25:26]
  wire  ram_MPORT_3_en; // @[Mem.scala 25:26]
  wire [7:0] ram_MPORT_4_data; // @[Mem.scala 25:26]
  wire [9:0] ram_MPORT_4_addr; // @[Mem.scala 25:26]
  wire  ram_MPORT_4_mask; // @[Mem.scala 25:26]
  wire  ram_MPORT_4_en; // @[Mem.scala 25:26]
  wire [7:0] ram_MPORT_5_data; // @[Mem.scala 25:26]
  wire [9:0] ram_MPORT_5_addr; // @[Mem.scala 25:26]
  wire  ram_MPORT_5_mask; // @[Mem.scala 25:26]
  wire  ram_MPORT_5_en; // @[Mem.scala 25:26]
  wire [7:0] ram_MPORT_6_data; // @[Mem.scala 25:26]
  wire [9:0] ram_MPORT_6_addr; // @[Mem.scala 25:26]
  wire  ram_MPORT_6_mask; // @[Mem.scala 25:26]
  wire  ram_MPORT_6_en; // @[Mem.scala 25:26]
  reg  ram_loadVal_MPORT_en_pipe_0;
  reg [9:0] ram_loadVal_MPORT_addr_pipe_0;
  reg  ram_loadVal_MPORT_1_en_pipe_0;
  reg [9:0] ram_loadVal_MPORT_1_addr_pipe_0;
  reg  ram_loadVal_MPORT_2_en_pipe_0;
  reg [9:0] ram_loadVal_MPORT_2_addr_pipe_0;
  reg  ram_loadVal_MPORT_3_en_pipe_0;
  reg [9:0] ram_loadVal_MPORT_3_addr_pipe_0;
  reg  ram_loadVal_MPORT_4_en_pipe_0;
  reg [9:0] ram_loadVal_MPORT_4_addr_pipe_0;
  reg  ram_loadVal_MPORT_5_en_pipe_0;
  reg [9:0] ram_loadVal_MPORT_5_addr_pipe_0;
  reg  ram_loadVal_MPORT_6_en_pipe_0;
  reg [9:0] ram_loadVal_MPORT_6_addr_pipe_0;
  wire  _legalLoad_T_1 = ~io_loadOp_addr[0]; // @[Mem.scala 12:21]
  wire  _legalLoad_T_6 = _legalLoad_T_1 & ~io_loadOp_addr[1]; // @[Mem.scala 13:31]
  wire  _legalLoad_T_10 = 2'h1 == io_loadOp_Width ? _legalLoad_T_1 : 2'h0 == io_loadOp_Width; // @[Mux.scala 81:58]
  wire  legalLoad = 2'h2 == io_loadOp_Width ? _legalLoad_T_6 : _legalLoad_T_10; // @[Mux.scala 81:58]
  wire [63:0] _loadVal_T_3 = io_loadOp_addr + 64'h1; // @[Mem.scala 34:43]
  wire [15:0] _loadVal_T_5 = {ram_loadVal_MPORT_1_data,ram_loadVal_MPORT_2_data}; // @[Cat.scala 31:58]
  wire [63:0] _loadVal_T_11 = io_loadOp_addr + 64'h2; // @[Mem.scala 35:60]
  wire [63:0] _loadVal_T_14 = io_loadOp_addr + 64'h3; // @[Mem.scala 35:78]
  wire [31:0] _loadVal_T_16 = {ram_loadVal_MPORT_3_data,ram_loadVal_MPORT_4_data,ram_loadVal_MPORT_5_data,
    ram_loadVal_MPORT_6_data}; // @[Cat.scala 31:58]
  wire [7:0] _loadVal_T_18 = 2'h0 == io_loadOp_Width ? ram_loadVal_MPORT_data : 8'h0; // @[Mux.scala 81:58]
  wire [15:0] _loadVal_T_20 = 2'h1 == io_loadOp_Width ? _loadVal_T_5 : {{8'd0}, _loadVal_T_18}; // @[Mux.scala 81:58]
  wire [31:0] loadVal = 2'h2 == io_loadOp_Width ? _loadVal_T_16 : {{16'd0}, _loadVal_T_20}; // @[Mux.scala 81:58]
  wire [31:0] ldata = legalLoad ? loadVal : 32'h0; // @[Mem.scala 39:22]
  wire  _legalStore_T_1 = ~io_storeOp_addr[0]; // @[Mem.scala 12:21]
  wire  _legalStore_T_6 = _legalStore_T_1 & ~io_storeOp_addr[1]; // @[Mem.scala 13:31]
  wire  _legalStore_T_7 = 2'h0 == io_storeOp_Width; // @[Mux.scala 81:61]
  wire  _legalStore_T_9 = 2'h1 == io_storeOp_Width; // @[Mux.scala 81:61]
  wire  _legalStore_T_10 = 2'h1 == io_storeOp_Width ? _legalStore_T_1 : 2'h0 == io_storeOp_Width; // @[Mux.scala 81:58]
  wire  _legalStore_T_11 = 2'h2 == io_storeOp_Width; // @[Mux.scala 81:61]
  wire  legalStore = 2'h2 == io_storeOp_Width ? _legalStore_T_6 : _legalStore_T_10; // @[Mux.scala 81:58]
  wire  _T = io_storeOp_en & legalStore; // @[Mem.scala 47:24]
  wire [63:0] _T_8 = io_storeOp_addr + 64'h1; // @[Mem.scala 54:26]
  wire [63:0] _T_19 = io_storeOp_addr + 64'h2; // @[Mem.scala 59:26]
  wire [63:0] _T_23 = io_storeOp_addr + 64'h3; // @[Mem.scala 60:26]
  wire  _GEN_20 = _legalStore_T_9 ? 1'h0 : _legalStore_T_11; // @[Mem.scala 25:26 48:33]
  wire  _GEN_36 = _legalStore_T_7 ? 1'h0 : _legalStore_T_9; // @[Mem.scala 25:26 48:33]
  wire  _GEN_43 = _legalStore_T_7 ? 1'h0 : _GEN_20; // @[Mem.scala 25:26 48:33]
  assign ram_loadVal_MPORT_en = ram_loadVal_MPORT_en_pipe_0;
  assign ram_loadVal_MPORT_addr = ram_loadVal_MPORT_addr_pipe_0;
  assign ram_loadVal_MPORT_data = ram[ram_loadVal_MPORT_addr]; // @[Mem.scala 25:26]
  assign ram_loadVal_MPORT_1_en = ram_loadVal_MPORT_1_en_pipe_0;
  assign ram_loadVal_MPORT_1_addr = ram_loadVal_MPORT_1_addr_pipe_0;
  assign ram_loadVal_MPORT_1_data = ram[ram_loadVal_MPORT_1_addr]; // @[Mem.scala 25:26]
  assign ram_loadVal_MPORT_2_en = ram_loadVal_MPORT_2_en_pipe_0;
  assign ram_loadVal_MPORT_2_addr = ram_loadVal_MPORT_2_addr_pipe_0;
  assign ram_loadVal_MPORT_2_data = ram[ram_loadVal_MPORT_2_addr]; // @[Mem.scala 25:26]
  assign ram_loadVal_MPORT_3_en = ram_loadVal_MPORT_3_en_pipe_0;
  assign ram_loadVal_MPORT_3_addr = ram_loadVal_MPORT_3_addr_pipe_0;
  assign ram_loadVal_MPORT_3_data = ram[ram_loadVal_MPORT_3_addr]; // @[Mem.scala 25:26]
  assign ram_loadVal_MPORT_4_en = ram_loadVal_MPORT_4_en_pipe_0;
  assign ram_loadVal_MPORT_4_addr = ram_loadVal_MPORT_4_addr_pipe_0;
  assign ram_loadVal_MPORT_4_data = ram[ram_loadVal_MPORT_4_addr]; // @[Mem.scala 25:26]
  assign ram_loadVal_MPORT_5_en = ram_loadVal_MPORT_5_en_pipe_0;
  assign ram_loadVal_MPORT_5_addr = ram_loadVal_MPORT_5_addr_pipe_0;
  assign ram_loadVal_MPORT_5_data = ram[ram_loadVal_MPORT_5_addr]; // @[Mem.scala 25:26]
  assign ram_loadVal_MPORT_6_en = ram_loadVal_MPORT_6_en_pipe_0;
  assign ram_loadVal_MPORT_6_addr = ram_loadVal_MPORT_6_addr_pipe_0;
  assign ram_loadVal_MPORT_6_data = ram[ram_loadVal_MPORT_6_addr]; // @[Mem.scala 25:26]
  assign ram_MPORT_data = io_storeOp_data[7:0];
  assign ram_MPORT_addr = io_storeOp_addr[9:0];
  assign ram_MPORT_mask = 1'h1;
  assign ram_MPORT_en = _T & _legalStore_T_7;
  assign ram_MPORT_1_data = io_storeOp_data[7:0];
  assign ram_MPORT_1_addr = io_storeOp_addr[9:0];
  assign ram_MPORT_1_mask = 1'h1;
  assign ram_MPORT_1_en = _T & _GEN_36;
  assign ram_MPORT_2_data = io_storeOp_data[15:8];
  assign ram_MPORT_2_addr = _T_8[9:0];
  assign ram_MPORT_2_mask = 1'h1;
  assign ram_MPORT_2_en = _T & _GEN_36;
  assign ram_MPORT_3_data = io_storeOp_data[7:0];
  assign ram_MPORT_3_addr = io_storeOp_addr[9:0];
  assign ram_MPORT_3_mask = 1'h1;
  assign ram_MPORT_3_en = _T & _GEN_43;
  assign ram_MPORT_4_data = io_storeOp_data[15:8];
  assign ram_MPORT_4_addr = _T_8[9:0];
  assign ram_MPORT_4_mask = 1'h1;
  assign ram_MPORT_4_en = _T & _GEN_43;
  assign ram_MPORT_5_data = io_storeOp_data[23:16];
  assign ram_MPORT_5_addr = _T_19[9:0];
  assign ram_MPORT_5_mask = 1'h1;
  assign ram_MPORT_5_en = _T & _GEN_43;
  assign ram_MPORT_6_data = io_storeOp_data[31:24];
  assign ram_MPORT_6_addr = _T_23[9:0];
  assign ram_MPORT_6_mask = 1'h1;
  assign ram_MPORT_6_en = _T & _GEN_43;
  assign io_memForwarding_addr = io_writeRfOp_i_addr; // @[Mem.scala 68:27]
  assign io_memForwarding_data = io_loadOp_isLoad ? {{32'd0}, loadVal} : io_writeRfOp_i_data; // @[Mem.scala 69:33]
  assign io_writeRfOp_o_en = io_writeRfOp_i_en; // @[Mem.scala 65:27]
  assign io_writeRfOp_o_data = io_loadOp_isLoad ? {{32'd0}, ldata} : io_writeRfOp_i_data; // @[Mem.scala 64:33]
  assign io_writeRfOp_o_addr = io_writeRfOp_i_addr; // @[Mem.scala 66:27]
  always @(posedge clock) begin
    if (ram_MPORT_en & ram_MPORT_mask) begin
      ram[ram_MPORT_addr] <= ram_MPORT_data; // @[Mem.scala 25:26]
    end
    if (ram_MPORT_1_en & ram_MPORT_1_mask) begin
      ram[ram_MPORT_1_addr] <= ram_MPORT_1_data; // @[Mem.scala 25:26]
    end
    if (ram_MPORT_2_en & ram_MPORT_2_mask) begin
      ram[ram_MPORT_2_addr] <= ram_MPORT_2_data; // @[Mem.scala 25:26]
    end
    if (ram_MPORT_3_en & ram_MPORT_3_mask) begin
      ram[ram_MPORT_3_addr] <= ram_MPORT_3_data; // @[Mem.scala 25:26]
    end
    if (ram_MPORT_4_en & ram_MPORT_4_mask) begin
      ram[ram_MPORT_4_addr] <= ram_MPORT_4_data; // @[Mem.scala 25:26]
    end
    if (ram_MPORT_5_en & ram_MPORT_5_mask) begin
      ram[ram_MPORT_5_addr] <= ram_MPORT_5_data; // @[Mem.scala 25:26]
    end
    if (ram_MPORT_6_en & ram_MPORT_6_mask) begin
      ram[ram_MPORT_6_addr] <= ram_MPORT_6_data; // @[Mem.scala 25:26]
    end
    ram_loadVal_MPORT_en_pipe_0 <= 1'h1;
    if (1'h1) begin
      ram_loadVal_MPORT_addr_pipe_0 <= io_loadOp_addr[9:0];
    end
    ram_loadVal_MPORT_1_en_pipe_0 <= 1'h1;
    if (1'h1) begin
      ram_loadVal_MPORT_1_addr_pipe_0 <= io_loadOp_addr[9:0];
    end
    ram_loadVal_MPORT_2_en_pipe_0 <= 1'h1;
    if (1'h1) begin
      ram_loadVal_MPORT_2_addr_pipe_0 <= _loadVal_T_3[9:0];
    end
    ram_loadVal_MPORT_3_en_pipe_0 <= 1'h1;
    if (1'h1) begin
      ram_loadVal_MPORT_3_addr_pipe_0 <= io_loadOp_addr[9:0];
    end
    ram_loadVal_MPORT_4_en_pipe_0 <= 1'h1;
    if (1'h1) begin
      ram_loadVal_MPORT_4_addr_pipe_0 <= _loadVal_T_3[9:0];
    end
    ram_loadVal_MPORT_5_en_pipe_0 <= 1'h1;
    if (1'h1) begin
      ram_loadVal_MPORT_5_addr_pipe_0 <= _loadVal_T_11[9:0];
    end
    ram_loadVal_MPORT_6_en_pipe_0 <= 1'h1;
    if (1'h1) begin
      ram_loadVal_MPORT_6_addr_pipe_0 <= _loadVal_T_14[9:0];
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_MEM_INIT
  _RAND_0 = {1{`RANDOM}};
  for (initvar = 0; initvar < 1024; initvar = initvar+1)
    ram[initvar] = _RAND_0[7:0];
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{`RANDOM}};
  ram_loadVal_MPORT_en_pipe_0 = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  ram_loadVal_MPORT_addr_pipe_0 = _RAND_2[9:0];
  _RAND_3 = {1{`RANDOM}};
  ram_loadVal_MPORT_1_en_pipe_0 = _RAND_3[0:0];
  _RAND_4 = {1{`RANDOM}};
  ram_loadVal_MPORT_1_addr_pipe_0 = _RAND_4[9:0];
  _RAND_5 = {1{`RANDOM}};
  ram_loadVal_MPORT_2_en_pipe_0 = _RAND_5[0:0];
  _RAND_6 = {1{`RANDOM}};
  ram_loadVal_MPORT_2_addr_pipe_0 = _RAND_6[9:0];
  _RAND_7 = {1{`RANDOM}};
  ram_loadVal_MPORT_3_en_pipe_0 = _RAND_7[0:0];
  _RAND_8 = {1{`RANDOM}};
  ram_loadVal_MPORT_3_addr_pipe_0 = _RAND_8[9:0];
  _RAND_9 = {1{`RANDOM}};
  ram_loadVal_MPORT_4_en_pipe_0 = _RAND_9[0:0];
  _RAND_10 = {1{`RANDOM}};
  ram_loadVal_MPORT_4_addr_pipe_0 = _RAND_10[9:0];
  _RAND_11 = {1{`RANDOM}};
  ram_loadVal_MPORT_5_en_pipe_0 = _RAND_11[0:0];
  _RAND_12 = {1{`RANDOM}};
  ram_loadVal_MPORT_5_addr_pipe_0 = _RAND_12[9:0];
  _RAND_13 = {1{`RANDOM}};
  ram_loadVal_MPORT_6_en_pipe_0 = _RAND_13[0:0];
  _RAND_14 = {1{`RANDOM}};
  ram_loadVal_MPORT_6_addr_pipe_0 = _RAND_14[9:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module Mem_Wb(
  input         clock,
  input         io_stall,
  input         io_flush,
  input         io_reset,
  input         io_writeRfOp_i_en,
  input  [63:0] io_writeRfOp_i_data,
  input  [4:0]  io_writeRfOp_i_addr,
  output        io_writeRfOp_o_en,
  output [63:0] io_writeRfOp_o_data,
  output [4:0]  io_writeRfOp_o_addr
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [63:0] _RAND_1;
  reg [31:0] _RAND_2;
`endif // RANDOMIZE_REG_INIT
  reg  writeRfOp_en; // @[pipeline-registers.scala 107:30]
  reg [63:0] writeRfOp_data; // @[pipeline-registers.scala 107:30]
  reg [4:0] writeRfOp_addr; // @[pipeline-registers.scala 107:30]
  assign io_writeRfOp_o_en = writeRfOp_en; // @[pipeline-registers.scala 114:21]
  assign io_writeRfOp_o_data = writeRfOp_data; // @[pipeline-registers.scala 114:21]
  assign io_writeRfOp_o_addr = writeRfOp_addr; // @[pipeline-registers.scala 114:21]
  always @(posedge clock) begin
    if (io_reset | io_flush) begin // @[pipeline-registers.scala 108:30]
      writeRfOp_en <= 1'h0; // @[pipeline-registers.scala 109:21]
    end else if (!(io_stall)) begin // @[pipeline-registers.scala 110:25]
      writeRfOp_en <= io_writeRfOp_i_en; // @[pipeline-registers.scala 107:30]
    end
    if (io_reset | io_flush) begin // @[pipeline-registers.scala 108:30]
      writeRfOp_data <= 64'h0; // @[pipeline-registers.scala 109:21]
    end else if (!(io_stall)) begin // @[pipeline-registers.scala 110:25]
      writeRfOp_data <= io_writeRfOp_i_data; // @[pipeline-registers.scala 107:30]
    end
    if (io_reset | io_flush) begin // @[pipeline-registers.scala 108:30]
      writeRfOp_addr <= 5'h0; // @[pipeline-registers.scala 109:21]
    end else if (!(io_stall)) begin // @[pipeline-registers.scala 110:25]
      writeRfOp_addr <= io_writeRfOp_i_addr; // @[pipeline-registers.scala 107:30]
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  writeRfOp_en = _RAND_0[0:0];
  _RAND_1 = {2{`RANDOM}};
  writeRfOp_data = _RAND_1[63:0];
  _RAND_2 = {1{`RANDOM}};
  writeRfOp_addr = _RAND_2[4:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module Wb(
  input         io_writeRfOp_i_en,
  input  [63:0] io_writeRfOp_i_data,
  input  [4:0]  io_writeRfOp_i_addr,
  output [4:0]  io_wbForwarding_addr,
  output [63:0] io_wbForwarding_data,
  output        io_writeRfOp_o_en,
  output [63:0] io_writeRfOp_o_data,
  output [4:0]  io_writeRfOp_o_addr
);
  assign io_wbForwarding_addr = io_writeRfOp_i_addr; // @[Wb.scala 14:21]
  assign io_wbForwarding_data = io_writeRfOp_i_data; // @[Wb.scala 14:21]
  assign io_writeRfOp_o_en = io_writeRfOp_i_en; // @[Wb.scala 13:21]
  assign io_writeRfOp_o_data = io_writeRfOp_i_data; // @[Wb.scala 13:21]
  assign io_writeRfOp_o_addr = io_writeRfOp_i_addr; // @[Wb.scala 13:21]
endmodule
module Ctrl(
  input        io_id_stall_req,
  input        io_id_flush_req,
  output [4:0] io_stall,
  output [4:0] io_flush
);
  wire [1:0] _GEN_0 = io_id_stall_req ? 2'h3 : 2'h0; // @[Ctrl.scala 15:17 17:26 18:21]
  wire [2:0] _GEN_1 = io_id_flush_req ? 3'h7 : 3'h0; // @[Ctrl.scala 16:17 20:26 23:21]
  assign io_stall = {{3'd0}, _GEN_0};
  assign io_flush = {{2'd0}, _GEN_1};
endmodule
module Top(
  input         io_clk,
  input         io_reset,
  output [63:0] io_o1,
  output [31:0] io_o2,
  output [63:0] io_o3,
  output [63:0] io_o4
);
  wire  IF_clock; // @[Top.scala 22:64]
  wire  IF_reset; // @[Top.scala 22:64]
  wire  IF_io_reset; // @[Top.scala 22:64]
  wire  IF_io_stall; // @[Top.scala 22:64]
  wire  IF_io_flush; // @[Top.scala 22:64]
  wire  IF_io_branchOp_taken; // @[Top.scala 22:64]
  wire [63:0] IF_io_branchOp_target; // @[Top.scala 22:64]
  wire [63:0] IF_io_pc_o; // @[Top.scala 22:64]
  wire [31:0] IF_io_inst_o; // @[Top.scala 22:64]
  wire  REGFILE_clock; // @[Top.scala 24:64]
  wire  REGFILE_reset; // @[Top.scala 24:64]
  wire [4:0] REGFILE_io_id2Rf_ReadIdx1; // @[Top.scala 24:64]
  wire [4:0] REGFILE_io_id2Rf_ReadIdx2; // @[Top.scala 24:64]
  wire  REGFILE_io_writeRfOp_en; // @[Top.scala 24:64]
  wire [63:0] REGFILE_io_writeRfOp_data; // @[Top.scala 24:64]
  wire [4:0] REGFILE_io_writeRfOp_addr; // @[Top.scala 24:64]
  wire [63:0] REGFILE_io_rf2Id_RegData1; // @[Top.scala 24:64]
  wire [63:0] REGFILE_io_rf2Id_RegData2; // @[Top.scala 24:64]
  wire  IF_ID_clock; // @[Top.scala 25:64]
  wire  IF_ID_io_stall; // @[Top.scala 25:64]
  wire  IF_ID_io_reset; // @[Top.scala 25:64]
  wire  IF_ID_io_flush; // @[Top.scala 25:64]
  wire [63:0] IF_ID_io_pc_i; // @[Top.scala 25:64]
  wire [31:0] IF_ID_io_inst_i; // @[Top.scala 25:64]
  wire [63:0] IF_ID_io_pc_o; // @[Top.scala 25:64]
  wire [31:0] IF_ID_io_inst_o; // @[Top.scala 25:64]
  wire [63:0] ID_io_pc; // @[Top.scala 26:64]
  wire [31:0] ID_io_inst_i; // @[Top.scala 26:64]
  wire [63:0] ID_io_rf2Id_RegData1; // @[Top.scala 26:64]
  wire [63:0] ID_io_rf2Id_RegData2; // @[Top.scala 26:64]
  wire  ID_io_prev_is_load; // @[Top.scala 26:64]
  wire [4:0] ID_io_load_dest; // @[Top.scala 26:64]
  wire [4:0] ID_io_exForwarding_addr; // @[Top.scala 26:64]
  wire [63:0] ID_io_exForwarding_data; // @[Top.scala 26:64]
  wire [4:0] ID_io_memForwarding_addr; // @[Top.scala 26:64]
  wire [63:0] ID_io_memForwarding_data; // @[Top.scala 26:64]
  wire [4:0] ID_io_wbForwarding_addr; // @[Top.scala 26:64]
  wire [63:0] ID_io_wbForwarding_data; // @[Top.scala 26:64]
  wire  ID_io_stall_req; // @[Top.scala 26:64]
  wire [4:0] ID_io_id2Rf_ReadIdx1; // @[Top.scala 26:64]
  wire [4:0] ID_io_id2Rf_ReadIdx2; // @[Top.scala 26:64]
  wire [63:0] ID_io_decInfo_oprand1; // @[Top.scala 26:64]
  wire [63:0] ID_io_decInfo_oprand2; // @[Top.scala 26:64]
  wire [4:0] ID_io_decInfo_rd; // @[Top.scala 26:64]
  wire [2:0] ID_io_decInfo_InstType; // @[Top.scala 26:64]
  wire [4:0] ID_io_decInfo_aluop; // @[Top.scala 26:64]
  wire  ID_io_decInfo_storeOp_en; // @[Top.scala 26:64]
  wire [63:0] ID_io_decInfo_storeOp_data; // @[Top.scala 26:64]
  wire [1:0] ID_io_decInfo_storeOp_Width; // @[Top.scala 26:64]
  wire  ID_io_decInfo_loadOp_isLoad; // @[Top.scala 26:64]
  wire [1:0] ID_io_decInfo_loadOp_Width; // @[Top.scala 26:64]
  wire [4:0] ID_io_decInfo_loadOp_dest; // @[Top.scala 26:64]
  wire  ID_io_branchOp_taken; // @[Top.scala 26:64]
  wire [63:0] ID_io_branchOp_target; // @[Top.scala 26:64]
  wire  ID_io_flush_req; // @[Top.scala 26:64]
  wire  ID_EX_clock; // @[Top.scala 27:64]
  wire  ID_EX_io_stall; // @[Top.scala 27:64]
  wire  ID_EX_io_flush; // @[Top.scala 27:64]
  wire  ID_EX_io_reset; // @[Top.scala 27:64]
  wire  ID_EX_io_prev_is_load_i; // @[Top.scala 27:64]
  wire [63:0] ID_EX_io_decInfo_i_oprand1; // @[Top.scala 27:64]
  wire [63:0] ID_EX_io_decInfo_i_oprand2; // @[Top.scala 27:64]
  wire [4:0] ID_EX_io_decInfo_i_rd; // @[Top.scala 27:64]
  wire [2:0] ID_EX_io_decInfo_i_InstType; // @[Top.scala 27:64]
  wire [4:0] ID_EX_io_decInfo_i_aluop; // @[Top.scala 27:64]
  wire  ID_EX_io_decInfo_i_storeOp_en; // @[Top.scala 27:64]
  wire [63:0] ID_EX_io_decInfo_i_storeOp_data; // @[Top.scala 27:64]
  wire [1:0] ID_EX_io_decInfo_i_storeOp_Width; // @[Top.scala 27:64]
  wire  ID_EX_io_decInfo_i_loadOp_isLoad; // @[Top.scala 27:64]
  wire [1:0] ID_EX_io_decInfo_i_loadOp_Width; // @[Top.scala 27:64]
  wire [4:0] ID_EX_io_decInfo_i_loadOp_dest; // @[Top.scala 27:64]
  wire [63:0] ID_EX_io_decInfo_o_oprand1; // @[Top.scala 27:64]
  wire [63:0] ID_EX_io_decInfo_o_oprand2; // @[Top.scala 27:64]
  wire [4:0] ID_EX_io_decInfo_o_rd; // @[Top.scala 27:64]
  wire [2:0] ID_EX_io_decInfo_o_InstType; // @[Top.scala 27:64]
  wire [4:0] ID_EX_io_decInfo_o_aluop; // @[Top.scala 27:64]
  wire  ID_EX_io_decInfo_o_storeOp_en; // @[Top.scala 27:64]
  wire [63:0] ID_EX_io_decInfo_o_storeOp_data; // @[Top.scala 27:64]
  wire [1:0] ID_EX_io_decInfo_o_storeOp_Width; // @[Top.scala 27:64]
  wire  ID_EX_io_decInfo_o_loadOp_isLoad; // @[Top.scala 27:64]
  wire [1:0] ID_EX_io_decInfo_o_loadOp_Width; // @[Top.scala 27:64]
  wire  ID_EX_io_prev_is_load_o; // @[Top.scala 27:64]
  wire [4:0] ID_EX_io_load_dest_o; // @[Top.scala 27:64]
  wire [63:0] EX_io_decInfo_oprand1; // @[Top.scala 28:64]
  wire [63:0] EX_io_decInfo_oprand2; // @[Top.scala 28:64]
  wire [4:0] EX_io_decInfo_rd; // @[Top.scala 28:64]
  wire [2:0] EX_io_decInfo_InstType; // @[Top.scala 28:64]
  wire [4:0] EX_io_decInfo_aluop; // @[Top.scala 28:64]
  wire  EX_io_decInfo_storeOp_en; // @[Top.scala 28:64]
  wire [63:0] EX_io_decInfo_storeOp_data; // @[Top.scala 28:64]
  wire [1:0] EX_io_decInfo_storeOp_Width; // @[Top.scala 28:64]
  wire  EX_io_decInfo_loadOp_isLoad; // @[Top.scala 28:64]
  wire [1:0] EX_io_decInfo_loadOp_Width; // @[Top.scala 28:64]
  wire [4:0] EX_io_exForwarding_addr; // @[Top.scala 28:64]
  wire [63:0] EX_io_exForwarding_data; // @[Top.scala 28:64]
  wire  EX_io_writeRfOp_en; // @[Top.scala 28:64]
  wire [63:0] EX_io_writeRfOp_data; // @[Top.scala 28:64]
  wire [4:0] EX_io_writeRfOp_addr; // @[Top.scala 28:64]
  wire  EX_io_loadOp_isLoad; // @[Top.scala 28:64]
  wire [63:0] EX_io_loadOp_addr; // @[Top.scala 28:64]
  wire [1:0] EX_io_loadOp_Width; // @[Top.scala 28:64]
  wire  EX_io_storeOp_en; // @[Top.scala 28:64]
  wire [63:0] EX_io_storeOp_addr; // @[Top.scala 28:64]
  wire [63:0] EX_io_storeOp_data; // @[Top.scala 28:64]
  wire [1:0] EX_io_storeOp_Width; // @[Top.scala 28:64]
  wire  EX_MEM_clock; // @[Top.scala 29:64]
  wire  EX_MEM_io_stall; // @[Top.scala 29:64]
  wire  EX_MEM_io_flush; // @[Top.scala 29:64]
  wire  EX_MEM_io_reset; // @[Top.scala 29:64]
  wire  EX_MEM_io_loadOp_i_isLoad; // @[Top.scala 29:64]
  wire [63:0] EX_MEM_io_loadOp_i_addr; // @[Top.scala 29:64]
  wire [1:0] EX_MEM_io_loadOp_i_Width; // @[Top.scala 29:64]
  wire  EX_MEM_io_storeOp_i_en; // @[Top.scala 29:64]
  wire [63:0] EX_MEM_io_storeOp_i_addr; // @[Top.scala 29:64]
  wire [63:0] EX_MEM_io_storeOp_i_data; // @[Top.scala 29:64]
  wire [1:0] EX_MEM_io_storeOp_i_Width; // @[Top.scala 29:64]
  wire  EX_MEM_io_writeRfOp_i_en; // @[Top.scala 29:64]
  wire [63:0] EX_MEM_io_writeRfOp_i_data; // @[Top.scala 29:64]
  wire [4:0] EX_MEM_io_writeRfOp_i_addr; // @[Top.scala 29:64]
  wire  EX_MEM_io_loadOp_o_isLoad; // @[Top.scala 29:64]
  wire [63:0] EX_MEM_io_loadOp_o_addr; // @[Top.scala 29:64]
  wire [1:0] EX_MEM_io_loadOp_o_Width; // @[Top.scala 29:64]
  wire  EX_MEM_io_storeOp_o_en; // @[Top.scala 29:64]
  wire [63:0] EX_MEM_io_storeOp_o_addr; // @[Top.scala 29:64]
  wire [63:0] EX_MEM_io_storeOp_o_data; // @[Top.scala 29:64]
  wire [1:0] EX_MEM_io_storeOp_o_Width; // @[Top.scala 29:64]
  wire  EX_MEM_io_writeRfOp_o_en; // @[Top.scala 29:64]
  wire [63:0] EX_MEM_io_writeRfOp_o_data; // @[Top.scala 29:64]
  wire [4:0] EX_MEM_io_writeRfOp_o_addr; // @[Top.scala 29:64]
  wire  MEM_clock; // @[Top.scala 30:64]
  wire  MEM_io_writeRfOp_i_en; // @[Top.scala 30:64]
  wire [63:0] MEM_io_writeRfOp_i_data; // @[Top.scala 30:64]
  wire [4:0] MEM_io_writeRfOp_i_addr; // @[Top.scala 30:64]
  wire  MEM_io_loadOp_isLoad; // @[Top.scala 30:64]
  wire [63:0] MEM_io_loadOp_addr; // @[Top.scala 30:64]
  wire [1:0] MEM_io_loadOp_Width; // @[Top.scala 30:64]
  wire  MEM_io_storeOp_en; // @[Top.scala 30:64]
  wire [63:0] MEM_io_storeOp_addr; // @[Top.scala 30:64]
  wire [63:0] MEM_io_storeOp_data; // @[Top.scala 30:64]
  wire [1:0] MEM_io_storeOp_Width; // @[Top.scala 30:64]
  wire [4:0] MEM_io_memForwarding_addr; // @[Top.scala 30:64]
  wire [63:0] MEM_io_memForwarding_data; // @[Top.scala 30:64]
  wire  MEM_io_writeRfOp_o_en; // @[Top.scala 30:64]
  wire [63:0] MEM_io_writeRfOp_o_data; // @[Top.scala 30:64]
  wire [4:0] MEM_io_writeRfOp_o_addr; // @[Top.scala 30:64]
  wire  MEM_WB_clock; // @[Top.scala 31:64]
  wire  MEM_WB_io_stall; // @[Top.scala 31:64]
  wire  MEM_WB_io_flush; // @[Top.scala 31:64]
  wire  MEM_WB_io_reset; // @[Top.scala 31:64]
  wire  MEM_WB_io_writeRfOp_i_en; // @[Top.scala 31:64]
  wire [63:0] MEM_WB_io_writeRfOp_i_data; // @[Top.scala 31:64]
  wire [4:0] MEM_WB_io_writeRfOp_i_addr; // @[Top.scala 31:64]
  wire  MEM_WB_io_writeRfOp_o_en; // @[Top.scala 31:64]
  wire [63:0] MEM_WB_io_writeRfOp_o_data; // @[Top.scala 31:64]
  wire [4:0] MEM_WB_io_writeRfOp_o_addr; // @[Top.scala 31:64]
  wire  WB_io_writeRfOp_i_en; // @[Top.scala 32:64]
  wire [63:0] WB_io_writeRfOp_i_data; // @[Top.scala 32:64]
  wire [4:0] WB_io_writeRfOp_i_addr; // @[Top.scala 32:64]
  wire [4:0] WB_io_wbForwarding_addr; // @[Top.scala 32:64]
  wire [63:0] WB_io_wbForwarding_data; // @[Top.scala 32:64]
  wire  WB_io_writeRfOp_o_en; // @[Top.scala 32:64]
  wire [63:0] WB_io_writeRfOp_o_data; // @[Top.scala 32:64]
  wire [4:0] WB_io_writeRfOp_o_addr; // @[Top.scala 32:64]
  wire  CTRL_io_id_stall_req; // @[Top.scala 33:64]
  wire  CTRL_io_id_flush_req; // @[Top.scala 33:64]
  wire [4:0] CTRL_io_stall; // @[Top.scala 33:64]
  wire [4:0] CTRL_io_flush; // @[Top.scala 33:64]
  If IF ( // @[Top.scala 22:64]
    .clock(IF_clock),
    .reset(IF_reset),
    .io_reset(IF_io_reset),
    .io_stall(IF_io_stall),
    .io_flush(IF_io_flush),
    .io_branchOp_taken(IF_io_branchOp_taken),
    .io_branchOp_target(IF_io_branchOp_target),
    .io_pc_o(IF_io_pc_o),
    .io_inst_o(IF_io_inst_o)
  );
  Regfile REGFILE ( // @[Top.scala 24:64]
    .clock(REGFILE_clock),
    .reset(REGFILE_reset),
    .io_id2Rf_ReadIdx1(REGFILE_io_id2Rf_ReadIdx1),
    .io_id2Rf_ReadIdx2(REGFILE_io_id2Rf_ReadIdx2),
    .io_writeRfOp_en(REGFILE_io_writeRfOp_en),
    .io_writeRfOp_data(REGFILE_io_writeRfOp_data),
    .io_writeRfOp_addr(REGFILE_io_writeRfOp_addr),
    .io_rf2Id_RegData1(REGFILE_io_rf2Id_RegData1),
    .io_rf2Id_RegData2(REGFILE_io_rf2Id_RegData2)
  );
  If_Id IF_ID ( // @[Top.scala 25:64]
    .clock(IF_ID_clock),
    .io_stall(IF_ID_io_stall),
    .io_reset(IF_ID_io_reset),
    .io_flush(IF_ID_io_flush),
    .io_pc_i(IF_ID_io_pc_i),
    .io_inst_i(IF_ID_io_inst_i),
    .io_pc_o(IF_ID_io_pc_o),
    .io_inst_o(IF_ID_io_inst_o)
  );
  Id ID ( // @[Top.scala 26:64]
    .io_pc(ID_io_pc),
    .io_inst_i(ID_io_inst_i),
    .io_rf2Id_RegData1(ID_io_rf2Id_RegData1),
    .io_rf2Id_RegData2(ID_io_rf2Id_RegData2),
    .io_prev_is_load(ID_io_prev_is_load),
    .io_load_dest(ID_io_load_dest),
    .io_exForwarding_addr(ID_io_exForwarding_addr),
    .io_exForwarding_data(ID_io_exForwarding_data),
    .io_memForwarding_addr(ID_io_memForwarding_addr),
    .io_memForwarding_data(ID_io_memForwarding_data),
    .io_wbForwarding_addr(ID_io_wbForwarding_addr),
    .io_wbForwarding_data(ID_io_wbForwarding_data),
    .io_stall_req(ID_io_stall_req),
    .io_id2Rf_ReadIdx1(ID_io_id2Rf_ReadIdx1),
    .io_id2Rf_ReadIdx2(ID_io_id2Rf_ReadIdx2),
    .io_decInfo_oprand1(ID_io_decInfo_oprand1),
    .io_decInfo_oprand2(ID_io_decInfo_oprand2),
    .io_decInfo_rd(ID_io_decInfo_rd),
    .io_decInfo_InstType(ID_io_decInfo_InstType),
    .io_decInfo_aluop(ID_io_decInfo_aluop),
    .io_decInfo_storeOp_en(ID_io_decInfo_storeOp_en),
    .io_decInfo_storeOp_data(ID_io_decInfo_storeOp_data),
    .io_decInfo_storeOp_Width(ID_io_decInfo_storeOp_Width),
    .io_decInfo_loadOp_isLoad(ID_io_decInfo_loadOp_isLoad),
    .io_decInfo_loadOp_Width(ID_io_decInfo_loadOp_Width),
    .io_decInfo_loadOp_dest(ID_io_decInfo_loadOp_dest),
    .io_branchOp_taken(ID_io_branchOp_taken),
    .io_branchOp_target(ID_io_branchOp_target),
    .io_flush_req(ID_io_flush_req)
  );
  Id_Ex ID_EX ( // @[Top.scala 27:64]
    .clock(ID_EX_clock),
    .io_stall(ID_EX_io_stall),
    .io_flush(ID_EX_io_flush),
    .io_reset(ID_EX_io_reset),
    .io_prev_is_load_i(ID_EX_io_prev_is_load_i),
    .io_decInfo_i_oprand1(ID_EX_io_decInfo_i_oprand1),
    .io_decInfo_i_oprand2(ID_EX_io_decInfo_i_oprand2),
    .io_decInfo_i_rd(ID_EX_io_decInfo_i_rd),
    .io_decInfo_i_InstType(ID_EX_io_decInfo_i_InstType),
    .io_decInfo_i_aluop(ID_EX_io_decInfo_i_aluop),
    .io_decInfo_i_storeOp_en(ID_EX_io_decInfo_i_storeOp_en),
    .io_decInfo_i_storeOp_data(ID_EX_io_decInfo_i_storeOp_data),
    .io_decInfo_i_storeOp_Width(ID_EX_io_decInfo_i_storeOp_Width),
    .io_decInfo_i_loadOp_isLoad(ID_EX_io_decInfo_i_loadOp_isLoad),
    .io_decInfo_i_loadOp_Width(ID_EX_io_decInfo_i_loadOp_Width),
    .io_decInfo_i_loadOp_dest(ID_EX_io_decInfo_i_loadOp_dest),
    .io_decInfo_o_oprand1(ID_EX_io_decInfo_o_oprand1),
    .io_decInfo_o_oprand2(ID_EX_io_decInfo_o_oprand2),
    .io_decInfo_o_rd(ID_EX_io_decInfo_o_rd),
    .io_decInfo_o_InstType(ID_EX_io_decInfo_o_InstType),
    .io_decInfo_o_aluop(ID_EX_io_decInfo_o_aluop),
    .io_decInfo_o_storeOp_en(ID_EX_io_decInfo_o_storeOp_en),
    .io_decInfo_o_storeOp_data(ID_EX_io_decInfo_o_storeOp_data),
    .io_decInfo_o_storeOp_Width(ID_EX_io_decInfo_o_storeOp_Width),
    .io_decInfo_o_loadOp_isLoad(ID_EX_io_decInfo_o_loadOp_isLoad),
    .io_decInfo_o_loadOp_Width(ID_EX_io_decInfo_o_loadOp_Width),
    .io_prev_is_load_o(ID_EX_io_prev_is_load_o),
    .io_load_dest_o(ID_EX_io_load_dest_o)
  );
  Ex EX ( // @[Top.scala 28:64]
    .io_decInfo_oprand1(EX_io_decInfo_oprand1),
    .io_decInfo_oprand2(EX_io_decInfo_oprand2),
    .io_decInfo_rd(EX_io_decInfo_rd),
    .io_decInfo_InstType(EX_io_decInfo_InstType),
    .io_decInfo_aluop(EX_io_decInfo_aluop),
    .io_decInfo_storeOp_en(EX_io_decInfo_storeOp_en),
    .io_decInfo_storeOp_data(EX_io_decInfo_storeOp_data),
    .io_decInfo_storeOp_Width(EX_io_decInfo_storeOp_Width),
    .io_decInfo_loadOp_isLoad(EX_io_decInfo_loadOp_isLoad),
    .io_decInfo_loadOp_Width(EX_io_decInfo_loadOp_Width),
    .io_exForwarding_addr(EX_io_exForwarding_addr),
    .io_exForwarding_data(EX_io_exForwarding_data),
    .io_writeRfOp_en(EX_io_writeRfOp_en),
    .io_writeRfOp_data(EX_io_writeRfOp_data),
    .io_writeRfOp_addr(EX_io_writeRfOp_addr),
    .io_loadOp_isLoad(EX_io_loadOp_isLoad),
    .io_loadOp_addr(EX_io_loadOp_addr),
    .io_loadOp_Width(EX_io_loadOp_Width),
    .io_storeOp_en(EX_io_storeOp_en),
    .io_storeOp_addr(EX_io_storeOp_addr),
    .io_storeOp_data(EX_io_storeOp_data),
    .io_storeOp_Width(EX_io_storeOp_Width)
  );
  Ex_Mem EX_MEM ( // @[Top.scala 29:64]
    .clock(EX_MEM_clock),
    .io_stall(EX_MEM_io_stall),
    .io_flush(EX_MEM_io_flush),
    .io_reset(EX_MEM_io_reset),
    .io_loadOp_i_isLoad(EX_MEM_io_loadOp_i_isLoad),
    .io_loadOp_i_addr(EX_MEM_io_loadOp_i_addr),
    .io_loadOp_i_Width(EX_MEM_io_loadOp_i_Width),
    .io_storeOp_i_en(EX_MEM_io_storeOp_i_en),
    .io_storeOp_i_addr(EX_MEM_io_storeOp_i_addr),
    .io_storeOp_i_data(EX_MEM_io_storeOp_i_data),
    .io_storeOp_i_Width(EX_MEM_io_storeOp_i_Width),
    .io_writeRfOp_i_en(EX_MEM_io_writeRfOp_i_en),
    .io_writeRfOp_i_data(EX_MEM_io_writeRfOp_i_data),
    .io_writeRfOp_i_addr(EX_MEM_io_writeRfOp_i_addr),
    .io_loadOp_o_isLoad(EX_MEM_io_loadOp_o_isLoad),
    .io_loadOp_o_addr(EX_MEM_io_loadOp_o_addr),
    .io_loadOp_o_Width(EX_MEM_io_loadOp_o_Width),
    .io_storeOp_o_en(EX_MEM_io_storeOp_o_en),
    .io_storeOp_o_addr(EX_MEM_io_storeOp_o_addr),
    .io_storeOp_o_data(EX_MEM_io_storeOp_o_data),
    .io_storeOp_o_Width(EX_MEM_io_storeOp_o_Width),
    .io_writeRfOp_o_en(EX_MEM_io_writeRfOp_o_en),
    .io_writeRfOp_o_data(EX_MEM_io_writeRfOp_o_data),
    .io_writeRfOp_o_addr(EX_MEM_io_writeRfOp_o_addr)
  );
  Memory MEM ( // @[Top.scala 30:64]
    .clock(MEM_clock),
    .io_writeRfOp_i_en(MEM_io_writeRfOp_i_en),
    .io_writeRfOp_i_data(MEM_io_writeRfOp_i_data),
    .io_writeRfOp_i_addr(MEM_io_writeRfOp_i_addr),
    .io_loadOp_isLoad(MEM_io_loadOp_isLoad),
    .io_loadOp_addr(MEM_io_loadOp_addr),
    .io_loadOp_Width(MEM_io_loadOp_Width),
    .io_storeOp_en(MEM_io_storeOp_en),
    .io_storeOp_addr(MEM_io_storeOp_addr),
    .io_storeOp_data(MEM_io_storeOp_data),
    .io_storeOp_Width(MEM_io_storeOp_Width),
    .io_memForwarding_addr(MEM_io_memForwarding_addr),
    .io_memForwarding_data(MEM_io_memForwarding_data),
    .io_writeRfOp_o_en(MEM_io_writeRfOp_o_en),
    .io_writeRfOp_o_data(MEM_io_writeRfOp_o_data),
    .io_writeRfOp_o_addr(MEM_io_writeRfOp_o_addr)
  );
  Mem_Wb MEM_WB ( // @[Top.scala 31:64]
    .clock(MEM_WB_clock),
    .io_stall(MEM_WB_io_stall),
    .io_flush(MEM_WB_io_flush),
    .io_reset(MEM_WB_io_reset),
    .io_writeRfOp_i_en(MEM_WB_io_writeRfOp_i_en),
    .io_writeRfOp_i_data(MEM_WB_io_writeRfOp_i_data),
    .io_writeRfOp_i_addr(MEM_WB_io_writeRfOp_i_addr),
    .io_writeRfOp_o_en(MEM_WB_io_writeRfOp_o_en),
    .io_writeRfOp_o_data(MEM_WB_io_writeRfOp_o_data),
    .io_writeRfOp_o_addr(MEM_WB_io_writeRfOp_o_addr)
  );
  Wb WB ( // @[Top.scala 32:64]
    .io_writeRfOp_i_en(WB_io_writeRfOp_i_en),
    .io_writeRfOp_i_data(WB_io_writeRfOp_i_data),
    .io_writeRfOp_i_addr(WB_io_writeRfOp_i_addr),
    .io_wbForwarding_addr(WB_io_wbForwarding_addr),
    .io_wbForwarding_data(WB_io_wbForwarding_data),
    .io_writeRfOp_o_en(WB_io_writeRfOp_o_en),
    .io_writeRfOp_o_data(WB_io_writeRfOp_o_data),
    .io_writeRfOp_o_addr(WB_io_writeRfOp_o_addr)
  );
  Ctrl CTRL ( // @[Top.scala 33:64]
    .io_id_stall_req(CTRL_io_id_stall_req),
    .io_id_flush_req(CTRL_io_id_flush_req),
    .io_stall(CTRL_io_stall),
    .io_flush(CTRL_io_flush)
  );
  assign io_o1 = WB_io_writeRfOp_o_data; // @[Top.scala 110:7]
  assign io_o2 = 32'h0; // @[Top.scala 111:7]
  assign io_o3 = 64'h0; // @[Top.scala 112:7]
  assign io_o4 = 64'h0; // @[Top.scala 113:7]
  assign IF_clock = io_clk;
  assign IF_reset = io_reset;
  assign IF_io_reset = io_reset; // @[Top.scala 38:25]
  assign IF_io_stall = CTRL_io_stall[0]; // @[Top.scala 45:41]
  assign IF_io_flush = CTRL_io_flush[0]; // @[Top.scala 52:41]
  assign IF_io_branchOp_taken = ID_io_branchOp_taken; // @[Top.scala 59:25]
  assign IF_io_branchOp_target = ID_io_branchOp_target; // @[Top.scala 59:25]
  assign REGFILE_clock = io_clk;
  assign REGFILE_reset = io_reset;
  assign REGFILE_io_id2Rf_ReadIdx1 = ID_io_id2Rf_ReadIdx1; // @[Top.scala 70:29]
  assign REGFILE_io_id2Rf_ReadIdx2 = ID_io_id2Rf_ReadIdx2; // @[Top.scala 70:29]
  assign REGFILE_io_writeRfOp_en = WB_io_writeRfOp_o_en; // @[Top.scala 92:29]
  assign REGFILE_io_writeRfOp_data = WB_io_writeRfOp_o_data; // @[Top.scala 92:29]
  assign REGFILE_io_writeRfOp_addr = WB_io_writeRfOp_o_addr; // @[Top.scala 92:29]
  assign IF_ID_clock = io_clk;
  assign IF_ID_io_stall = CTRL_io_stall[1]; // @[Top.scala 46:41]
  assign IF_ID_io_reset = io_reset; // @[Top.scala 39:25]
  assign IF_ID_io_flush = CTRL_io_flush[1]; // @[Top.scala 53:41]
  assign IF_ID_io_pc_i = IF_io_pc_o; // @[Top.scala 67:25]
  assign IF_ID_io_inst_i = IF_io_inst_o; // @[Top.scala 64:25]
  assign ID_io_pc = IF_ID_io_pc_o; // @[Top.scala 68:25]
  assign ID_io_inst_i = IF_ID_io_inst_o; // @[Top.scala 66:25]
  assign ID_io_rf2Id_RegData1 = REGFILE_io_rf2Id_RegData1; // @[Top.scala 71:29]
  assign ID_io_rf2Id_RegData2 = REGFILE_io_rf2Id_RegData2; // @[Top.scala 71:29]
  assign ID_io_prev_is_load = ID_EX_io_prev_is_load_o; // @[Top.scala 76:29]
  assign ID_io_load_dest = ID_EX_io_load_dest_o; // @[Top.scala 75:29]
  assign ID_io_exForwarding_addr = EX_io_exForwarding_addr; // @[Top.scala 98:29]
  assign ID_io_exForwarding_data = EX_io_exForwarding_data; // @[Top.scala 98:29]
  assign ID_io_memForwarding_addr = MEM_io_memForwarding_addr; // @[Top.scala 97:29]
  assign ID_io_memForwarding_data = MEM_io_memForwarding_data; // @[Top.scala 97:29]
  assign ID_io_wbForwarding_addr = WB_io_wbForwarding_addr; // @[Top.scala 96:29]
  assign ID_io_wbForwarding_data = WB_io_wbForwarding_data; // @[Top.scala 96:29]
  assign ID_EX_clock = io_clk;
  assign ID_EX_io_stall = CTRL_io_stall[2]; // @[Top.scala 47:41]
  assign ID_EX_io_flush = CTRL_io_flush[2]; // @[Top.scala 54:41]
  assign ID_EX_io_reset = io_reset; // @[Top.scala 40:25]
  assign ID_EX_io_prev_is_load_i = ID_io_decInfo_loadOp_isLoad; // @[Top.scala 74:29]
  assign ID_EX_io_decInfo_i_oprand1 = ID_io_decInfo_oprand1; // @[Top.scala 73:29]
  assign ID_EX_io_decInfo_i_oprand2 = ID_io_decInfo_oprand2; // @[Top.scala 73:29]
  assign ID_EX_io_decInfo_i_rd = ID_io_decInfo_rd; // @[Top.scala 73:29]
  assign ID_EX_io_decInfo_i_InstType = ID_io_decInfo_InstType; // @[Top.scala 73:29]
  assign ID_EX_io_decInfo_i_aluop = ID_io_decInfo_aluop; // @[Top.scala 73:29]
  assign ID_EX_io_decInfo_i_storeOp_en = ID_io_decInfo_storeOp_en; // @[Top.scala 73:29]
  assign ID_EX_io_decInfo_i_storeOp_data = ID_io_decInfo_storeOp_data; // @[Top.scala 73:29]
  assign ID_EX_io_decInfo_i_storeOp_Width = ID_io_decInfo_storeOp_Width; // @[Top.scala 73:29]
  assign ID_EX_io_decInfo_i_loadOp_isLoad = ID_io_decInfo_loadOp_isLoad; // @[Top.scala 73:29]
  assign ID_EX_io_decInfo_i_loadOp_Width = ID_io_decInfo_loadOp_Width; // @[Top.scala 73:29]
  assign ID_EX_io_decInfo_i_loadOp_dest = ID_io_decInfo_loadOp_dest; // @[Top.scala 73:29]
  assign EX_io_decInfo_oprand1 = ID_EX_io_decInfo_o_oprand1; // @[Top.scala 78:29]
  assign EX_io_decInfo_oprand2 = ID_EX_io_decInfo_o_oprand2; // @[Top.scala 78:29]
  assign EX_io_decInfo_rd = ID_EX_io_decInfo_o_rd; // @[Top.scala 78:29]
  assign EX_io_decInfo_InstType = ID_EX_io_decInfo_o_InstType; // @[Top.scala 78:29]
  assign EX_io_decInfo_aluop = ID_EX_io_decInfo_o_aluop; // @[Top.scala 78:29]
  assign EX_io_decInfo_storeOp_en = ID_EX_io_decInfo_o_storeOp_en; // @[Top.scala 78:29]
  assign EX_io_decInfo_storeOp_data = ID_EX_io_decInfo_o_storeOp_data; // @[Top.scala 78:29]
  assign EX_io_decInfo_storeOp_Width = ID_EX_io_decInfo_o_storeOp_Width; // @[Top.scala 78:29]
  assign EX_io_decInfo_loadOp_isLoad = ID_EX_io_decInfo_o_loadOp_isLoad; // @[Top.scala 78:29]
  assign EX_io_decInfo_loadOp_Width = ID_EX_io_decInfo_o_loadOp_Width; // @[Top.scala 78:29]
  assign EX_MEM_clock = io_clk;
  assign EX_MEM_io_stall = CTRL_io_stall[3]; // @[Top.scala 48:41]
  assign EX_MEM_io_flush = CTRL_io_flush[3]; // @[Top.scala 55:41]
  assign EX_MEM_io_reset = io_reset; // @[Top.scala 41:25]
  assign EX_MEM_io_loadOp_i_isLoad = EX_io_loadOp_isLoad; // @[Top.scala 79:29]
  assign EX_MEM_io_loadOp_i_addr = EX_io_loadOp_addr; // @[Top.scala 79:29]
  assign EX_MEM_io_loadOp_i_Width = EX_io_loadOp_Width; // @[Top.scala 79:29]
  assign EX_MEM_io_storeOp_i_en = EX_io_storeOp_en; // @[Top.scala 80:29]
  assign EX_MEM_io_storeOp_i_addr = EX_io_storeOp_addr; // @[Top.scala 80:29]
  assign EX_MEM_io_storeOp_i_data = EX_io_storeOp_data; // @[Top.scala 80:29]
  assign EX_MEM_io_storeOp_i_Width = EX_io_storeOp_Width; // @[Top.scala 80:29]
  assign EX_MEM_io_writeRfOp_i_en = EX_io_writeRfOp_en; // @[Top.scala 82:29]
  assign EX_MEM_io_writeRfOp_i_data = EX_io_writeRfOp_data; // @[Top.scala 82:29]
  assign EX_MEM_io_writeRfOp_i_addr = EX_io_writeRfOp_addr; // @[Top.scala 82:29]
  assign MEM_clock = io_clk;
  assign MEM_io_writeRfOp_i_en = EX_MEM_io_writeRfOp_o_en; // @[Top.scala 86:29]
  assign MEM_io_writeRfOp_i_data = EX_MEM_io_writeRfOp_o_data; // @[Top.scala 86:29]
  assign MEM_io_writeRfOp_i_addr = EX_MEM_io_writeRfOp_o_addr; // @[Top.scala 86:29]
  assign MEM_io_loadOp_isLoad = EX_MEM_io_loadOp_o_isLoad; // @[Top.scala 83:29]
  assign MEM_io_loadOp_addr = EX_MEM_io_loadOp_o_addr; // @[Top.scala 83:29]
  assign MEM_io_loadOp_Width = EX_MEM_io_loadOp_o_Width; // @[Top.scala 83:29]
  assign MEM_io_storeOp_en = EX_MEM_io_storeOp_o_en; // @[Top.scala 84:29]
  assign MEM_io_storeOp_addr = EX_MEM_io_storeOp_o_addr; // @[Top.scala 84:29]
  assign MEM_io_storeOp_data = EX_MEM_io_storeOp_o_data; // @[Top.scala 84:29]
  assign MEM_io_storeOp_Width = EX_MEM_io_storeOp_o_Width; // @[Top.scala 84:29]
  assign MEM_WB_clock = io_clk;
  assign MEM_WB_io_stall = CTRL_io_stall[4]; // @[Top.scala 49:41]
  assign MEM_WB_io_flush = CTRL_io_flush[4]; // @[Top.scala 56:41]
  assign MEM_WB_io_reset = io_reset; // @[Top.scala 42:25]
  assign MEM_WB_io_writeRfOp_i_en = MEM_io_writeRfOp_o_en; // @[Top.scala 88:29]
  assign MEM_WB_io_writeRfOp_i_data = MEM_io_writeRfOp_o_data; // @[Top.scala 88:29]
  assign MEM_WB_io_writeRfOp_i_addr = MEM_io_writeRfOp_o_addr; // @[Top.scala 88:29]
  assign WB_io_writeRfOp_i_en = MEM_WB_io_writeRfOp_o_en; // @[Top.scala 90:29]
  assign WB_io_writeRfOp_i_data = MEM_WB_io_writeRfOp_o_data; // @[Top.scala 90:29]
  assign WB_io_writeRfOp_i_addr = MEM_WB_io_writeRfOp_o_addr; // @[Top.scala 90:29]
  assign CTRL_io_id_stall_req = ID_io_stall_req; // @[Top.scala 100:29]
  assign CTRL_io_id_flush_req = ID_io_flush_req; // @[Top.scala 101:29]
endmodule