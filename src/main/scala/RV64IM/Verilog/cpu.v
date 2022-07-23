module If(
  input         clock,
  input         reset,
  input  [31:0] io_inst_i,
  output [63:0] io_pc_o,
  output [31:0] io_inst_o
);
`ifdef RANDOMIZE_REG_INIT
  reg [63:0] _RAND_0;
`endif // RANDOMIZE_REG_INIT
  reg [63:0] pc; // @[If.scala 15:21]
  wire [63:0] _pc_T_1 = pc + 64'h4; // @[If.scala 17:17]
  assign io_pc_o = pc; // @[If.scala 19:19 20:21 24:21]
  assign io_inst_o = io_inst_i; // @[If.scala 19:19 21:21 25:21]
  always @(posedge clock) begin
    if (reset) begin // @[If.scala 15:21]
      pc <= 64'h0; // @[If.scala 15:21]
    end else begin
      pc <= _pc_T_1; // @[If.scala 17:11]
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
  pc = _RAND_0[63:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module Inst_Rom(
  input         clock,
  input  [63:0] io_addr_i,
  output [31:0] io_inst_o
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
`endif // RANDOMIZE_REG_INIT
  reg [31:0] mem [0:8191]; // @[Inst_Rom.scala 16:27]
  wire  mem_io_inst_o_MPORT_en; // @[Inst_Rom.scala 16:27]
  wire [12:0] mem_io_inst_o_MPORT_addr; // @[Inst_Rom.scala 16:27]
  wire [31:0] mem_io_inst_o_MPORT_data; // @[Inst_Rom.scala 16:27]
  reg  mem_io_inst_o_MPORT_en_pipe_0;
  reg [12:0] mem_io_inst_o_MPORT_addr_pipe_0;
  assign mem_io_inst_o_MPORT_en = mem_io_inst_o_MPORT_en_pipe_0;
  assign mem_io_inst_o_MPORT_addr = mem_io_inst_o_MPORT_addr_pipe_0;
  assign mem_io_inst_o_MPORT_data = mem[mem_io_inst_o_MPORT_addr]; // @[Inst_Rom.scala 16:27]
  assign io_inst_o = mem_io_inst_o_MPORT_data; // @[Inst_Rom.scala 18:21]
  always @(posedge clock) begin
    mem_io_inst_o_MPORT_en_pipe_0 <= 1'h1;
    if (1'h1) begin
      mem_io_inst_o_MPORT_addr_pipe_0 <= io_addr_i[14:2];
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
  mem_io_inst_o_MPORT_en_pipe_0 = _RAND_0[0:0];
  _RAND_1 = {1{`RANDOM}};
  mem_io_inst_o_MPORT_addr_pipe_0 = _RAND_1[12:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
  $readmemh("Inst_Rom.data", mem);
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module Regfile(
  input         clock,
  input         io_wen,
  input  [4:0]  io_write_idx_i,
  input  [63:0] io_write_data_i,
  input  [4:0]  io_read_idx1_i,
  input  [4:0]  io_read_idx2_i,
  output [63:0] io_data1_o,
  output [63:0] io_data2_o
);
`ifdef RANDOMIZE_MEM_INIT
  reg [63:0] _RAND_0;
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  reg [63:0] _RAND_1;
`endif // RANDOMIZE_REG_INIT
  reg [63:0] rf [0:31]; // @[Regfile.scala 17:17]
  wire  rf_io_data1_o_MPORT_en; // @[Regfile.scala 17:17]
  wire [4:0] rf_io_data1_o_MPORT_addr; // @[Regfile.scala 17:17]
  wire [63:0] rf_io_data1_o_MPORT_data; // @[Regfile.scala 17:17]
  wire  rf_io_data2_o_MPORT_en; // @[Regfile.scala 17:17]
  wire [4:0] rf_io_data2_o_MPORT_addr; // @[Regfile.scala 17:17]
  wire [63:0] rf_io_data2_o_MPORT_data; // @[Regfile.scala 17:17]
  wire [63:0] rf_MPORT_data; // @[Regfile.scala 17:17]
  wire [4:0] rf_MPORT_addr; // @[Regfile.scala 17:17]
  wire  rf_MPORT_mask; // @[Regfile.scala 17:17]
  wire  rf_MPORT_en; // @[Regfile.scala 17:17]
  wire [63:0] rf_MPORT_1_data; // @[Regfile.scala 17:17]
  wire [4:0] rf_MPORT_1_addr; // @[Regfile.scala 17:17]
  wire  rf_MPORT_1_mask; // @[Regfile.scala 17:17]
  wire  rf_MPORT_1_en; // @[Regfile.scala 17:17]
  wire [63:0] rf_MPORT_2_data; // @[Regfile.scala 17:17]
  wire [4:0] rf_MPORT_2_addr; // @[Regfile.scala 17:17]
  wire  rf_MPORT_2_mask; // @[Regfile.scala 17:17]
  wire  rf_MPORT_2_en; // @[Regfile.scala 17:17]
  reg [63:0] latch; // @[Regfile.scala 18:24]
  assign rf_io_data1_o_MPORT_en = 1'h1;
  assign rf_io_data1_o_MPORT_addr = io_read_idx1_i;
  assign rf_io_data1_o_MPORT_data = rf[rf_io_data1_o_MPORT_addr]; // @[Regfile.scala 17:17]
  assign rf_io_data2_o_MPORT_en = 1'h1;
  assign rf_io_data2_o_MPORT_addr = io_read_idx2_i;
  assign rf_io_data2_o_MPORT_data = rf[rf_io_data2_o_MPORT_addr]; // @[Regfile.scala 17:17]
  assign rf_MPORT_data = 64'h0;
  assign rf_MPORT_addr = 5'h0;
  assign rf_MPORT_mask = 1'h1;
  assign rf_MPORT_en = 1'h1;
  assign rf_MPORT_1_data = 64'h1bf52;
  assign rf_MPORT_1_addr = 5'h1;
  assign rf_MPORT_1_mask = 1'h1;
  assign rf_MPORT_1_en = 1'h1;
  assign rf_MPORT_2_data = latch;
  assign rf_MPORT_2_addr = io_write_idx_i;
  assign rf_MPORT_2_mask = 1'h1;
  assign rf_MPORT_2_en = io_wen;
  assign io_data1_o = rf_io_data1_o_MPORT_data; // @[Regfile.scala 34:16]
  assign io_data2_o = rf_io_data2_o_MPORT_data; // @[Regfile.scala 35:16]
  always @(posedge clock) begin
    if (rf_MPORT_en & rf_MPORT_mask) begin
      rf[rf_MPORT_addr] <= rf_MPORT_data; // @[Regfile.scala 17:17]
    end
    if (rf_MPORT_1_en & rf_MPORT_1_mask) begin
      rf[rf_MPORT_1_addr] <= rf_MPORT_1_data; // @[Regfile.scala 17:17]
    end
    if (rf_MPORT_2_en & rf_MPORT_2_mask) begin
      rf[rf_MPORT_2_addr] <= rf_MPORT_2_data; // @[Regfile.scala 17:17]
    end
    latch <= io_write_data_i; // @[Regfile.scala 18:24]
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
  _RAND_0 = {2{`RANDOM}};
  for (initvar = 0; initvar < 32; initvar = initvar+1)
    rf[initvar] = _RAND_0[63:0];
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {2{`RANDOM}};
  latch = _RAND_1[63:0];
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
  input  [63:0] io_if_inst_i,
  output [63:0] io_if_inst_o
);
`ifdef RANDOMIZE_REG_INIT
  reg [63:0] _RAND_0;
`endif // RANDOMIZE_REG_INIT
  reg [63:0] inst; // @[If_Id.scala 13:23]
  assign io_if_inst_o = inst; // @[If_Id.scala 15:19 16:22 18:22]
  always @(posedge clock) begin
    inst <= io_if_inst_i; // @[If_Id.scala 13:23]
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
  inst = _RAND_0[63:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module Id(
  input  [31:0] io_id_inst_i,
  input  [63:0] io_id_RegData1_i,
  input  [63:0] io_id_RegData2_i,
  output [63:0] io_id_oprand1_o,
  output [63:0] io_id_oprand2_o,
  output [4:0]  io_id_ReadIdx1_o,
  output [4:0]  io_id_ReadIdx2_o,
  output        io_id_wreg_o,
  output [6:0]  io_id_opcode_o,
  output [3:0]  io_id_aluop_o
);
  wire [6:0] opcode = io_id_inst_i[6:0]; // @[Id.scala 34:31]
  wire [2:0] funct3 = io_id_inst_i[14:12]; // @[Id.scala 35:31]
  wire [6:0] funct7 = io_id_inst_i[31:25]; // @[Id.scala 36:31]
  wire  _T_2 = 3'h0 == funct3; // @[Id.scala 47:35]
  wire [63:0] _GEN_0 = 3'h0 == funct3 ? io_id_RegData1_i : 64'h0; // @[Id.scala 37:16 47:35 49:37]
  wire [63:0] _GEN_1 = 3'h0 == funct3 ? io_id_RegData2_i : 64'h0; // @[Id.scala 38:16 47:35 50:37]
  wire [63:0] _GEN_3 = 7'h0 == funct7 ? _GEN_0 : 64'h0; // @[Id.scala 37:16 45:27]
  wire [63:0] _GEN_4 = 7'h0 == funct7 ? _GEN_1 : 64'h0; // @[Id.scala 38:16 45:27]
  wire  _GEN_5 = 7'h0 == funct7 & _T_2; // @[Id.scala 39:16 45:27]
  wire  wreg = 7'h33 == opcode & _GEN_5; // @[Id.scala 39:16 43:19]
  assign io_id_oprand1_o = 7'h33 == opcode ? _GEN_3 : 64'h0; // @[Id.scala 37:16 43:19]
  assign io_id_oprand2_o = 7'h33 == opcode ? _GEN_4 : 64'h0; // @[Id.scala 38:16 43:19]
  assign io_id_ReadIdx1_o = io_id_inst_i[19:15]; // @[Id.scala 74:42]
  assign io_id_ReadIdx2_o = io_id_inst_i[24:20]; // @[Id.scala 73:42]
  assign io_id_wreg_o = 7'h33 == opcode & _GEN_5; // @[Id.scala 39:16 43:19]
  assign io_id_opcode_o = io_id_inst_i[6:0]; // @[Id.scala 34:31]
  assign io_id_aluop_o = {{3'd0}, wreg}; // @[Id.scala 29:23]
endmodule
module Id_Ex(
  input         clock,
  input  [6:0]  io_id_opcode_i,
  input  [63:0] io_id_oprand1_i,
  input  [63:0] io_id_oprand2_i,
  input  [4:0]  io_id_rd_i,
  input  [3:0]  io_id_aluop_i,
  output [6:0]  io_ex_opcode_o,
  output [63:0] io_ex_oprand1_o,
  output [63:0] io_ex_oprand2_o,
  output [4:0]  io_ex_rd_o,
  output [3:0]  io_ex_aluop_o
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [63:0] _RAND_1;
  reg [63:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
`endif // RANDOMIZE_REG_INIT
  reg [6:0] opcode; // @[Id_Ex.scala 25:26]
  reg [63:0] oprand1; // @[Id_Ex.scala 26:26]
  reg [63:0] oprand2; // @[Id_Ex.scala 27:26]
  reg [4:0] rd; // @[Id_Ex.scala 28:26]
  reg [3:0] aluop; // @[Id_Ex.scala 30:26]
  assign io_ex_opcode_o = opcode; // @[Id_Ex.scala 32:19 33:27 41:27]
  assign io_ex_oprand1_o = oprand1; // @[Id_Ex.scala 32:19 34:27 42:27]
  assign io_ex_oprand2_o = oprand2; // @[Id_Ex.scala 32:19 35:27 43:27]
  assign io_ex_rd_o = rd; // @[Id_Ex.scala 32:19 36:27 44:27]
  assign io_ex_aluop_o = aluop; // @[Id_Ex.scala 32:19 38:27 46:27]
  always @(posedge clock) begin
    opcode <= io_id_opcode_i; // @[Id_Ex.scala 25:26]
    oprand1 <= io_id_oprand1_i; // @[Id_Ex.scala 26:26]
    oprand2 <= io_id_oprand2_i; // @[Id_Ex.scala 27:26]
    rd <= io_id_rd_i; // @[Id_Ex.scala 28:26]
    aluop <= io_id_aluop_i; // @[Id_Ex.scala 30:26]
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
  opcode = _RAND_0[6:0];
  _RAND_1 = {2{`RANDOM}};
  oprand1 = _RAND_1[63:0];
  _RAND_2 = {2{`RANDOM}};
  oprand2 = _RAND_2[63:0];
  _RAND_3 = {1{`RANDOM}};
  rd = _RAND_3[4:0];
  _RAND_4 = {1{`RANDOM}};
  aluop = _RAND_4[3:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module Ex(
  input  [6:0]  io_ex_opcode_i,
  input  [3:0]  io_ex_aluop_i,
  input  [63:0] io_ex_oprand1_i,
  input  [63:0] io_ex_oprand2_i,
  input  [4:0]  io_ex_rd_i,
  output [4:0]  io_ex_rd_o,
  output [63:0] io_ex_wdata_o,
  output        io_ex_wreg_o
);
  wire [63:0] _alu_result_T_1 = io_ex_oprand1_i + io_ex_oprand2_i; // @[Ex.scala 30:44]
  wire [63:0] _GEN_0 = 4'h1 == io_ex_aluop_i ? _alu_result_T_1 : 64'h0; // @[Ex.scala 22:20 25:26 30:25]
  wire [63:0] alu_result = 4'h0 == io_ex_aluop_i ? 64'h0 : _GEN_0; // @[Ex.scala 25:26 27:25]
  assign io_ex_rd_o = 7'h33 == io_ex_opcode_i ? io_ex_rd_i : 5'h0; // @[Ex.scala 42:25 46:31 50:31]
  assign io_ex_wdata_o = 7'h33 == io_ex_opcode_i ? alu_result : 64'h0; // @[Ex.scala 43:25 46:31 48:31]
  assign io_ex_wreg_o = 7'h33 == io_ex_opcode_i; // @[Ex.scala 46:31]
endmodule
module Ex_Mem(
  input         clock,
  input  [63:0] io_ex_wdata_i,
  input         io_ex_wreg_i,
  input  [4:0]  io_ex_rd_i,
  output [63:0] io_mem_wdata_o,
  output        io_mem_wreg_o,
  output [4:0]  io_mem_rd_o
);
`ifdef RANDOMIZE_REG_INIT
  reg [63:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
`endif // RANDOMIZE_REG_INIT
  reg [63:0] wdata; // @[Ex_Mem.scala 18:24]
  reg  wreg; // @[Ex_Mem.scala 19:24]
  reg [4:0] rd; // @[Ex_Mem.scala 20:24]
  assign io_mem_wdata_o = wdata; // @[Ex_Mem.scala 22:19 23:25 27:25]
  assign io_mem_wreg_o = wreg; // @[Ex_Mem.scala 22:19 24:25 28:25]
  assign io_mem_rd_o = rd; // @[Ex_Mem.scala 22:19 25:25 29:25]
  always @(posedge clock) begin
    wdata <= io_ex_wdata_i; // @[Ex_Mem.scala 18:24]
    wreg <= io_ex_wreg_i; // @[Ex_Mem.scala 19:24]
    rd <= io_ex_rd_i; // @[Ex_Mem.scala 20:24]
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
  wdata = _RAND_0[63:0];
  _RAND_1 = {1{`RANDOM}};
  wreg = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  rd = _RAND_2[4:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module Memory(
  input  [63:0] io_mem_wdata_i,
  input         io_mem_wreg_i,
  input  [4:0]  io_mem_rd_i,
  output [63:0] io_mem_wdata_o,
  output        io_mem_wreg_o,
  output [4:0]  io_mem_rd_o
);
  assign io_mem_wdata_o = io_mem_wdata_i; // @[Memory.scala 17:19 18:25 22:25]
  assign io_mem_wreg_o = io_mem_wreg_i; // @[Memory.scala 17:19 19:25 23:25]
  assign io_mem_rd_o = io_mem_rd_i; // @[Memory.scala 17:19 20:25 24:25]
endmodule
module Mem_Wb(
  input         clock,
  input  [4:0]  io_mem_rd_i,
  input  [63:0] io_mem_wdata_i,
  input         io_mem_wreg_i,
  output [4:0]  io_wb_rd_o,
  output [63:0] io_wb_wdata_o,
  output        io_wb_wreg_o
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [63:0] _RAND_1;
  reg [31:0] _RAND_2;
`endif // RANDOMIZE_REG_INIT
  reg [4:0] rd; // @[Mem_Wb.scala 17:26]
  reg [63:0] wdata; // @[Mem_Wb.scala 18:26]
  reg  wreg; // @[Mem_Wb.scala 19:26]
  assign io_wb_rd_o = rd; // @[Mem_Wb.scala 21:19 22:25 26:25]
  assign io_wb_wdata_o = wdata; // @[Mem_Wb.scala 21:19 23:25 27:25]
  assign io_wb_wreg_o = wreg; // @[Mem_Wb.scala 21:19 24:25 28:25]
  always @(posedge clock) begin
    rd <= io_mem_rd_i; // @[Mem_Wb.scala 17:26]
    wdata <= io_mem_wdata_i; // @[Mem_Wb.scala 18:26]
    wreg <= io_mem_wreg_i; // @[Mem_Wb.scala 19:26]
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
  rd = _RAND_0[4:0];
  _RAND_1 = {2{`RANDOM}};
  wdata = _RAND_1[63:0];
  _RAND_2 = {1{`RANDOM}};
  wreg = _RAND_2[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module Wb(
  input  [4:0]  io_wb_rd_i,
  input  [63:0] io_wb_wdata_i,
  input         io_wb_wreg_i,
  output [4:0]  io_wb_rd_o,
  output [63:0] io_wb_wdata_o,
  output        io_wb_wreg_o
);
  assign io_wb_rd_o = io_wb_rd_i; // @[Wb.scala 17:19 18:25 22:25]
  assign io_wb_wdata_o = io_wb_wdata_i; // @[Wb.scala 17:19 19:25 23:25]
  assign io_wb_wreg_o = io_wb_wreg_i; // @[Wb.scala 17:19 20:25 24:25]
endmodule
module Top(
  input         clock,
  input         reset,
  output [63:0] io_o1,
  output [31:0] io_o2,
  output [63:0] io_o3,
  output [63:0] io_o4
);
  wire  IF_clock; // @[Top.scala 19:29]
  wire  IF_reset; // @[Top.scala 19:29]
  wire [31:0] IF_io_inst_i; // @[Top.scala 19:29]
  wire [63:0] IF_io_pc_o; // @[Top.scala 19:29]
  wire [31:0] IF_io_inst_o; // @[Top.scala 19:29]
  wire  INST_ROM_clock; // @[Top.scala 20:29]
  wire [63:0] INST_ROM_io_addr_i; // @[Top.scala 20:29]
  wire [31:0] INST_ROM_io_inst_o; // @[Top.scala 20:29]
  wire  REGFILE_clock; // @[Top.scala 21:29]
  wire  REGFILE_io_wen; // @[Top.scala 21:29]
  wire [4:0] REGFILE_io_write_idx_i; // @[Top.scala 21:29]
  wire [63:0] REGFILE_io_write_data_i; // @[Top.scala 21:29]
  wire [4:0] REGFILE_io_read_idx1_i; // @[Top.scala 21:29]
  wire [4:0] REGFILE_io_read_idx2_i; // @[Top.scala 21:29]
  wire [63:0] REGFILE_io_data1_o; // @[Top.scala 21:29]
  wire [63:0] REGFILE_io_data2_o; // @[Top.scala 21:29]
  wire  IF_ID_clock; // @[Top.scala 22:29]
  wire [63:0] IF_ID_io_if_inst_i; // @[Top.scala 22:29]
  wire [63:0] IF_ID_io_if_inst_o; // @[Top.scala 22:29]
  wire [31:0] ID_io_id_inst_i; // @[Top.scala 23:29]
  wire [63:0] ID_io_id_RegData1_i; // @[Top.scala 23:29]
  wire [63:0] ID_io_id_RegData2_i; // @[Top.scala 23:29]
  wire [63:0] ID_io_id_oprand1_o; // @[Top.scala 23:29]
  wire [63:0] ID_io_id_oprand2_o; // @[Top.scala 23:29]
  wire [4:0] ID_io_id_ReadIdx1_o; // @[Top.scala 23:29]
  wire [4:0] ID_io_id_ReadIdx2_o; // @[Top.scala 23:29]
  wire  ID_io_id_wreg_o; // @[Top.scala 23:29]
  wire [6:0] ID_io_id_opcode_o; // @[Top.scala 23:29]
  wire [3:0] ID_io_id_aluop_o; // @[Top.scala 23:29]
  wire  ID_EX_clock; // @[Top.scala 24:29]
  wire [6:0] ID_EX_io_id_opcode_i; // @[Top.scala 24:29]
  wire [63:0] ID_EX_io_id_oprand1_i; // @[Top.scala 24:29]
  wire [63:0] ID_EX_io_id_oprand2_i; // @[Top.scala 24:29]
  wire [4:0] ID_EX_io_id_rd_i; // @[Top.scala 24:29]
  wire [3:0] ID_EX_io_id_aluop_i; // @[Top.scala 24:29]
  wire [6:0] ID_EX_io_ex_opcode_o; // @[Top.scala 24:29]
  wire [63:0] ID_EX_io_ex_oprand1_o; // @[Top.scala 24:29]
  wire [63:0] ID_EX_io_ex_oprand2_o; // @[Top.scala 24:29]
  wire [4:0] ID_EX_io_ex_rd_o; // @[Top.scala 24:29]
  wire [3:0] ID_EX_io_ex_aluop_o; // @[Top.scala 24:29]
  wire [6:0] EX_io_ex_opcode_i; // @[Top.scala 25:29]
  wire [3:0] EX_io_ex_aluop_i; // @[Top.scala 25:29]
  wire [63:0] EX_io_ex_oprand1_i; // @[Top.scala 25:29]
  wire [63:0] EX_io_ex_oprand2_i; // @[Top.scala 25:29]
  wire [4:0] EX_io_ex_rd_i; // @[Top.scala 25:29]
  wire [4:0] EX_io_ex_rd_o; // @[Top.scala 25:29]
  wire [63:0] EX_io_ex_wdata_o; // @[Top.scala 25:29]
  wire  EX_io_ex_wreg_o; // @[Top.scala 25:29]
  wire  EX_MEM_clock; // @[Top.scala 26:29]
  wire [63:0] EX_MEM_io_ex_wdata_i; // @[Top.scala 26:29]
  wire  EX_MEM_io_ex_wreg_i; // @[Top.scala 26:29]
  wire [4:0] EX_MEM_io_ex_rd_i; // @[Top.scala 26:29]
  wire [63:0] EX_MEM_io_mem_wdata_o; // @[Top.scala 26:29]
  wire  EX_MEM_io_mem_wreg_o; // @[Top.scala 26:29]
  wire [4:0] EX_MEM_io_mem_rd_o; // @[Top.scala 26:29]
  wire [63:0] MEM_io_mem_wdata_i; // @[Top.scala 27:29]
  wire  MEM_io_mem_wreg_i; // @[Top.scala 27:29]
  wire [4:0] MEM_io_mem_rd_i; // @[Top.scala 27:29]
  wire [63:0] MEM_io_mem_wdata_o; // @[Top.scala 27:29]
  wire  MEM_io_mem_wreg_o; // @[Top.scala 27:29]
  wire [4:0] MEM_io_mem_rd_o; // @[Top.scala 27:29]
  wire  MEM_WB_clock; // @[Top.scala 28:29]
  wire [4:0] MEM_WB_io_mem_rd_i; // @[Top.scala 28:29]
  wire [63:0] MEM_WB_io_mem_wdata_i; // @[Top.scala 28:29]
  wire  MEM_WB_io_mem_wreg_i; // @[Top.scala 28:29]
  wire [4:0] MEM_WB_io_wb_rd_o; // @[Top.scala 28:29]
  wire [63:0] MEM_WB_io_wb_wdata_o; // @[Top.scala 28:29]
  wire  MEM_WB_io_wb_wreg_o; // @[Top.scala 28:29]
  wire [4:0] WB_io_wb_rd_i; // @[Top.scala 29:29]
  wire [63:0] WB_io_wb_wdata_i; // @[Top.scala 29:29]
  wire  WB_io_wb_wreg_i; // @[Top.scala 29:29]
  wire [4:0] WB_io_wb_rd_o; // @[Top.scala 29:29]
  wire [63:0] WB_io_wb_wdata_o; // @[Top.scala 29:29]
  wire  WB_io_wb_wreg_o; // @[Top.scala 29:29]
  If IF ( // @[Top.scala 19:29]
    .clock(IF_clock),
    .reset(IF_reset),
    .io_inst_i(IF_io_inst_i),
    .io_pc_o(IF_io_pc_o),
    .io_inst_o(IF_io_inst_o)
  );
  Inst_Rom INST_ROM ( // @[Top.scala 20:29]
    .clock(INST_ROM_clock),
    .io_addr_i(INST_ROM_io_addr_i),
    .io_inst_o(INST_ROM_io_inst_o)
  );
  Regfile REGFILE ( // @[Top.scala 21:29]
    .clock(REGFILE_clock),
    .io_wen(REGFILE_io_wen),
    .io_write_idx_i(REGFILE_io_write_idx_i),
    .io_write_data_i(REGFILE_io_write_data_i),
    .io_read_idx1_i(REGFILE_io_read_idx1_i),
    .io_read_idx2_i(REGFILE_io_read_idx2_i),
    .io_data1_o(REGFILE_io_data1_o),
    .io_data2_o(REGFILE_io_data2_o)
  );
  If_Id IF_ID ( // @[Top.scala 22:29]
    .clock(IF_ID_clock),
    .io_if_inst_i(IF_ID_io_if_inst_i),
    .io_if_inst_o(IF_ID_io_if_inst_o)
  );
  Id ID ( // @[Top.scala 23:29]
    .io_id_inst_i(ID_io_id_inst_i),
    .io_id_RegData1_i(ID_io_id_RegData1_i),
    .io_id_RegData2_i(ID_io_id_RegData2_i),
    .io_id_oprand1_o(ID_io_id_oprand1_o),
    .io_id_oprand2_o(ID_io_id_oprand2_o),
    .io_id_ReadIdx1_o(ID_io_id_ReadIdx1_o),
    .io_id_ReadIdx2_o(ID_io_id_ReadIdx2_o),
    .io_id_wreg_o(ID_io_id_wreg_o),
    .io_id_opcode_o(ID_io_id_opcode_o),
    .io_id_aluop_o(ID_io_id_aluop_o)
  );
  Id_Ex ID_EX ( // @[Top.scala 24:29]
    .clock(ID_EX_clock),
    .io_id_opcode_i(ID_EX_io_id_opcode_i),
    .io_id_oprand1_i(ID_EX_io_id_oprand1_i),
    .io_id_oprand2_i(ID_EX_io_id_oprand2_i),
    .io_id_rd_i(ID_EX_io_id_rd_i),
    .io_id_aluop_i(ID_EX_io_id_aluop_i),
    .io_ex_opcode_o(ID_EX_io_ex_opcode_o),
    .io_ex_oprand1_o(ID_EX_io_ex_oprand1_o),
    .io_ex_oprand2_o(ID_EX_io_ex_oprand2_o),
    .io_ex_rd_o(ID_EX_io_ex_rd_o),
    .io_ex_aluop_o(ID_EX_io_ex_aluop_o)
  );
  Ex EX ( // @[Top.scala 25:29]
    .io_ex_opcode_i(EX_io_ex_opcode_i),
    .io_ex_aluop_i(EX_io_ex_aluop_i),
    .io_ex_oprand1_i(EX_io_ex_oprand1_i),
    .io_ex_oprand2_i(EX_io_ex_oprand2_i),
    .io_ex_rd_i(EX_io_ex_rd_i),
    .io_ex_rd_o(EX_io_ex_rd_o),
    .io_ex_wdata_o(EX_io_ex_wdata_o),
    .io_ex_wreg_o(EX_io_ex_wreg_o)
  );
  Ex_Mem EX_MEM ( // @[Top.scala 26:29]
    .clock(EX_MEM_clock),
    .io_ex_wdata_i(EX_MEM_io_ex_wdata_i),
    .io_ex_wreg_i(EX_MEM_io_ex_wreg_i),
    .io_ex_rd_i(EX_MEM_io_ex_rd_i),
    .io_mem_wdata_o(EX_MEM_io_mem_wdata_o),
    .io_mem_wreg_o(EX_MEM_io_mem_wreg_o),
    .io_mem_rd_o(EX_MEM_io_mem_rd_o)
  );
  Memory MEM ( // @[Top.scala 27:29]
    .io_mem_wdata_i(MEM_io_mem_wdata_i),
    .io_mem_wreg_i(MEM_io_mem_wreg_i),
    .io_mem_rd_i(MEM_io_mem_rd_i),
    .io_mem_wdata_o(MEM_io_mem_wdata_o),
    .io_mem_wreg_o(MEM_io_mem_wreg_o),
    .io_mem_rd_o(MEM_io_mem_rd_o)
  );
  Mem_Wb MEM_WB ( // @[Top.scala 28:29]
    .clock(MEM_WB_clock),
    .io_mem_rd_i(MEM_WB_io_mem_rd_i),
    .io_mem_wdata_i(MEM_WB_io_mem_wdata_i),
    .io_mem_wreg_i(MEM_WB_io_mem_wreg_i),
    .io_wb_rd_o(MEM_WB_io_wb_rd_o),
    .io_wb_wdata_o(MEM_WB_io_wb_wdata_o),
    .io_wb_wreg_o(MEM_WB_io_wb_wreg_o)
  );
  Wb WB ( // @[Top.scala 29:29]
    .io_wb_rd_i(WB_io_wb_rd_i),
    .io_wb_wdata_i(WB_io_wb_wdata_i),
    .io_wb_wreg_i(WB_io_wb_wreg_i),
    .io_wb_rd_o(WB_io_wb_rd_o),
    .io_wb_wdata_o(WB_io_wb_wdata_o),
    .io_wb_wreg_o(WB_io_wb_wreg_o)
  );
  assign io_o1 = WB_io_wb_wdata_o; // @[Top.scala 104:11]
  assign io_o2 = IF_io_inst_o; // @[Top.scala 105:11]
  assign io_o3 = 64'h0; // @[Top.scala 106:11]
  assign io_o4 = 64'h0; // @[Top.scala 107:11]
  assign IF_clock = clock;
  assign IF_reset = reset;
  assign IF_io_inst_i = INST_ROM_io_inst_o; // @[Top.scala 45:25]
  assign INST_ROM_clock = clock;
  assign INST_ROM_io_addr_i = IF_io_pc_o; // @[Top.scala 46:25]
  assign REGFILE_clock = clock;
  assign REGFILE_io_wen = WB_io_wb_wreg_o; // @[Top.scala 98:29]
  assign REGFILE_io_write_idx_i = WB_io_wb_rd_o; // @[Top.scala 99:29]
  assign REGFILE_io_write_data_i = WB_io_wb_wdata_o; // @[Top.scala 100:29]
  assign REGFILE_io_read_idx1_i = ID_io_id_ReadIdx1_o; // @[Top.scala 55:29]
  assign REGFILE_io_read_idx2_i = ID_io_id_ReadIdx2_o; // @[Top.scala 56:29]
  assign IF_ID_clock = clock;
  assign IF_ID_io_if_inst_i = {{32'd0}, IF_io_inst_o}; // @[Top.scala 49:25]
  assign ID_io_id_inst_i = IF_ID_io_if_inst_o[31:0]; // @[Top.scala 52:25]
  assign ID_io_id_RegData1_i = REGFILE_io_data1_o; // @[Top.scala 57:29]
  assign ID_io_id_RegData2_i = REGFILE_io_data2_o; // @[Top.scala 58:29]
  assign ID_EX_clock = clock;
  assign ID_EX_io_id_opcode_i = ID_io_id_opcode_o; // @[Top.scala 61:29]
  assign ID_EX_io_id_oprand1_i = ID_io_id_oprand1_o; // @[Top.scala 63:29]
  assign ID_EX_io_id_oprand2_i = ID_io_id_oprand2_o; // @[Top.scala 64:29]
  assign ID_EX_io_id_rd_i = {{4'd0}, ID_io_id_wreg_o}; // @[Top.scala 65:29]
  assign ID_EX_io_id_aluop_i = ID_io_id_aluop_o; // @[Top.scala 66:29]
  assign EX_io_ex_opcode_i = ID_EX_io_ex_opcode_o; // @[Top.scala 70:29]
  assign EX_io_ex_aluop_i = ID_EX_io_ex_aluop_o; // @[Top.scala 73:29]
  assign EX_io_ex_oprand1_i = ID_EX_io_ex_oprand1_o; // @[Top.scala 71:29]
  assign EX_io_ex_oprand2_i = ID_EX_io_ex_oprand2_o; // @[Top.scala 72:29]
  assign EX_io_ex_rd_i = ID_EX_io_ex_rd_o; // @[Top.scala 74:29]
  assign EX_MEM_clock = clock;
  assign EX_MEM_io_ex_wdata_i = EX_io_ex_wdata_o; // @[Top.scala 78:29]
  assign EX_MEM_io_ex_wreg_i = EX_io_ex_wreg_o; // @[Top.scala 79:29]
  assign EX_MEM_io_ex_rd_i = EX_io_ex_rd_o; // @[Top.scala 80:29]
  assign MEM_io_mem_wdata_i = EX_MEM_io_mem_wdata_o; // @[Top.scala 83:29]
  assign MEM_io_mem_wreg_i = EX_MEM_io_mem_wreg_o; // @[Top.scala 84:29]
  assign MEM_io_mem_rd_i = EX_MEM_io_mem_rd_o; // @[Top.scala 85:29]
  assign MEM_WB_clock = clock;
  assign MEM_WB_io_mem_rd_i = MEM_io_mem_rd_o; // @[Top.scala 89:29]
  assign MEM_WB_io_mem_wdata_i = MEM_io_mem_wdata_o; // @[Top.scala 88:29]
  assign MEM_WB_io_mem_wreg_i = MEM_io_mem_wreg_o; // @[Top.scala 90:29]
  assign WB_io_wb_rd_i = MEM_WB_io_wb_rd_o; // @[Top.scala 94:29]
  assign WB_io_wb_wdata_i = MEM_WB_io_wb_wdata_o; // @[Top.scala 93:29]
  assign WB_io_wb_wreg_i = MEM_WB_io_wb_wreg_o; // @[Top.scala 95:29]
endmodule

