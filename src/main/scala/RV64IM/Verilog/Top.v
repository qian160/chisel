module If(
  input         clock,
  input         reset,
  input         io_stall,
  input         io_excep_happen,
  input  [63:0] io_excep_new_pc,
  input         io_branchOp_taken,
  input  [63:0] io_branchOp_target,
  output [63:0] io_pc_o,
  output [31:0] io_inst_o
);
`ifdef RANDOMIZE_REG_INIT
  reg [63:0] _RAND_0;
`endif // RANDOMIZE_REG_INIT
  reg [31:0] inst_rom [0:4095]; // @[If.scala 15:24]
  wire  inst_rom_io_inst_o_MPORT_en; // @[If.scala 15:24]
  wire [11:0] inst_rom_io_inst_o_MPORT_addr; // @[If.scala 15:24]
  wire [31:0] inst_rom_io_inst_o_MPORT_data; // @[If.scala 15:24]
  reg [63:0] pc; // @[If.scala 36:26]
  wire [63:0] _next_pc_T_2 = pc + 64'h4; // @[If.scala 42:36]
  wire [63:0] _next_pc_T_3 = io_stall ? pc : _next_pc_T_2; // @[Mux.scala 47:70]
  assign inst_rom_io_inst_o_MPORT_en = 1'h1;
  assign inst_rom_io_inst_o_MPORT_addr = pc[13:2];
  assign inst_rom_io_inst_o_MPORT_data = inst_rom[inst_rom_io_inst_o_MPORT_addr]; // @[If.scala 15:24]
  assign io_pc_o = pc; // @[If.scala 49:18]
  assign io_inst_o = reset ? 32'h0 : inst_rom_io_inst_o_MPORT_data; // @[If.scala 48:24]
  always @(posedge clock) begin
    if (reset) begin // @[If.scala 36:26]
      pc <= 64'h400; // @[If.scala 36:26]
    end else if (reset) begin // @[Mux.scala 47:70]
      pc <= 64'h0;
    end else if (io_excep_happen) begin // @[Mux.scala 47:70]
      pc <= io_excep_new_pc;
    end else if (io_branchOp_taken) begin // @[Mux.scala 47:70]
      pc <= io_branchOp_target;
    end else begin
      pc <= _next_pc_T_3;
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
  _RAND_0 = {2{`RANDOM}};
  pc = _RAND_0[63:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
  $readmemh("/home/s081/Downloads/chisel-template/src/main/scala/RV64IM/Inst_Rom.data", inst_rom);
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module CSR(
  input         clock,
  input         reset,
  input  [11:0] io_ID_2_CSR_addr,
  input  [63:0] io_ID_2_CSR_wdata,
  input         io_writeOp_en,
  input  [63:0] io_writeOp_data,
  input  [4:0]  io_exception_cause,
  input  [63:0] io_exception_pc,
  input  [63:0] io_exception_xtval,
  input         io_exception_happen,
  output [63:0] io_CSR_2_ID_data,
  output        io_CSR_2_ID_legalWrite,
  output        io_CSR_2_ID_legalRead,
  output [1:0]  io_CSR_2_ID_priv,
  output [63:0] io_CSR_2_ID_xtvec,
  output [63:0] io_CSR_2_ID_xepc
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_REG_INIT
  reg [63:0] csr [0:1023]; // @[CSR.scala 24:22]
  wire  csr_mtimecmp_en; // @[CSR.scala 24:22]
  wire [9:0] csr_mtimecmp_addr; // @[CSR.scala 24:22]
  wire [63:0] csr_mtimecmp_data; // @[CSR.scala 24:22]
  wire  csr_io_CSR_2_ID_data_MPORT_en; // @[CSR.scala 24:22]
  wire [9:0] csr_io_CSR_2_ID_data_MPORT_addr; // @[CSR.scala 24:22]
  wire [63:0] csr_io_CSR_2_ID_data_MPORT_data; // @[CSR.scala 24:22]
  wire  csr_mtime_r_en; // @[CSR.scala 24:22]
  wire [9:0] csr_mtime_r_addr; // @[CSR.scala 24:22]
  wire [63:0] csr_mtime_r_data; // @[CSR.scala 24:22]
  wire  csr_mtvec_r_en; // @[CSR.scala 24:22]
  wire [9:0] csr_mtvec_r_addr; // @[CSR.scala 24:22]
  wire [63:0] csr_mtvec_r_data; // @[CSR.scala 24:22]
  wire  csr_stvec_r_en; // @[CSR.scala 24:22]
  wire [9:0] csr_stvec_r_addr; // @[CSR.scala 24:22]
  wire [63:0] csr_stvec_r_data; // @[CSR.scala 24:22]
  wire  csr_utvec_r_en; // @[CSR.scala 24:22]
  wire [9:0] csr_utvec_r_addr; // @[CSR.scala 24:22]
  wire [63:0] csr_utvec_r_data; // @[CSR.scala 24:22]
  wire  csr_mepc_r_en; // @[CSR.scala 24:22]
  wire [9:0] csr_mepc_r_addr; // @[CSR.scala 24:22]
  wire [63:0] csr_mepc_r_data; // @[CSR.scala 24:22]
  wire  csr_sepc_r_en; // @[CSR.scala 24:22]
  wire [9:0] csr_sepc_r_addr; // @[CSR.scala 24:22]
  wire [63:0] csr_sepc_r_data; // @[CSR.scala 24:22]
  wire  csr_uepc_r_en; // @[CSR.scala 24:22]
  wire [9:0] csr_uepc_r_addr; // @[CSR.scala 24:22]
  wire [63:0] csr_uepc_r_data; // @[CSR.scala 24:22]
  wire  csr_medeleg_r_en; // @[CSR.scala 24:22]
  wire [9:0] csr_medeleg_r_addr; // @[CSR.scala 24:22]
  wire [63:0] csr_medeleg_r_data; // @[CSR.scala 24:22]
  wire  csr_sedeleg_r_en; // @[CSR.scala 24:22]
  wire [9:0] csr_sedeleg_r_addr; // @[CSR.scala 24:22]
  wire [63:0] csr_sedeleg_r_data; // @[CSR.scala 24:22]
  wire  csr_mideleg_r_en; // @[CSR.scala 24:22]
  wire [9:0] csr_mideleg_r_addr; // @[CSR.scala 24:22]
  wire [63:0] csr_mideleg_r_data; // @[CSR.scala 24:22]
  wire  csr_sideleg_r_en; // @[CSR.scala 24:22]
  wire [9:0] csr_sideleg_r_addr; // @[CSR.scala 24:22]
  wire [63:0] csr_sideleg_r_data; // @[CSR.scala 24:22]
  wire [63:0] csr_MPORT_data; // @[CSR.scala 24:22]
  wire [9:0] csr_MPORT_addr; // @[CSR.scala 24:22]
  wire  csr_MPORT_mask; // @[CSR.scala 24:22]
  wire  csr_MPORT_en; // @[CSR.scala 24:22]
  wire [63:0] csr_MPORT_1_data; // @[CSR.scala 24:22]
  wire [9:0] csr_MPORT_1_addr; // @[CSR.scala 24:22]
  wire  csr_MPORT_1_mask; // @[CSR.scala 24:22]
  wire  csr_MPORT_1_en; // @[CSR.scala 24:22]
  wire [63:0] csr_MPORT_2_data; // @[CSR.scala 24:22]
  wire [9:0] csr_MPORT_2_addr; // @[CSR.scala 24:22]
  wire  csr_MPORT_2_mask; // @[CSR.scala 24:22]
  wire  csr_MPORT_2_en; // @[CSR.scala 24:22]
  wire [63:0] csr_MPORT_3_data; // @[CSR.scala 24:22]
  wire [9:0] csr_MPORT_3_addr; // @[CSR.scala 24:22]
  wire  csr_MPORT_3_mask; // @[CSR.scala 24:22]
  wire  csr_MPORT_3_en; // @[CSR.scala 24:22]
  wire [63:0] csr_MPORT_4_data; // @[CSR.scala 24:22]
  wire [9:0] csr_MPORT_4_addr; // @[CSR.scala 24:22]
  wire  csr_MPORT_4_mask; // @[CSR.scala 24:22]
  wire  csr_MPORT_4_en; // @[CSR.scala 24:22]
  wire [63:0] csr_mie_data; // @[CSR.scala 24:22]
  wire [9:0] csr_mie_addr; // @[CSR.scala 24:22]
  wire  csr_mie_mask; // @[CSR.scala 24:22]
  wire  csr_mie_en; // @[CSR.scala 24:22]
  wire [63:0] csr_mip_data; // @[CSR.scala 24:22]
  wire [9:0] csr_mip_addr; // @[CSR.scala 24:22]
  wire  csr_mip_mask; // @[CSR.scala 24:22]
  wire  csr_mip_en; // @[CSR.scala 24:22]
  wire [63:0] csr_mtval_data; // @[CSR.scala 24:22]
  wire [9:0] csr_mtval_addr; // @[CSR.scala 24:22]
  wire  csr_mtval_mask; // @[CSR.scala 24:22]
  wire  csr_mtval_en; // @[CSR.scala 24:22]
  wire [63:0] csr_stval_data; // @[CSR.scala 24:22]
  wire [9:0] csr_stval_addr; // @[CSR.scala 24:22]
  wire  csr_stval_mask; // @[CSR.scala 24:22]
  wire  csr_stval_en; // @[CSR.scala 24:22]
  wire [63:0] csr_utval_data; // @[CSR.scala 24:22]
  wire [9:0] csr_utval_addr; // @[CSR.scala 24:22]
  wire  csr_utval_mask; // @[CSR.scala 24:22]
  wire  csr_utval_en; // @[CSR.scala 24:22]
  wire [63:0] csr_mcause_data; // @[CSR.scala 24:22]
  wire [9:0] csr_mcause_addr; // @[CSR.scala 24:22]
  wire  csr_mcause_mask; // @[CSR.scala 24:22]
  wire  csr_mcause_en; // @[CSR.scala 24:22]
  wire [63:0] csr_scause_data; // @[CSR.scala 24:22]
  wire [9:0] csr_scause_addr; // @[CSR.scala 24:22]
  wire  csr_scause_mask; // @[CSR.scala 24:22]
  wire  csr_scause_en; // @[CSR.scala 24:22]
  wire [63:0] csr_ucause_data; // @[CSR.scala 24:22]
  wire [9:0] csr_ucause_addr; // @[CSR.scala 24:22]
  wire  csr_ucause_mask; // @[CSR.scala 24:22]
  wire  csr_ucause_en; // @[CSR.scala 24:22]
  wire [63:0] csr_MPORT_5_data; // @[CSR.scala 24:22]
  wire [9:0] csr_MPORT_5_addr; // @[CSR.scala 24:22]
  wire  csr_MPORT_5_mask; // @[CSR.scala 24:22]
  wire  csr_MPORT_5_en; // @[CSR.scala 24:22]
  wire [63:0] csr_mtime_w_data; // @[CSR.scala 24:22]
  wire [9:0] csr_mtime_w_addr; // @[CSR.scala 24:22]
  wire  csr_mtime_w_mask; // @[CSR.scala 24:22]
  wire  csr_mtime_w_en; // @[CSR.scala 24:22]
  wire [63:0] csr_mtvec_w_data; // @[CSR.scala 24:22]
  wire [9:0] csr_mtvec_w_addr; // @[CSR.scala 24:22]
  wire  csr_mtvec_w_mask; // @[CSR.scala 24:22]
  wire  csr_mtvec_w_en; // @[CSR.scala 24:22]
  wire [63:0] csr_stvec_w_data; // @[CSR.scala 24:22]
  wire [9:0] csr_stvec_w_addr; // @[CSR.scala 24:22]
  wire  csr_stvec_w_mask; // @[CSR.scala 24:22]
  wire  csr_stvec_w_en; // @[CSR.scala 24:22]
  wire [63:0] csr_utvec_w_data; // @[CSR.scala 24:22]
  wire [9:0] csr_utvec_w_addr; // @[CSR.scala 24:22]
  wire  csr_utvec_w_mask; // @[CSR.scala 24:22]
  wire  csr_utvec_w_en; // @[CSR.scala 24:22]
  wire [63:0] csr_mepc_w_data; // @[CSR.scala 24:22]
  wire [9:0] csr_mepc_w_addr; // @[CSR.scala 24:22]
  wire  csr_mepc_w_mask; // @[CSR.scala 24:22]
  wire  csr_mepc_w_en; // @[CSR.scala 24:22]
  wire [63:0] csr_sepc_w_data; // @[CSR.scala 24:22]
  wire [9:0] csr_sepc_w_addr; // @[CSR.scala 24:22]
  wire  csr_sepc_w_mask; // @[CSR.scala 24:22]
  wire  csr_sepc_w_en; // @[CSR.scala 24:22]
  wire [63:0] csr_uepc_w_data; // @[CSR.scala 24:22]
  wire [9:0] csr_uepc_w_addr; // @[CSR.scala 24:22]
  wire  csr_uepc_w_mask; // @[CSR.scala 24:22]
  wire  csr_uepc_w_en; // @[CSR.scala 24:22]
  wire [63:0] csr_medeleg_w_data; // @[CSR.scala 24:22]
  wire [9:0] csr_medeleg_w_addr; // @[CSR.scala 24:22]
  wire  csr_medeleg_w_mask; // @[CSR.scala 24:22]
  wire  csr_medeleg_w_en; // @[CSR.scala 24:22]
  wire [63:0] csr_sedeleg_w_data; // @[CSR.scala 24:22]
  wire [9:0] csr_sedeleg_w_addr; // @[CSR.scala 24:22]
  wire  csr_sedeleg_w_mask; // @[CSR.scala 24:22]
  wire  csr_sedeleg_w_en; // @[CSR.scala 24:22]
  wire [63:0] csr_mideleg_w_data; // @[CSR.scala 24:22]
  wire [9:0] csr_mideleg_w_addr; // @[CSR.scala 24:22]
  wire  csr_mideleg_w_mask; // @[CSR.scala 24:22]
  wire  csr_mideleg_w_en; // @[CSR.scala 24:22]
  wire [63:0] csr_sideleg_w_data; // @[CSR.scala 24:22]
  wire [9:0] csr_sideleg_w_addr; // @[CSR.scala 24:22]
  wire  csr_sideleg_w_mask; // @[CSR.scala 24:22]
  wire  csr_sideleg_w_en; // @[CSR.scala 24:22]
  reg [1:0] priv; // @[CSR.scala 32:28]
  wire  R_ONLY = &io_ID_2_CSR_addr[11:10]; // @[CSR.scala 78:42]
  wire [1:0] privRequired = io_ID_2_CSR_addr[9:8]; // @[CSR.scala 79:34]
  wire [63:0] cause = {59'h0,io_exception_cause}; // @[Cat.scala 31:58]
  wire [63:0] _nextPriv_T_2 = csr_medeleg_r_data >> cause[4:0]; // @[CSR.scala 108:33]
  wire  _nextPriv_T_4 = ~_nextPriv_T_2[0]; // @[CSR.scala 108:25]
  wire [63:0] _nextPriv_T_13 = csr_sedeleg_r_data >> cause[4:0]; // @[CSR.scala 110:33]
  wire  _nextPriv_T_15 = ~_nextPriv_T_13[0]; // @[CSR.scala 110:25]
  wire [1:0] _nextPriv_T_23 = _nextPriv_T_15 ? 2'h1 : 2'h0; // @[Mux.scala 47:70]
  wire [1:0] _nextPriv_T_25 = _nextPriv_T_4 ? 2'h3 : _nextPriv_T_23; // @[Mux.scala 47:70]
  wire [1:0] nextPriv = io_exception_happen ? _nextPriv_T_25 : priv; // @[CSR.scala 105:39 107:18 33:18]
  wire  _xtvec_T = 2'h3 == nextPriv; // @[Mux.scala 81:61]
  wire [63:0] _xtvec_T_1 = 2'h3 == nextPriv ? csr_mtvec_r_data : 64'h0; // @[Mux.scala 81:58]
  wire  _xtvec_T_2 = 2'h1 == nextPriv; // @[Mux.scala 81:61]
  wire [63:0] _xtvec_T_3 = 2'h1 == nextPriv ? csr_stvec_r_data : _xtvec_T_1; // @[Mux.scala 81:58]
  wire  _xtvec_T_4 = 2'h0 == nextPriv; // @[Mux.scala 81:61]
  wire [63:0] xtvec = 2'h0 == nextPriv ? csr_utvec_r_data : _xtvec_T_3; // @[Mux.scala 81:58]
  wire [63:0] _xepc_T_1 = 2'h3 == nextPriv ? csr_mepc_r_data : 64'h0; // @[Mux.scala 81:58]
  wire [63:0] _xepc_T_3 = 2'h1 == nextPriv ? csr_sepc_r_data : _xepc_T_1; // @[Mux.scala 81:58]
  wire  xtvec_mode = xtvec[0] | xtvec[1]; // @[CSR.scala 103:32]
  wire [61:0] base = xtvec[63:2]; // @[CSR.scala 104:28]
  wire  _GEN_21 = _xtvec_T_2 ? 1'h0 : _xtvec_T_4; // @[CSR.scala 115:26 55:24]
  wire  _GEN_35 = _xtvec_T ? 1'h0 : _xtvec_T_2; // @[CSR.scala 115:26 54:24]
  wire  _GEN_41 = _xtvec_T ? 1'h0 : _GEN_21; // @[CSR.scala 115:26 55:24]
  wire [63:0] _GEN_65 = {{2'd0}, base}; // @[CSR.scala 145:54]
  wire [63:0] _io_CSR_2_ID_xtvec_T_1 = _GEN_65 + cause; // @[CSR.scala 145:54]
  wire [65:0] _io_CSR_2_ID_xtvec_T_2 = {_io_CSR_2_ID_xtvec_T_1, 2'h0}; // @[CSR.scala 145:62]
  wire [65:0] _io_CSR_2_ID_xtvec_T_3 = xtvec_mode ? _io_CSR_2_ID_xtvec_T_2 : {{4'd0}, base}; // @[CSR.scala 145:36]
  assign csr_mtimecmp_en = 1'h1;
  assign csr_mtimecmp_addr = 10'h321;
  assign csr_mtimecmp_data = csr[csr_mtimecmp_addr]; // @[CSR.scala 24:22]
  assign csr_io_CSR_2_ID_data_MPORT_en = 1'h1;
  assign csr_io_CSR_2_ID_data_MPORT_addr = io_ID_2_CSR_addr[9:0];
  assign csr_io_CSR_2_ID_data_MPORT_data = csr[csr_io_CSR_2_ID_data_MPORT_addr]; // @[CSR.scala 24:22]
  assign csr_mtime_r_en = 1'h1 & ~1'h1;
  assign csr_mtime_r_addr = 10'h320;
  assign csr_mtime_r_data = csr[csr_mtime_r_addr]; // @[CSR.scala 24:22]
  assign csr_mtvec_r_en = 1'h1 & ~1'h1;
  assign csr_mtvec_r_addr = 10'h305;
  assign csr_mtvec_r_data = csr[csr_mtvec_r_addr]; // @[CSR.scala 24:22]
  assign csr_stvec_r_en = 1'h1 & ~1'h1;
  assign csr_stvec_r_addr = 10'h105;
  assign csr_stvec_r_data = csr[csr_stvec_r_addr]; // @[CSR.scala 24:22]
  assign csr_utvec_r_en = 1'h1 & ~1'h1;
  assign csr_utvec_r_addr = 10'h5;
  assign csr_utvec_r_data = csr[csr_utvec_r_addr]; // @[CSR.scala 24:22]
  assign csr_mepc_r_en = 1'h1 & ~(io_exception_happen & _xtvec_T);
  assign csr_mepc_r_addr = 10'h341;
  assign csr_mepc_r_data = csr[csr_mepc_r_addr]; // @[CSR.scala 24:22]
  assign csr_sepc_r_en = 1'h1 & ~(io_exception_happen & _GEN_35);
  assign csr_sepc_r_addr = 10'h141;
  assign csr_sepc_r_data = csr[csr_sepc_r_addr]; // @[CSR.scala 24:22]
  assign csr_uepc_r_en = 1'h1 & ~(io_exception_happen & _GEN_41);
  assign csr_uepc_r_addr = 10'h41;
  assign csr_uepc_r_data = csr[csr_uepc_r_addr]; // @[CSR.scala 24:22]
  assign csr_medeleg_r_en = 1'h1 & ~1'h1;
  assign csr_medeleg_r_addr = 10'h302;
  assign csr_medeleg_r_data = csr[csr_medeleg_r_addr]; // @[CSR.scala 24:22]
  assign csr_sedeleg_r_en = 1'h1 & ~1'h1;
  assign csr_sedeleg_r_addr = 10'h102;
  assign csr_sedeleg_r_data = csr[csr_sedeleg_r_addr]; // @[CSR.scala 24:22]
  assign csr_mideleg_r_en = 1'h1 & ~1'h1;
  assign csr_mideleg_r_addr = 10'h303;
  assign csr_mideleg_r_data = csr[csr_mideleg_r_addr]; // @[CSR.scala 24:22]
  assign csr_sideleg_r_en = 1'h1 & ~1'h1;
  assign csr_sideleg_r_addr = 10'h103;
  assign csr_sideleg_r_data = csr[csr_sideleg_r_addr]; // @[CSR.scala 24:22]
  assign csr_MPORT_data = 64'h8000000000141100;
  assign csr_MPORT_addr = 10'h301;
  assign csr_MPORT_mask = 1'h1;
  assign csr_MPORT_en = 1'h1;
  assign csr_MPORT_1_data = 64'h114514;
  assign csr_MPORT_1_addr = 10'h311;
  assign csr_MPORT_1_mask = 1'h1;
  assign csr_MPORT_1_en = 1'h1;
  assign csr_MPORT_2_data = 64'h1919810;
  assign csr_MPORT_2_addr = 10'h312;
  assign csr_MPORT_2_mask = 1'h1;
  assign csr_MPORT_2_en = 1'h1;
  assign csr_MPORT_3_data = 64'h0;
  assign csr_MPORT_3_addr = 10'h314;
  assign csr_MPORT_3_mask = 1'h1;
  assign csr_MPORT_3_en = 1'h1;
  assign csr_MPORT_4_data = 64'h1145141919810;
  assign csr_MPORT_4_addr = 10'h114;
  assign csr_MPORT_4_mask = 1'h1;
  assign csr_MPORT_4_en = 1'h1;
  assign csr_mie_data = 64'haaa;
  assign csr_mie_addr = 10'h304;
  assign csr_mie_mask = 1'h1;
  assign csr_mie_en = 1'h1;
  assign csr_mip_data = 64'h0;
  assign csr_mip_addr = 10'h344;
  assign csr_mip_mask = 1'h1;
  assign csr_mip_en = 1'h1;
  assign csr_mtval_data = io_exception_xtval;
  assign csr_mtval_addr = 10'h343;
  assign csr_mtval_mask = io_exception_happen & _xtvec_T;
  assign csr_mtval_en = 1'h1;
  assign csr_stval_data = io_exception_xtval;
  assign csr_stval_addr = 10'h143;
  assign csr_stval_mask = io_exception_happen & _GEN_35;
  assign csr_stval_en = 1'h1;
  assign csr_utval_data = io_exception_xtval;
  assign csr_utval_addr = 10'h43;
  assign csr_utval_mask = io_exception_happen & _GEN_41;
  assign csr_utval_en = 1'h1;
  assign csr_mcause_data = {59'h0,io_exception_cause};
  assign csr_mcause_addr = 10'h342;
  assign csr_mcause_mask = io_exception_happen & _xtvec_T;
  assign csr_mcause_en = 1'h1;
  assign csr_scause_data = {59'h0,io_exception_cause};
  assign csr_scause_addr = 10'h142;
  assign csr_scause_mask = io_exception_happen & _GEN_35;
  assign csr_scause_en = 1'h1;
  assign csr_ucause_data = {59'h0,io_exception_cause};
  assign csr_ucause_addr = 10'h42;
  assign csr_ucause_mask = io_exception_happen & _GEN_41;
  assign csr_ucause_en = 1'h1;
  assign csr_MPORT_5_data = io_writeOp_data;
  assign csr_MPORT_5_addr = io_ID_2_CSR_addr[9:0];
  assign csr_MPORT_5_mask = 1'h1;
  assign csr_MPORT_5_en = io_writeOp_en;
  assign csr_mtime_w_data = csr_mtime_r_data + 64'h1;
  assign csr_mtime_w_addr = 10'h320;
  assign csr_mtime_w_mask = 1'h1;
  assign csr_mtime_w_en = 1'h1 & 1'h1;
  assign csr_mtvec_w_data = 64'h0;
  assign csr_mtvec_w_addr = 10'h305;
  assign csr_mtvec_w_mask = 1'h1;
  assign csr_mtvec_w_en = 1'h1 & 1'h1;
  assign csr_stvec_w_data = 64'h400;
  assign csr_stvec_w_addr = 10'h105;
  assign csr_stvec_w_mask = 1'h1;
  assign csr_stvec_w_en = 1'h1 & 1'h1;
  assign csr_utvec_w_data = 64'h800;
  assign csr_utvec_w_addr = 10'h5;
  assign csr_utvec_w_mask = 1'h1;
  assign csr_utvec_w_en = 1'h1 & 1'h1;
  assign csr_mepc_w_data = io_exception_pc;
  assign csr_mepc_w_addr = 10'h341;
  assign csr_mepc_w_mask = io_exception_happen & _xtvec_T;
  assign csr_mepc_w_en = 1'h1 & (io_exception_happen & _xtvec_T);
  assign csr_sepc_w_data = io_exception_pc;
  assign csr_sepc_w_addr = 10'h141;
  assign csr_sepc_w_mask = io_exception_happen & _GEN_35;
  assign csr_sepc_w_en = 1'h1 & (io_exception_happen & _GEN_35);
  assign csr_uepc_w_data = io_exception_pc;
  assign csr_uepc_w_addr = 10'h41;
  assign csr_uepc_w_mask = io_exception_happen & _GEN_41;
  assign csr_uepc_w_en = 1'h1 & (io_exception_happen & _GEN_41);
  assign csr_medeleg_w_data = 64'h0;
  assign csr_medeleg_w_addr = 10'h302;
  assign csr_medeleg_w_mask = 1'h1;
  assign csr_medeleg_w_en = 1'h1 & 1'h1;
  assign csr_sedeleg_w_data = 64'h0;
  assign csr_sedeleg_w_addr = 10'h102;
  assign csr_sedeleg_w_mask = 1'h1;
  assign csr_sedeleg_w_en = 1'h1 & 1'h1;
  assign csr_mideleg_w_data = 64'h0;
  assign csr_mideleg_w_addr = 10'h303;
  assign csr_mideleg_w_mask = 1'h1;
  assign csr_mideleg_w_en = 1'h1 & 1'h1;
  assign csr_sideleg_w_data = 64'h0;
  assign csr_sideleg_w_addr = 10'h103;
  assign csr_sideleg_w_mask = 1'h1;
  assign csr_sideleg_w_en = 1'h1 & 1'h1;
  assign io_CSR_2_ID_data = csr_io_CSR_2_ID_data_MPORT_data; // @[CSR.scala 146:29]
  assign io_CSR_2_ID_legalWrite = ~R_ONLY | R_ONLY & io_ID_2_CSR_wdata == 64'h0; // @[CSR.scala 81:39]
  assign io_CSR_2_ID_legalRead = priv >= privRequired; // @[CSR.scala 80:32]
  assign io_CSR_2_ID_priv = priv; // @[CSR.scala 149:29]
  assign io_CSR_2_ID_xtvec = _io_CSR_2_ID_xtvec_T_3[63:0]; // @[CSR.scala 145:29]
  assign io_CSR_2_ID_xepc = 2'h0 == nextPriv ? csr_uepc_r_data : _xepc_T_3; // @[Mux.scala 81:58]
  always @(posedge clock) begin
    if (csr_MPORT_en & csr_MPORT_mask) begin
      csr[csr_MPORT_addr] <= csr_MPORT_data; // @[CSR.scala 24:22]
    end
    if (csr_MPORT_1_en & csr_MPORT_1_mask) begin
      csr[csr_MPORT_1_addr] <= csr_MPORT_1_data; // @[CSR.scala 24:22]
    end
    if (csr_MPORT_2_en & csr_MPORT_2_mask) begin
      csr[csr_MPORT_2_addr] <= csr_MPORT_2_data; // @[CSR.scala 24:22]
    end
    if (csr_MPORT_3_en & csr_MPORT_3_mask) begin
      csr[csr_MPORT_3_addr] <= csr_MPORT_3_data; // @[CSR.scala 24:22]
    end
    if (csr_MPORT_4_en & csr_MPORT_4_mask) begin
      csr[csr_MPORT_4_addr] <= csr_MPORT_4_data; // @[CSR.scala 24:22]
    end
    if (csr_mie_en & csr_mie_mask) begin
      csr[csr_mie_addr] <= csr_mie_data; // @[CSR.scala 24:22]
    end
    if (csr_mip_en & csr_mip_mask) begin
      csr[csr_mip_addr] <= csr_mip_data; // @[CSR.scala 24:22]
    end
    if (csr_mtval_en & csr_mtval_mask) begin
      csr[csr_mtval_addr] <= csr_mtval_data; // @[CSR.scala 24:22]
    end
    if (csr_stval_en & csr_stval_mask) begin
      csr[csr_stval_addr] <= csr_stval_data; // @[CSR.scala 24:22]
    end
    if (csr_utval_en & csr_utval_mask) begin
      csr[csr_utval_addr] <= csr_utval_data; // @[CSR.scala 24:22]
    end
    if (csr_mcause_en & csr_mcause_mask) begin
      csr[csr_mcause_addr] <= csr_mcause_data; // @[CSR.scala 24:22]
    end
    if (csr_scause_en & csr_scause_mask) begin
      csr[csr_scause_addr] <= csr_scause_data; // @[CSR.scala 24:22]
    end
    if (csr_ucause_en & csr_ucause_mask) begin
      csr[csr_ucause_addr] <= csr_ucause_data; // @[CSR.scala 24:22]
    end
    if (csr_MPORT_5_en & csr_MPORT_5_mask) begin
      csr[csr_MPORT_5_addr] <= csr_MPORT_5_data; // @[CSR.scala 24:22]
    end
    if (csr_mtime_w_en & csr_mtime_w_mask) begin
      csr[csr_mtime_w_addr] <= csr_mtime_w_data; // @[CSR.scala 24:22]
    end
    if (csr_mtvec_w_en & csr_mtvec_w_mask) begin
      csr[csr_mtvec_w_addr] <= csr_mtvec_w_data; // @[CSR.scala 24:22]
    end
    if (csr_stvec_w_en & csr_stvec_w_mask) begin
      csr[csr_stvec_w_addr] <= csr_stvec_w_data; // @[CSR.scala 24:22]
    end
    if (csr_utvec_w_en & csr_utvec_w_mask) begin
      csr[csr_utvec_w_addr] <= csr_utvec_w_data; // @[CSR.scala 24:22]
    end
    if (csr_mepc_w_en & csr_mepc_w_mask) begin
      csr[csr_mepc_w_addr] <= csr_mepc_w_data; // @[CSR.scala 24:22]
    end
    if (csr_sepc_w_en & csr_sepc_w_mask) begin
      csr[csr_sepc_w_addr] <= csr_sepc_w_data; // @[CSR.scala 24:22]
    end
    if (csr_uepc_w_en & csr_uepc_w_mask) begin
      csr[csr_uepc_w_addr] <= csr_uepc_w_data; // @[CSR.scala 24:22]
    end
    if (csr_medeleg_w_en & csr_medeleg_w_mask) begin
      csr[csr_medeleg_w_addr] <= csr_medeleg_w_data; // @[CSR.scala 24:22]
    end
    if (csr_sedeleg_w_en & csr_sedeleg_w_mask) begin
      csr[csr_sedeleg_w_addr] <= csr_sedeleg_w_data; // @[CSR.scala 24:22]
    end
    if (csr_mideleg_w_en & csr_mideleg_w_mask) begin
      csr[csr_mideleg_w_addr] <= csr_mideleg_w_data; // @[CSR.scala 24:22]
    end
    if (csr_sideleg_w_en & csr_sideleg_w_mask) begin
      csr[csr_sideleg_w_addr] <= csr_sideleg_w_data; // @[CSR.scala 24:22]
    end
    if (reset) begin // @[CSR.scala 32:28]
      priv <= 2'h3; // @[CSR.scala 32:28]
    end else if (io_exception_happen) begin // @[CSR.scala 105:39]
      if (_nextPriv_T_4) begin // @[Mux.scala 47:70]
        priv <= 2'h3;
      end else if (_nextPriv_T_15) begin // @[Mux.scala 47:70]
        priv <= 2'h1;
      end else begin
        priv <= 2'h0;
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
  priv = _RAND_0[1:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
  $readmemh("/home/s081/Downloads/chisel-template/src/main/scala/RV64IM/csr.data", csr);
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
  reg [63:0] rf_0; // @[Regfile.scala 12:24]
  reg [63:0] rf_1; // @[Regfile.scala 12:24]
  reg [63:0] rf_2; // @[Regfile.scala 12:24]
  reg [63:0] rf_3; // @[Regfile.scala 12:24]
  reg [63:0] rf_4; // @[Regfile.scala 12:24]
  reg [63:0] rf_5; // @[Regfile.scala 12:24]
  reg [63:0] rf_6; // @[Regfile.scala 12:24]
  reg [63:0] rf_7; // @[Regfile.scala 12:24]
  reg [63:0] rf_8; // @[Regfile.scala 12:24]
  reg [63:0] rf_9; // @[Regfile.scala 12:24]
  reg [63:0] rf_10; // @[Regfile.scala 12:24]
  reg [63:0] rf_11; // @[Regfile.scala 12:24]
  reg [63:0] rf_12; // @[Regfile.scala 12:24]
  reg [63:0] rf_13; // @[Regfile.scala 12:24]
  reg [63:0] rf_14; // @[Regfile.scala 12:24]
  reg [63:0] rf_15; // @[Regfile.scala 12:24]
  reg [63:0] rf_16; // @[Regfile.scala 12:24]
  reg [63:0] rf_17; // @[Regfile.scala 12:24]
  reg [63:0] rf_18; // @[Regfile.scala 12:24]
  reg [63:0] rf_19; // @[Regfile.scala 12:24]
  reg [63:0] rf_20; // @[Regfile.scala 12:24]
  reg [63:0] rf_21; // @[Regfile.scala 12:24]
  reg [63:0] rf_22; // @[Regfile.scala 12:24]
  reg [63:0] rf_23; // @[Regfile.scala 12:24]
  reg [63:0] rf_24; // @[Regfile.scala 12:24]
  reg [63:0] rf_25; // @[Regfile.scala 12:24]
  reg [63:0] rf_26; // @[Regfile.scala 12:24]
  reg [63:0] rf_27; // @[Regfile.scala 12:24]
  reg [63:0] rf_28; // @[Regfile.scala 12:24]
  reg [63:0] rf_29; // @[Regfile.scala 12:24]
  reg [63:0] rf_30; // @[Regfile.scala 12:24]
  wire [63:0] _GEN_63 = 5'h1 == io_id2Rf_ReadIdx1 ? rf_1 : rf_0; // @[Regfile.scala 20:{23,23}]
  wire [63:0] _GEN_64 = 5'h2 == io_id2Rf_ReadIdx1 ? rf_2 : _GEN_63; // @[Regfile.scala 20:{23,23}]
  wire [63:0] _GEN_65 = 5'h3 == io_id2Rf_ReadIdx1 ? rf_3 : _GEN_64; // @[Regfile.scala 20:{23,23}]
  wire [63:0] _GEN_66 = 5'h4 == io_id2Rf_ReadIdx1 ? rf_4 : _GEN_65; // @[Regfile.scala 20:{23,23}]
  wire [63:0] _GEN_67 = 5'h5 == io_id2Rf_ReadIdx1 ? rf_5 : _GEN_66; // @[Regfile.scala 20:{23,23}]
  wire [63:0] _GEN_68 = 5'h6 == io_id2Rf_ReadIdx1 ? rf_6 : _GEN_67; // @[Regfile.scala 20:{23,23}]
  wire [63:0] _GEN_69 = 5'h7 == io_id2Rf_ReadIdx1 ? rf_7 : _GEN_68; // @[Regfile.scala 20:{23,23}]
  wire [63:0] _GEN_70 = 5'h8 == io_id2Rf_ReadIdx1 ? rf_8 : _GEN_69; // @[Regfile.scala 20:{23,23}]
  wire [63:0] _GEN_71 = 5'h9 == io_id2Rf_ReadIdx1 ? rf_9 : _GEN_70; // @[Regfile.scala 20:{23,23}]
  wire [63:0] _GEN_72 = 5'ha == io_id2Rf_ReadIdx1 ? rf_10 : _GEN_71; // @[Regfile.scala 20:{23,23}]
  wire [63:0] _GEN_73 = 5'hb == io_id2Rf_ReadIdx1 ? rf_11 : _GEN_72; // @[Regfile.scala 20:{23,23}]
  wire [63:0] _GEN_74 = 5'hc == io_id2Rf_ReadIdx1 ? rf_12 : _GEN_73; // @[Regfile.scala 20:{23,23}]
  wire [63:0] _GEN_75 = 5'hd == io_id2Rf_ReadIdx1 ? rf_13 : _GEN_74; // @[Regfile.scala 20:{23,23}]
  wire [63:0] _GEN_76 = 5'he == io_id2Rf_ReadIdx1 ? rf_14 : _GEN_75; // @[Regfile.scala 20:{23,23}]
  wire [63:0] _GEN_77 = 5'hf == io_id2Rf_ReadIdx1 ? rf_15 : _GEN_76; // @[Regfile.scala 20:{23,23}]
  wire [63:0] _GEN_78 = 5'h10 == io_id2Rf_ReadIdx1 ? rf_16 : _GEN_77; // @[Regfile.scala 20:{23,23}]
  wire [63:0] _GEN_79 = 5'h11 == io_id2Rf_ReadIdx1 ? rf_17 : _GEN_78; // @[Regfile.scala 20:{23,23}]
  wire [63:0] _GEN_80 = 5'h12 == io_id2Rf_ReadIdx1 ? rf_18 : _GEN_79; // @[Regfile.scala 20:{23,23}]
  wire [63:0] _GEN_81 = 5'h13 == io_id2Rf_ReadIdx1 ? rf_19 : _GEN_80; // @[Regfile.scala 20:{23,23}]
  wire [63:0] _GEN_82 = 5'h14 == io_id2Rf_ReadIdx1 ? rf_20 : _GEN_81; // @[Regfile.scala 20:{23,23}]
  wire [63:0] _GEN_83 = 5'h15 == io_id2Rf_ReadIdx1 ? rf_21 : _GEN_82; // @[Regfile.scala 20:{23,23}]
  wire [63:0] _GEN_84 = 5'h16 == io_id2Rf_ReadIdx1 ? rf_22 : _GEN_83; // @[Regfile.scala 20:{23,23}]
  wire [63:0] _GEN_85 = 5'h17 == io_id2Rf_ReadIdx1 ? rf_23 : _GEN_84; // @[Regfile.scala 20:{23,23}]
  wire [63:0] _GEN_86 = 5'h18 == io_id2Rf_ReadIdx1 ? rf_24 : _GEN_85; // @[Regfile.scala 20:{23,23}]
  wire [63:0] _GEN_87 = 5'h19 == io_id2Rf_ReadIdx1 ? rf_25 : _GEN_86; // @[Regfile.scala 20:{23,23}]
  wire [63:0] _GEN_88 = 5'h1a == io_id2Rf_ReadIdx1 ? rf_26 : _GEN_87; // @[Regfile.scala 20:{23,23}]
  wire [63:0] _GEN_89 = 5'h1b == io_id2Rf_ReadIdx1 ? rf_27 : _GEN_88; // @[Regfile.scala 20:{23,23}]
  wire [63:0] _GEN_90 = 5'h1c == io_id2Rf_ReadIdx1 ? rf_28 : _GEN_89; // @[Regfile.scala 20:{23,23}]
  wire [63:0] _GEN_91 = 5'h1d == io_id2Rf_ReadIdx1 ? rf_29 : _GEN_90; // @[Regfile.scala 20:{23,23}]
  wire [63:0] _GEN_94 = 5'h1 == io_id2Rf_ReadIdx2 ? rf_1 : rf_0; // @[Regfile.scala 21:{23,23}]
  wire [63:0] _GEN_95 = 5'h2 == io_id2Rf_ReadIdx2 ? rf_2 : _GEN_94; // @[Regfile.scala 21:{23,23}]
  wire [63:0] _GEN_96 = 5'h3 == io_id2Rf_ReadIdx2 ? rf_3 : _GEN_95; // @[Regfile.scala 21:{23,23}]
  wire [63:0] _GEN_97 = 5'h4 == io_id2Rf_ReadIdx2 ? rf_4 : _GEN_96; // @[Regfile.scala 21:{23,23}]
  wire [63:0] _GEN_98 = 5'h5 == io_id2Rf_ReadIdx2 ? rf_5 : _GEN_97; // @[Regfile.scala 21:{23,23}]
  wire [63:0] _GEN_99 = 5'h6 == io_id2Rf_ReadIdx2 ? rf_6 : _GEN_98; // @[Regfile.scala 21:{23,23}]
  wire [63:0] _GEN_100 = 5'h7 == io_id2Rf_ReadIdx2 ? rf_7 : _GEN_99; // @[Regfile.scala 21:{23,23}]
  wire [63:0] _GEN_101 = 5'h8 == io_id2Rf_ReadIdx2 ? rf_8 : _GEN_100; // @[Regfile.scala 21:{23,23}]
  wire [63:0] _GEN_102 = 5'h9 == io_id2Rf_ReadIdx2 ? rf_9 : _GEN_101; // @[Regfile.scala 21:{23,23}]
  wire [63:0] _GEN_103 = 5'ha == io_id2Rf_ReadIdx2 ? rf_10 : _GEN_102; // @[Regfile.scala 21:{23,23}]
  wire [63:0] _GEN_104 = 5'hb == io_id2Rf_ReadIdx2 ? rf_11 : _GEN_103; // @[Regfile.scala 21:{23,23}]
  wire [63:0] _GEN_105 = 5'hc == io_id2Rf_ReadIdx2 ? rf_12 : _GEN_104; // @[Regfile.scala 21:{23,23}]
  wire [63:0] _GEN_106 = 5'hd == io_id2Rf_ReadIdx2 ? rf_13 : _GEN_105; // @[Regfile.scala 21:{23,23}]
  wire [63:0] _GEN_107 = 5'he == io_id2Rf_ReadIdx2 ? rf_14 : _GEN_106; // @[Regfile.scala 21:{23,23}]
  wire [63:0] _GEN_108 = 5'hf == io_id2Rf_ReadIdx2 ? rf_15 : _GEN_107; // @[Regfile.scala 21:{23,23}]
  wire [63:0] _GEN_109 = 5'h10 == io_id2Rf_ReadIdx2 ? rf_16 : _GEN_108; // @[Regfile.scala 21:{23,23}]
  wire [63:0] _GEN_110 = 5'h11 == io_id2Rf_ReadIdx2 ? rf_17 : _GEN_109; // @[Regfile.scala 21:{23,23}]
  wire [63:0] _GEN_111 = 5'h12 == io_id2Rf_ReadIdx2 ? rf_18 : _GEN_110; // @[Regfile.scala 21:{23,23}]
  wire [63:0] _GEN_112 = 5'h13 == io_id2Rf_ReadIdx2 ? rf_19 : _GEN_111; // @[Regfile.scala 21:{23,23}]
  wire [63:0] _GEN_113 = 5'h14 == io_id2Rf_ReadIdx2 ? rf_20 : _GEN_112; // @[Regfile.scala 21:{23,23}]
  wire [63:0] _GEN_114 = 5'h15 == io_id2Rf_ReadIdx2 ? rf_21 : _GEN_113; // @[Regfile.scala 21:{23,23}]
  wire [63:0] _GEN_115 = 5'h16 == io_id2Rf_ReadIdx2 ? rf_22 : _GEN_114; // @[Regfile.scala 21:{23,23}]
  wire [63:0] _GEN_116 = 5'h17 == io_id2Rf_ReadIdx2 ? rf_23 : _GEN_115; // @[Regfile.scala 21:{23,23}]
  wire [63:0] _GEN_117 = 5'h18 == io_id2Rf_ReadIdx2 ? rf_24 : _GEN_116; // @[Regfile.scala 21:{23,23}]
  wire [63:0] _GEN_118 = 5'h19 == io_id2Rf_ReadIdx2 ? rf_25 : _GEN_117; // @[Regfile.scala 21:{23,23}]
  wire [63:0] _GEN_119 = 5'h1a == io_id2Rf_ReadIdx2 ? rf_26 : _GEN_118; // @[Regfile.scala 21:{23,23}]
  wire [63:0] _GEN_120 = 5'h1b == io_id2Rf_ReadIdx2 ? rf_27 : _GEN_119; // @[Regfile.scala 21:{23,23}]
  wire [63:0] _GEN_121 = 5'h1c == io_id2Rf_ReadIdx2 ? rf_28 : _GEN_120; // @[Regfile.scala 21:{23,23}]
  wire [63:0] _GEN_122 = 5'h1d == io_id2Rf_ReadIdx2 ? rf_29 : _GEN_121; // @[Regfile.scala 21:{23,23}]
  assign io_rf2Id_RegData1 = 5'h1e == io_id2Rf_ReadIdx1 ? rf_30 : _GEN_91; // @[Regfile.scala 20:{23,23}]
  assign io_rf2Id_RegData2 = 5'h1e == io_id2Rf_ReadIdx2 ? rf_30 : _GEN_122; // @[Regfile.scala 21:{23,23}]
  always @(posedge clock) begin
    if (reset) begin // @[Regfile.scala 12:24]
      rf_0 <= 64'h0; // @[Regfile.scala 12:24]
    end else if (io_writeRfOp_en) begin // @[Regfile.scala 15:26]
      if (5'h0 == io_writeRfOp_addr) begin // @[Regfile.scala 17:35]
        rf_0 <= io_writeRfOp_data; // @[Regfile.scala 17:35]
      end else begin
        rf_0 <= 64'h0; // @[Regfile.scala 13:14]
      end
    end else begin
      rf_0 <= 64'h0; // @[Regfile.scala 13:14]
    end
    if (reset) begin // @[Regfile.scala 12:24]
      rf_1 <= 64'h0; // @[Regfile.scala 12:24]
    end else if (io_writeRfOp_en) begin // @[Regfile.scala 15:26]
      if (5'h1 == io_writeRfOp_addr) begin // @[Regfile.scala 17:35]
        rf_1 <= io_writeRfOp_data; // @[Regfile.scala 17:35]
      end
    end
    if (reset) begin // @[Regfile.scala 12:24]
      rf_2 <= 64'h0; // @[Regfile.scala 12:24]
    end else if (io_writeRfOp_en) begin // @[Regfile.scala 15:26]
      if (5'h2 == io_writeRfOp_addr) begin // @[Regfile.scala 17:35]
        rf_2 <= io_writeRfOp_data; // @[Regfile.scala 17:35]
      end
    end
    if (reset) begin // @[Regfile.scala 12:24]
      rf_3 <= 64'h0; // @[Regfile.scala 12:24]
    end else if (io_writeRfOp_en) begin // @[Regfile.scala 15:26]
      if (5'h3 == io_writeRfOp_addr) begin // @[Regfile.scala 17:35]
        rf_3 <= io_writeRfOp_data; // @[Regfile.scala 17:35]
      end
    end
    if (reset) begin // @[Regfile.scala 12:24]
      rf_4 <= 64'h0; // @[Regfile.scala 12:24]
    end else if (io_writeRfOp_en) begin // @[Regfile.scala 15:26]
      if (5'h4 == io_writeRfOp_addr) begin // @[Regfile.scala 17:35]
        rf_4 <= io_writeRfOp_data; // @[Regfile.scala 17:35]
      end
    end
    if (reset) begin // @[Regfile.scala 12:24]
      rf_5 <= 64'h0; // @[Regfile.scala 12:24]
    end else if (io_writeRfOp_en) begin // @[Regfile.scala 15:26]
      if (5'h5 == io_writeRfOp_addr) begin // @[Regfile.scala 17:35]
        rf_5 <= io_writeRfOp_data; // @[Regfile.scala 17:35]
      end
    end
    if (reset) begin // @[Regfile.scala 12:24]
      rf_6 <= 64'h0; // @[Regfile.scala 12:24]
    end else if (io_writeRfOp_en) begin // @[Regfile.scala 15:26]
      if (5'h6 == io_writeRfOp_addr) begin // @[Regfile.scala 17:35]
        rf_6 <= io_writeRfOp_data; // @[Regfile.scala 17:35]
      end
    end
    if (reset) begin // @[Regfile.scala 12:24]
      rf_7 <= 64'h0; // @[Regfile.scala 12:24]
    end else if (io_writeRfOp_en) begin // @[Regfile.scala 15:26]
      if (5'h7 == io_writeRfOp_addr) begin // @[Regfile.scala 17:35]
        rf_7 <= io_writeRfOp_data; // @[Regfile.scala 17:35]
      end
    end
    if (reset) begin // @[Regfile.scala 12:24]
      rf_8 <= 64'h0; // @[Regfile.scala 12:24]
    end else if (io_writeRfOp_en) begin // @[Regfile.scala 15:26]
      if (5'h8 == io_writeRfOp_addr) begin // @[Regfile.scala 17:35]
        rf_8 <= io_writeRfOp_data; // @[Regfile.scala 17:35]
      end
    end
    if (reset) begin // @[Regfile.scala 12:24]
      rf_9 <= 64'h0; // @[Regfile.scala 12:24]
    end else if (io_writeRfOp_en) begin // @[Regfile.scala 15:26]
      if (5'h9 == io_writeRfOp_addr) begin // @[Regfile.scala 17:35]
        rf_9 <= io_writeRfOp_data; // @[Regfile.scala 17:35]
      end
    end
    if (reset) begin // @[Regfile.scala 12:24]
      rf_10 <= 64'h0; // @[Regfile.scala 12:24]
    end else if (io_writeRfOp_en) begin // @[Regfile.scala 15:26]
      if (5'ha == io_writeRfOp_addr) begin // @[Regfile.scala 17:35]
        rf_10 <= io_writeRfOp_data; // @[Regfile.scala 17:35]
      end
    end
    if (reset) begin // @[Regfile.scala 12:24]
      rf_11 <= 64'h0; // @[Regfile.scala 12:24]
    end else if (io_writeRfOp_en) begin // @[Regfile.scala 15:26]
      if (5'hb == io_writeRfOp_addr) begin // @[Regfile.scala 17:35]
        rf_11 <= io_writeRfOp_data; // @[Regfile.scala 17:35]
      end
    end
    if (reset) begin // @[Regfile.scala 12:24]
      rf_12 <= 64'h0; // @[Regfile.scala 12:24]
    end else if (io_writeRfOp_en) begin // @[Regfile.scala 15:26]
      if (5'hc == io_writeRfOp_addr) begin // @[Regfile.scala 17:35]
        rf_12 <= io_writeRfOp_data; // @[Regfile.scala 17:35]
      end
    end
    if (reset) begin // @[Regfile.scala 12:24]
      rf_13 <= 64'h0; // @[Regfile.scala 12:24]
    end else if (io_writeRfOp_en) begin // @[Regfile.scala 15:26]
      if (5'hd == io_writeRfOp_addr) begin // @[Regfile.scala 17:35]
        rf_13 <= io_writeRfOp_data; // @[Regfile.scala 17:35]
      end
    end
    if (reset) begin // @[Regfile.scala 12:24]
      rf_14 <= 64'h0; // @[Regfile.scala 12:24]
    end else if (io_writeRfOp_en) begin // @[Regfile.scala 15:26]
      if (5'he == io_writeRfOp_addr) begin // @[Regfile.scala 17:35]
        rf_14 <= io_writeRfOp_data; // @[Regfile.scala 17:35]
      end
    end
    if (reset) begin // @[Regfile.scala 12:24]
      rf_15 <= 64'h0; // @[Regfile.scala 12:24]
    end else if (io_writeRfOp_en) begin // @[Regfile.scala 15:26]
      if (5'hf == io_writeRfOp_addr) begin // @[Regfile.scala 17:35]
        rf_15 <= io_writeRfOp_data; // @[Regfile.scala 17:35]
      end
    end
    if (reset) begin // @[Regfile.scala 12:24]
      rf_16 <= 64'h0; // @[Regfile.scala 12:24]
    end else if (io_writeRfOp_en) begin // @[Regfile.scala 15:26]
      if (5'h10 == io_writeRfOp_addr) begin // @[Regfile.scala 17:35]
        rf_16 <= io_writeRfOp_data; // @[Regfile.scala 17:35]
      end
    end
    if (reset) begin // @[Regfile.scala 12:24]
      rf_17 <= 64'h0; // @[Regfile.scala 12:24]
    end else if (io_writeRfOp_en) begin // @[Regfile.scala 15:26]
      if (5'h11 == io_writeRfOp_addr) begin // @[Regfile.scala 17:35]
        rf_17 <= io_writeRfOp_data; // @[Regfile.scala 17:35]
      end
    end
    if (reset) begin // @[Regfile.scala 12:24]
      rf_18 <= 64'h0; // @[Regfile.scala 12:24]
    end else if (io_writeRfOp_en) begin // @[Regfile.scala 15:26]
      if (5'h12 == io_writeRfOp_addr) begin // @[Regfile.scala 17:35]
        rf_18 <= io_writeRfOp_data; // @[Regfile.scala 17:35]
      end
    end
    if (reset) begin // @[Regfile.scala 12:24]
      rf_19 <= 64'h0; // @[Regfile.scala 12:24]
    end else if (io_writeRfOp_en) begin // @[Regfile.scala 15:26]
      if (5'h13 == io_writeRfOp_addr) begin // @[Regfile.scala 17:35]
        rf_19 <= io_writeRfOp_data; // @[Regfile.scala 17:35]
      end
    end
    if (reset) begin // @[Regfile.scala 12:24]
      rf_20 <= 64'h0; // @[Regfile.scala 12:24]
    end else if (io_writeRfOp_en) begin // @[Regfile.scala 15:26]
      if (5'h14 == io_writeRfOp_addr) begin // @[Regfile.scala 17:35]
        rf_20 <= io_writeRfOp_data; // @[Regfile.scala 17:35]
      end
    end
    if (reset) begin // @[Regfile.scala 12:24]
      rf_21 <= 64'h0; // @[Regfile.scala 12:24]
    end else if (io_writeRfOp_en) begin // @[Regfile.scala 15:26]
      if (5'h15 == io_writeRfOp_addr) begin // @[Regfile.scala 17:35]
        rf_21 <= io_writeRfOp_data; // @[Regfile.scala 17:35]
      end
    end
    if (reset) begin // @[Regfile.scala 12:24]
      rf_22 <= 64'h0; // @[Regfile.scala 12:24]
    end else if (io_writeRfOp_en) begin // @[Regfile.scala 15:26]
      if (5'h16 == io_writeRfOp_addr) begin // @[Regfile.scala 17:35]
        rf_22 <= io_writeRfOp_data; // @[Regfile.scala 17:35]
      end
    end
    if (reset) begin // @[Regfile.scala 12:24]
      rf_23 <= 64'h0; // @[Regfile.scala 12:24]
    end else if (io_writeRfOp_en) begin // @[Regfile.scala 15:26]
      if (5'h17 == io_writeRfOp_addr) begin // @[Regfile.scala 17:35]
        rf_23 <= io_writeRfOp_data; // @[Regfile.scala 17:35]
      end
    end
    if (reset) begin // @[Regfile.scala 12:24]
      rf_24 <= 64'h0; // @[Regfile.scala 12:24]
    end else if (io_writeRfOp_en) begin // @[Regfile.scala 15:26]
      if (5'h18 == io_writeRfOp_addr) begin // @[Regfile.scala 17:35]
        rf_24 <= io_writeRfOp_data; // @[Regfile.scala 17:35]
      end
    end
    if (reset) begin // @[Regfile.scala 12:24]
      rf_25 <= 64'h0; // @[Regfile.scala 12:24]
    end else if (io_writeRfOp_en) begin // @[Regfile.scala 15:26]
      if (5'h19 == io_writeRfOp_addr) begin // @[Regfile.scala 17:35]
        rf_25 <= io_writeRfOp_data; // @[Regfile.scala 17:35]
      end
    end
    if (reset) begin // @[Regfile.scala 12:24]
      rf_26 <= 64'h0; // @[Regfile.scala 12:24]
    end else if (io_writeRfOp_en) begin // @[Regfile.scala 15:26]
      if (5'h1a == io_writeRfOp_addr) begin // @[Regfile.scala 17:35]
        rf_26 <= io_writeRfOp_data; // @[Regfile.scala 17:35]
      end
    end
    if (reset) begin // @[Regfile.scala 12:24]
      rf_27 <= 64'h0; // @[Regfile.scala 12:24]
    end else if (io_writeRfOp_en) begin // @[Regfile.scala 15:26]
      if (5'h1b == io_writeRfOp_addr) begin // @[Regfile.scala 17:35]
        rf_27 <= io_writeRfOp_data; // @[Regfile.scala 17:35]
      end
    end
    if (reset) begin // @[Regfile.scala 12:24]
      rf_28 <= 64'h0; // @[Regfile.scala 12:24]
    end else if (io_writeRfOp_en) begin // @[Regfile.scala 15:26]
      if (5'h1c == io_writeRfOp_addr) begin // @[Regfile.scala 17:35]
        rf_28 <= io_writeRfOp_data; // @[Regfile.scala 17:35]
      end
    end
    if (reset) begin // @[Regfile.scala 12:24]
      rf_29 <= 64'h0; // @[Regfile.scala 12:24]
    end else if (io_writeRfOp_en) begin // @[Regfile.scala 15:26]
      if (5'h1d == io_writeRfOp_addr) begin // @[Regfile.scala 17:35]
        rf_29 <= io_writeRfOp_data; // @[Regfile.scala 17:35]
      end
    end
    if (reset) begin // @[Regfile.scala 12:24]
      rf_30 <= 64'h0; // @[Regfile.scala 12:24]
    end else if (io_writeRfOp_en) begin // @[Regfile.scala 15:26]
      if (5'h1e == io_writeRfOp_addr) begin // @[Regfile.scala 17:35]
        rf_30 <= io_writeRfOp_data; // @[Regfile.scala 17:35]
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
  input         reset,
  input         io_stall,
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
  reg [31:0] inst; // @[pipeline-registers.scala 15:27]
  reg [63:0] pc; // @[pipeline-registers.scala 16:27]
  assign io_pc_o = pc; // @[pipeline-registers.scala 26:15]
  assign io_inst_o = inst; // @[pipeline-registers.scala 25:15]
  always @(posedge clock) begin
    if (reset | io_flush) begin // @[pipeline-registers.scala 18:34]
      inst <= 32'h0; // @[pipeline-registers.scala 19:17]
    end else if (!(io_stall)) begin // @[pipeline-registers.scala 21:25]
      inst <= io_inst_i; // @[pipeline-registers.scala 15:27]
    end
    if (reset | io_flush) begin // @[pipeline-registers.scala 18:34]
      pc <= 64'h0; // @[pipeline-registers.scala 20:17]
    end else if (!(io_stall)) begin // @[pipeline-registers.scala 21:25]
      pc <= io_pc_i; // @[pipeline-registers.scala 16:27]
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
  input  [4:0]  io_fwd_rf_ex_addr,
  input  [63:0] io_fwd_rf_ex_data,
  input  [4:0]  io_fwd_rf_mem_addr,
  input  [63:0] io_fwd_rf_mem_data,
  input  [4:0]  io_fwd_rf_wb_addr,
  input  [63:0] io_fwd_rf_wb_data,
  input  [11:0] io_fwd_csr_ex_addr,
  input  [63:0] io_fwd_csr_ex_data,
  input  [11:0] io_fwd_csr_mem_addr,
  input  [63:0] io_fwd_csr_mem_data,
  input  [11:0] io_fwd_csr_wb_addr,
  input  [63:0] io_fwd_csr_wb_data,
  input  [63:0] io_CSR_2_ID_data,
  input         io_CSR_2_ID_legalWrite,
  input         io_CSR_2_ID_legalRead,
  input  [1:0]  io_CSR_2_ID_priv,
  input  [63:0] io_CSR_2_ID_xtvec,
  input  [63:0] io_CSR_2_ID_xepc,
  input         io_prev_is_load,
  input  [4:0]  io_prev_rd,
  output [11:0] io_ID_2_CSR_addr,
  output [63:0] io_ID_2_CSR_wdata,
  output [4:0]  io_id2Rf_ReadIdx1,
  output [4:0]  io_id2Rf_ReadIdx2,
  output [63:0] io_decInfo_oprand1,
  output [63:0] io_decInfo_oprand2,
  output [4:0]  io_decInfo_rd,
  output [2:0]  io_decInfo_InstType,
  output [4:0]  io_decInfo_aluop,
  output        io_decInfo_branchOp_taken,
  output [63:0] io_decInfo_branchOp_target,
  output        io_decInfo_storeOp_en,
  output [63:0] io_decInfo_storeOp_data,
  output [1:0]  io_decInfo_storeOp_Width,
  output        io_decInfo_loadOp_isLoad,
  output [1:0]  io_decInfo_loadOp_Width,
  output        io_decInfo_loadOp_sign,
  output        io_decInfo_writeCSROp_en,
  output [11:0] io_decInfo_writeCSROp_addr,
  output [63:0] io_decInfo_writeCSROp_data,
  output        io_flush_req,
  output        io_stall_req,
  output [4:0]  io_exception_cause,
  output [63:0] io_exception_pc,
  output [63:0] io_exception_xtval,
  output        io_exception_happen,
  output [63:0] io_exception_new_pc
);
  wire [2:0] funct3 = io_inst_i[14:12]; // @[Id.scala 26:24]
  wire [11:0] csrAddr = io_inst_i[31:20]; // @[Id.scala 27:24]
  wire [4:0] rs1 = io_inst_i[19:15]; // @[Id.scala 35:24]
  wire [4:0] rs2 = io_inst_i[24:20]; // @[Id.scala 36:24]
  wire [4:0] rd = io_inst_i[11:7]; // @[Id.scala 37:24]
  wire [11:0] _imm_I_T_1 = io_inst_i[31:20]; // @[helpers.scala 14:47]
  wire [63:0] imm_I = {{52{_imm_I_T_1[11]}},_imm_I_T_1}; // @[helpers.scala 14:62]
  wire [11:0] _imm_S_T_3 = {io_inst_i[31:25],rd}; // @[helpers.scala 14:47]
  wire [63:0] imm_S = {{52{_imm_S_T_3[11]}},_imm_S_T_3}; // @[helpers.scala 14:62]
  wire [12:0] _imm_B_T_5 = {io_inst_i[31],io_inst_i[7],io_inst_i[30:25],io_inst_i[11:8],1'h0}; // @[helpers.scala 14:47]
  wire [63:0] imm_B = {{51{_imm_B_T_5[12]}},_imm_B_T_5}; // @[helpers.scala 14:62]
  wire [20:0] _imm_J_T_5 = {io_inst_i[31],io_inst_i[19:12],io_inst_i[20],io_inst_i[30:21],1'h0}; // @[helpers.scala 14:47]
  wire [63:0] imm_J = {{43{_imm_J_T_5[20]}},_imm_J_T_5}; // @[helpers.scala 14:62]
  wire [19:0] _imm_U_T_1 = io_inst_i[31:12]; // @[helpers.scala 14:47]
  wire [63:0] imm_U = {{44{_imm_U_T_1[19]}},_imm_U_T_1}; // @[helpers.scala 14:62]
  wire [63:0] branch_target = imm_B + io_pc; // @[Id.scala 46:33]
  wire [63:0] jal_target = imm_J + io_pc; // @[Id.scala 47:33]
  wire [63:0] jalr_target = imm_I + io_pc; // @[Id.scala 48:33]
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
  wire  _decRes_T_85 = 32'h37 == _decRes_T_80; // @[Lookup.scala 31:38]
  wire  _decRes_T_87 = 32'h17 == _decRes_T_80; // @[Lookup.scala 31:38]
  wire  _decRes_T_89 = 32'h73 == _decRes_T_80; // @[Lookup.scala 31:38]
  wire  _decRes_T_91 = 32'h1b == _decRes_T_20; // @[Lookup.scala 31:38]
  wire  _decRes_T_93 = 32'h101b == _decRes_T; // @[Lookup.scala 31:38]
  wire  _decRes_T_95 = 32'h501b == _decRes_T; // @[Lookup.scala 31:38]
  wire  _decRes_T_97 = 32'h4000501b == _decRes_T; // @[Lookup.scala 31:38]
  wire  _decRes_T_99 = 32'h3b == _decRes_T; // @[Lookup.scala 31:38]
  wire  _decRes_T_101 = 32'h4000003b == _decRes_T; // @[Lookup.scala 31:38]
  wire  _decRes_T_103 = 32'h103b == _decRes_T; // @[Lookup.scala 31:38]
  wire  _decRes_T_105 = 32'h503b == _decRes_T; // @[Lookup.scala 31:38]
  wire  _decRes_T_107 = 32'h4000503b == _decRes_T; // @[Lookup.scala 31:38]
  wire  _decRes_T_109 = 32'h6003 == _decRes_T_20; // @[Lookup.scala 31:38]
  wire  _decRes_T_111 = 32'h3003 == _decRes_T_20; // @[Lookup.scala 31:38]
  wire  _decRes_T_113 = 32'h3023 == _decRes_T_20; // @[Lookup.scala 31:38]
  wire  _decRes_T_115 = 32'h200003b == _decRes_T; // @[Lookup.scala 31:38]
  wire  _decRes_T_117 = 32'h200403b == _decRes_T; // @[Lookup.scala 31:38]
  wire  _decRes_T_119 = 32'h200503b == _decRes_T; // @[Lookup.scala 31:38]
  wire  _decRes_T_121 = 32'h200603b == _decRes_T; // @[Lookup.scala 31:38]
  wire  _decRes_T_123 = 32'h200703b == _decRes_T; // @[Lookup.scala 31:38]
  wire [3:0] _decRes_T_124 = _decRes_T_123 ? 4'h1 : 4'h0; // @[Lookup.scala 34:39]
  wire [3:0] _decRes_T_125 = _decRes_T_121 ? 4'h1 : _decRes_T_124; // @[Lookup.scala 34:39]
  wire [3:0] _decRes_T_126 = _decRes_T_119 ? 4'h1 : _decRes_T_125; // @[Lookup.scala 34:39]
  wire [3:0] _decRes_T_127 = _decRes_T_117 ? 4'h1 : _decRes_T_126; // @[Lookup.scala 34:39]
  wire [3:0] _decRes_T_128 = _decRes_T_115 ? 4'h1 : _decRes_T_127; // @[Lookup.scala 34:39]
  wire [3:0] _decRes_T_129 = _decRes_T_113 ? 4'h3 : _decRes_T_128; // @[Lookup.scala 34:39]
  wire [3:0] _decRes_T_130 = _decRes_T_111 ? 4'h2 : _decRes_T_129; // @[Lookup.scala 34:39]
  wire [3:0] _decRes_T_131 = _decRes_T_109 ? 4'h2 : _decRes_T_130; // @[Lookup.scala 34:39]
  wire [3:0] _decRes_T_132 = _decRes_T_107 ? 4'h1 : _decRes_T_131; // @[Lookup.scala 34:39]
  wire [3:0] _decRes_T_133 = _decRes_T_105 ? 4'h1 : _decRes_T_132; // @[Lookup.scala 34:39]
  wire [3:0] _decRes_T_134 = _decRes_T_103 ? 4'h1 : _decRes_T_133; // @[Lookup.scala 34:39]
  wire [3:0] _decRes_T_135 = _decRes_T_101 ? 4'h1 : _decRes_T_134; // @[Lookup.scala 34:39]
  wire [3:0] _decRes_T_136 = _decRes_T_99 ? 4'h1 : _decRes_T_135; // @[Lookup.scala 34:39]
  wire [3:0] _decRes_T_137 = _decRes_T_97 ? 4'h2 : _decRes_T_136; // @[Lookup.scala 34:39]
  wire [3:0] _decRes_T_138 = _decRes_T_95 ? 4'h2 : _decRes_T_137; // @[Lookup.scala 34:39]
  wire [3:0] _decRes_T_139 = _decRes_T_93 ? 4'h2 : _decRes_T_138; // @[Lookup.scala 34:39]
  wire [3:0] _decRes_T_140 = _decRes_T_91 ? 4'h2 : _decRes_T_139; // @[Lookup.scala 34:39]
  wire [3:0] _decRes_T_141 = _decRes_T_89 ? 4'h7 : _decRes_T_140; // @[Lookup.scala 34:39]
  wire [3:0] _decRes_T_142 = _decRes_T_87 ? 4'h5 : _decRes_T_141; // @[Lookup.scala 34:39]
  wire [3:0] _decRes_T_143 = _decRes_T_85 ? 4'h5 : _decRes_T_142; // @[Lookup.scala 34:39]
  wire [3:0] _decRes_T_144 = _decRes_T_83 ? 4'h2 : _decRes_T_143; // @[Lookup.scala 34:39]
  wire [3:0] _decRes_T_145 = _decRes_T_81 ? 4'h6 : _decRes_T_144; // @[Lookup.scala 34:39]
  wire [3:0] _decRes_T_146 = _decRes_T_79 ? 4'h4 : _decRes_T_145; // @[Lookup.scala 34:39]
  wire [3:0] _decRes_T_147 = _decRes_T_77 ? 4'h4 : _decRes_T_146; // @[Lookup.scala 34:39]
  wire [3:0] _decRes_T_148 = _decRes_T_75 ? 4'h4 : _decRes_T_147; // @[Lookup.scala 34:39]
  wire [3:0] _decRes_T_149 = _decRes_T_73 ? 4'h4 : _decRes_T_148; // @[Lookup.scala 34:39]
  wire [3:0] _decRes_T_150 = _decRes_T_71 ? 4'h4 : _decRes_T_149; // @[Lookup.scala 34:39]
  wire [3:0] _decRes_T_151 = _decRes_T_69 ? 4'h4 : _decRes_T_150; // @[Lookup.scala 34:39]
  wire [3:0] _decRes_T_152 = _decRes_T_67 ? 4'h1 : _decRes_T_151; // @[Lookup.scala 34:39]
  wire [3:0] _decRes_T_153 = _decRes_T_65 ? 4'h1 : _decRes_T_152; // @[Lookup.scala 34:39]
  wire [3:0] _decRes_T_154 = _decRes_T_63 ? 4'h1 : _decRes_T_153; // @[Lookup.scala 34:39]
  wire [3:0] _decRes_T_155 = _decRes_T_61 ? 4'h1 : _decRes_T_154; // @[Lookup.scala 34:39]
  wire [3:0] _decRes_T_156 = _decRes_T_59 ? 4'h1 : _decRes_T_155; // @[Lookup.scala 34:39]
  wire [3:0] _decRes_T_157 = _decRes_T_57 ? 4'h1 : _decRes_T_156; // @[Lookup.scala 34:39]
  wire [3:0] _decRes_T_158 = _decRes_T_55 ? 4'h1 : _decRes_T_157; // @[Lookup.scala 34:39]
  wire [3:0] _decRes_T_159 = _decRes_T_53 ? 4'h3 : _decRes_T_158; // @[Lookup.scala 34:39]
  wire [3:0] _decRes_T_160 = _decRes_T_51 ? 4'h3 : _decRes_T_159; // @[Lookup.scala 34:39]
  wire [3:0] _decRes_T_161 = _decRes_T_49 ? 4'h3 : _decRes_T_160; // @[Lookup.scala 34:39]
  wire [3:0] _decRes_T_162 = _decRes_T_47 ? 4'h2 : _decRes_T_161; // @[Lookup.scala 34:39]
  wire [3:0] _decRes_T_163 = _decRes_T_45 ? 4'h2 : _decRes_T_162; // @[Lookup.scala 34:39]
  wire [3:0] _decRes_T_164 = _decRes_T_43 ? 4'h2 : _decRes_T_163; // @[Lookup.scala 34:39]
  wire [3:0] _decRes_T_165 = _decRes_T_41 ? 4'h2 : _decRes_T_164; // @[Lookup.scala 34:39]
  wire [3:0] _decRes_T_166 = _decRes_T_39 ? 4'h2 : _decRes_T_165; // @[Lookup.scala 34:39]
  wire [3:0] _decRes_T_167 = _decRes_T_37 ? 4'h2 : _decRes_T_166; // @[Lookup.scala 34:39]
  wire [3:0] _decRes_T_168 = _decRes_T_35 ? 4'h2 : _decRes_T_167; // @[Lookup.scala 34:39]
  wire [3:0] _decRes_T_169 = _decRes_T_33 ? 4'h2 : _decRes_T_168; // @[Lookup.scala 34:39]
  wire [3:0] _decRes_T_170 = _decRes_T_31 ? 4'h2 : _decRes_T_169; // @[Lookup.scala 34:39]
  wire [3:0] _decRes_T_171 = _decRes_T_29 ? 4'h2 : _decRes_T_170; // @[Lookup.scala 34:39]
  wire [3:0] _decRes_T_172 = _decRes_T_27 ? 4'h2 : _decRes_T_171; // @[Lookup.scala 34:39]
  wire [3:0] _decRes_T_173 = _decRes_T_25 ? 4'h2 : _decRes_T_172; // @[Lookup.scala 34:39]
  wire [3:0] _decRes_T_174 = _decRes_T_23 ? 4'h2 : _decRes_T_173; // @[Lookup.scala 34:39]
  wire [3:0] _decRes_T_175 = _decRes_T_21 ? 4'h2 : _decRes_T_174; // @[Lookup.scala 34:39]
  wire [3:0] _decRes_T_176 = _decRes_T_19 ? 4'h1 : _decRes_T_175; // @[Lookup.scala 34:39]
  wire [3:0] _decRes_T_177 = _decRes_T_17 ? 4'h1 : _decRes_T_176; // @[Lookup.scala 34:39]
  wire [3:0] _decRes_T_178 = _decRes_T_15 ? 4'h1 : _decRes_T_177; // @[Lookup.scala 34:39]
  wire [3:0] _decRes_T_179 = _decRes_T_13 ? 4'h1 : _decRes_T_178; // @[Lookup.scala 34:39]
  wire [3:0] _decRes_T_180 = _decRes_T_11 ? 4'h1 : _decRes_T_179; // @[Lookup.scala 34:39]
  wire [3:0] _decRes_T_181 = _decRes_T_9 ? 4'h1 : _decRes_T_180; // @[Lookup.scala 34:39]
  wire [3:0] _decRes_T_182 = _decRes_T_7 ? 4'h1 : _decRes_T_181; // @[Lookup.scala 34:39]
  wire [3:0] _decRes_T_183 = _decRes_T_5 ? 4'h1 : _decRes_T_182; // @[Lookup.scala 34:39]
  wire [3:0] _decRes_T_184 = _decRes_T_3 ? 4'h1 : _decRes_T_183; // @[Lookup.scala 34:39]
  wire [3:0] decRes_0 = _decRes_T_1 ? 4'h1 : _decRes_T_184; // @[Lookup.scala 34:39]
  wire [4:0] _decRes_T_189 = _decRes_T_115 ? 5'hb : 5'h0; // @[Lookup.scala 34:39]
  wire [4:0] _decRes_T_190 = _decRes_T_113 ? 5'h0 : _decRes_T_189; // @[Lookup.scala 34:39]
  wire [4:0] _decRes_T_191 = _decRes_T_111 ? 5'h0 : _decRes_T_190; // @[Lookup.scala 34:39]
  wire [4:0] _decRes_T_192 = _decRes_T_109 ? 5'h0 : _decRes_T_191; // @[Lookup.scala 34:39]
  wire [4:0] _decRes_T_193 = _decRes_T_107 ? 5'h14 : _decRes_T_192; // @[Lookup.scala 34:39]
  wire [4:0] _decRes_T_194 = _decRes_T_105 ? 5'h13 : _decRes_T_193; // @[Lookup.scala 34:39]
  wire [4:0] _decRes_T_195 = _decRes_T_103 ? 5'h12 : _decRes_T_194; // @[Lookup.scala 34:39]
  wire [4:0] _decRes_T_196 = _decRes_T_101 ? 5'h11 : _decRes_T_195; // @[Lookup.scala 34:39]
  wire [4:0] _decRes_T_197 = _decRes_T_99 ? 5'h10 : _decRes_T_196; // @[Lookup.scala 34:39]
  wire [4:0] _decRes_T_198 = _decRes_T_97 ? 5'h14 : _decRes_T_197; // @[Lookup.scala 34:39]
  wire [4:0] _decRes_T_199 = _decRes_T_95 ? 5'h13 : _decRes_T_198; // @[Lookup.scala 34:39]
  wire [4:0] _decRes_T_200 = _decRes_T_93 ? 5'h12 : _decRes_T_199; // @[Lookup.scala 34:39]
  wire [4:0] _decRes_T_201 = _decRes_T_91 ? 5'h10 : _decRes_T_200; // @[Lookup.scala 34:39]
  wire [4:0] _decRes_T_202 = _decRes_T_89 ? 5'h0 : _decRes_T_201; // @[Lookup.scala 34:39]
  wire [4:0] _decRes_T_203 = _decRes_T_87 ? 5'h19 : _decRes_T_202; // @[Lookup.scala 34:39]
  wire [4:0] _decRes_T_204 = _decRes_T_85 ? 5'h18 : _decRes_T_203; // @[Lookup.scala 34:39]
  wire [4:0] _decRes_T_205 = _decRes_T_83 ? 5'ha : _decRes_T_204; // @[Lookup.scala 34:39]
  wire [4:0] _decRes_T_206 = _decRes_T_81 ? 5'h0 : _decRes_T_205; // @[Lookup.scala 34:39]
  wire [4:0] _decRes_T_207 = _decRes_T_79 ? 5'h7 : _decRes_T_206; // @[Lookup.scala 34:39]
  wire [4:0] _decRes_T_208 = _decRes_T_77 ? 5'h6 : _decRes_T_207; // @[Lookup.scala 34:39]
  wire [4:0] _decRes_T_209 = _decRes_T_75 ? 5'h5 : _decRes_T_208; // @[Lookup.scala 34:39]
  wire [4:0] _decRes_T_210 = _decRes_T_73 ? 5'h4 : _decRes_T_209; // @[Lookup.scala 34:39]
  wire [4:0] _decRes_T_211 = _decRes_T_71 ? 5'h1 : _decRes_T_210; // @[Lookup.scala 34:39]
  wire [4:0] _decRes_T_212 = _decRes_T_69 ? 5'h0 : _decRes_T_211; // @[Lookup.scala 34:39]
  wire [4:0] _decRes_T_213 = _decRes_T_67 ? 5'h1d : _decRes_T_212; // @[Lookup.scala 34:39]
  wire [4:0] _decRes_T_214 = _decRes_T_65 ? 5'h1c : _decRes_T_213; // @[Lookup.scala 34:39]
  wire [4:0] _decRes_T_215 = _decRes_T_63 ? 5'h1b : _decRes_T_214; // @[Lookup.scala 34:39]
  wire [4:0] _decRes_T_216 = _decRes_T_61 ? 5'h1a : _decRes_T_215; // @[Lookup.scala 34:39]
  wire [4:0] _decRes_T_217 = _decRes_T_59 ? 5'hd : _decRes_T_216; // @[Lookup.scala 34:39]
  wire [4:0] _decRes_T_218 = _decRes_T_57 ? 5'hc : _decRes_T_217; // @[Lookup.scala 34:39]
  wire [4:0] _decRes_T_219 = _decRes_T_55 ? 5'hb : _decRes_T_218; // @[Lookup.scala 34:39]
  wire [4:0] _decRes_T_220 = _decRes_T_53 ? 5'h0 : _decRes_T_219; // @[Lookup.scala 34:39]
  wire [4:0] _decRes_T_221 = _decRes_T_51 ? 5'h0 : _decRes_T_220; // @[Lookup.scala 34:39]
  wire [4:0] _decRes_T_222 = _decRes_T_49 ? 5'h0 : _decRes_T_221; // @[Lookup.scala 34:39]
  wire [4:0] _decRes_T_223 = _decRes_T_47 ? 5'h0 : _decRes_T_222; // @[Lookup.scala 34:39]
  wire [4:0] _decRes_T_224 = _decRes_T_45 ? 5'h0 : _decRes_T_223; // @[Lookup.scala 34:39]
  wire [4:0] _decRes_T_225 = _decRes_T_43 ? 5'h0 : _decRes_T_224; // @[Lookup.scala 34:39]
  wire [4:0] _decRes_T_226 = _decRes_T_41 ? 5'h0 : _decRes_T_225; // @[Lookup.scala 34:39]
  wire [4:0] _decRes_T_227 = _decRes_T_39 ? 5'h0 : _decRes_T_226; // @[Lookup.scala 34:39]
  wire [4:0] _decRes_T_228 = _decRes_T_37 ? 5'h9 : _decRes_T_227; // @[Lookup.scala 34:39]
  wire [4:0] _decRes_T_229 = _decRes_T_35 ? 5'h8 : _decRes_T_228; // @[Lookup.scala 34:39]
  wire [4:0] _decRes_T_230 = _decRes_T_33 ? 5'h7 : _decRes_T_229; // @[Lookup.scala 34:39]
  wire [4:0] _decRes_T_231 = _decRes_T_31 ? 5'h6 : _decRes_T_230; // @[Lookup.scala 34:39]
  wire [4:0] _decRes_T_232 = _decRes_T_29 ? 5'h5 : _decRes_T_231; // @[Lookup.scala 34:39]
  wire [4:0] _decRes_T_233 = _decRes_T_27 ? 5'h4 : _decRes_T_232; // @[Lookup.scala 34:39]
  wire [4:0] _decRes_T_234 = _decRes_T_25 ? 5'h3 : _decRes_T_233; // @[Lookup.scala 34:39]
  wire [4:0] _decRes_T_235 = _decRes_T_23 ? 5'h2 : _decRes_T_234; // @[Lookup.scala 34:39]
  wire [4:0] _decRes_T_236 = _decRes_T_21 ? 5'h0 : _decRes_T_235; // @[Lookup.scala 34:39]
  wire [4:0] _decRes_T_237 = _decRes_T_19 ? 5'h6 : _decRes_T_236; // @[Lookup.scala 34:39]
  wire [4:0] _decRes_T_238 = _decRes_T_17 ? 5'h5 : _decRes_T_237; // @[Lookup.scala 34:39]
  wire [4:0] _decRes_T_239 = _decRes_T_15 ? 5'h9 : _decRes_T_238; // @[Lookup.scala 34:39]
  wire [4:0] _decRes_T_240 = _decRes_T_13 ? 5'h8 : _decRes_T_239; // @[Lookup.scala 34:39]
  wire [4:0] _decRes_T_241 = _decRes_T_11 ? 5'h4 : _decRes_T_240; // @[Lookup.scala 34:39]
  wire [4:0] _decRes_T_242 = _decRes_T_9 ? 5'h3 : _decRes_T_241; // @[Lookup.scala 34:39]
  wire [4:0] _decRes_T_243 = _decRes_T_7 ? 5'h2 : _decRes_T_242; // @[Lookup.scala 34:39]
  wire [4:0] _decRes_T_244 = _decRes_T_5 ? 5'h7 : _decRes_T_243; // @[Lookup.scala 34:39]
  wire [4:0] _decRes_T_245 = _decRes_T_3 ? 5'h1 : _decRes_T_244; // @[Lookup.scala 34:39]
  wire [4:0] decOpt = _decRes_T_1 ? 5'h0 : _decRes_T_245; // @[Lookup.scala 34:39]
  wire  _rs1Val_T = rs1 == 5'h0; // @[Id.scala 55:14]
  wire  _rs1Val_T_1 = rs1 == io_fwd_rf_wb_addr; // @[Id.scala 56:14]
  wire  _rs1Val_T_2 = rs1 == io_fwd_rf_mem_addr; // @[Id.scala 57:14]
  wire  _rs1Val_T_3 = rs1 == io_fwd_rf_ex_addr; // @[Id.scala 58:14]
  wire [63:0] _rs1Val_T_4 = _rs1Val_T_3 ? io_fwd_rf_ex_data : io_rf2Id_RegData1; // @[Mux.scala 47:70]
  wire [63:0] _rs1Val_T_5 = _rs1Val_T_2 ? io_fwd_rf_mem_data : _rs1Val_T_4; // @[Mux.scala 47:70]
  wire [63:0] _rs1Val_T_6 = _rs1Val_T_1 ? io_fwd_rf_wb_data : _rs1Val_T_5; // @[Mux.scala 47:70]
  wire [63:0] rs1Val = _rs1Val_T ? 64'h0 : _rs1Val_T_6; // @[Mux.scala 47:70]
  wire  _rs2Val_T = rs2 == 5'h0; // @[Id.scala 63:14]
  wire  _rs2Val_T_1 = rs2 == io_fwd_rf_wb_addr; // @[Id.scala 64:14]
  wire  _rs2Val_T_2 = rs2 == io_fwd_rf_mem_addr; // @[Id.scala 65:14]
  wire  _rs2Val_T_3 = rs2 == io_fwd_rf_ex_addr; // @[Id.scala 66:14]
  wire [63:0] _rs2Val_T_4 = _rs2Val_T_3 ? io_fwd_rf_ex_data : io_rf2Id_RegData2; // @[Mux.scala 47:70]
  wire [63:0] _rs2Val_T_5 = _rs2Val_T_2 ? io_fwd_rf_mem_data : _rs2Val_T_4; // @[Mux.scala 47:70]
  wire [63:0] _rs2Val_T_6 = _rs2Val_T_1 ? io_fwd_rf_wb_data : _rs2Val_T_5; // @[Mux.scala 47:70]
  wire [63:0] rs2Val = _rs2Val_T ? 64'h0 : _rs2Val_T_6; // @[Mux.scala 47:70]
  wire  _csrVal_T = csrAddr == io_fwd_csr_wb_addr; // @[Id.scala 71:18]
  wire  _csrVal_T_1 = csrAddr == io_fwd_csr_mem_addr; // @[Id.scala 72:18]
  wire  _csrVal_T_2 = csrAddr == io_fwd_csr_ex_addr; // @[Id.scala 73:18]
  wire [63:0] _csrVal_T_3 = _csrVal_T_2 ? io_fwd_csr_ex_data : io_CSR_2_ID_data; // @[Mux.scala 47:70]
  wire [63:0] _csrVal_T_4 = _csrVal_T_1 ? io_fwd_csr_mem_data : _csrVal_T_3; // @[Mux.scala 47:70]
  wire [63:0] csrVal = _csrVal_T ? io_fwd_csr_wb_data : _csrVal_T_4; // @[Mux.scala 47:70]
  wire  csr_useImm = funct3[2]; // @[Id.scala 78:29]
  wire [63:0] rsVal = csr_useImm ? {{59'd0}, rs1} : rs1Val; // @[Id.scala 79:26]
  wire [63:0] _csrNewVal_T = csrVal | rsVal; // @[Id.scala 82:29]
  wire [63:0] _csrNewVal_T_1 = ~rsVal; // @[Id.scala 83:31]
  wire [63:0] _csrNewVal_T_2 = csrVal & _csrNewVal_T_1; // @[Id.scala 83:29]
  wire [63:0] _csrNewVal_T_4 = 3'h1 == funct3 ? rs1Val : 64'h0; // @[Mux.scala 81:58]
  wire [63:0] _csrNewVal_T_6 = 3'h2 == funct3 ? _csrNewVal_T : _csrNewVal_T_4; // @[Mux.scala 81:58]
  wire [63:0] csrNewVal = 3'h3 == funct3 ? _csrNewVal_T_2 : _csrNewVal_T_6; // @[Mux.scala 81:58]
  wire [1:0] _io_decInfo_loadOp_Width_T_5 = 3'h2 == funct3 ? 2'h2 : {{1'd0}, 3'h1 == funct3}; // @[Mux.scala 81:58]
  wire [1:0] _io_decInfo_loadOp_Width_T_7 = 3'h4 == funct3 ? 2'h0 : _io_decInfo_loadOp_Width_T_5; // @[Mux.scala 81:58]
  wire [1:0] _io_decInfo_loadOp_Width_T_9 = 3'h5 == funct3 ? 2'h1 : _io_decInfo_loadOp_Width_T_7; // @[Mux.scala 81:58]
  wire [1:0] _io_decInfo_loadOp_Width_T_11 = 3'h6 == funct3 ? 2'h2 : _io_decInfo_loadOp_Width_T_9; // @[Mux.scala 81:58]
  wire  _io_decInfo_loadOp_sign_T_7 = 3'h4 == funct3 ? 1'h0 : 3'h2 == funct3 | (3'h1 == funct3 | 3'h0 == funct3); // @[Mux.scala 81:58]
  wire  _io_decInfo_loadOp_sign_T_9 = 3'h5 == funct3 ? 1'h0 : _io_decInfo_loadOp_sign_T_7; // @[Mux.scala 81:58]
  wire  _io_decInfo_loadOp_sign_T_11 = 3'h6 == funct3 ? 1'h0 : _io_decInfo_loadOp_sign_T_9; // @[Mux.scala 81:58]
  wire  _T_4 = io_prev_rd == rs1 | io_prev_rd == rs2; // @[Id.scala 120:33]
  wire  _io_exception_happen_T_1 = io_inst_i == 32'h0 ? 1'h0 : 1'h1; // @[Id.scala 129:43]
  wire  _T_8 = decOpt == 5'ha; // @[Id.scala 145:39]
  wire [63:0] _GEN_5 = decOpt == 5'ha ? io_pc : rs1Val; // @[Id.scala 140:37 145:56 146:37]
  wire [63:0] _GEN_6 = decOpt == 5'ha ? 64'h4 : imm_I; // @[Id.scala 141:37 145:56 147:37]
  wire [63:0] _GEN_8 = decOpt == 5'ha ? jalr_target : 64'h0; // @[Id.scala 145:56 149:45 86:25]
  wire [1:0] _io_decInfo_storeOp_Width_T_7 = 3'h3 == funct3 ? 2'h3 : _io_decInfo_loadOp_Width_T_5; // @[Mux.scala 81:58]
  wire  _taken_T = rs1Val == rs2Val; // @[Id.scala 165:35]
  wire  _taken_T_1 = rs1Val != rs2Val; // @[Id.scala 166:35]
  wire [63:0] _taken_T_2 = _rs1Val_T ? 64'h0 : _rs1Val_T_6; // @[Id.scala 167:34]
  wire [63:0] _taken_T_3 = _rs2Val_T ? 64'h0 : _rs2Val_T_6; // @[Id.scala 167:51]
  wire  _taken_T_4 = $signed(_taken_T_2) < $signed(_taken_T_3); // @[Id.scala 167:41]
  wire  _taken_T_7 = $signed(_taken_T_2) >= $signed(_taken_T_3); // @[Id.scala 168:41]
  wire  _taken_T_8 = rs1Val < rs2Val; // @[Id.scala 169:35]
  wire  _taken_T_9 = rs1Val >= rs2Val; // @[Id.scala 170:35]
  wire  _taken_T_13 = 3'h1 == funct3 ? _taken_T_1 : 3'h0 == funct3 & _taken_T; // @[Mux.scala 81:58]
  wire  _taken_T_15 = 3'h4 == funct3 ? _taken_T_4 : _taken_T_13; // @[Mux.scala 81:58]
  wire  _taken_T_17 = 3'h5 == funct3 ? _taken_T_7 : _taken_T_15; // @[Mux.scala 81:58]
  wire  _taken_T_19 = 3'h6 == funct3 ? _taken_T_8 : _taken_T_17; // @[Mux.scala 81:58]
  wire  taken = 3'h7 == funct3 ? _taken_T_9 : _taken_T_19; // @[Mux.scala 81:58]
  wire [63:0] _io_decInfo_oprand1_T_1 = io_inst_i[5] ? 64'h0 : io_pc; // @[Id.scala 185:40]
  wire [75:0] _io_decInfo_oprand2_T = {imm_U, 12'h0}; // @[Id.scala 186:43]
  wire [4:0] _io_decInfo_rd_T = io_CSR_2_ID_legalRead ? rd : 5'h0; // @[Id.scala 193:52]
  wire [63:0] _io_decInfo_writeCSROp_data_T = io_CSR_2_ID_legalWrite ? csrNewVal : 64'h0; // @[Id.scala 198:52]
  wire [11:0] _io_decInfo_writeCSROp_addr_T = io_CSR_2_ID_legalWrite ? csrAddr : 12'h0; // @[Id.scala 199:52]
  wire [1:0] inst_p2 = io_inst_i[21:20]; // @[Id.scala 202:43]
  wire [1:0] X = io_inst_i[29:28]; // @[Id.scala 203:43]
  wire [4:0] cause = io_CSR_2_ID_priv >= X ? 5'h10 : 5'h2; // @[Id.scala 208:47]
  wire  new_pc_Sel = cause[4]; // @[Id.scala 209:49]
  wire [63:0] _io_exception_new_pc_T = new_pc_Sel ? io_CSR_2_ID_xepc : io_CSR_2_ID_xtvec; // @[Id.scala 212:52]
  wire [4:0] _GEN_10 = 2'h2 == inst_p2 ? cause : 5'h0; // @[Id.scala 206:32 211:45 99:25]
  wire [63:0] _GEN_11 = 2'h2 == inst_p2 ? _io_exception_new_pc_T : io_CSR_2_ID_xtvec; // @[Id.scala 102:25 206:32 212:45]
  wire [4:0] _GEN_12 = |funct3 ? _io_decInfo_rd_T : 5'h0; // @[Id.scala 192:29 193:45 86:25]
  wire [63:0] _GEN_14 = |funct3 ? csrVal : 64'h0; // @[Id.scala 192:29 195:45 86:25]
  wire [63:0] _GEN_16 = |funct3 ? _io_decInfo_writeCSROp_data_T : 64'h0; // @[Id.scala 192:29 198:45 86:25]
  wire [11:0] _GEN_17 = |funct3 ? _io_decInfo_writeCSROp_addr_T : 12'h0; // @[Id.scala 192:29 199:45 86:25]
  wire  _GEN_18 = |funct3 & io_CSR_2_ID_legalWrite; // @[Id.scala 192:29 200:45 86:25]
  wire  _GEN_19 = |funct3 ? 1'h0 : 1'h1; // @[Id.scala 192:29 97:25 204:37]
  wire [4:0] _GEN_20 = |funct3 ? 5'h0 : _GEN_10; // @[Id.scala 192:29 99:25]
  wire [63:0] _GEN_21 = |funct3 ? io_CSR_2_ID_xtvec : _GEN_11; // @[Id.scala 102:25 192:29]
  wire [4:0] _GEN_22 = 4'h7 == decRes_0 ? _GEN_12 : 5'h0; // @[Id.scala 125:21 86:25]
  wire [63:0] _GEN_24 = 4'h7 == decRes_0 ? _GEN_14 : 64'h0; // @[Id.scala 125:21 86:25]
  wire [63:0] _GEN_26 = 4'h7 == decRes_0 ? _GEN_16 : 64'h0; // @[Id.scala 125:21 86:25]
  wire [11:0] _GEN_27 = 4'h7 == decRes_0 ? _GEN_17 : 12'h0; // @[Id.scala 125:21 86:25]
  wire [4:0] _GEN_30 = 4'h7 == decRes_0 ? _GEN_20 : 5'h0; // @[Id.scala 125:21 99:25]
  wire [63:0] _GEN_31 = 4'h7 == decRes_0 ? _GEN_21 : io_CSR_2_ID_xtvec; // @[Id.scala 125:21 102:25]
  wire [63:0] _GEN_32 = 4'h5 == decRes_0 ? _io_decInfo_oprand1_T_1 : _GEN_24; // @[Id.scala 125:21 185:33]
  wire [75:0] _GEN_33 = 4'h5 == decRes_0 ? _io_decInfo_oprand2_T : 76'h0; // @[Id.scala 125:21 186:33]
  wire [4:0] _GEN_35 = 4'h5 == decRes_0 ? rd : _GEN_22; // @[Id.scala 125:21 188:33]
  wire [63:0] _GEN_36 = 4'h5 == decRes_0 ? 64'h0 : _GEN_26; // @[Id.scala 125:21 86:25]
  wire [11:0] _GEN_37 = 4'h5 == decRes_0 ? 12'h0 : _GEN_27; // @[Id.scala 125:21 86:25]
  wire  _GEN_38 = 4'h5 == decRes_0 ? 1'h0 : 4'h7 == decRes_0 & _GEN_18; // @[Id.scala 125:21 86:25]
  wire  _GEN_39 = 4'h5 == decRes_0 ? 1'h0 : 4'h7 == decRes_0 & _GEN_19; // @[Id.scala 125:21 97:25]
  wire [4:0] _GEN_40 = 4'h5 == decRes_0 ? 5'h0 : _GEN_30; // @[Id.scala 125:21 99:25]
  wire [63:0] _GEN_41 = 4'h5 == decRes_0 ? io_CSR_2_ID_xtvec : _GEN_31; // @[Id.scala 125:21 102:25]
  wire [63:0] _GEN_42 = 4'h6 == decRes_0 ? io_pc : _GEN_32; // @[Id.scala 125:21 177:41]
  wire [75:0] _GEN_43 = 4'h6 == decRes_0 ? 76'h4 : _GEN_33; // @[Id.scala 125:21 178:41]
  wire [63:0] _GEN_46 = 4'h6 == decRes_0 ? jal_target : 64'h0; // @[Id.scala 125:21 181:41 86:25]
  wire [4:0] _GEN_48 = 4'h6 == decRes_0 ? 5'h0 : _GEN_35; // @[Id.scala 125:21 86:25]
  wire [63:0] _GEN_49 = 4'h6 == decRes_0 ? 64'h0 : _GEN_36; // @[Id.scala 125:21 86:25]
  wire [11:0] _GEN_50 = 4'h6 == decRes_0 ? 12'h0 : _GEN_37; // @[Id.scala 125:21 86:25]
  wire  _GEN_51 = 4'h6 == decRes_0 ? 1'h0 : _GEN_38; // @[Id.scala 125:21 86:25]
  wire  _GEN_52 = 4'h6 == decRes_0 ? 1'h0 : _GEN_39; // @[Id.scala 125:21 97:25]
  wire [4:0] _GEN_53 = 4'h6 == decRes_0 ? 5'h0 : _GEN_40; // @[Id.scala 125:21 99:25]
  wire [63:0] _GEN_54 = 4'h6 == decRes_0 ? io_CSR_2_ID_xtvec : _GEN_41; // @[Id.scala 125:21 102:25]
  wire  _GEN_55 = 4'h4 == decRes_0 ? taken : 4'h6 == decRes_0; // @[Id.scala 125:21 172:41]
  wire [63:0] _GEN_56 = 4'h4 == decRes_0 ? branch_target : _GEN_46; // @[Id.scala 125:21 173:41]
  wire [63:0] _GEN_58 = 4'h4 == decRes_0 ? 64'h0 : _GEN_42; // @[Id.scala 125:21 86:25]
  wire [75:0] _GEN_59 = 4'h4 == decRes_0 ? 76'h0 : _GEN_43; // @[Id.scala 125:21 86:25]
  wire [4:0] _GEN_61 = 4'h4 == decRes_0 ? 5'h0 : _GEN_48; // @[Id.scala 125:21 86:25]
  wire [63:0] _GEN_62 = 4'h4 == decRes_0 ? 64'h0 : _GEN_49; // @[Id.scala 125:21 86:25]
  wire [11:0] _GEN_63 = 4'h4 == decRes_0 ? 12'h0 : _GEN_50; // @[Id.scala 125:21 86:25]
  wire  _GEN_64 = 4'h4 == decRes_0 ? 1'h0 : _GEN_51; // @[Id.scala 125:21 86:25]
  wire  _GEN_65 = 4'h4 == decRes_0 ? 1'h0 : _GEN_52; // @[Id.scala 125:21 97:25]
  wire [4:0] _GEN_66 = 4'h4 == decRes_0 ? 5'h0 : _GEN_53; // @[Id.scala 125:21 99:25]
  wire [63:0] _GEN_67 = 4'h4 == decRes_0 ? io_CSR_2_ID_xtvec : _GEN_54; // @[Id.scala 125:21 102:25]
  wire [63:0] _GEN_68 = 4'h3 == decRes_0 ? rs1Val : _GEN_58; // @[Id.scala 125:21 154:38]
  wire [75:0] _GEN_69 = 4'h3 == decRes_0 ? {{12'd0}, imm_S} : _GEN_59; // @[Id.scala 125:21 155:38]
  wire [63:0] _GEN_70 = 4'h3 == decRes_0 ? rs2Val : 64'h0; // @[Id.scala 125:21 157:38 86:25]
  wire [1:0] _GEN_72 = 4'h3 == decRes_0 ? _io_decInfo_storeOp_Width_T_7 : 2'h0; // @[Id.scala 125:21 159:38 86:25]
  wire  _GEN_73 = 4'h3 == decRes_0 ? 1'h0 : _GEN_55; // @[Id.scala 125:21 86:25]
  wire [63:0] _GEN_74 = 4'h3 == decRes_0 ? 64'h0 : _GEN_56; // @[Id.scala 125:21 86:25]
  wire [4:0] _GEN_77 = 4'h3 == decRes_0 ? 5'h0 : _GEN_61; // @[Id.scala 125:21 86:25]
  wire [63:0] _GEN_78 = 4'h3 == decRes_0 ? 64'h0 : _GEN_62; // @[Id.scala 125:21 86:25]
  wire [11:0] _GEN_79 = 4'h3 == decRes_0 ? 12'h0 : _GEN_63; // @[Id.scala 125:21 86:25]
  wire  _GEN_80 = 4'h3 == decRes_0 ? 1'h0 : _GEN_64; // @[Id.scala 125:21 86:25]
  wire  _GEN_81 = 4'h3 == decRes_0 ? 1'h0 : _GEN_65; // @[Id.scala 125:21 97:25]
  wire [4:0] _GEN_82 = 4'h3 == decRes_0 ? 5'h0 : _GEN_66; // @[Id.scala 125:21 99:25]
  wire [63:0] _GEN_83 = 4'h3 == decRes_0 ? io_CSR_2_ID_xtvec : _GEN_67; // @[Id.scala 125:21 102:25]
  wire [63:0] _GEN_84 = 4'h2 == decRes_0 ? _GEN_5 : _GEN_68; // @[Id.scala 125:21]
  wire [75:0] _GEN_85 = 4'h2 == decRes_0 ? {{12'd0}, _GEN_6} : _GEN_69; // @[Id.scala 125:21]
  wire [4:0] _GEN_87 = 4'h2 == decRes_0 ? rd : _GEN_77; // @[Id.scala 125:21 143:37]
  wire  _GEN_88 = 4'h2 == decRes_0 ? _T_8 : _GEN_73; // @[Id.scala 125:21]
  wire [63:0] _GEN_89 = 4'h2 == decRes_0 ? _GEN_8 : _GEN_74; // @[Id.scala 125:21]
  wire [63:0] _GEN_91 = 4'h2 == decRes_0 ? 64'h0 : _GEN_70; // @[Id.scala 125:21 86:25]
  wire  _GEN_92 = 4'h2 == decRes_0 ? 1'h0 : 4'h3 == decRes_0; // @[Id.scala 125:21 86:25]
  wire [1:0] _GEN_93 = 4'h2 == decRes_0 ? 2'h0 : _GEN_72; // @[Id.scala 125:21 86:25]
  wire [63:0] _GEN_94 = 4'h2 == decRes_0 ? 64'h0 : _GEN_78; // @[Id.scala 125:21 86:25]
  wire [11:0] _GEN_95 = 4'h2 == decRes_0 ? 12'h0 : _GEN_79; // @[Id.scala 125:21 86:25]
  wire  _GEN_96 = 4'h2 == decRes_0 ? 1'h0 : _GEN_80; // @[Id.scala 125:21 86:25]
  wire  _GEN_97 = 4'h2 == decRes_0 ? 1'h0 : _GEN_81; // @[Id.scala 125:21 97:25]
  wire [4:0] _GEN_98 = 4'h2 == decRes_0 ? 5'h0 : _GEN_82; // @[Id.scala 125:21 99:25]
  wire [63:0] _GEN_99 = 4'h2 == decRes_0 ? io_CSR_2_ID_xtvec : _GEN_83; // @[Id.scala 125:21 102:25]
  wire [63:0] _GEN_100 = 4'h1 == decRes_0 ? rs1Val : _GEN_84; // @[Id.scala 125:21 134:37]
  wire [75:0] _GEN_101 = 4'h1 == decRes_0 ? {{12'd0}, rs2Val} : _GEN_85; // @[Id.scala 125:21 135:37]
  wire [4:0] _GEN_103 = 4'h1 == decRes_0 ? rd : _GEN_87; // @[Id.scala 125:21 137:37]
  wire  _GEN_104 = 4'h1 == decRes_0 ? 1'h0 : _GEN_88; // @[Id.scala 125:21 86:25]
  wire [63:0] _GEN_105 = 4'h1 == decRes_0 ? 64'h0 : _GEN_89; // @[Id.scala 125:21 86:25]
  wire [63:0] _GEN_107 = 4'h1 == decRes_0 ? 64'h0 : _GEN_91; // @[Id.scala 125:21 86:25]
  wire  _GEN_108 = 4'h1 == decRes_0 ? 1'h0 : _GEN_92; // @[Id.scala 125:21 86:25]
  wire [1:0] _GEN_109 = 4'h1 == decRes_0 ? 2'h0 : _GEN_93; // @[Id.scala 125:21 86:25]
  wire [63:0] _GEN_110 = 4'h1 == decRes_0 ? 64'h0 : _GEN_94; // @[Id.scala 125:21 86:25]
  wire [11:0] _GEN_111 = 4'h1 == decRes_0 ? 12'h0 : _GEN_95; // @[Id.scala 125:21 86:25]
  wire  _GEN_112 = 4'h1 == decRes_0 ? 1'h0 : _GEN_96; // @[Id.scala 125:21 86:25]
  wire  _GEN_113 = 4'h1 == decRes_0 ? 1'h0 : _GEN_97; // @[Id.scala 125:21 97:25]
  wire [4:0] _GEN_114 = 4'h1 == decRes_0 ? 5'h0 : _GEN_98; // @[Id.scala 125:21 99:25]
  wire [63:0] _GEN_115 = 4'h1 == decRes_0 ? io_CSR_2_ID_xtvec : _GEN_99; // @[Id.scala 125:21 102:25]
  wire [31:0] _GEN_118 = 4'h0 == decRes_0 ? io_inst_i : 32'h0; // @[Id.scala 125:21 100:25 131:37]
  wire [75:0] _GEN_120 = 4'h0 == decRes_0 ? 76'h0 : _GEN_101; // @[Id.scala 125:21 86:25]
  assign io_ID_2_CSR_addr = io_inst_i[31:20]; // @[Id.scala 27:24]
  assign io_ID_2_CSR_wdata = decRes_0 == 4'h7 ? csrNewVal : 64'h0; // @[Id.scala 224:32]
  assign io_id2Rf_ReadIdx1 = io_inst_i[19:15]; // @[Id.scala 35:24]
  assign io_id2Rf_ReadIdx2 = io_inst_i[24:20]; // @[Id.scala 36:24]
  assign io_decInfo_oprand1 = 4'h0 == decRes_0 ? 64'h0 : _GEN_100; // @[Id.scala 125:21 86:25]
  assign io_decInfo_oprand2 = _GEN_120[63:0];
  assign io_decInfo_rd = 4'h0 == decRes_0 ? 5'h0 : _GEN_103; // @[Id.scala 125:21 86:25]
  assign io_decInfo_InstType = decRes_0[2:0]; // @[Id.scala 91:25]
  assign io_decInfo_aluop = _decRes_T_1 ? 5'h0 : _decRes_T_245; // @[Lookup.scala 34:39]
  assign io_decInfo_branchOp_taken = 4'h0 == decRes_0 ? 1'h0 : _GEN_104; // @[Id.scala 125:21 86:25]
  assign io_decInfo_branchOp_target = 4'h0 == decRes_0 ? 64'h0 : _GEN_105; // @[Id.scala 125:21 86:25]
  assign io_decInfo_storeOp_en = 4'h0 == decRes_0 ? 1'h0 : _GEN_108; // @[Id.scala 125:21 86:25]
  assign io_decInfo_storeOp_data = 4'h0 == decRes_0 ? 64'h0 : _GEN_107; // @[Id.scala 125:21 86:25]
  assign io_decInfo_storeOp_Width = 4'h0 == decRes_0 ? 2'h0 : _GEN_109; // @[Id.scala 125:21 86:25]
  assign io_decInfo_loadOp_isLoad = io_inst_i[6:0] == 7'h3; // @[Id.scala 104:20]
  assign io_decInfo_loadOp_Width = io_inst_i[6:0] == 7'h3 ? _io_decInfo_loadOp_Width_T_11 : 2'h0; // @[Id.scala 104:38 107:34 86:25]
  assign io_decInfo_loadOp_sign = io_inst_i[6:0] == 7'h3 & _io_decInfo_loadOp_sign_T_11; // @[Id.scala 104:38 111:34 86:25]
  assign io_decInfo_writeCSROp_en = 4'h0 == decRes_0 ? 1'h0 : _GEN_112; // @[Id.scala 125:21 86:25]
  assign io_decInfo_writeCSROp_addr = 4'h0 == decRes_0 ? 12'h0 : _GEN_111; // @[Id.scala 125:21 86:25]
  assign io_decInfo_writeCSROp_data = 4'h0 == decRes_0 ? 64'h0 : _GEN_110; // @[Id.scala 125:21 86:25]
  assign io_flush_req = 4'h0 == decRes_0 ? 1'h0 : _GEN_104; // @[Id.scala 125:21 87:25]
  assign io_stall_req = io_prev_is_load & _T_4; // @[Id.scala 119:26 88:25]
  assign io_exception_cause = 4'h0 == decRes_0 ? 5'h2 : _GEN_114; // @[Id.scala 125:21 130:37]
  assign io_exception_pc = io_pc; // @[Id.scala 94:25]
  assign io_exception_xtval = {{32'd0}, _GEN_118};
  assign io_exception_happen = 4'h0 == decRes_0 ? _io_exception_happen_T_1 : _GEN_113; // @[Id.scala 125:21 129:37]
  assign io_exception_new_pc = 4'h0 == decRes_0 ? io_CSR_2_ID_xtvec : _GEN_115; // @[Id.scala 125:21 102:25]
endmodule
module Id_Ex(
  input         clock,
  input         reset,
  input         io_stall,
  input         io_flush,
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
  input         io_decInfo_i_loadOp_sign,
  input         io_decInfo_i_writeCSROp_en,
  input  [11:0] io_decInfo_i_writeCSROp_addr,
  input  [63:0] io_decInfo_i_writeCSROp_data,
  input  [4:0]  io_exception_i_cause,
  input  [63:0] io_exception_i_pc,
  input  [63:0] io_exception_i_xtval,
  input         io_exception_i_happen,
  input  [63:0] io_exception_i_new_pc,
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
  output        io_decInfo_o_loadOp_sign,
  output        io_decInfo_o_writeCSROp_en,
  output [11:0] io_decInfo_o_writeCSROp_addr,
  output [63:0] io_decInfo_o_writeCSROp_data,
  output [4:0]  io_exception_o_cause,
  output [63:0] io_exception_o_pc,
  output [63:0] io_exception_o_xtval,
  output        io_exception_o_happen,
  output [63:0] io_exception_o_new_pc
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
  reg [31:0] _RAND_12;
  reg [63:0] _RAND_13;
  reg [31:0] _RAND_14;
  reg [63:0] _RAND_15;
  reg [63:0] _RAND_16;
  reg [31:0] _RAND_17;
  reg [63:0] _RAND_18;
`endif // RANDOMIZE_REG_INIT
  reg [63:0] decInfo_oprand1; // @[pipeline-registers.scala 41:32]
  reg [63:0] decInfo_oprand2; // @[pipeline-registers.scala 41:32]
  reg [4:0] decInfo_rd; // @[pipeline-registers.scala 41:32]
  reg [2:0] decInfo_InstType; // @[pipeline-registers.scala 41:32]
  reg [4:0] decInfo_aluop; // @[pipeline-registers.scala 41:32]
  reg  decInfo_storeOp_en; // @[pipeline-registers.scala 41:32]
  reg [63:0] decInfo_storeOp_data; // @[pipeline-registers.scala 41:32]
  reg [1:0] decInfo_storeOp_Width; // @[pipeline-registers.scala 41:32]
  reg  decInfo_loadOp_isLoad; // @[pipeline-registers.scala 41:32]
  reg [1:0] decInfo_loadOp_Width; // @[pipeline-registers.scala 41:32]
  reg  decInfo_loadOp_sign; // @[pipeline-registers.scala 41:32]
  reg  decInfo_writeCSROp_en; // @[pipeline-registers.scala 41:32]
  reg [11:0] decInfo_writeCSROp_addr; // @[pipeline-registers.scala 41:32]
  reg [63:0] decInfo_writeCSROp_data; // @[pipeline-registers.scala 41:32]
  reg [4:0] exception_cause; // @[pipeline-registers.scala 42:32]
  reg [63:0] exception_pc; // @[pipeline-registers.scala 42:32]
  reg [63:0] exception_xtval; // @[pipeline-registers.scala 42:32]
  reg  exception_happen; // @[pipeline-registers.scala 42:32]
  reg [63:0] exception_new_pc; // @[pipeline-registers.scala 42:32]
  assign io_decInfo_o_oprand1 = decInfo_oprand1; // @[pipeline-registers.scala 50:24]
  assign io_decInfo_o_oprand2 = decInfo_oprand2; // @[pipeline-registers.scala 50:24]
  assign io_decInfo_o_rd = decInfo_rd; // @[pipeline-registers.scala 50:24]
  assign io_decInfo_o_InstType = decInfo_InstType; // @[pipeline-registers.scala 50:24]
  assign io_decInfo_o_aluop = decInfo_aluop; // @[pipeline-registers.scala 50:24]
  assign io_decInfo_o_storeOp_en = decInfo_storeOp_en; // @[pipeline-registers.scala 50:24]
  assign io_decInfo_o_storeOp_data = decInfo_storeOp_data; // @[pipeline-registers.scala 50:24]
  assign io_decInfo_o_storeOp_Width = decInfo_storeOp_Width; // @[pipeline-registers.scala 50:24]
  assign io_decInfo_o_loadOp_isLoad = decInfo_loadOp_isLoad; // @[pipeline-registers.scala 50:24]
  assign io_decInfo_o_loadOp_Width = decInfo_loadOp_Width; // @[pipeline-registers.scala 50:24]
  assign io_decInfo_o_loadOp_sign = decInfo_loadOp_sign; // @[pipeline-registers.scala 50:24]
  assign io_decInfo_o_writeCSROp_en = decInfo_writeCSROp_en; // @[pipeline-registers.scala 50:24]
  assign io_decInfo_o_writeCSROp_addr = decInfo_writeCSROp_addr; // @[pipeline-registers.scala 50:24]
  assign io_decInfo_o_writeCSROp_data = decInfo_writeCSROp_data; // @[pipeline-registers.scala 50:24]
  assign io_exception_o_cause = exception_cause; // @[pipeline-registers.scala 51:24]
  assign io_exception_o_pc = exception_pc; // @[pipeline-registers.scala 51:24]
  assign io_exception_o_xtval = exception_xtval; // @[pipeline-registers.scala 51:24]
  assign io_exception_o_happen = exception_happen; // @[pipeline-registers.scala 51:24]
  assign io_exception_o_new_pc = exception_new_pc; // @[pipeline-registers.scala 51:24]
  always @(posedge clock) begin
    if (reset | io_flush) begin // @[pipeline-registers.scala 43:34]
      decInfo_oprand1 <= 64'h0; // @[pipeline-registers.scala 44:24]
    end else if (!(io_stall)) begin // @[pipeline-registers.scala 46:25]
      decInfo_oprand1 <= io_decInfo_i_oprand1; // @[pipeline-registers.scala 41:32]
    end
    if (reset | io_flush) begin // @[pipeline-registers.scala 43:34]
      decInfo_oprand2 <= 64'h0; // @[pipeline-registers.scala 44:24]
    end else if (!(io_stall)) begin // @[pipeline-registers.scala 46:25]
      decInfo_oprand2 <= io_decInfo_i_oprand2; // @[pipeline-registers.scala 41:32]
    end
    if (reset | io_flush) begin // @[pipeline-registers.scala 43:34]
      decInfo_rd <= 5'h0; // @[pipeline-registers.scala 44:24]
    end else if (!(io_stall)) begin // @[pipeline-registers.scala 46:25]
      decInfo_rd <= io_decInfo_i_rd; // @[pipeline-registers.scala 41:32]
    end
    if (reset | io_flush) begin // @[pipeline-registers.scala 43:34]
      decInfo_InstType <= 3'h0; // @[pipeline-registers.scala 44:24]
    end else if (!(io_stall)) begin // @[pipeline-registers.scala 46:25]
      decInfo_InstType <= io_decInfo_i_InstType; // @[pipeline-registers.scala 41:32]
    end
    if (reset | io_flush) begin // @[pipeline-registers.scala 43:34]
      decInfo_aluop <= 5'h0; // @[pipeline-registers.scala 44:24]
    end else if (!(io_stall)) begin // @[pipeline-registers.scala 46:25]
      decInfo_aluop <= io_decInfo_i_aluop; // @[pipeline-registers.scala 41:32]
    end
    if (reset | io_flush) begin // @[pipeline-registers.scala 43:34]
      decInfo_storeOp_en <= 1'h0; // @[pipeline-registers.scala 44:24]
    end else if (!(io_stall)) begin // @[pipeline-registers.scala 46:25]
      decInfo_storeOp_en <= io_decInfo_i_storeOp_en; // @[pipeline-registers.scala 41:32]
    end
    if (reset | io_flush) begin // @[pipeline-registers.scala 43:34]
      decInfo_storeOp_data <= 64'h0; // @[pipeline-registers.scala 44:24]
    end else if (!(io_stall)) begin // @[pipeline-registers.scala 46:25]
      decInfo_storeOp_data <= io_decInfo_i_storeOp_data; // @[pipeline-registers.scala 41:32]
    end
    if (reset | io_flush) begin // @[pipeline-registers.scala 43:34]
      decInfo_storeOp_Width <= 2'h0; // @[pipeline-registers.scala 44:24]
    end else if (!(io_stall)) begin // @[pipeline-registers.scala 46:25]
      decInfo_storeOp_Width <= io_decInfo_i_storeOp_Width; // @[pipeline-registers.scala 41:32]
    end
    if (reset | io_flush) begin // @[pipeline-registers.scala 43:34]
      decInfo_loadOp_isLoad <= 1'h0; // @[pipeline-registers.scala 44:24]
    end else if (!(io_stall)) begin // @[pipeline-registers.scala 46:25]
      decInfo_loadOp_isLoad <= io_decInfo_i_loadOp_isLoad; // @[pipeline-registers.scala 41:32]
    end
    if (reset | io_flush) begin // @[pipeline-registers.scala 43:34]
      decInfo_loadOp_Width <= 2'h0; // @[pipeline-registers.scala 44:24]
    end else if (!(io_stall)) begin // @[pipeline-registers.scala 46:25]
      decInfo_loadOp_Width <= io_decInfo_i_loadOp_Width; // @[pipeline-registers.scala 41:32]
    end
    if (reset | io_flush) begin // @[pipeline-registers.scala 43:34]
      decInfo_loadOp_sign <= 1'h0; // @[pipeline-registers.scala 44:24]
    end else if (!(io_stall)) begin // @[pipeline-registers.scala 46:25]
      decInfo_loadOp_sign <= io_decInfo_i_loadOp_sign; // @[pipeline-registers.scala 41:32]
    end
    if (reset | io_flush) begin // @[pipeline-registers.scala 43:34]
      decInfo_writeCSROp_en <= 1'h0; // @[pipeline-registers.scala 44:24]
    end else if (!(io_stall)) begin // @[pipeline-registers.scala 46:25]
      decInfo_writeCSROp_en <= io_decInfo_i_writeCSROp_en; // @[pipeline-registers.scala 41:32]
    end
    if (reset | io_flush) begin // @[pipeline-registers.scala 43:34]
      decInfo_writeCSROp_addr <= 12'h0; // @[pipeline-registers.scala 44:24]
    end else if (!(io_stall)) begin // @[pipeline-registers.scala 46:25]
      decInfo_writeCSROp_addr <= io_decInfo_i_writeCSROp_addr; // @[pipeline-registers.scala 41:32]
    end
    if (reset | io_flush) begin // @[pipeline-registers.scala 43:34]
      decInfo_writeCSROp_data <= 64'h0; // @[pipeline-registers.scala 44:24]
    end else if (!(io_stall)) begin // @[pipeline-registers.scala 46:25]
      decInfo_writeCSROp_data <= io_decInfo_i_writeCSROp_data; // @[pipeline-registers.scala 41:32]
    end
    if (reset | io_flush) begin // @[pipeline-registers.scala 43:34]
      exception_cause <= 5'h0; // @[pipeline-registers.scala 45:24]
    end else if (!(io_stall)) begin // @[pipeline-registers.scala 46:25]
      exception_cause <= io_exception_i_cause; // @[pipeline-registers.scala 42:32]
    end
    if (reset | io_flush) begin // @[pipeline-registers.scala 43:34]
      exception_pc <= 64'h0; // @[pipeline-registers.scala 45:24]
    end else if (!(io_stall)) begin // @[pipeline-registers.scala 46:25]
      exception_pc <= io_exception_i_pc; // @[pipeline-registers.scala 42:32]
    end
    if (reset | io_flush) begin // @[pipeline-registers.scala 43:34]
      exception_xtval <= 64'h0; // @[pipeline-registers.scala 45:24]
    end else if (!(io_stall)) begin // @[pipeline-registers.scala 46:25]
      exception_xtval <= io_exception_i_xtval; // @[pipeline-registers.scala 42:32]
    end
    if (reset | io_flush) begin // @[pipeline-registers.scala 43:34]
      exception_happen <= 1'h0; // @[pipeline-registers.scala 45:24]
    end else if (!(io_stall)) begin // @[pipeline-registers.scala 46:25]
      exception_happen <= io_exception_i_happen; // @[pipeline-registers.scala 42:32]
    end
    if (reset | io_flush) begin // @[pipeline-registers.scala 43:34]
      exception_new_pc <= 64'h0; // @[pipeline-registers.scala 45:24]
    end else if (!(io_stall)) begin // @[pipeline-registers.scala 46:25]
      exception_new_pc <= io_exception_i_new_pc; // @[pipeline-registers.scala 42:32]
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
  decInfo_loadOp_sign = _RAND_10[0:0];
  _RAND_11 = {1{`RANDOM}};
  decInfo_writeCSROp_en = _RAND_11[0:0];
  _RAND_12 = {1{`RANDOM}};
  decInfo_writeCSROp_addr = _RAND_12[11:0];
  _RAND_13 = {2{`RANDOM}};
  decInfo_writeCSROp_data = _RAND_13[63:0];
  _RAND_14 = {1{`RANDOM}};
  exception_cause = _RAND_14[4:0];
  _RAND_15 = {2{`RANDOM}};
  exception_pc = _RAND_15[63:0];
  _RAND_16 = {2{`RANDOM}};
  exception_xtval = _RAND_16[63:0];
  _RAND_17 = {1{`RANDOM}};
  exception_happen = _RAND_17[0:0];
  _RAND_18 = {2{`RANDOM}};
  exception_new_pc = _RAND_18[63:0];
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
  input         io_decInfo_loadOp_sign,
  input         io_decInfo_writeCSROp_en,
  input  [11:0] io_decInfo_writeCSROp_addr,
  input  [63:0] io_decInfo_writeCSROp_data,
  input  [63:0] io_divRes_quo,
  input  [63:0] io_divRes_rem,
  input         io_divRes_finish,
  input  [4:0]  io_exception_i_cause,
  input  [63:0] io_exception_i_pc,
  input  [63:0] io_exception_i_xtval,
  input         io_exception_i_happen,
  input  [63:0] io_exception_i_new_pc,
  output [4:0]  io_rf_fwd_addr,
  output [63:0] io_rf_fwd_data,
  output [11:0] io_csr_fwd_addr,
  output [63:0] io_csr_fwd_data,
  output        io_writeRfOp_en,
  output [63:0] io_writeRfOp_data,
  output [4:0]  io_writeRfOp_addr,
  output        io_writeCSROp_en,
  output [11:0] io_writeCSROp_addr,
  output [63:0] io_writeCSROp_data,
  output        io_loadOp_isLoad,
  output [63:0] io_loadOp_addr,
  output [1:0]  io_loadOp_Width,
  output        io_loadOp_sign,
  output        io_storeOp_en,
  output [63:0] io_storeOp_addr,
  output [63:0] io_storeOp_data,
  output [1:0]  io_storeOp_Width,
  output        io_divOP_start,
  output [63:0] io_divOP_a,
  output [63:0] io_divOP_b,
  output        io_stall_req,
  output [4:0]  io_exception_o_cause,
  output [63:0] io_exception_o_pc,
  output [63:0] io_exception_o_xtval,
  output        io_exception_o_happen,
  output [63:0] io_exception_o_new_pc
);
  wire [63:0] _aluRes_T_1 = io_decInfo_oprand1 + io_decInfo_oprand2; // @[Ex.scala 30:37]
  wire [63:0] _aluRes_T_5 = io_decInfo_oprand1 - io_decInfo_oprand2; // @[Ex.scala 32:20]
  wire  _aluRes_T_8 = $signed(io_decInfo_oprand1) < $signed(io_decInfo_oprand2); // @[Ex.scala 33:30]
  wire  _aluRes_T_10 = io_decInfo_oprand1 < io_decInfo_oprand2; // @[Ex.scala 34:23]
  wire [127:0] _aluRes_T_12 = io_decInfo_oprand1 * io_decInfo_oprand2; // @[Ex.scala 35:20]
  wire [63:0] _aluRes_T_16 = io_decInfo_oprand1 ^ io_decInfo_oprand2; // @[Ex.scala 37:20]
  wire [63:0] _aluRes_T_17 = io_decInfo_oprand1 | io_decInfo_oprand2; // @[Ex.scala 38:20]
  wire [63:0] _aluRes_T_18 = io_decInfo_oprand1 & io_decInfo_oprand2; // @[Ex.scala 39:20]
  wire [126:0] _GEN_0 = {{63'd0}, io_decInfo_oprand1}; // @[Ex.scala 40:20]
  wire [126:0] _aluRes_T_20 = _GEN_0 << io_decInfo_oprand2[5:0]; // @[Ex.scala 40:20]
  wire [63:0] _aluRes_T_22 = io_decInfo_oprand1 >> io_decInfo_oprand2[5:0]; // @[Ex.scala 41:20]
  wire [63:0] _aluRes_T_26 = $signed(io_decInfo_oprand1) >>> io_decInfo_oprand2[5:0]; // @[Ex.scala 42:38]
  wire [31:0] _aluRes_T_31 = io_decInfo_oprand1[31:0] + io_decInfo_oprand2[31:0]; // @[helpers.scala 14:47]
  wire [63:0] _aluRes_T_33 = {{32{_aluRes_T_31[31]}},_aluRes_T_31}; // @[helpers.scala 14:62]
  wire [31:0] _aluRes_T_38 = io_decInfo_oprand1[31:0] - io_decInfo_oprand2[31:0]; // @[helpers.scala 14:47]
  wire [63:0] _aluRes_T_40 = {{32{_aluRes_T_38[31]}},_aluRes_T_38}; // @[helpers.scala 14:62]
  wire [63:0] _aluRes_T_46 = io_decInfo_oprand1[31:0] * io_decInfo_oprand2[31:0]; // @[helpers.scala 14:62]
  wire [94:0] _GEN_2 = {{31'd0}, io_decInfo_oprand1}; // @[Ex.scala 47:36]
  wire [94:0] _aluRes_T_48 = _GEN_2 << io_decInfo_oprand2[4:0]; // @[Ex.scala 47:36]
  wire [31:0] _aluRes_T_50 = _aluRes_T_48[31:0]; // @[helpers.scala 14:47]
  wire [63:0] _aluRes_T_52 = {{32{_aluRes_T_50[31]}},_aluRes_T_50}; // @[helpers.scala 14:62]
  wire [31:0] _aluRes_T_60 = io_decInfo_oprand1[31:0]; // @[Ex.scala 49:42]
  wire [31:0] _aluRes_T_64 = $signed(_aluRes_T_60) >>> io_decInfo_oprand2[4:0]; // @[helpers.scala 14:47]
  wire [63:0] _aluRes_T_66 = {{32{_aluRes_T_64[31]}},_aluRes_T_64}; // @[helpers.scala 14:62]
  wire [63:0] _aluRes_T_68 = 5'h0 == io_decInfo_aluop ? _aluRes_T_1 : _aluRes_T_1; // @[Mux.scala 81:58]
  wire [63:0] _aluRes_T_70 = 5'h1 == io_decInfo_aluop ? _aluRes_T_5 : _aluRes_T_68; // @[Mux.scala 81:58]
  wire [63:0] _aluRes_T_72 = 5'h2 == io_decInfo_aluop ? {{63'd0}, _aluRes_T_8} : _aluRes_T_70; // @[Mux.scala 81:58]
  wire [63:0] _aluRes_T_74 = 5'h3 == io_decInfo_aluop ? {{63'd0}, _aluRes_T_10} : _aluRes_T_72; // @[Mux.scala 81:58]
  wire [63:0] _aluRes_T_76 = 5'hb == io_decInfo_aluop ? _aluRes_T_12[63:0] : _aluRes_T_74; // @[Mux.scala 81:58]
  wire [63:0] _aluRes_T_78 = 5'hc == io_decInfo_aluop ? _aluRes_T_12[127:64] : _aluRes_T_76; // @[Mux.scala 81:58]
  wire [63:0] _aluRes_T_80 = 5'h4 == io_decInfo_aluop ? _aluRes_T_16 : _aluRes_T_78; // @[Mux.scala 81:58]
  wire [63:0] _aluRes_T_82 = 5'h5 == io_decInfo_aluop ? _aluRes_T_17 : _aluRes_T_80; // @[Mux.scala 81:58]
  wire [63:0] _aluRes_T_84 = 5'h6 == io_decInfo_aluop ? _aluRes_T_18 : _aluRes_T_82; // @[Mux.scala 81:58]
  wire [126:0] _aluRes_T_86 = 5'h7 == io_decInfo_aluop ? _aluRes_T_20 : {{63'd0}, _aluRes_T_84}; // @[Mux.scala 81:58]
  wire [126:0] _aluRes_T_88 = 5'h8 == io_decInfo_aluop ? {{63'd0}, _aluRes_T_22} : _aluRes_T_86; // @[Mux.scala 81:58]
  wire [126:0] _aluRes_T_90 = 5'h9 == io_decInfo_aluop ? {{63'd0}, _aluRes_T_26} : _aluRes_T_88; // @[Mux.scala 81:58]
  wire [126:0] _aluRes_T_92 = 5'h10 == io_decInfo_aluop ? {{63'd0}, _aluRes_T_33} : _aluRes_T_90; // @[Mux.scala 81:58]
  wire [126:0] _aluRes_T_94 = 5'h11 == io_decInfo_aluop ? {{63'd0}, _aluRes_T_40} : _aluRes_T_92; // @[Mux.scala 81:58]
  wire [126:0] _aluRes_T_96 = 5'hf == io_decInfo_aluop ? {{63'd0}, _aluRes_T_46} : _aluRes_T_94; // @[Mux.scala 81:58]
  wire [126:0] _aluRes_T_98 = 5'h12 == io_decInfo_aluop ? {{63'd0}, _aluRes_T_52} : _aluRes_T_96; // @[Mux.scala 81:58]
  wire [126:0] _aluRes_T_100 = 5'h13 == io_decInfo_aluop ? {{63'd0}, _aluRes_T_52} : _aluRes_T_98; // @[Mux.scala 81:58]
  wire [126:0] aluRes = 5'h14 == io_decInfo_aluop ? {{63'd0}, _aluRes_T_66} : _aluRes_T_100; // @[Mux.scala 81:58]
  wire  isDiv = io_decInfo_aluop == 5'h1a | io_decInfo_aluop == 5'h1b | io_decInfo_aluop == 5'h1c | io_decInfo_aluop == 5'h1d
    ; // @[Ex.scala 57:73]
  wire  _io_divOP_start_T = io_divRes_finish ? 1'h0 : 1'h1; // @[Ex.scala 61:33]
  wire [63:0] _divRes_T_1 = 5'h1a == io_decInfo_aluop ? io_divRes_quo : 64'h0; // @[Mux.scala 81:58]
  wire [63:0] _divRes_T_3 = 5'h1b == io_decInfo_aluop ? io_divRes_quo : _divRes_T_1; // @[Mux.scala 81:58]
  wire [63:0] _divRes_T_5 = 5'h1c == io_decInfo_aluop ? io_divRes_rem : _divRes_T_3; // @[Mux.scala 81:58]
  wire [63:0] _divRes_T_7 = 5'h1d == io_decInfo_aluop ? io_divRes_rem : _divRes_T_5; // @[Mux.scala 81:58]
  wire [63:0] _GEN_1 = io_divRes_finish ? _divRes_T_7 : 64'h0; // @[Ex.scala 70:31 71:21 58:45]
  wire [63:0] divRes = isDiv ? _GEN_1 : 64'h0; // @[Ex.scala 60:16 58:45]
  wire [3:0] _GEN_30 = {{1'd0}, io_decInfo_InstType}; // @[Ex.scala 82:32]
  wire [126:0] _io_writeRfOp_data_T = isDiv ? {{63'd0}, divRes} : aluRes; // @[Ex.scala 84:38]
  wire [126:0] _GEN_9 = io_writeCSROp_en ? aluRes : 127'h0; // @[Ex.scala 104:35 105:36 81:21]
  wire [4:0] _GEN_11 = io_writeCSROp_en ? io_decInfo_rd : 5'h0; // @[Ex.scala 104:35 107:36 81:21]
  wire [126:0] _GEN_12 = 4'h7 == _GEN_30 ? _GEN_9 : 127'h0; // @[Ex.scala 81:21 82:32]
  wire  _GEN_13 = 4'h7 == _GEN_30 & io_writeCSROp_en; // @[Ex.scala 81:21 82:32]
  wire [4:0] _GEN_14 = 4'h7 == _GEN_30 ? _GEN_11 : 5'h0; // @[Ex.scala 81:21 82:32]
  wire [126:0] _GEN_15 = 4'h6 == _GEN_30 ? aluRes : _GEN_12; // @[Ex.scala 82:32 99:32]
  wire  _GEN_16 = 4'h6 == _GEN_30 | _GEN_13; // @[Ex.scala 100:32 82:32]
  wire [4:0] _GEN_17 = 4'h6 == _GEN_30 ? io_decInfo_rd : _GEN_14; // @[Ex.scala 101:32 82:32]
  wire [126:0] _GEN_18 = 4'h3 == _GEN_30 ? aluRes : 127'h0; // @[Ex.scala 28:17 82:32 95:32]
  wire [126:0] _GEN_19 = 4'h3 == _GEN_30 ? 127'h0 : _GEN_15; // @[Ex.scala 81:21 82:32]
  wire  _GEN_20 = 4'h3 == _GEN_30 ? 1'h0 : _GEN_16; // @[Ex.scala 81:21 82:32]
  wire [4:0] _GEN_21 = 4'h3 == _GEN_30 ? 5'h0 : _GEN_17; // @[Ex.scala 81:21 82:32]
  wire [126:0] _GEN_22 = 4'h2 == _GEN_30 ? aluRes : _GEN_19; // @[Ex.scala 82:32 89:32]
  wire  _GEN_23 = 4'h2 == _GEN_30 | _GEN_20; // @[Ex.scala 82:32 90:32]
  wire [4:0] _GEN_24 = 4'h2 == _GEN_30 ? io_decInfo_rd : _GEN_21; // @[Ex.scala 82:32 91:32]
  wire [126:0] _GEN_25 = 4'h2 == _GEN_30 ? 127'h0 : _GEN_18; // @[Ex.scala 28:17 82:32]
  wire [126:0] _GEN_26 = 4'h1 == _GEN_30 ? _io_writeRfOp_data_T : _GEN_22; // @[Ex.scala 82:32 84:32]
  wire [126:0] _GEN_29 = 4'h1 == _GEN_30 ? 127'h0 : _GEN_25; // @[Ex.scala 28:17 82:32]
  assign io_rf_fwd_addr = io_decInfo_rd; // @[Ex.scala 122:22]
  assign io_rf_fwd_data = aluRes[63:0]; // @[Ex.scala 121:22]
  assign io_csr_fwd_addr = io_writeCSROp_addr; // @[Ex.scala 125:22]
  assign io_csr_fwd_data = io_writeCSROp_data; // @[Ex.scala 124:22]
  assign io_writeRfOp_en = 4'h1 == _GEN_30 | _GEN_23; // @[Ex.scala 82:32 85:32]
  assign io_writeRfOp_data = _GEN_26[63:0];
  assign io_writeRfOp_addr = 4'h1 == _GEN_30 ? io_decInfo_rd : _GEN_24; // @[Ex.scala 82:32 86:32]
  assign io_writeCSROp_en = io_decInfo_writeCSROp_en; // @[Ex.scala 113:22]
  assign io_writeCSROp_addr = io_decInfo_writeCSROp_addr; // @[Ex.scala 113:22]
  assign io_writeCSROp_data = io_decInfo_writeCSROp_data; // @[Ex.scala 113:22]
  assign io_loadOp_isLoad = io_decInfo_loadOp_isLoad; // @[Ex.scala 116:22]
  assign io_loadOp_addr = aluRes[63:0]; // @[Ex.scala 115:22]
  assign io_loadOp_Width = io_decInfo_loadOp_Width; // @[Ex.scala 117:22]
  assign io_loadOp_sign = io_decInfo_loadOp_sign; // @[Ex.scala 118:22]
  assign io_storeOp_en = io_decInfo_storeOp_en; // @[Ex.scala 28:17]
  assign io_storeOp_addr = _GEN_29[63:0];
  assign io_storeOp_data = io_decInfo_storeOp_data; // @[Ex.scala 28:17]
  assign io_storeOp_Width = io_decInfo_storeOp_Width; // @[Ex.scala 28:17]
  assign io_divOP_start = isDiv & _io_divOP_start_T; // @[Ex.scala 59:16 60:16 61:27]
  assign io_divOP_a = isDiv ? io_decInfo_oprand1 : 64'h0; // @[Ex.scala 59:16 60:16 62:27]
  assign io_divOP_b = isDiv ? io_decInfo_oprand2 : 64'h0; // @[Ex.scala 59:16 60:16 63:27]
  assign io_stall_req = isDiv & _io_divOP_start_T; // @[Ex.scala 60:16 56:21]
  assign io_exception_o_cause = io_exception_i_cause; // @[Ex.scala 127:22]
  assign io_exception_o_pc = io_exception_i_pc; // @[Ex.scala 127:22]
  assign io_exception_o_xtval = io_exception_i_xtval; // @[Ex.scala 127:22]
  assign io_exception_o_happen = io_exception_i_happen; // @[Ex.scala 127:22]
  assign io_exception_o_new_pc = io_exception_i_new_pc; // @[Ex.scala 127:22]
endmodule
module Ex_Mem(
  input         clock,
  input         reset,
  input         io_stall,
  input         io_flush,
  input         io_loadOp_i_isLoad,
  input  [63:0] io_loadOp_i_addr,
  input  [1:0]  io_loadOp_i_Width,
  input         io_loadOp_i_sign,
  input         io_storeOp_i_en,
  input  [63:0] io_storeOp_i_addr,
  input  [63:0] io_storeOp_i_data,
  input  [1:0]  io_storeOp_i_Width,
  input         io_writeRfOp_i_en,
  input  [63:0] io_writeRfOp_i_data,
  input  [4:0]  io_writeRfOp_i_addr,
  input         io_writeCSROp_i_en,
  input  [11:0] io_writeCSROp_i_addr,
  input  [63:0] io_writeCSROp_i_data,
  input  [4:0]  io_exception_i_cause,
  input  [63:0] io_exception_i_pc,
  input  [63:0] io_exception_i_xtval,
  input         io_exception_i_happen,
  input  [63:0] io_exception_i_new_pc,
  output        io_loadOp_o_isLoad,
  output [63:0] io_loadOp_o_addr,
  output [1:0]  io_loadOp_o_Width,
  output        io_loadOp_o_sign,
  output        io_storeOp_o_en,
  output [63:0] io_storeOp_o_addr,
  output [63:0] io_storeOp_o_data,
  output [1:0]  io_storeOp_o_Width,
  output        io_writeRfOp_o_en,
  output [63:0] io_writeRfOp_o_data,
  output [4:0]  io_writeRfOp_o_addr,
  output        io_writeCSROp_o_en,
  output [11:0] io_writeCSROp_o_addr,
  output [63:0] io_writeCSROp_o_data,
  output [4:0]  io_exception_o_cause,
  output [63:0] io_exception_o_pc,
  output [63:0] io_exception_o_xtval,
  output        io_exception_o_happen,
  output [63:0] io_exception_o_new_pc
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [63:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [63:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
  reg [31:0] _RAND_7;
  reg [63:0] _RAND_8;
  reg [63:0] _RAND_9;
  reg [31:0] _RAND_10;
  reg [31:0] _RAND_11;
  reg [31:0] _RAND_12;
  reg [63:0] _RAND_13;
  reg [31:0] _RAND_14;
  reg [63:0] _RAND_15;
  reg [63:0] _RAND_16;
  reg [31:0] _RAND_17;
  reg [63:0] _RAND_18;
`endif // RANDOMIZE_REG_INIT
  reg  writeRfOp_en; // @[pipeline-registers.scala 72:33]
  reg [63:0] writeRfOp_data; // @[pipeline-registers.scala 72:33]
  reg [4:0] writeRfOp_addr; // @[pipeline-registers.scala 72:33]
  reg  loadOp_isLoad; // @[pipeline-registers.scala 73:33]
  reg [63:0] loadOp_addr; // @[pipeline-registers.scala 73:33]
  reg [1:0] loadOp_Width; // @[pipeline-registers.scala 73:33]
  reg  loadOp_sign; // @[pipeline-registers.scala 73:33]
  reg  storeOp_en; // @[pipeline-registers.scala 74:33]
  reg [63:0] storeOp_addr; // @[pipeline-registers.scala 74:33]
  reg [63:0] storeOp_data; // @[pipeline-registers.scala 74:33]
  reg [1:0] storeOp_Width; // @[pipeline-registers.scala 74:33]
  reg  writeCSROp_en; // @[pipeline-registers.scala 75:33]
  reg [11:0] writeCSROp_addr; // @[pipeline-registers.scala 75:33]
  reg [63:0] writeCSROp_data; // @[pipeline-registers.scala 75:33]
  reg [4:0] exception_cause; // @[pipeline-registers.scala 76:33]
  reg [63:0] exception_pc; // @[pipeline-registers.scala 76:33]
  reg [63:0] exception_xtval; // @[pipeline-registers.scala 76:33]
  reg  exception_happen; // @[pipeline-registers.scala 76:33]
  reg [63:0] exception_new_pc; // @[pipeline-registers.scala 76:33]
  assign io_loadOp_o_isLoad = loadOp_isLoad; // @[pipeline-registers.scala 92:23]
  assign io_loadOp_o_addr = loadOp_addr; // @[pipeline-registers.scala 92:23]
  assign io_loadOp_o_Width = loadOp_Width; // @[pipeline-registers.scala 92:23]
  assign io_loadOp_o_sign = loadOp_sign; // @[pipeline-registers.scala 92:23]
  assign io_storeOp_o_en = storeOp_en; // @[pipeline-registers.scala 93:23]
  assign io_storeOp_o_addr = storeOp_addr; // @[pipeline-registers.scala 93:23]
  assign io_storeOp_o_data = storeOp_data; // @[pipeline-registers.scala 93:23]
  assign io_storeOp_o_Width = storeOp_Width; // @[pipeline-registers.scala 93:23]
  assign io_writeRfOp_o_en = writeRfOp_en; // @[pipeline-registers.scala 91:23]
  assign io_writeRfOp_o_data = writeRfOp_data; // @[pipeline-registers.scala 91:23]
  assign io_writeRfOp_o_addr = writeRfOp_addr; // @[pipeline-registers.scala 91:23]
  assign io_writeCSROp_o_en = writeCSROp_en; // @[pipeline-registers.scala 94:23]
  assign io_writeCSROp_o_addr = writeCSROp_addr; // @[pipeline-registers.scala 94:23]
  assign io_writeCSROp_o_data = writeCSROp_data; // @[pipeline-registers.scala 94:23]
  assign io_exception_o_cause = exception_cause; // @[pipeline-registers.scala 95:23]
  assign io_exception_o_pc = exception_pc; // @[pipeline-registers.scala 95:23]
  assign io_exception_o_xtval = exception_xtval; // @[pipeline-registers.scala 95:23]
  assign io_exception_o_happen = exception_happen; // @[pipeline-registers.scala 95:23]
  assign io_exception_o_new_pc = exception_new_pc; // @[pipeline-registers.scala 95:23]
  always @(posedge clock) begin
    if (reset | io_flush) begin // @[pipeline-registers.scala 78:34]
      writeRfOp_en <= 1'h0; // @[pipeline-registers.scala 79:22]
    end else if (!(io_stall)) begin // @[pipeline-registers.scala 84:25]
      writeRfOp_en <= io_writeRfOp_i_en; // @[pipeline-registers.scala 72:33]
    end
    if (reset | io_flush) begin // @[pipeline-registers.scala 78:34]
      writeRfOp_data <= 64'h0; // @[pipeline-registers.scala 79:22]
    end else if (!(io_stall)) begin // @[pipeline-registers.scala 84:25]
      writeRfOp_data <= io_writeRfOp_i_data; // @[pipeline-registers.scala 72:33]
    end
    if (reset | io_flush) begin // @[pipeline-registers.scala 78:34]
      writeRfOp_addr <= 5'h0; // @[pipeline-registers.scala 79:22]
    end else if (!(io_stall)) begin // @[pipeline-registers.scala 84:25]
      writeRfOp_addr <= io_writeRfOp_i_addr; // @[pipeline-registers.scala 72:33]
    end
    if (reset | io_flush) begin // @[pipeline-registers.scala 78:34]
      loadOp_isLoad <= 1'h0; // @[pipeline-registers.scala 80:22]
    end else if (!(io_stall)) begin // @[pipeline-registers.scala 84:25]
      loadOp_isLoad <= io_loadOp_i_isLoad; // @[pipeline-registers.scala 73:33]
    end
    if (reset | io_flush) begin // @[pipeline-registers.scala 78:34]
      loadOp_addr <= 64'h0; // @[pipeline-registers.scala 80:22]
    end else if (!(io_stall)) begin // @[pipeline-registers.scala 84:25]
      loadOp_addr <= io_loadOp_i_addr; // @[pipeline-registers.scala 73:33]
    end
    if (reset | io_flush) begin // @[pipeline-registers.scala 78:34]
      loadOp_Width <= 2'h0; // @[pipeline-registers.scala 80:22]
    end else if (!(io_stall)) begin // @[pipeline-registers.scala 84:25]
      loadOp_Width <= io_loadOp_i_Width; // @[pipeline-registers.scala 73:33]
    end
    if (reset | io_flush) begin // @[pipeline-registers.scala 78:34]
      loadOp_sign <= 1'h0; // @[pipeline-registers.scala 80:22]
    end else if (!(io_stall)) begin // @[pipeline-registers.scala 84:25]
      loadOp_sign <= io_loadOp_i_sign; // @[pipeline-registers.scala 73:33]
    end
    if (reset | io_flush) begin // @[pipeline-registers.scala 78:34]
      storeOp_en <= 1'h0; // @[pipeline-registers.scala 81:22]
    end else if (!(io_stall)) begin // @[pipeline-registers.scala 84:25]
      storeOp_en <= io_storeOp_i_en; // @[pipeline-registers.scala 74:33]
    end
    if (reset | io_flush) begin // @[pipeline-registers.scala 78:34]
      storeOp_addr <= 64'h0; // @[pipeline-registers.scala 81:22]
    end else if (!(io_stall)) begin // @[pipeline-registers.scala 84:25]
      storeOp_addr <= io_storeOp_i_addr; // @[pipeline-registers.scala 74:33]
    end
    if (reset | io_flush) begin // @[pipeline-registers.scala 78:34]
      storeOp_data <= 64'h0; // @[pipeline-registers.scala 81:22]
    end else if (!(io_stall)) begin // @[pipeline-registers.scala 84:25]
      storeOp_data <= io_storeOp_i_data; // @[pipeline-registers.scala 74:33]
    end
    if (reset | io_flush) begin // @[pipeline-registers.scala 78:34]
      storeOp_Width <= 2'h0; // @[pipeline-registers.scala 81:22]
    end else if (!(io_stall)) begin // @[pipeline-registers.scala 84:25]
      storeOp_Width <= io_storeOp_i_Width; // @[pipeline-registers.scala 74:33]
    end
    if (reset | io_flush) begin // @[pipeline-registers.scala 78:34]
      writeCSROp_en <= 1'h0; // @[pipeline-registers.scala 82:22]
    end else if (!(io_stall)) begin // @[pipeline-registers.scala 84:25]
      writeCSROp_en <= io_writeCSROp_i_en; // @[pipeline-registers.scala 75:33]
    end
    if (reset | io_flush) begin // @[pipeline-registers.scala 78:34]
      writeCSROp_addr <= 12'h0; // @[pipeline-registers.scala 82:22]
    end else if (!(io_stall)) begin // @[pipeline-registers.scala 84:25]
      writeCSROp_addr <= io_writeCSROp_i_addr; // @[pipeline-registers.scala 75:33]
    end
    if (reset | io_flush) begin // @[pipeline-registers.scala 78:34]
      writeCSROp_data <= 64'h0; // @[pipeline-registers.scala 82:22]
    end else if (!(io_stall)) begin // @[pipeline-registers.scala 84:25]
      writeCSROp_data <= io_writeCSROp_i_data; // @[pipeline-registers.scala 75:33]
    end
    if (reset | io_flush) begin // @[pipeline-registers.scala 78:34]
      exception_cause <= 5'h0; // @[pipeline-registers.scala 83:22]
    end else if (!(io_stall)) begin // @[pipeline-registers.scala 84:25]
      exception_cause <= io_exception_i_cause; // @[pipeline-registers.scala 76:33]
    end
    if (reset | io_flush) begin // @[pipeline-registers.scala 78:34]
      exception_pc <= 64'h0; // @[pipeline-registers.scala 83:22]
    end else if (!(io_stall)) begin // @[pipeline-registers.scala 84:25]
      exception_pc <= io_exception_i_pc; // @[pipeline-registers.scala 76:33]
    end
    if (reset | io_flush) begin // @[pipeline-registers.scala 78:34]
      exception_xtval <= 64'h0; // @[pipeline-registers.scala 83:22]
    end else if (!(io_stall)) begin // @[pipeline-registers.scala 84:25]
      exception_xtval <= io_exception_i_xtval; // @[pipeline-registers.scala 76:33]
    end
    if (reset | io_flush) begin // @[pipeline-registers.scala 78:34]
      exception_happen <= 1'h0; // @[pipeline-registers.scala 83:22]
    end else if (!(io_stall)) begin // @[pipeline-registers.scala 84:25]
      exception_happen <= io_exception_i_happen; // @[pipeline-registers.scala 76:33]
    end
    if (reset | io_flush) begin // @[pipeline-registers.scala 78:34]
      exception_new_pc <= 64'h0; // @[pipeline-registers.scala 83:22]
    end else if (!(io_stall)) begin // @[pipeline-registers.scala 84:25]
      exception_new_pc <= io_exception_i_new_pc; // @[pipeline-registers.scala 76:33]
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
  loadOp_sign = _RAND_6[0:0];
  _RAND_7 = {1{`RANDOM}};
  storeOp_en = _RAND_7[0:0];
  _RAND_8 = {2{`RANDOM}};
  storeOp_addr = _RAND_8[63:0];
  _RAND_9 = {2{`RANDOM}};
  storeOp_data = _RAND_9[63:0];
  _RAND_10 = {1{`RANDOM}};
  storeOp_Width = _RAND_10[1:0];
  _RAND_11 = {1{`RANDOM}};
  writeCSROp_en = _RAND_11[0:0];
  _RAND_12 = {1{`RANDOM}};
  writeCSROp_addr = _RAND_12[11:0];
  _RAND_13 = {2{`RANDOM}};
  writeCSROp_data = _RAND_13[63:0];
  _RAND_14 = {1{`RANDOM}};
  exception_cause = _RAND_14[4:0];
  _RAND_15 = {2{`RANDOM}};
  exception_pc = _RAND_15[63:0];
  _RAND_16 = {2{`RANDOM}};
  exception_xtval = _RAND_16[63:0];
  _RAND_17 = {1{`RANDOM}};
  exception_happen = _RAND_17[0:0];
  _RAND_18 = {2{`RANDOM}};
  exception_new_pc = _RAND_18[63:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module MEM(
  input         clock,
  input         io_writeRfOp_i_en,
  input  [63:0] io_writeRfOp_i_data,
  input  [4:0]  io_writeRfOp_i_addr,
  input         io_writeCSROp_i_en,
  input  [11:0] io_writeCSROp_i_addr,
  input  [63:0] io_writeCSROp_i_data,
  input         io_loadOp_isLoad,
  input  [63:0] io_loadOp_addr,
  input  [1:0]  io_loadOp_Width,
  input         io_loadOp_sign,
  input         io_storeOp_en,
  input  [63:0] io_storeOp_addr,
  input  [63:0] io_storeOp_data,
  input  [1:0]  io_storeOp_Width,
  input  [4:0]  io_exception_i_cause,
  input  [63:0] io_exception_i_pc,
  input  [63:0] io_exception_i_xtval,
  input         io_exception_i_happen,
  input  [63:0] io_exception_i_new_pc,
  output [4:0]  io_rf_fwd_addr,
  output [63:0] io_rf_fwd_data,
  output [11:0] io_csr_fwd_addr,
  output [63:0] io_csr_fwd_data,
  output        io_writeRfOp_o_en,
  output [63:0] io_writeRfOp_o_data,
  output [4:0]  io_writeRfOp_o_addr,
  output        io_writeCSROp_o_en,
  output [11:0] io_writeCSROp_o_addr,
  output [63:0] io_writeCSROp_o_data,
  output [4:0]  io_exception_o_cause,
  output [63:0] io_exception_o_pc,
  output [63:0] io_exception_o_xtval,
  output        io_exception_o_happen,
  output [63:0] io_exception_o_new_pc
);
`ifdef RANDOMIZE_MEM_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_MEM_INIT
  reg [7:0] ram [0:1023]; // @[Mem.scala 30:24]
  wire  ram_BYTE_en; // @[Mem.scala 30:24]
  wire [9:0] ram_BYTE_addr; // @[Mem.scala 30:24]
  wire [7:0] ram_BYTE_data; // @[Mem.scala 30:24]
  wire  ram_HALFWORD_MPORT_en; // @[Mem.scala 30:24]
  wire [9:0] ram_HALFWORD_MPORT_addr; // @[Mem.scala 30:24]
  wire [7:0] ram_HALFWORD_MPORT_data; // @[Mem.scala 30:24]
  wire  ram_HALFWORD_MPORT_1_en; // @[Mem.scala 30:24]
  wire [9:0] ram_HALFWORD_MPORT_1_addr; // @[Mem.scala 30:24]
  wire [7:0] ram_HALFWORD_MPORT_1_data; // @[Mem.scala 30:24]
  wire  ram_WORD_MPORT_en; // @[Mem.scala 30:24]
  wire [9:0] ram_WORD_MPORT_addr; // @[Mem.scala 30:24]
  wire [7:0] ram_WORD_MPORT_data; // @[Mem.scala 30:24]
  wire  ram_WORD_MPORT_1_en; // @[Mem.scala 30:24]
  wire [9:0] ram_WORD_MPORT_1_addr; // @[Mem.scala 30:24]
  wire [7:0] ram_WORD_MPORT_1_data; // @[Mem.scala 30:24]
  wire  ram_WORD_MPORT_2_en; // @[Mem.scala 30:24]
  wire [9:0] ram_WORD_MPORT_2_addr; // @[Mem.scala 30:24]
  wire [7:0] ram_WORD_MPORT_2_data; // @[Mem.scala 30:24]
  wire  ram_WORD_MPORT_3_en; // @[Mem.scala 30:24]
  wire [9:0] ram_WORD_MPORT_3_addr; // @[Mem.scala 30:24]
  wire [7:0] ram_WORD_MPORT_3_data; // @[Mem.scala 30:24]
  wire  ram_DWORD_MPORT_en; // @[Mem.scala 30:24]
  wire [9:0] ram_DWORD_MPORT_addr; // @[Mem.scala 30:24]
  wire [7:0] ram_DWORD_MPORT_data; // @[Mem.scala 30:24]
  wire  ram_DWORD_MPORT_1_en; // @[Mem.scala 30:24]
  wire [9:0] ram_DWORD_MPORT_1_addr; // @[Mem.scala 30:24]
  wire [7:0] ram_DWORD_MPORT_1_data; // @[Mem.scala 30:24]
  wire  ram_DWORD_MPORT_2_en; // @[Mem.scala 30:24]
  wire [9:0] ram_DWORD_MPORT_2_addr; // @[Mem.scala 30:24]
  wire [7:0] ram_DWORD_MPORT_2_data; // @[Mem.scala 30:24]
  wire  ram_DWORD_MPORT_3_en; // @[Mem.scala 30:24]
  wire [9:0] ram_DWORD_MPORT_3_addr; // @[Mem.scala 30:24]
  wire [7:0] ram_DWORD_MPORT_3_data; // @[Mem.scala 30:24]
  wire  ram_DWORD_MPORT_4_en; // @[Mem.scala 30:24]
  wire [9:0] ram_DWORD_MPORT_4_addr; // @[Mem.scala 30:24]
  wire [7:0] ram_DWORD_MPORT_4_data; // @[Mem.scala 30:24]
  wire  ram_DWORD_MPORT_5_en; // @[Mem.scala 30:24]
  wire [9:0] ram_DWORD_MPORT_5_addr; // @[Mem.scala 30:24]
  wire [7:0] ram_DWORD_MPORT_5_data; // @[Mem.scala 30:24]
  wire  ram_DWORD_MPORT_6_en; // @[Mem.scala 30:24]
  wire [9:0] ram_DWORD_MPORT_6_addr; // @[Mem.scala 30:24]
  wire [7:0] ram_DWORD_MPORT_6_data; // @[Mem.scala 30:24]
  wire  ram_DWORD_MPORT_7_en; // @[Mem.scala 30:24]
  wire [9:0] ram_DWORD_MPORT_7_addr; // @[Mem.scala 30:24]
  wire [7:0] ram_DWORD_MPORT_7_data; // @[Mem.scala 30:24]
  wire [7:0] ram_MPORT_data; // @[Mem.scala 30:24]
  wire [9:0] ram_MPORT_addr; // @[Mem.scala 30:24]
  wire  ram_MPORT_mask; // @[Mem.scala 30:24]
  wire  ram_MPORT_en; // @[Mem.scala 30:24]
  wire [7:0] ram_MPORT_1_data; // @[Mem.scala 30:24]
  wire [9:0] ram_MPORT_1_addr; // @[Mem.scala 30:24]
  wire  ram_MPORT_1_mask; // @[Mem.scala 30:24]
  wire  ram_MPORT_1_en; // @[Mem.scala 30:24]
  wire [7:0] ram_MPORT_2_data; // @[Mem.scala 30:24]
  wire [9:0] ram_MPORT_2_addr; // @[Mem.scala 30:24]
  wire  ram_MPORT_2_mask; // @[Mem.scala 30:24]
  wire  ram_MPORT_2_en; // @[Mem.scala 30:24]
  wire [7:0] ram_MPORT_3_data; // @[Mem.scala 30:24]
  wire [9:0] ram_MPORT_3_addr; // @[Mem.scala 30:24]
  wire  ram_MPORT_3_mask; // @[Mem.scala 30:24]
  wire  ram_MPORT_3_en; // @[Mem.scala 30:24]
  wire [7:0] ram_MPORT_4_data; // @[Mem.scala 30:24]
  wire [9:0] ram_MPORT_4_addr; // @[Mem.scala 30:24]
  wire  ram_MPORT_4_mask; // @[Mem.scala 30:24]
  wire  ram_MPORT_4_en; // @[Mem.scala 30:24]
  wire [7:0] ram_MPORT_5_data; // @[Mem.scala 30:24]
  wire [9:0] ram_MPORT_5_addr; // @[Mem.scala 30:24]
  wire  ram_MPORT_5_mask; // @[Mem.scala 30:24]
  wire  ram_MPORT_5_en; // @[Mem.scala 30:24]
  wire [7:0] ram_MPORT_6_data; // @[Mem.scala 30:24]
  wire [9:0] ram_MPORT_6_addr; // @[Mem.scala 30:24]
  wire  ram_MPORT_6_mask; // @[Mem.scala 30:24]
  wire  ram_MPORT_6_en; // @[Mem.scala 30:24]
  wire  _LoadIsLegal_T_1 = ~io_loadOp_addr[0]; // @[Mem.scala 11:21]
  wire  _LoadIsLegal_T_6 = _LoadIsLegal_T_1 & ~io_loadOp_addr[1]; // @[Mem.scala 12:31]
  wire  _LoadIsLegal_T_14 = _LoadIsLegal_T_6 & ~io_loadOp_addr[2]; // @[Mem.scala 13:42]
  wire  _LoadIsLegal_T_16 = 2'h1 == io_loadOp_Width ? _LoadIsLegal_T_1 : 1'h1; // @[Mux.scala 81:58]
  wire  _LoadIsLegal_T_18 = 2'h2 == io_loadOp_Width ? _LoadIsLegal_T_6 : _LoadIsLegal_T_16; // @[Mux.scala 81:58]
  wire  LoadIsLegal = 2'h3 == io_loadOp_Width ? _LoadIsLegal_T_14 : _LoadIsLegal_T_18; // @[Mux.scala 81:58]
  wire [63:0] _HALFWORD_T_2 = io_loadOp_addr + 64'h1; // @[Mem.scala 39:49]
  wire [15:0] HALFWORD = {ram_HALFWORD_MPORT_data,ram_HALFWORD_MPORT_1_data}; // @[Cat.scala 31:58]
  wire [63:0] _WORD_T_5 = io_loadOp_addr + 64'h2; // @[Mem.scala 40:66]
  wire [63:0] _WORD_T_8 = io_loadOp_addr + 64'h3; // @[Mem.scala 40:84]
  wire [31:0] WORD = {ram_WORD_MPORT_data,ram_WORD_MPORT_1_data,ram_WORD_MPORT_2_data,ram_WORD_MPORT_3_data}; // @[Cat.scala 31:58]
  wire [63:0] _DWORD_T_11 = io_loadOp_addr + 64'h4; // @[Mem.scala 41:100]
  wire [63:0] _DWORD_T_14 = io_loadOp_addr + 64'h5; // @[Mem.scala 41:117]
  wire [63:0] _DWORD_T_17 = io_loadOp_addr + 64'h6; // @[Mem.scala 41:134]
  wire [63:0] _DWORD_T_20 = io_loadOp_addr + 64'h7; // @[Mem.scala 41:152]
  wire [63:0] DWORD = {ram_DWORD_MPORT_data,ram_DWORD_MPORT_1_data,ram_DWORD_MPORT_2_data,ram_DWORD_MPORT_3_data,
    ram_DWORD_MPORT_4_data,ram_DWORD_MPORT_5_data,ram_DWORD_MPORT_6_data,ram_DWORD_MPORT_7_data}; // @[Cat.scala 31:58]
  wire [7:0] _loadVal_T = ram_BYTE_data; // @[helpers.scala 14:47]
  wire [63:0] _loadVal_T_2 = {{56{_loadVal_T[7]}},_loadVal_T}; // @[helpers.scala 14:62]
  wire [63:0] _loadVal_T_3 = io_loadOp_sign ? _loadVal_T_2 : {{56'd0}, ram_BYTE_data}; // @[Mem.scala 44:20]
  wire [15:0] _loadVal_T_4 = {ram_HALFWORD_MPORT_data,ram_HALFWORD_MPORT_1_data}; // @[helpers.scala 14:47]
  wire [63:0] _loadVal_T_6 = {{48{_loadVal_T_4[15]}},_loadVal_T_4}; // @[helpers.scala 14:62]
  wire [63:0] _loadVal_T_7 = io_loadOp_sign ? _loadVal_T_6 : {{48'd0}, HALFWORD}; // @[Mem.scala 45:20]
  wire [31:0] _loadVal_T_8 = {ram_WORD_MPORT_data,ram_WORD_MPORT_1_data,ram_WORD_MPORT_2_data,ram_WORD_MPORT_3_data}; // @[helpers.scala 14:47]
  wire [63:0] _loadVal_T_10 = {{32{_loadVal_T_8[31]}},_loadVal_T_8}; // @[helpers.scala 14:62]
  wire [63:0] _loadVal_T_11 = io_loadOp_sign ? _loadVal_T_10 : {{32'd0}, WORD}; // @[Mem.scala 46:20]
  wire [63:0] _loadVal_T_13 = 2'h1 == io_loadOp_Width ? _loadVal_T_7 : _loadVal_T_3; // @[Mux.scala 81:58]
  wire [63:0] _loadVal_T_15 = 2'h2 == io_loadOp_Width ? _loadVal_T_11 : _loadVal_T_13; // @[Mux.scala 81:58]
  wire [63:0] loadVal = 2'h3 == io_loadOp_Width ? DWORD : _loadVal_T_15; // @[Mux.scala 81:58]
  wire [63:0] ldata = LoadIsLegal ? loadVal : 64'h0; // @[Mem.scala 50:22]
  wire  _StoreIsLegal_T_1 = ~io_storeOp_addr[0]; // @[Mem.scala 11:21]
  wire  _StoreIsLegal_T_6 = _StoreIsLegal_T_1 & ~io_storeOp_addr[1]; // @[Mem.scala 12:31]
  wire  _StoreIsLegal_T_14 = _StoreIsLegal_T_6 & ~io_storeOp_addr[2]; // @[Mem.scala 13:42]
  wire  _StoreIsLegal_T_15 = 2'h1 == io_storeOp_Width; // @[Mux.scala 81:61]
  wire  _StoreIsLegal_T_16 = 2'h1 == io_storeOp_Width ? _StoreIsLegal_T_1 : 1'h1; // @[Mux.scala 81:58]
  wire  _StoreIsLegal_T_17 = 2'h2 == io_storeOp_Width; // @[Mux.scala 81:61]
  wire  _StoreIsLegal_T_18 = 2'h2 == io_storeOp_Width ? _StoreIsLegal_T_6 : _StoreIsLegal_T_16; // @[Mux.scala 81:58]
  wire  StoreIsLegal = 2'h3 == io_storeOp_Width ? _StoreIsLegal_T_14 : _StoreIsLegal_T_18; // @[Mux.scala 81:58]
  wire  _T = io_storeOp_en & StoreIsLegal; // @[Mem.scala 57:24]
  wire  _T_1 = 2'h0 == io_storeOp_Width; // @[Mem.scala 58:33]
  wire [63:0] _T_8 = io_storeOp_addr + 64'h1; // @[Mem.scala 64:26]
  wire [63:0] _T_19 = io_storeOp_addr + 64'h2; // @[Mem.scala 69:26]
  wire [63:0] _T_23 = io_storeOp_addr + 64'h3; // @[Mem.scala 70:26]
  wire  _GEN_20 = _StoreIsLegal_T_15 ? 1'h0 : _StoreIsLegal_T_17; // @[Mem.scala 30:24 58:33]
  wire  _GEN_36 = 2'h0 == io_storeOp_Width ? 1'h0 : _StoreIsLegal_T_15; // @[Mem.scala 30:24 58:33]
  wire  _GEN_43 = 2'h0 == io_storeOp_Width ? 1'h0 : _GEN_20; // @[Mem.scala 30:24 58:33]
  assign ram_BYTE_en = 1'h1;
  assign ram_BYTE_addr = io_loadOp_addr[9:0];
  assign ram_BYTE_data = ram[ram_BYTE_addr]; // @[Mem.scala 30:24]
  assign ram_HALFWORD_MPORT_en = 1'h1;
  assign ram_HALFWORD_MPORT_addr = io_loadOp_addr[9:0];
  assign ram_HALFWORD_MPORT_data = ram[ram_HALFWORD_MPORT_addr]; // @[Mem.scala 30:24]
  assign ram_HALFWORD_MPORT_1_en = 1'h1;
  assign ram_HALFWORD_MPORT_1_addr = _HALFWORD_T_2[9:0];
  assign ram_HALFWORD_MPORT_1_data = ram[ram_HALFWORD_MPORT_1_addr]; // @[Mem.scala 30:24]
  assign ram_WORD_MPORT_en = 1'h1;
  assign ram_WORD_MPORT_addr = io_loadOp_addr[9:0];
  assign ram_WORD_MPORT_data = ram[ram_WORD_MPORT_addr]; // @[Mem.scala 30:24]
  assign ram_WORD_MPORT_1_en = 1'h1;
  assign ram_WORD_MPORT_1_addr = _HALFWORD_T_2[9:0];
  assign ram_WORD_MPORT_1_data = ram[ram_WORD_MPORT_1_addr]; // @[Mem.scala 30:24]
  assign ram_WORD_MPORT_2_en = 1'h1;
  assign ram_WORD_MPORT_2_addr = _WORD_T_5[9:0];
  assign ram_WORD_MPORT_2_data = ram[ram_WORD_MPORT_2_addr]; // @[Mem.scala 30:24]
  assign ram_WORD_MPORT_3_en = 1'h1;
  assign ram_WORD_MPORT_3_addr = _WORD_T_8[9:0];
  assign ram_WORD_MPORT_3_data = ram[ram_WORD_MPORT_3_addr]; // @[Mem.scala 30:24]
  assign ram_DWORD_MPORT_en = 1'h1;
  assign ram_DWORD_MPORT_addr = io_loadOp_addr[9:0];
  assign ram_DWORD_MPORT_data = ram[ram_DWORD_MPORT_addr]; // @[Mem.scala 30:24]
  assign ram_DWORD_MPORT_1_en = 1'h1;
  assign ram_DWORD_MPORT_1_addr = _HALFWORD_T_2[9:0];
  assign ram_DWORD_MPORT_1_data = ram[ram_DWORD_MPORT_1_addr]; // @[Mem.scala 30:24]
  assign ram_DWORD_MPORT_2_en = 1'h1;
  assign ram_DWORD_MPORT_2_addr = _WORD_T_5[9:0];
  assign ram_DWORD_MPORT_2_data = ram[ram_DWORD_MPORT_2_addr]; // @[Mem.scala 30:24]
  assign ram_DWORD_MPORT_3_en = 1'h1;
  assign ram_DWORD_MPORT_3_addr = _WORD_T_8[9:0];
  assign ram_DWORD_MPORT_3_data = ram[ram_DWORD_MPORT_3_addr]; // @[Mem.scala 30:24]
  assign ram_DWORD_MPORT_4_en = 1'h1;
  assign ram_DWORD_MPORT_4_addr = _DWORD_T_11[9:0];
  assign ram_DWORD_MPORT_4_data = ram[ram_DWORD_MPORT_4_addr]; // @[Mem.scala 30:24]
  assign ram_DWORD_MPORT_5_en = 1'h1;
  assign ram_DWORD_MPORT_5_addr = _DWORD_T_14[9:0];
  assign ram_DWORD_MPORT_5_data = ram[ram_DWORD_MPORT_5_addr]; // @[Mem.scala 30:24]
  assign ram_DWORD_MPORT_6_en = 1'h1;
  assign ram_DWORD_MPORT_6_addr = _DWORD_T_17[9:0];
  assign ram_DWORD_MPORT_6_data = ram[ram_DWORD_MPORT_6_addr]; // @[Mem.scala 30:24]
  assign ram_DWORD_MPORT_7_en = 1'h1;
  assign ram_DWORD_MPORT_7_addr = _DWORD_T_20[9:0];
  assign ram_DWORD_MPORT_7_data = ram[ram_DWORD_MPORT_7_addr]; // @[Mem.scala 30:24]
  assign ram_MPORT_data = io_storeOp_data[7:0];
  assign ram_MPORT_addr = io_storeOp_addr[9:0];
  assign ram_MPORT_mask = 1'h1;
  assign ram_MPORT_en = _T & _T_1;
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
  assign io_rf_fwd_addr = io_writeRfOp_i_addr; // @[Mem.scala 81:20]
  assign io_rf_fwd_data = io_loadOp_isLoad ? loadVal : io_writeRfOp_i_data; // @[Mem.scala 82:26]
  assign io_csr_fwd_addr = io_writeCSROp_o_addr; // @[Mem.scala 85:22]
  assign io_csr_fwd_data = io_writeCSROp_o_data; // @[Mem.scala 84:22]
  assign io_writeRfOp_o_en = io_writeRfOp_i_en; // @[Mem.scala 76:27]
  assign io_writeRfOp_o_data = io_loadOp_isLoad ? ldata : io_writeRfOp_i_data; // @[Mem.scala 75:33]
  assign io_writeRfOp_o_addr = io_writeRfOp_i_addr; // @[Mem.scala 77:27]
  assign io_writeCSROp_o_en = io_writeCSROp_i_en; // @[Mem.scala 79:27]
  assign io_writeCSROp_o_addr = io_writeCSROp_i_addr; // @[Mem.scala 79:27]
  assign io_writeCSROp_o_data = io_writeCSROp_i_data; // @[Mem.scala 79:27]
  assign io_exception_o_cause = io_exception_i_cause; // @[Mem.scala 87:22]
  assign io_exception_o_pc = io_exception_i_pc; // @[Mem.scala 87:22]
  assign io_exception_o_xtval = io_exception_i_xtval; // @[Mem.scala 87:22]
  assign io_exception_o_happen = io_exception_i_happen; // @[Mem.scala 87:22]
  assign io_exception_o_new_pc = io_exception_i_new_pc; // @[Mem.scala 87:22]
  always @(posedge clock) begin
    if (ram_MPORT_en & ram_MPORT_mask) begin
      ram[ram_MPORT_addr] <= ram_MPORT_data; // @[Mem.scala 30:24]
    end
    if (ram_MPORT_1_en & ram_MPORT_1_mask) begin
      ram[ram_MPORT_1_addr] <= ram_MPORT_1_data; // @[Mem.scala 30:24]
    end
    if (ram_MPORT_2_en & ram_MPORT_2_mask) begin
      ram[ram_MPORT_2_addr] <= ram_MPORT_2_data; // @[Mem.scala 30:24]
    end
    if (ram_MPORT_3_en & ram_MPORT_3_mask) begin
      ram[ram_MPORT_3_addr] <= ram_MPORT_3_data; // @[Mem.scala 30:24]
    end
    if (ram_MPORT_4_en & ram_MPORT_4_mask) begin
      ram[ram_MPORT_4_addr] <= ram_MPORT_4_data; // @[Mem.scala 30:24]
    end
    if (ram_MPORT_5_en & ram_MPORT_5_mask) begin
      ram[ram_MPORT_5_addr] <= ram_MPORT_5_data; // @[Mem.scala 30:24]
    end
    if (ram_MPORT_6_en & ram_MPORT_6_mask) begin
      ram[ram_MPORT_6_addr] <= ram_MPORT_6_data; // @[Mem.scala 30:24]
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
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module Mem_Wb(
  input         clock,
  input         reset,
  input         io_stall,
  input         io_flush,
  input         io_writeRfOp_i_en,
  input  [63:0] io_writeRfOp_i_data,
  input  [4:0]  io_writeRfOp_i_addr,
  input         io_writeCSROp_i_en,
  input  [11:0] io_writeCSROp_i_addr,
  input  [63:0] io_writeCSROp_i_data,
  input  [4:0]  io_exception_i_cause,
  input  [63:0] io_exception_i_pc,
  input  [63:0] io_exception_i_xtval,
  input         io_exception_i_happen,
  input  [63:0] io_exception_i_new_pc,
  output        io_writeRfOp_o_en,
  output [63:0] io_writeRfOp_o_data,
  output [4:0]  io_writeRfOp_o_addr,
  output        io_writeCSROp_o_en,
  output [11:0] io_writeCSROp_o_addr,
  output [63:0] io_writeCSROp_o_data,
  output [4:0]  io_exception_o_cause,
  output [63:0] io_exception_o_pc,
  output [63:0] io_exception_o_xtval,
  output        io_exception_o_happen,
  output [63:0] io_exception_o_new_pc
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [63:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [63:0] _RAND_5;
  reg [31:0] _RAND_6;
  reg [63:0] _RAND_7;
  reg [63:0] _RAND_8;
  reg [31:0] _RAND_9;
  reg [63:0] _RAND_10;
`endif // RANDOMIZE_REG_INIT
  reg  writeRfOp_en; // @[pipeline-registers.scala 111:30]
  reg [63:0] writeRfOp_data; // @[pipeline-registers.scala 111:30]
  reg [4:0] writeRfOp_addr; // @[pipeline-registers.scala 111:30]
  reg  writeCSROp_en; // @[pipeline-registers.scala 112:30]
  reg [11:0] writeCSROp_addr; // @[pipeline-registers.scala 112:30]
  reg [63:0] writeCSROp_data; // @[pipeline-registers.scala 112:30]
  reg [4:0] exception_cause; // @[pipeline-registers.scala 113:30]
  reg [63:0] exception_pc; // @[pipeline-registers.scala 113:30]
  reg [63:0] exception_xtval; // @[pipeline-registers.scala 113:30]
  reg  exception_happen; // @[pipeline-registers.scala 113:30]
  reg [63:0] exception_new_pc; // @[pipeline-registers.scala 113:30]
  assign io_writeRfOp_o_en = writeRfOp_en; // @[pipeline-registers.scala 124:21]
  assign io_writeRfOp_o_data = writeRfOp_data; // @[pipeline-registers.scala 124:21]
  assign io_writeRfOp_o_addr = writeRfOp_addr; // @[pipeline-registers.scala 124:21]
  assign io_writeCSROp_o_en = writeCSROp_en; // @[pipeline-registers.scala 125:21]
  assign io_writeCSROp_o_addr = writeCSROp_addr; // @[pipeline-registers.scala 125:21]
  assign io_writeCSROp_o_data = writeCSROp_data; // @[pipeline-registers.scala 125:21]
  assign io_exception_o_cause = exception_cause; // @[pipeline-registers.scala 126:21]
  assign io_exception_o_pc = exception_pc; // @[pipeline-registers.scala 126:21]
  assign io_exception_o_xtval = exception_xtval; // @[pipeline-registers.scala 126:21]
  assign io_exception_o_happen = exception_happen; // @[pipeline-registers.scala 126:21]
  assign io_exception_o_new_pc = exception_new_pc; // @[pipeline-registers.scala 126:21]
  always @(posedge clock) begin
    if (reset | io_flush) begin // @[pipeline-registers.scala 115:34]
      writeRfOp_en <= 1'h0; // @[pipeline-registers.scala 116:21]
    end else if (!(io_stall)) begin // @[pipeline-registers.scala 119:25]
      writeRfOp_en <= io_writeRfOp_i_en; // @[pipeline-registers.scala 111:30]
    end
    if (reset | io_flush) begin // @[pipeline-registers.scala 115:34]
      writeRfOp_data <= 64'h0; // @[pipeline-registers.scala 116:21]
    end else if (!(io_stall)) begin // @[pipeline-registers.scala 119:25]
      writeRfOp_data <= io_writeRfOp_i_data; // @[pipeline-registers.scala 111:30]
    end
    if (reset | io_flush) begin // @[pipeline-registers.scala 115:34]
      writeRfOp_addr <= 5'h0; // @[pipeline-registers.scala 116:21]
    end else if (!(io_stall)) begin // @[pipeline-registers.scala 119:25]
      writeRfOp_addr <= io_writeRfOp_i_addr; // @[pipeline-registers.scala 111:30]
    end
    if (reset | io_flush) begin // @[pipeline-registers.scala 115:34]
      writeCSROp_en <= 1'h0; // @[pipeline-registers.scala 117:21]
    end else if (!(io_stall)) begin // @[pipeline-registers.scala 119:25]
      writeCSROp_en <= io_writeCSROp_i_en; // @[pipeline-registers.scala 112:30]
    end
    if (reset | io_flush) begin // @[pipeline-registers.scala 115:34]
      writeCSROp_addr <= 12'h0; // @[pipeline-registers.scala 117:21]
    end else if (!(io_stall)) begin // @[pipeline-registers.scala 119:25]
      writeCSROp_addr <= io_writeCSROp_i_addr; // @[pipeline-registers.scala 112:30]
    end
    if (reset | io_flush) begin // @[pipeline-registers.scala 115:34]
      writeCSROp_data <= 64'h0; // @[pipeline-registers.scala 117:21]
    end else if (!(io_stall)) begin // @[pipeline-registers.scala 119:25]
      writeCSROp_data <= io_writeCSROp_i_data; // @[pipeline-registers.scala 112:30]
    end
    if (reset | io_flush) begin // @[pipeline-registers.scala 115:34]
      exception_cause <= 5'h0; // @[pipeline-registers.scala 118:21]
    end else if (!(io_stall)) begin // @[pipeline-registers.scala 119:25]
      exception_cause <= io_exception_i_cause; // @[pipeline-registers.scala 113:30]
    end
    if (reset | io_flush) begin // @[pipeline-registers.scala 115:34]
      exception_pc <= 64'h0; // @[pipeline-registers.scala 118:21]
    end else if (!(io_stall)) begin // @[pipeline-registers.scala 119:25]
      exception_pc <= io_exception_i_pc; // @[pipeline-registers.scala 113:30]
    end
    if (reset | io_flush) begin // @[pipeline-registers.scala 115:34]
      exception_xtval <= 64'h0; // @[pipeline-registers.scala 118:21]
    end else if (!(io_stall)) begin // @[pipeline-registers.scala 119:25]
      exception_xtval <= io_exception_i_xtval; // @[pipeline-registers.scala 113:30]
    end
    if (reset | io_flush) begin // @[pipeline-registers.scala 115:34]
      exception_happen <= 1'h0; // @[pipeline-registers.scala 118:21]
    end else if (!(io_stall)) begin // @[pipeline-registers.scala 119:25]
      exception_happen <= io_exception_i_happen; // @[pipeline-registers.scala 113:30]
    end
    if (reset | io_flush) begin // @[pipeline-registers.scala 115:34]
      exception_new_pc <= 64'h0; // @[pipeline-registers.scala 118:21]
    end else if (!(io_stall)) begin // @[pipeline-registers.scala 119:25]
      exception_new_pc <= io_exception_i_new_pc; // @[pipeline-registers.scala 113:30]
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
  writeCSROp_en = _RAND_3[0:0];
  _RAND_4 = {1{`RANDOM}};
  writeCSROp_addr = _RAND_4[11:0];
  _RAND_5 = {2{`RANDOM}};
  writeCSROp_data = _RAND_5[63:0];
  _RAND_6 = {1{`RANDOM}};
  exception_cause = _RAND_6[4:0];
  _RAND_7 = {2{`RANDOM}};
  exception_pc = _RAND_7[63:0];
  _RAND_8 = {2{`RANDOM}};
  exception_xtval = _RAND_8[63:0];
  _RAND_9 = {1{`RANDOM}};
  exception_happen = _RAND_9[0:0];
  _RAND_10 = {2{`RANDOM}};
  exception_new_pc = _RAND_10[63:0];
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
  input         io_writeCSROp_i_en,
  input  [11:0] io_writeCSROp_i_addr,
  input  [63:0] io_writeCSROp_i_data,
  input  [4:0]  io_exception_i_cause,
  input  [63:0] io_exception_i_pc,
  input  [63:0] io_exception_i_xtval,
  input         io_exception_i_happen,
  input  [63:0] io_exception_i_new_pc,
  output        io_writeRfOp_o_en,
  output [63:0] io_writeRfOp_o_data,
  output [4:0]  io_writeRfOp_o_addr,
  output        io_writeCSROp_o_en,
  output [63:0] io_writeCSROp_o_data,
  output [4:0]  io_exception_o_cause,
  output [63:0] io_exception_o_pc,
  output [63:0] io_exception_o_xtval,
  output        io_exception_o_happen,
  output [4:0]  io_rf_fwd_addr,
  output [63:0] io_rf_fwd_data,
  output [11:0] io_csr_fwd_addr,
  output [63:0] io_csr_fwd_data,
  output        io_if_excep_happen,
  output [63:0] io_if_excep_new_pc
);
  assign io_writeRfOp_o_en = io_writeRfOp_i_en; // @[Wb.scala 22:21]
  assign io_writeRfOp_o_data = io_writeRfOp_i_data; // @[Wb.scala 22:21]
  assign io_writeRfOp_o_addr = io_writeRfOp_i_addr; // @[Wb.scala 22:21]
  assign io_writeCSROp_o_en = io_writeCSROp_i_en; // @[Wb.scala 23:21]
  assign io_writeCSROp_o_data = io_writeCSROp_i_data; // @[Wb.scala 23:21]
  assign io_exception_o_cause = io_exception_i_cause; // @[Wb.scala 28:21]
  assign io_exception_o_pc = io_exception_i_pc; // @[Wb.scala 28:21]
  assign io_exception_o_xtval = io_exception_i_xtval; // @[Wb.scala 28:21]
  assign io_exception_o_happen = io_exception_i_happen; // @[Wb.scala 28:21]
  assign io_rf_fwd_addr = io_writeRfOp_i_addr; // @[Wb.scala 25:21]
  assign io_rf_fwd_data = io_writeRfOp_i_data; // @[Wb.scala 25:21]
  assign io_csr_fwd_addr = io_writeCSROp_i_addr; // @[Wb.scala 26:21]
  assign io_csr_fwd_data = io_writeCSROp_i_data; // @[Wb.scala 26:21]
  assign io_if_excep_happen = io_exception_i_happen; // @[Wb.scala 33:17]
  assign io_if_excep_new_pc = io_exception_i_new_pc; // @[Wb.scala 33:17]
endmodule
module Ctrl(
  input        io_excep,
  input        io_id_stall_req,
  input        io_id_flush_req,
  input        io_ex_stall_req,
  output [4:0] io_stall,
  output [4:0] io_flush
);
  wire [1:0] _GEN_0 = io_id_stall_req ? 2'h3 : 2'h0; // @[Ctrl.scala 18:17 21:26 22:21]
  wire [2:0] _GEN_1 = io_ex_stall_req ? 3'h7 : {{1'd0}, _GEN_0}; // @[Ctrl.scala 24:26 25:21]
  wire [1:0] _GEN_2 = io_id_flush_req ? 2'h3 : 2'h0; // @[Ctrl.scala 19:17 27:26 28:21]
  assign io_stall = {{2'd0}, _GEN_1};
  assign io_flush = io_excep ? 5'h1f : {{3'd0}, _GEN_2}; // @[Ctrl.scala 32:19 33:21]
endmodule
module Div(
  input         clock,
  input         reset,
  input  [63:0] io_a,
  input  [63:0] io_b,
  input         io_start,
  output [63:0] io_rem,
  output [63:0] io_quo,
  output        io_finish
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [159:0] _RAND_1;
  reg [63:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [63:0] _RAND_4;
  reg [63:0] _RAND_5;
`endif // RANDOMIZE_REG_INIT
  reg [1:0] state; // @[Arith.scala 553:26]
  reg [128:0] PA; // @[Arith.scala 554:26]
  wire [64:0] P = PA[128:64]; // @[Arith.scala 555:21]
  wire [130:0] PASL2 = {PA, 2'h0}; // @[Arith.scala 556:22]
  reg [63:0] B; // @[Arith.scala 557:26]
  wire [64:0] _negB_T = {1'h0,B}; // @[Cat.scala 31:58]
  wire [64:0] _negB_T_1 = ~_negB_T; // @[Arith.scala 559:19]
  wire [64:0] negB = _negB_T_1 + 65'h1; // @[Arith.scala 559:37]
  wire [65:0] neg2B = {negB, 1'h0}; // @[Arith.scala 560:24]
  wire [63:0] _GEN_845 = {{32'd0}, io_b[63:32]}; // @[Bitwise.scala 105:31]
  wire [63:0] _clz_T_3 = _GEN_845 & 64'hffffffff; // @[Bitwise.scala 105:31]
  wire [63:0] _clz_T_5 = {io_b[31:0], 32'h0}; // @[Bitwise.scala 105:70]
  wire [63:0] _clz_T_7 = _clz_T_5 & 64'hffffffff00000000; // @[Bitwise.scala 105:80]
  wire [63:0] _clz_T_8 = _clz_T_3 | _clz_T_7; // @[Bitwise.scala 105:39]
  wire [63:0] _GEN_846 = {{16'd0}, _clz_T_8[63:16]}; // @[Bitwise.scala 105:31]
  wire [63:0] _clz_T_13 = _GEN_846 & 64'hffff0000ffff; // @[Bitwise.scala 105:31]
  wire [63:0] _clz_T_15 = {_clz_T_8[47:0], 16'h0}; // @[Bitwise.scala 105:70]
  wire [63:0] _clz_T_17 = _clz_T_15 & 64'hffff0000ffff0000; // @[Bitwise.scala 105:80]
  wire [63:0] _clz_T_18 = _clz_T_13 | _clz_T_17; // @[Bitwise.scala 105:39]
  wire [63:0] _GEN_847 = {{8'd0}, _clz_T_18[63:8]}; // @[Bitwise.scala 105:31]
  wire [63:0] _clz_T_23 = _GEN_847 & 64'hff00ff00ff00ff; // @[Bitwise.scala 105:31]
  wire [63:0] _clz_T_25 = {_clz_T_18[55:0], 8'h0}; // @[Bitwise.scala 105:70]
  wire [63:0] _clz_T_27 = _clz_T_25 & 64'hff00ff00ff00ff00; // @[Bitwise.scala 105:80]
  wire [63:0] _clz_T_28 = _clz_T_23 | _clz_T_27; // @[Bitwise.scala 105:39]
  wire [63:0] _GEN_848 = {{4'd0}, _clz_T_28[63:4]}; // @[Bitwise.scala 105:31]
  wire [63:0] _clz_T_33 = _GEN_848 & 64'hf0f0f0f0f0f0f0f; // @[Bitwise.scala 105:31]
  wire [63:0] _clz_T_35 = {_clz_T_28[59:0], 4'h0}; // @[Bitwise.scala 105:70]
  wire [63:0] _clz_T_37 = _clz_T_35 & 64'hf0f0f0f0f0f0f0f0; // @[Bitwise.scala 105:80]
  wire [63:0] _clz_T_38 = _clz_T_33 | _clz_T_37; // @[Bitwise.scala 105:39]
  wire [63:0] _GEN_849 = {{2'd0}, _clz_T_38[63:2]}; // @[Bitwise.scala 105:31]
  wire [63:0] _clz_T_43 = _GEN_849 & 64'h3333333333333333; // @[Bitwise.scala 105:31]
  wire [63:0] _clz_T_45 = {_clz_T_38[61:0], 2'h0}; // @[Bitwise.scala 105:70]
  wire [63:0] _clz_T_47 = _clz_T_45 & 64'hcccccccccccccccc; // @[Bitwise.scala 105:80]
  wire [63:0] _clz_T_48 = _clz_T_43 | _clz_T_47; // @[Bitwise.scala 105:39]
  wire [63:0] _GEN_850 = {{1'd0}, _clz_T_48[63:1]}; // @[Bitwise.scala 105:31]
  wire [63:0] _clz_T_53 = _GEN_850 & 64'h5555555555555555; // @[Bitwise.scala 105:31]
  wire [63:0] _clz_T_55 = {_clz_T_48[62:0], 1'h0}; // @[Bitwise.scala 105:70]
  wire [63:0] _clz_T_57 = _clz_T_55 & 64'haaaaaaaaaaaaaaaa; // @[Bitwise.scala 105:80]
  wire [63:0] _clz_T_58 = _clz_T_53 | _clz_T_57; // @[Bitwise.scala 105:39]
  wire [5:0] _clz_T_123 = _clz_T_58[62] ? 6'h3e : 6'h3f; // @[Mux.scala 47:70]
  wire [5:0] _clz_T_124 = _clz_T_58[61] ? 6'h3d : _clz_T_123; // @[Mux.scala 47:70]
  wire [5:0] _clz_T_125 = _clz_T_58[60] ? 6'h3c : _clz_T_124; // @[Mux.scala 47:70]
  wire [5:0] _clz_T_126 = _clz_T_58[59] ? 6'h3b : _clz_T_125; // @[Mux.scala 47:70]
  wire [5:0] _clz_T_127 = _clz_T_58[58] ? 6'h3a : _clz_T_126; // @[Mux.scala 47:70]
  wire [5:0] _clz_T_128 = _clz_T_58[57] ? 6'h39 : _clz_T_127; // @[Mux.scala 47:70]
  wire [5:0] _clz_T_129 = _clz_T_58[56] ? 6'h38 : _clz_T_128; // @[Mux.scala 47:70]
  wire [5:0] _clz_T_130 = _clz_T_58[55] ? 6'h37 : _clz_T_129; // @[Mux.scala 47:70]
  wire [5:0] _clz_T_131 = _clz_T_58[54] ? 6'h36 : _clz_T_130; // @[Mux.scala 47:70]
  wire [5:0] _clz_T_132 = _clz_T_58[53] ? 6'h35 : _clz_T_131; // @[Mux.scala 47:70]
  wire [5:0] _clz_T_133 = _clz_T_58[52] ? 6'h34 : _clz_T_132; // @[Mux.scala 47:70]
  wire [5:0] _clz_T_134 = _clz_T_58[51] ? 6'h33 : _clz_T_133; // @[Mux.scala 47:70]
  wire [5:0] _clz_T_135 = _clz_T_58[50] ? 6'h32 : _clz_T_134; // @[Mux.scala 47:70]
  wire [5:0] _clz_T_136 = _clz_T_58[49] ? 6'h31 : _clz_T_135; // @[Mux.scala 47:70]
  wire [5:0] _clz_T_137 = _clz_T_58[48] ? 6'h30 : _clz_T_136; // @[Mux.scala 47:70]
  wire [5:0] _clz_T_138 = _clz_T_58[47] ? 6'h2f : _clz_T_137; // @[Mux.scala 47:70]
  wire [5:0] _clz_T_139 = _clz_T_58[46] ? 6'h2e : _clz_T_138; // @[Mux.scala 47:70]
  wire [5:0] _clz_T_140 = _clz_T_58[45] ? 6'h2d : _clz_T_139; // @[Mux.scala 47:70]
  wire [5:0] _clz_T_141 = _clz_T_58[44] ? 6'h2c : _clz_T_140; // @[Mux.scala 47:70]
  wire [5:0] _clz_T_142 = _clz_T_58[43] ? 6'h2b : _clz_T_141; // @[Mux.scala 47:70]
  wire [5:0] _clz_T_143 = _clz_T_58[42] ? 6'h2a : _clz_T_142; // @[Mux.scala 47:70]
  wire [5:0] _clz_T_144 = _clz_T_58[41] ? 6'h29 : _clz_T_143; // @[Mux.scala 47:70]
  wire [5:0] _clz_T_145 = _clz_T_58[40] ? 6'h28 : _clz_T_144; // @[Mux.scala 47:70]
  wire [5:0] _clz_T_146 = _clz_T_58[39] ? 6'h27 : _clz_T_145; // @[Mux.scala 47:70]
  wire [5:0] _clz_T_147 = _clz_T_58[38] ? 6'h26 : _clz_T_146; // @[Mux.scala 47:70]
  wire [5:0] _clz_T_148 = _clz_T_58[37] ? 6'h25 : _clz_T_147; // @[Mux.scala 47:70]
  wire [5:0] _clz_T_149 = _clz_T_58[36] ? 6'h24 : _clz_T_148; // @[Mux.scala 47:70]
  wire [5:0] _clz_T_150 = _clz_T_58[35] ? 6'h23 : _clz_T_149; // @[Mux.scala 47:70]
  wire [5:0] _clz_T_151 = _clz_T_58[34] ? 6'h22 : _clz_T_150; // @[Mux.scala 47:70]
  wire [5:0] _clz_T_152 = _clz_T_58[33] ? 6'h21 : _clz_T_151; // @[Mux.scala 47:70]
  wire [5:0] _clz_T_153 = _clz_T_58[32] ? 6'h20 : _clz_T_152; // @[Mux.scala 47:70]
  wire [5:0] _clz_T_154 = _clz_T_58[31] ? 6'h1f : _clz_T_153; // @[Mux.scala 47:70]
  wire [5:0] _clz_T_155 = _clz_T_58[30] ? 6'h1e : _clz_T_154; // @[Mux.scala 47:70]
  wire [5:0] _clz_T_156 = _clz_T_58[29] ? 6'h1d : _clz_T_155; // @[Mux.scala 47:70]
  wire [5:0] _clz_T_157 = _clz_T_58[28] ? 6'h1c : _clz_T_156; // @[Mux.scala 47:70]
  wire [5:0] _clz_T_158 = _clz_T_58[27] ? 6'h1b : _clz_T_157; // @[Mux.scala 47:70]
  wire [5:0] _clz_T_159 = _clz_T_58[26] ? 6'h1a : _clz_T_158; // @[Mux.scala 47:70]
  wire [5:0] _clz_T_160 = _clz_T_58[25] ? 6'h19 : _clz_T_159; // @[Mux.scala 47:70]
  wire [5:0] _clz_T_161 = _clz_T_58[24] ? 6'h18 : _clz_T_160; // @[Mux.scala 47:70]
  wire [5:0] _clz_T_162 = _clz_T_58[23] ? 6'h17 : _clz_T_161; // @[Mux.scala 47:70]
  wire [5:0] _clz_T_163 = _clz_T_58[22] ? 6'h16 : _clz_T_162; // @[Mux.scala 47:70]
  wire [5:0] _clz_T_164 = _clz_T_58[21] ? 6'h15 : _clz_T_163; // @[Mux.scala 47:70]
  wire [5:0] _clz_T_165 = _clz_T_58[20] ? 6'h14 : _clz_T_164; // @[Mux.scala 47:70]
  wire [5:0] _clz_T_166 = _clz_T_58[19] ? 6'h13 : _clz_T_165; // @[Mux.scala 47:70]
  wire [5:0] _clz_T_167 = _clz_T_58[18] ? 6'h12 : _clz_T_166; // @[Mux.scala 47:70]
  wire [5:0] _clz_T_168 = _clz_T_58[17] ? 6'h11 : _clz_T_167; // @[Mux.scala 47:70]
  wire [5:0] _clz_T_169 = _clz_T_58[16] ? 6'h10 : _clz_T_168; // @[Mux.scala 47:70]
  wire [5:0] _clz_T_170 = _clz_T_58[15] ? 6'hf : _clz_T_169; // @[Mux.scala 47:70]
  wire [5:0] _clz_T_171 = _clz_T_58[14] ? 6'he : _clz_T_170; // @[Mux.scala 47:70]
  wire [5:0] _clz_T_172 = _clz_T_58[13] ? 6'hd : _clz_T_171; // @[Mux.scala 47:70]
  wire [5:0] _clz_T_173 = _clz_T_58[12] ? 6'hc : _clz_T_172; // @[Mux.scala 47:70]
  wire [5:0] _clz_T_174 = _clz_T_58[11] ? 6'hb : _clz_T_173; // @[Mux.scala 47:70]
  wire [5:0] _clz_T_175 = _clz_T_58[10] ? 6'ha : _clz_T_174; // @[Mux.scala 47:70]
  wire [5:0] _clz_T_176 = _clz_T_58[9] ? 6'h9 : _clz_T_175; // @[Mux.scala 47:70]
  wire [5:0] _clz_T_177 = _clz_T_58[8] ? 6'h8 : _clz_T_176; // @[Mux.scala 47:70]
  wire [5:0] _clz_T_178 = _clz_T_58[7] ? 6'h7 : _clz_T_177; // @[Mux.scala 47:70]
  wire [5:0] _clz_T_179 = _clz_T_58[6] ? 6'h6 : _clz_T_178; // @[Mux.scala 47:70]
  wire [5:0] _clz_T_180 = _clz_T_58[5] ? 6'h5 : _clz_T_179; // @[Mux.scala 47:70]
  wire [5:0] _clz_T_181 = _clz_T_58[4] ? 6'h4 : _clz_T_180; // @[Mux.scala 47:70]
  wire [5:0] _clz_T_182 = _clz_T_58[3] ? 6'h3 : _clz_T_181; // @[Mux.scala 47:70]
  wire [5:0] _clz_T_183 = _clz_T_58[2] ? 6'h2 : _clz_T_182; // @[Mux.scala 47:70]
  wire [5:0] _clz_T_184 = _clz_T_58[1] ? 6'h1 : _clz_T_183; // @[Mux.scala 47:70]
  wire [5:0] clz = _clz_T_58[0] ? 6'h0 : _clz_T_184; // @[Mux.scala 47:70]
  wire [3:0] whichTable = B[63:60]; // @[Arith.scala 564:23]
  wire [3:0] _offset_T_1 = whichTable - 4'h8; // @[Arith.scala 566:34]
  wire [5:0] _offset_T_2 = {_offset_T_1, 2'h0}; // @[Arith.scala 566:41]
  wire [5:0] _GEN_851 = {{2'd0}, whichTable}; // @[Arith.scala 566:47]
  wire [5:0] _offset_T_4 = _offset_T_2 + _GEN_851; // @[Arith.scala 566:47]
  wire [5:0] _offset_T_6 = _offset_T_4 - 6'h8; // @[Arith.scala 566:60]
  wire [6:0] offset = {_offset_T_6, 1'h0}; // @[Arith.scala 566:67]
  reg [5:0] cnt; // @[Arith.scala 567:26]
  wire  P_neg = PA[128]; // @[Arith.scala 568:21]
  reg [63:0] pos_quo; // @[Arith.scala 569:26]
  reg [63:0] neg_quo; // @[Arith.scala 570:26]
  wire [63:0] _io_quo_T_1 = pos_quo - neg_quo; // @[Arith.scala 574:27]
  wire [5:0] _qNeg2_T_1 = P[64:59]; // @[Arith.scala 578:36]
  wire [6:0] _qNeg1_T_3 = offset + 7'h2; // @[Arith.scala 579:57]
  wire [6:0] _qNeg1_T_5 = offset + 7'h3; // @[Arith.scala 579:77]
  wire [5:0] _GEN_161 = 7'h1 == _qNeg1_T_3 ? $signed(-6'sh7) : $signed(-6'shc); // @[Arith.scala 530:{14,14}]
  wire [5:0] _GEN_162 = 7'h2 == _qNeg1_T_3 ? $signed(-6'sh6) : $signed(_GEN_161); // @[Arith.scala 530:{14,14}]
  wire [5:0] _GEN_163 = 7'h3 == _qNeg1_T_3 ? $signed(-6'sh3) : $signed(_GEN_162); // @[Arith.scala 530:{14,14}]
  wire [5:0] _GEN_164 = 7'h4 == _qNeg1_T_3 ? $signed(-6'sh2) : $signed(_GEN_163); // @[Arith.scala 530:{14,14}]
  wire [5:0] _GEN_165 = 7'h5 == _qNeg1_T_3 ? $signed(6'sh1) : $signed(_GEN_164); // @[Arith.scala 530:{14,14}]
  wire [5:0] _GEN_166 = 7'h6 == _qNeg1_T_3 ? $signed(6'sh2) : $signed(_GEN_165); // @[Arith.scala 530:{14,14}]
  wire [5:0] _GEN_167 = 7'h7 == _qNeg1_T_3 ? $signed(6'sh5) : $signed(_GEN_166); // @[Arith.scala 530:{14,14}]
  wire [5:0] _GEN_168 = 7'h8 == _qNeg1_T_3 ? $signed(6'sh6) : $signed(_GEN_167); // @[Arith.scala 530:{14,14}]
  wire [5:0] _GEN_169 = 7'h9 == _qNeg1_T_3 ? $signed(6'shb) : $signed(_GEN_168); // @[Arith.scala 530:{14,14}]
  wire [5:0] _GEN_170 = 7'ha == _qNeg1_T_3 ? $signed(-6'she) : $signed(_GEN_169); // @[Arith.scala 530:{14,14}]
  wire [5:0] _GEN_171 = 7'hb == _qNeg1_T_3 ? $signed(-6'sh8) : $signed(_GEN_170); // @[Arith.scala 530:{14,14}]
  wire [5:0] _GEN_172 = 7'hc == _qNeg1_T_3 ? $signed(-6'sh7) : $signed(_GEN_171); // @[Arith.scala 530:{14,14}]
  wire [5:0] _GEN_173 = 7'hd == _qNeg1_T_3 ? $signed(-6'sh3) : $signed(_GEN_172); // @[Arith.scala 530:{14,14}]
  wire [5:0] _GEN_174 = 7'he == _qNeg1_T_3 ? $signed(-6'sh3) : $signed(_GEN_173); // @[Arith.scala 530:{14,14}]
  wire [5:0] _GEN_175 = 7'hf == _qNeg1_T_3 ? $signed(6'sh2) : $signed(_GEN_174); // @[Arith.scala 530:{14,14}]
  wire [5:0] _GEN_176 = 7'h10 == _qNeg1_T_3 ? $signed(6'sh2) : $signed(_GEN_175); // @[Arith.scala 530:{14,14}]
  wire [5:0] _GEN_177 = 7'h11 == _qNeg1_T_3 ? $signed(6'sh6) : $signed(_GEN_176); // @[Arith.scala 530:{14,14}]
  wire [5:0] _GEN_178 = 7'h12 == _qNeg1_T_3 ? $signed(6'sh7) : $signed(_GEN_177); // @[Arith.scala 530:{14,14}]
  wire [5:0] _GEN_179 = 7'h13 == _qNeg1_T_3 ? $signed(6'shd) : $signed(_GEN_178); // @[Arith.scala 530:{14,14}]
  wire [5:0] _GEN_180 = 7'h14 == _qNeg1_T_3 ? $signed(-6'shf) : $signed(_GEN_179); // @[Arith.scala 530:{14,14}]
  wire [5:0] _GEN_181 = 7'h15 == _qNeg1_T_3 ? $signed(-6'sh9) : $signed(_GEN_180); // @[Arith.scala 530:{14,14}]
  wire [5:0] _GEN_182 = 7'h16 == _qNeg1_T_3 ? $signed(-6'sh8) : $signed(_GEN_181); // @[Arith.scala 530:{14,14}]
  wire [5:0] _GEN_183 = 7'h17 == _qNeg1_T_3 ? $signed(-6'sh3) : $signed(_GEN_182); // @[Arith.scala 530:{14,14}]
  wire [5:0] _GEN_184 = 7'h18 == _qNeg1_T_3 ? $signed(-6'sh3) : $signed(_GEN_183); // @[Arith.scala 530:{14,14}]
  wire [5:0] _GEN_185 = 7'h19 == _qNeg1_T_3 ? $signed(6'sh2) : $signed(_GEN_184); // @[Arith.scala 530:{14,14}]
  wire [5:0] _GEN_186 = 7'h1a == _qNeg1_T_3 ? $signed(6'sh2) : $signed(_GEN_185); // @[Arith.scala 530:{14,14}]
  wire [5:0] _GEN_187 = 7'h1b == _qNeg1_T_3 ? $signed(6'sh7) : $signed(_GEN_186); // @[Arith.scala 530:{14,14}]
  wire [5:0] _GEN_188 = 7'h1c == _qNeg1_T_3 ? $signed(6'sh8) : $signed(_GEN_187); // @[Arith.scala 530:{14,14}]
  wire [5:0] _GEN_189 = 7'h1d == _qNeg1_T_3 ? $signed(6'she) : $signed(_GEN_188); // @[Arith.scala 530:{14,14}]
  wire [5:0] _GEN_190 = 7'h1e == _qNeg1_T_3 ? $signed(-6'sh10) : $signed(_GEN_189); // @[Arith.scala 530:{14,14}]
  wire [5:0] _GEN_191 = 7'h1f == _qNeg1_T_3 ? $signed(-6'sh9) : $signed(_GEN_190); // @[Arith.scala 530:{14,14}]
  wire [5:0] _GEN_192 = 7'h20 == _qNeg1_T_3 ? $signed(-6'sh9) : $signed(_GEN_191); // @[Arith.scala 530:{14,14}]
  wire [5:0] _GEN_193 = 7'h21 == _qNeg1_T_3 ? $signed(-6'sh3) : $signed(_GEN_192); // @[Arith.scala 530:{14,14}]
  wire [5:0] _GEN_194 = 7'h22 == _qNeg1_T_3 ? $signed(-6'sh3) : $signed(_GEN_193); // @[Arith.scala 530:{14,14}]
  wire [5:0] _GEN_195 = 7'h23 == _qNeg1_T_3 ? $signed(6'sh2) : $signed(_GEN_194); // @[Arith.scala 530:{14,14}]
  wire [5:0] _GEN_196 = 7'h24 == _qNeg1_T_3 ? $signed(6'sh2) : $signed(_GEN_195); // @[Arith.scala 530:{14,14}]
  wire [5:0] _GEN_197 = 7'h25 == _qNeg1_T_3 ? $signed(6'sh8) : $signed(_GEN_196); // @[Arith.scala 530:{14,14}]
  wire [5:0] _GEN_198 = 7'h26 == _qNeg1_T_3 ? $signed(6'sh8) : $signed(_GEN_197); // @[Arith.scala 530:{14,14}]
  wire [5:0] _GEN_199 = 7'h27 == _qNeg1_T_3 ? $signed(6'shf) : $signed(_GEN_198); // @[Arith.scala 530:{14,14}]
  wire [5:0] _GEN_200 = 7'h28 == _qNeg1_T_3 ? $signed(-6'sh12) : $signed(_GEN_199); // @[Arith.scala 530:{14,14}]
  wire [5:0] _GEN_201 = 7'h29 == _qNeg1_T_3 ? $signed(-6'sha) : $signed(_GEN_200); // @[Arith.scala 530:{14,14}]
  wire [5:0] _GEN_202 = 7'h2a == _qNeg1_T_3 ? $signed(-6'sha) : $signed(_GEN_201); // @[Arith.scala 530:{14,14}]
  wire [5:0] _GEN_203 = 7'h2b == _qNeg1_T_3 ? $signed(-6'sh4) : $signed(_GEN_202); // @[Arith.scala 530:{14,14}]
  wire [5:0] _GEN_204 = 7'h2c == _qNeg1_T_3 ? $signed(-6'sh4) : $signed(_GEN_203); // @[Arith.scala 530:{14,14}]
  wire [5:0] _GEN_205 = 7'h2d == _qNeg1_T_3 ? $signed(6'sh3) : $signed(_GEN_204); // @[Arith.scala 530:{14,14}]
  wire [5:0] _GEN_206 = 7'h2e == _qNeg1_T_3 ? $signed(6'sh3) : $signed(_GEN_205); // @[Arith.scala 530:{14,14}]
  wire [5:0] _GEN_207 = 7'h2f == _qNeg1_T_3 ? $signed(6'sh9) : $signed(_GEN_206); // @[Arith.scala 530:{14,14}]
  wire [5:0] _GEN_208 = 7'h30 == _qNeg1_T_3 ? $signed(6'sh9) : $signed(_GEN_207); // @[Arith.scala 530:{14,14}]
  wire [5:0] _GEN_209 = 7'h31 == _qNeg1_T_3 ? $signed(6'sh11) : $signed(_GEN_208); // @[Arith.scala 530:{14,14}]
  wire [5:0] _GEN_210 = 7'h32 == _qNeg1_T_3 ? $signed(-6'sh13) : $signed(_GEN_209); // @[Arith.scala 530:{14,14}]
  wire [5:0] _GEN_211 = 7'h33 == _qNeg1_T_3 ? $signed(-6'shb) : $signed(_GEN_210); // @[Arith.scala 530:{14,14}]
  wire [5:0] _GEN_212 = 7'h34 == _qNeg1_T_3 ? $signed(-6'sha) : $signed(_GEN_211); // @[Arith.scala 530:{14,14}]
  wire [5:0] _GEN_213 = 7'h35 == _qNeg1_T_3 ? $signed(-6'sh4) : $signed(_GEN_212); // @[Arith.scala 530:{14,14}]
  wire [5:0] _GEN_214 = 7'h36 == _qNeg1_T_3 ? $signed(-6'sh4) : $signed(_GEN_213); // @[Arith.scala 530:{14,14}]
  wire [5:0] _GEN_215 = 7'h37 == _qNeg1_T_3 ? $signed(6'sh3) : $signed(_GEN_214); // @[Arith.scala 530:{14,14}]
  wire [5:0] _GEN_216 = 7'h38 == _qNeg1_T_3 ? $signed(6'sh3) : $signed(_GEN_215); // @[Arith.scala 530:{14,14}]
  wire [5:0] _GEN_217 = 7'h39 == _qNeg1_T_3 ? $signed(6'sh9) : $signed(_GEN_216); // @[Arith.scala 530:{14,14}]
  wire [5:0] _GEN_218 = 7'h3a == _qNeg1_T_3 ? $signed(6'sha) : $signed(_GEN_217); // @[Arith.scala 530:{14,14}]
  wire [5:0] _GEN_219 = 7'h3b == _qNeg1_T_3 ? $signed(6'sh12) : $signed(_GEN_218); // @[Arith.scala 530:{14,14}]
  wire [5:0] _GEN_220 = 7'h3c == _qNeg1_T_3 ? $signed(-6'sh14) : $signed(_GEN_219); // @[Arith.scala 530:{14,14}]
  wire [5:0] _GEN_221 = 7'h3d == _qNeg1_T_3 ? $signed(-6'shb) : $signed(_GEN_220); // @[Arith.scala 530:{14,14}]
  wire [5:0] _GEN_222 = 7'h3e == _qNeg1_T_3 ? $signed(-6'shb) : $signed(_GEN_221); // @[Arith.scala 530:{14,14}]
  wire [5:0] _GEN_223 = 7'h3f == _qNeg1_T_3 ? $signed(-6'sh4) : $signed(_GEN_222); // @[Arith.scala 530:{14,14}]
  wire [5:0] _GEN_224 = 7'h40 == _qNeg1_T_3 ? $signed(-6'sh4) : $signed(_GEN_223); // @[Arith.scala 530:{14,14}]
  wire [5:0] _GEN_225 = 7'h41 == _qNeg1_T_3 ? $signed(6'sh3) : $signed(_GEN_224); // @[Arith.scala 530:{14,14}]
  wire [5:0] _GEN_226 = 7'h42 == _qNeg1_T_3 ? $signed(6'sh3) : $signed(_GEN_225); // @[Arith.scala 530:{14,14}]
  wire [5:0] _GEN_227 = 7'h43 == _qNeg1_T_3 ? $signed(6'sha) : $signed(_GEN_226); // @[Arith.scala 530:{14,14}]
  wire [5:0] _GEN_228 = 7'h44 == _qNeg1_T_3 ? $signed(6'sha) : $signed(_GEN_227); // @[Arith.scala 530:{14,14}]
  wire [5:0] _GEN_229 = 7'h45 == _qNeg1_T_3 ? $signed(6'sh13) : $signed(_GEN_228); // @[Arith.scala 530:{14,14}]
  wire [5:0] _GEN_230 = 7'h46 == _qNeg1_T_3 ? $signed(-6'sh16) : $signed(_GEN_229); // @[Arith.scala 530:{14,14}]
  wire [5:0] _GEN_231 = 7'h47 == _qNeg1_T_3 ? $signed(-6'shc) : $signed(_GEN_230); // @[Arith.scala 530:{14,14}]
  wire [5:0] _GEN_232 = 7'h48 == _qNeg1_T_3 ? $signed(-6'shc) : $signed(_GEN_231); // @[Arith.scala 530:{14,14}]
  wire [5:0] _GEN_233 = 7'h49 == _qNeg1_T_3 ? $signed(-6'sh4) : $signed(_GEN_232); // @[Arith.scala 530:{14,14}]
  wire [5:0] _GEN_234 = 7'h4a == _qNeg1_T_3 ? $signed(-6'sh5) : $signed(_GEN_233); // @[Arith.scala 530:{14,14}]
  wire [5:0] _GEN_235 = 7'h4b == _qNeg1_T_3 ? $signed(6'sh4) : $signed(_GEN_234); // @[Arith.scala 530:{14,14}]
  wire [5:0] _GEN_236 = 7'h4c == _qNeg1_T_3 ? $signed(6'sh3) : $signed(_GEN_235); // @[Arith.scala 530:{14,14}]
  wire [5:0] _GEN_237 = 7'h4d == _qNeg1_T_3 ? $signed(6'shb) : $signed(_GEN_236); // @[Arith.scala 530:{14,14}]
  wire [5:0] _GEN_238 = 7'h4e == _qNeg1_T_3 ? $signed(6'shb) : $signed(_GEN_237); // @[Arith.scala 530:{14,14}]
  wire [5:0] _GEN_239 = 7'h4f == _qNeg1_T_3 ? $signed(6'sh15) : $signed(_GEN_238); // @[Arith.scala 530:{14,14}]
  wire [5:0] _GEN_241 = 7'h1 == _qNeg1_T_5 ? $signed(-6'sh7) : $signed(-6'shc); // @[Arith.scala 530:{26,26}]
  wire [5:0] _GEN_242 = 7'h2 == _qNeg1_T_5 ? $signed(-6'sh6) : $signed(_GEN_241); // @[Arith.scala 530:{26,26}]
  wire [5:0] _GEN_243 = 7'h3 == _qNeg1_T_5 ? $signed(-6'sh3) : $signed(_GEN_242); // @[Arith.scala 530:{26,26}]
  wire [5:0] _GEN_244 = 7'h4 == _qNeg1_T_5 ? $signed(-6'sh2) : $signed(_GEN_243); // @[Arith.scala 530:{26,26}]
  wire [5:0] _GEN_245 = 7'h5 == _qNeg1_T_5 ? $signed(6'sh1) : $signed(_GEN_244); // @[Arith.scala 530:{26,26}]
  wire [5:0] _GEN_246 = 7'h6 == _qNeg1_T_5 ? $signed(6'sh2) : $signed(_GEN_245); // @[Arith.scala 530:{26,26}]
  wire [5:0] _GEN_247 = 7'h7 == _qNeg1_T_5 ? $signed(6'sh5) : $signed(_GEN_246); // @[Arith.scala 530:{26,26}]
  wire [5:0] _GEN_248 = 7'h8 == _qNeg1_T_5 ? $signed(6'sh6) : $signed(_GEN_247); // @[Arith.scala 530:{26,26}]
  wire [5:0] _GEN_249 = 7'h9 == _qNeg1_T_5 ? $signed(6'shb) : $signed(_GEN_248); // @[Arith.scala 530:{26,26}]
  wire [5:0] _GEN_250 = 7'ha == _qNeg1_T_5 ? $signed(-6'she) : $signed(_GEN_249); // @[Arith.scala 530:{26,26}]
  wire [5:0] _GEN_251 = 7'hb == _qNeg1_T_5 ? $signed(-6'sh8) : $signed(_GEN_250); // @[Arith.scala 530:{26,26}]
  wire [5:0] _GEN_252 = 7'hc == _qNeg1_T_5 ? $signed(-6'sh7) : $signed(_GEN_251); // @[Arith.scala 530:{26,26}]
  wire [5:0] _GEN_253 = 7'hd == _qNeg1_T_5 ? $signed(-6'sh3) : $signed(_GEN_252); // @[Arith.scala 530:{26,26}]
  wire [5:0] _GEN_254 = 7'he == _qNeg1_T_5 ? $signed(-6'sh3) : $signed(_GEN_253); // @[Arith.scala 530:{26,26}]
  wire [5:0] _GEN_255 = 7'hf == _qNeg1_T_5 ? $signed(6'sh2) : $signed(_GEN_254); // @[Arith.scala 530:{26,26}]
  wire [5:0] _GEN_256 = 7'h10 == _qNeg1_T_5 ? $signed(6'sh2) : $signed(_GEN_255); // @[Arith.scala 530:{26,26}]
  wire [5:0] _GEN_257 = 7'h11 == _qNeg1_T_5 ? $signed(6'sh6) : $signed(_GEN_256); // @[Arith.scala 530:{26,26}]
  wire [5:0] _GEN_258 = 7'h12 == _qNeg1_T_5 ? $signed(6'sh7) : $signed(_GEN_257); // @[Arith.scala 530:{26,26}]
  wire [5:0] _GEN_259 = 7'h13 == _qNeg1_T_5 ? $signed(6'shd) : $signed(_GEN_258); // @[Arith.scala 530:{26,26}]
  wire [5:0] _GEN_260 = 7'h14 == _qNeg1_T_5 ? $signed(-6'shf) : $signed(_GEN_259); // @[Arith.scala 530:{26,26}]
  wire [5:0] _GEN_261 = 7'h15 == _qNeg1_T_5 ? $signed(-6'sh9) : $signed(_GEN_260); // @[Arith.scala 530:{26,26}]
  wire [5:0] _GEN_262 = 7'h16 == _qNeg1_T_5 ? $signed(-6'sh8) : $signed(_GEN_261); // @[Arith.scala 530:{26,26}]
  wire [5:0] _GEN_263 = 7'h17 == _qNeg1_T_5 ? $signed(-6'sh3) : $signed(_GEN_262); // @[Arith.scala 530:{26,26}]
  wire [5:0] _GEN_264 = 7'h18 == _qNeg1_T_5 ? $signed(-6'sh3) : $signed(_GEN_263); // @[Arith.scala 530:{26,26}]
  wire [5:0] _GEN_265 = 7'h19 == _qNeg1_T_5 ? $signed(6'sh2) : $signed(_GEN_264); // @[Arith.scala 530:{26,26}]
  wire [5:0] _GEN_266 = 7'h1a == _qNeg1_T_5 ? $signed(6'sh2) : $signed(_GEN_265); // @[Arith.scala 530:{26,26}]
  wire [5:0] _GEN_267 = 7'h1b == _qNeg1_T_5 ? $signed(6'sh7) : $signed(_GEN_266); // @[Arith.scala 530:{26,26}]
  wire [5:0] _GEN_268 = 7'h1c == _qNeg1_T_5 ? $signed(6'sh8) : $signed(_GEN_267); // @[Arith.scala 530:{26,26}]
  wire [5:0] _GEN_269 = 7'h1d == _qNeg1_T_5 ? $signed(6'she) : $signed(_GEN_268); // @[Arith.scala 530:{26,26}]
  wire [5:0] _GEN_270 = 7'h1e == _qNeg1_T_5 ? $signed(-6'sh10) : $signed(_GEN_269); // @[Arith.scala 530:{26,26}]
  wire [5:0] _GEN_271 = 7'h1f == _qNeg1_T_5 ? $signed(-6'sh9) : $signed(_GEN_270); // @[Arith.scala 530:{26,26}]
  wire [5:0] _GEN_272 = 7'h20 == _qNeg1_T_5 ? $signed(-6'sh9) : $signed(_GEN_271); // @[Arith.scala 530:{26,26}]
  wire [5:0] _GEN_273 = 7'h21 == _qNeg1_T_5 ? $signed(-6'sh3) : $signed(_GEN_272); // @[Arith.scala 530:{26,26}]
  wire [5:0] _GEN_274 = 7'h22 == _qNeg1_T_5 ? $signed(-6'sh3) : $signed(_GEN_273); // @[Arith.scala 530:{26,26}]
  wire [5:0] _GEN_275 = 7'h23 == _qNeg1_T_5 ? $signed(6'sh2) : $signed(_GEN_274); // @[Arith.scala 530:{26,26}]
  wire [5:0] _GEN_276 = 7'h24 == _qNeg1_T_5 ? $signed(6'sh2) : $signed(_GEN_275); // @[Arith.scala 530:{26,26}]
  wire [5:0] _GEN_277 = 7'h25 == _qNeg1_T_5 ? $signed(6'sh8) : $signed(_GEN_276); // @[Arith.scala 530:{26,26}]
  wire [5:0] _GEN_278 = 7'h26 == _qNeg1_T_5 ? $signed(6'sh8) : $signed(_GEN_277); // @[Arith.scala 530:{26,26}]
  wire [5:0] _GEN_279 = 7'h27 == _qNeg1_T_5 ? $signed(6'shf) : $signed(_GEN_278); // @[Arith.scala 530:{26,26}]
  wire [5:0] _GEN_280 = 7'h28 == _qNeg1_T_5 ? $signed(-6'sh12) : $signed(_GEN_279); // @[Arith.scala 530:{26,26}]
  wire [5:0] _GEN_281 = 7'h29 == _qNeg1_T_5 ? $signed(-6'sha) : $signed(_GEN_280); // @[Arith.scala 530:{26,26}]
  wire [5:0] _GEN_282 = 7'h2a == _qNeg1_T_5 ? $signed(-6'sha) : $signed(_GEN_281); // @[Arith.scala 530:{26,26}]
  wire [5:0] _GEN_283 = 7'h2b == _qNeg1_T_5 ? $signed(-6'sh4) : $signed(_GEN_282); // @[Arith.scala 530:{26,26}]
  wire [5:0] _GEN_284 = 7'h2c == _qNeg1_T_5 ? $signed(-6'sh4) : $signed(_GEN_283); // @[Arith.scala 530:{26,26}]
  wire [5:0] _GEN_285 = 7'h2d == _qNeg1_T_5 ? $signed(6'sh3) : $signed(_GEN_284); // @[Arith.scala 530:{26,26}]
  wire [5:0] _GEN_286 = 7'h2e == _qNeg1_T_5 ? $signed(6'sh3) : $signed(_GEN_285); // @[Arith.scala 530:{26,26}]
  wire [5:0] _GEN_287 = 7'h2f == _qNeg1_T_5 ? $signed(6'sh9) : $signed(_GEN_286); // @[Arith.scala 530:{26,26}]
  wire [5:0] _GEN_288 = 7'h30 == _qNeg1_T_5 ? $signed(6'sh9) : $signed(_GEN_287); // @[Arith.scala 530:{26,26}]
  wire [5:0] _GEN_289 = 7'h31 == _qNeg1_T_5 ? $signed(6'sh11) : $signed(_GEN_288); // @[Arith.scala 530:{26,26}]
  wire [5:0] _GEN_290 = 7'h32 == _qNeg1_T_5 ? $signed(-6'sh13) : $signed(_GEN_289); // @[Arith.scala 530:{26,26}]
  wire [5:0] _GEN_291 = 7'h33 == _qNeg1_T_5 ? $signed(-6'shb) : $signed(_GEN_290); // @[Arith.scala 530:{26,26}]
  wire [5:0] _GEN_292 = 7'h34 == _qNeg1_T_5 ? $signed(-6'sha) : $signed(_GEN_291); // @[Arith.scala 530:{26,26}]
  wire [5:0] _GEN_293 = 7'h35 == _qNeg1_T_5 ? $signed(-6'sh4) : $signed(_GEN_292); // @[Arith.scala 530:{26,26}]
  wire [5:0] _GEN_294 = 7'h36 == _qNeg1_T_5 ? $signed(-6'sh4) : $signed(_GEN_293); // @[Arith.scala 530:{26,26}]
  wire [5:0] _GEN_295 = 7'h37 == _qNeg1_T_5 ? $signed(6'sh3) : $signed(_GEN_294); // @[Arith.scala 530:{26,26}]
  wire [5:0] _GEN_296 = 7'h38 == _qNeg1_T_5 ? $signed(6'sh3) : $signed(_GEN_295); // @[Arith.scala 530:{26,26}]
  wire [5:0] _GEN_297 = 7'h39 == _qNeg1_T_5 ? $signed(6'sh9) : $signed(_GEN_296); // @[Arith.scala 530:{26,26}]
  wire [5:0] _GEN_298 = 7'h3a == _qNeg1_T_5 ? $signed(6'sha) : $signed(_GEN_297); // @[Arith.scala 530:{26,26}]
  wire [5:0] _GEN_299 = 7'h3b == _qNeg1_T_5 ? $signed(6'sh12) : $signed(_GEN_298); // @[Arith.scala 530:{26,26}]
  wire [5:0] _GEN_300 = 7'h3c == _qNeg1_T_5 ? $signed(-6'sh14) : $signed(_GEN_299); // @[Arith.scala 530:{26,26}]
  wire [5:0] _GEN_301 = 7'h3d == _qNeg1_T_5 ? $signed(-6'shb) : $signed(_GEN_300); // @[Arith.scala 530:{26,26}]
  wire [5:0] _GEN_302 = 7'h3e == _qNeg1_T_5 ? $signed(-6'shb) : $signed(_GEN_301); // @[Arith.scala 530:{26,26}]
  wire [5:0] _GEN_303 = 7'h3f == _qNeg1_T_5 ? $signed(-6'sh4) : $signed(_GEN_302); // @[Arith.scala 530:{26,26}]
  wire [5:0] _GEN_304 = 7'h40 == _qNeg1_T_5 ? $signed(-6'sh4) : $signed(_GEN_303); // @[Arith.scala 530:{26,26}]
  wire [5:0] _GEN_305 = 7'h41 == _qNeg1_T_5 ? $signed(6'sh3) : $signed(_GEN_304); // @[Arith.scala 530:{26,26}]
  wire [5:0] _GEN_306 = 7'h42 == _qNeg1_T_5 ? $signed(6'sh3) : $signed(_GEN_305); // @[Arith.scala 530:{26,26}]
  wire [5:0] _GEN_307 = 7'h43 == _qNeg1_T_5 ? $signed(6'sha) : $signed(_GEN_306); // @[Arith.scala 530:{26,26}]
  wire [5:0] _GEN_308 = 7'h44 == _qNeg1_T_5 ? $signed(6'sha) : $signed(_GEN_307); // @[Arith.scala 530:{26,26}]
  wire [5:0] _GEN_309 = 7'h45 == _qNeg1_T_5 ? $signed(6'sh13) : $signed(_GEN_308); // @[Arith.scala 530:{26,26}]
  wire [5:0] _GEN_310 = 7'h46 == _qNeg1_T_5 ? $signed(-6'sh16) : $signed(_GEN_309); // @[Arith.scala 530:{26,26}]
  wire [5:0] _GEN_311 = 7'h47 == _qNeg1_T_5 ? $signed(-6'shc) : $signed(_GEN_310); // @[Arith.scala 530:{26,26}]
  wire [5:0] _GEN_312 = 7'h48 == _qNeg1_T_5 ? $signed(-6'shc) : $signed(_GEN_311); // @[Arith.scala 530:{26,26}]
  wire [5:0] _GEN_313 = 7'h49 == _qNeg1_T_5 ? $signed(-6'sh4) : $signed(_GEN_312); // @[Arith.scala 530:{26,26}]
  wire [5:0] _GEN_314 = 7'h4a == _qNeg1_T_5 ? $signed(-6'sh5) : $signed(_GEN_313); // @[Arith.scala 530:{26,26}]
  wire [5:0] _GEN_315 = 7'h4b == _qNeg1_T_5 ? $signed(6'sh4) : $signed(_GEN_314); // @[Arith.scala 530:{26,26}]
  wire [5:0] _GEN_316 = 7'h4c == _qNeg1_T_5 ? $signed(6'sh3) : $signed(_GEN_315); // @[Arith.scala 530:{26,26}]
  wire [5:0] _GEN_317 = 7'h4d == _qNeg1_T_5 ? $signed(6'shb) : $signed(_GEN_316); // @[Arith.scala 530:{26,26}]
  wire [5:0] _GEN_318 = 7'h4e == _qNeg1_T_5 ? $signed(6'shb) : $signed(_GEN_317); // @[Arith.scala 530:{26,26}]
  wire [5:0] _GEN_319 = 7'h4f == _qNeg1_T_5 ? $signed(6'sh15) : $signed(_GEN_318); // @[Arith.scala 530:{26,26}]
  wire  qNeg1 = $signed(_qNeg2_T_1) >= $signed(_GEN_239) & $signed(_qNeg2_T_1) <= $signed(_GEN_319); // @[Arith.scala 530:19]
  wire [6:0] _q0_T_3 = offset + 7'h4; // @[Arith.scala 580:57]
  wire [6:0] _q0_T_5 = offset + 7'h5; // @[Arith.scala 580:77]
  wire [5:0] _GEN_321 = 7'h1 == _q0_T_3 ? $signed(-6'sh7) : $signed(-6'shc); // @[Arith.scala 530:{14,14}]
  wire [5:0] _GEN_322 = 7'h2 == _q0_T_3 ? $signed(-6'sh6) : $signed(_GEN_321); // @[Arith.scala 530:{14,14}]
  wire [5:0] _GEN_323 = 7'h3 == _q0_T_3 ? $signed(-6'sh3) : $signed(_GEN_322); // @[Arith.scala 530:{14,14}]
  wire [5:0] _GEN_324 = 7'h4 == _q0_T_3 ? $signed(-6'sh2) : $signed(_GEN_323); // @[Arith.scala 530:{14,14}]
  wire [5:0] _GEN_325 = 7'h5 == _q0_T_3 ? $signed(6'sh1) : $signed(_GEN_324); // @[Arith.scala 530:{14,14}]
  wire [5:0] _GEN_326 = 7'h6 == _q0_T_3 ? $signed(6'sh2) : $signed(_GEN_325); // @[Arith.scala 530:{14,14}]
  wire [5:0] _GEN_327 = 7'h7 == _q0_T_3 ? $signed(6'sh5) : $signed(_GEN_326); // @[Arith.scala 530:{14,14}]
  wire [5:0] _GEN_328 = 7'h8 == _q0_T_3 ? $signed(6'sh6) : $signed(_GEN_327); // @[Arith.scala 530:{14,14}]
  wire [5:0] _GEN_329 = 7'h9 == _q0_T_3 ? $signed(6'shb) : $signed(_GEN_328); // @[Arith.scala 530:{14,14}]
  wire [5:0] _GEN_330 = 7'ha == _q0_T_3 ? $signed(-6'she) : $signed(_GEN_329); // @[Arith.scala 530:{14,14}]
  wire [5:0] _GEN_331 = 7'hb == _q0_T_3 ? $signed(-6'sh8) : $signed(_GEN_330); // @[Arith.scala 530:{14,14}]
  wire [5:0] _GEN_332 = 7'hc == _q0_T_3 ? $signed(-6'sh7) : $signed(_GEN_331); // @[Arith.scala 530:{14,14}]
  wire [5:0] _GEN_333 = 7'hd == _q0_T_3 ? $signed(-6'sh3) : $signed(_GEN_332); // @[Arith.scala 530:{14,14}]
  wire [5:0] _GEN_334 = 7'he == _q0_T_3 ? $signed(-6'sh3) : $signed(_GEN_333); // @[Arith.scala 530:{14,14}]
  wire [5:0] _GEN_335 = 7'hf == _q0_T_3 ? $signed(6'sh2) : $signed(_GEN_334); // @[Arith.scala 530:{14,14}]
  wire [5:0] _GEN_336 = 7'h10 == _q0_T_3 ? $signed(6'sh2) : $signed(_GEN_335); // @[Arith.scala 530:{14,14}]
  wire [5:0] _GEN_337 = 7'h11 == _q0_T_3 ? $signed(6'sh6) : $signed(_GEN_336); // @[Arith.scala 530:{14,14}]
  wire [5:0] _GEN_338 = 7'h12 == _q0_T_3 ? $signed(6'sh7) : $signed(_GEN_337); // @[Arith.scala 530:{14,14}]
  wire [5:0] _GEN_339 = 7'h13 == _q0_T_3 ? $signed(6'shd) : $signed(_GEN_338); // @[Arith.scala 530:{14,14}]
  wire [5:0] _GEN_340 = 7'h14 == _q0_T_3 ? $signed(-6'shf) : $signed(_GEN_339); // @[Arith.scala 530:{14,14}]
  wire [5:0] _GEN_341 = 7'h15 == _q0_T_3 ? $signed(-6'sh9) : $signed(_GEN_340); // @[Arith.scala 530:{14,14}]
  wire [5:0] _GEN_342 = 7'h16 == _q0_T_3 ? $signed(-6'sh8) : $signed(_GEN_341); // @[Arith.scala 530:{14,14}]
  wire [5:0] _GEN_343 = 7'h17 == _q0_T_3 ? $signed(-6'sh3) : $signed(_GEN_342); // @[Arith.scala 530:{14,14}]
  wire [5:0] _GEN_344 = 7'h18 == _q0_T_3 ? $signed(-6'sh3) : $signed(_GEN_343); // @[Arith.scala 530:{14,14}]
  wire [5:0] _GEN_345 = 7'h19 == _q0_T_3 ? $signed(6'sh2) : $signed(_GEN_344); // @[Arith.scala 530:{14,14}]
  wire [5:0] _GEN_346 = 7'h1a == _q0_T_3 ? $signed(6'sh2) : $signed(_GEN_345); // @[Arith.scala 530:{14,14}]
  wire [5:0] _GEN_347 = 7'h1b == _q0_T_3 ? $signed(6'sh7) : $signed(_GEN_346); // @[Arith.scala 530:{14,14}]
  wire [5:0] _GEN_348 = 7'h1c == _q0_T_3 ? $signed(6'sh8) : $signed(_GEN_347); // @[Arith.scala 530:{14,14}]
  wire [5:0] _GEN_349 = 7'h1d == _q0_T_3 ? $signed(6'she) : $signed(_GEN_348); // @[Arith.scala 530:{14,14}]
  wire [5:0] _GEN_350 = 7'h1e == _q0_T_3 ? $signed(-6'sh10) : $signed(_GEN_349); // @[Arith.scala 530:{14,14}]
  wire [5:0] _GEN_351 = 7'h1f == _q0_T_3 ? $signed(-6'sh9) : $signed(_GEN_350); // @[Arith.scala 530:{14,14}]
  wire [5:0] _GEN_352 = 7'h20 == _q0_T_3 ? $signed(-6'sh9) : $signed(_GEN_351); // @[Arith.scala 530:{14,14}]
  wire [5:0] _GEN_353 = 7'h21 == _q0_T_3 ? $signed(-6'sh3) : $signed(_GEN_352); // @[Arith.scala 530:{14,14}]
  wire [5:0] _GEN_354 = 7'h22 == _q0_T_3 ? $signed(-6'sh3) : $signed(_GEN_353); // @[Arith.scala 530:{14,14}]
  wire [5:0] _GEN_355 = 7'h23 == _q0_T_3 ? $signed(6'sh2) : $signed(_GEN_354); // @[Arith.scala 530:{14,14}]
  wire [5:0] _GEN_356 = 7'h24 == _q0_T_3 ? $signed(6'sh2) : $signed(_GEN_355); // @[Arith.scala 530:{14,14}]
  wire [5:0] _GEN_357 = 7'h25 == _q0_T_3 ? $signed(6'sh8) : $signed(_GEN_356); // @[Arith.scala 530:{14,14}]
  wire [5:0] _GEN_358 = 7'h26 == _q0_T_3 ? $signed(6'sh8) : $signed(_GEN_357); // @[Arith.scala 530:{14,14}]
  wire [5:0] _GEN_359 = 7'h27 == _q0_T_3 ? $signed(6'shf) : $signed(_GEN_358); // @[Arith.scala 530:{14,14}]
  wire [5:0] _GEN_360 = 7'h28 == _q0_T_3 ? $signed(-6'sh12) : $signed(_GEN_359); // @[Arith.scala 530:{14,14}]
  wire [5:0] _GEN_361 = 7'h29 == _q0_T_3 ? $signed(-6'sha) : $signed(_GEN_360); // @[Arith.scala 530:{14,14}]
  wire [5:0] _GEN_362 = 7'h2a == _q0_T_3 ? $signed(-6'sha) : $signed(_GEN_361); // @[Arith.scala 530:{14,14}]
  wire [5:0] _GEN_363 = 7'h2b == _q0_T_3 ? $signed(-6'sh4) : $signed(_GEN_362); // @[Arith.scala 530:{14,14}]
  wire [5:0] _GEN_364 = 7'h2c == _q0_T_3 ? $signed(-6'sh4) : $signed(_GEN_363); // @[Arith.scala 530:{14,14}]
  wire [5:0] _GEN_365 = 7'h2d == _q0_T_3 ? $signed(6'sh3) : $signed(_GEN_364); // @[Arith.scala 530:{14,14}]
  wire [5:0] _GEN_366 = 7'h2e == _q0_T_3 ? $signed(6'sh3) : $signed(_GEN_365); // @[Arith.scala 530:{14,14}]
  wire [5:0] _GEN_367 = 7'h2f == _q0_T_3 ? $signed(6'sh9) : $signed(_GEN_366); // @[Arith.scala 530:{14,14}]
  wire [5:0] _GEN_368 = 7'h30 == _q0_T_3 ? $signed(6'sh9) : $signed(_GEN_367); // @[Arith.scala 530:{14,14}]
  wire [5:0] _GEN_369 = 7'h31 == _q0_T_3 ? $signed(6'sh11) : $signed(_GEN_368); // @[Arith.scala 530:{14,14}]
  wire [5:0] _GEN_370 = 7'h32 == _q0_T_3 ? $signed(-6'sh13) : $signed(_GEN_369); // @[Arith.scala 530:{14,14}]
  wire [5:0] _GEN_371 = 7'h33 == _q0_T_3 ? $signed(-6'shb) : $signed(_GEN_370); // @[Arith.scala 530:{14,14}]
  wire [5:0] _GEN_372 = 7'h34 == _q0_T_3 ? $signed(-6'sha) : $signed(_GEN_371); // @[Arith.scala 530:{14,14}]
  wire [5:0] _GEN_373 = 7'h35 == _q0_T_3 ? $signed(-6'sh4) : $signed(_GEN_372); // @[Arith.scala 530:{14,14}]
  wire [5:0] _GEN_374 = 7'h36 == _q0_T_3 ? $signed(-6'sh4) : $signed(_GEN_373); // @[Arith.scala 530:{14,14}]
  wire [5:0] _GEN_375 = 7'h37 == _q0_T_3 ? $signed(6'sh3) : $signed(_GEN_374); // @[Arith.scala 530:{14,14}]
  wire [5:0] _GEN_376 = 7'h38 == _q0_T_3 ? $signed(6'sh3) : $signed(_GEN_375); // @[Arith.scala 530:{14,14}]
  wire [5:0] _GEN_377 = 7'h39 == _q0_T_3 ? $signed(6'sh9) : $signed(_GEN_376); // @[Arith.scala 530:{14,14}]
  wire [5:0] _GEN_378 = 7'h3a == _q0_T_3 ? $signed(6'sha) : $signed(_GEN_377); // @[Arith.scala 530:{14,14}]
  wire [5:0] _GEN_379 = 7'h3b == _q0_T_3 ? $signed(6'sh12) : $signed(_GEN_378); // @[Arith.scala 530:{14,14}]
  wire [5:0] _GEN_380 = 7'h3c == _q0_T_3 ? $signed(-6'sh14) : $signed(_GEN_379); // @[Arith.scala 530:{14,14}]
  wire [5:0] _GEN_381 = 7'h3d == _q0_T_3 ? $signed(-6'shb) : $signed(_GEN_380); // @[Arith.scala 530:{14,14}]
  wire [5:0] _GEN_382 = 7'h3e == _q0_T_3 ? $signed(-6'shb) : $signed(_GEN_381); // @[Arith.scala 530:{14,14}]
  wire [5:0] _GEN_383 = 7'h3f == _q0_T_3 ? $signed(-6'sh4) : $signed(_GEN_382); // @[Arith.scala 530:{14,14}]
  wire [5:0] _GEN_384 = 7'h40 == _q0_T_3 ? $signed(-6'sh4) : $signed(_GEN_383); // @[Arith.scala 530:{14,14}]
  wire [5:0] _GEN_385 = 7'h41 == _q0_T_3 ? $signed(6'sh3) : $signed(_GEN_384); // @[Arith.scala 530:{14,14}]
  wire [5:0] _GEN_386 = 7'h42 == _q0_T_3 ? $signed(6'sh3) : $signed(_GEN_385); // @[Arith.scala 530:{14,14}]
  wire [5:0] _GEN_387 = 7'h43 == _q0_T_3 ? $signed(6'sha) : $signed(_GEN_386); // @[Arith.scala 530:{14,14}]
  wire [5:0] _GEN_388 = 7'h44 == _q0_T_3 ? $signed(6'sha) : $signed(_GEN_387); // @[Arith.scala 530:{14,14}]
  wire [5:0] _GEN_389 = 7'h45 == _q0_T_3 ? $signed(6'sh13) : $signed(_GEN_388); // @[Arith.scala 530:{14,14}]
  wire [5:0] _GEN_390 = 7'h46 == _q0_T_3 ? $signed(-6'sh16) : $signed(_GEN_389); // @[Arith.scala 530:{14,14}]
  wire [5:0] _GEN_391 = 7'h47 == _q0_T_3 ? $signed(-6'shc) : $signed(_GEN_390); // @[Arith.scala 530:{14,14}]
  wire [5:0] _GEN_392 = 7'h48 == _q0_T_3 ? $signed(-6'shc) : $signed(_GEN_391); // @[Arith.scala 530:{14,14}]
  wire [5:0] _GEN_393 = 7'h49 == _q0_T_3 ? $signed(-6'sh4) : $signed(_GEN_392); // @[Arith.scala 530:{14,14}]
  wire [5:0] _GEN_394 = 7'h4a == _q0_T_3 ? $signed(-6'sh5) : $signed(_GEN_393); // @[Arith.scala 530:{14,14}]
  wire [5:0] _GEN_395 = 7'h4b == _q0_T_3 ? $signed(6'sh4) : $signed(_GEN_394); // @[Arith.scala 530:{14,14}]
  wire [5:0] _GEN_396 = 7'h4c == _q0_T_3 ? $signed(6'sh3) : $signed(_GEN_395); // @[Arith.scala 530:{14,14}]
  wire [5:0] _GEN_397 = 7'h4d == _q0_T_3 ? $signed(6'shb) : $signed(_GEN_396); // @[Arith.scala 530:{14,14}]
  wire [5:0] _GEN_398 = 7'h4e == _q0_T_3 ? $signed(6'shb) : $signed(_GEN_397); // @[Arith.scala 530:{14,14}]
  wire [5:0] _GEN_399 = 7'h4f == _q0_T_3 ? $signed(6'sh15) : $signed(_GEN_398); // @[Arith.scala 530:{14,14}]
  wire [5:0] _GEN_401 = 7'h1 == _q0_T_5 ? $signed(-6'sh7) : $signed(-6'shc); // @[Arith.scala 530:{26,26}]
  wire [5:0] _GEN_402 = 7'h2 == _q0_T_5 ? $signed(-6'sh6) : $signed(_GEN_401); // @[Arith.scala 530:{26,26}]
  wire [5:0] _GEN_403 = 7'h3 == _q0_T_5 ? $signed(-6'sh3) : $signed(_GEN_402); // @[Arith.scala 530:{26,26}]
  wire [5:0] _GEN_404 = 7'h4 == _q0_T_5 ? $signed(-6'sh2) : $signed(_GEN_403); // @[Arith.scala 530:{26,26}]
  wire [5:0] _GEN_405 = 7'h5 == _q0_T_5 ? $signed(6'sh1) : $signed(_GEN_404); // @[Arith.scala 530:{26,26}]
  wire [5:0] _GEN_406 = 7'h6 == _q0_T_5 ? $signed(6'sh2) : $signed(_GEN_405); // @[Arith.scala 530:{26,26}]
  wire [5:0] _GEN_407 = 7'h7 == _q0_T_5 ? $signed(6'sh5) : $signed(_GEN_406); // @[Arith.scala 530:{26,26}]
  wire [5:0] _GEN_408 = 7'h8 == _q0_T_5 ? $signed(6'sh6) : $signed(_GEN_407); // @[Arith.scala 530:{26,26}]
  wire [5:0] _GEN_409 = 7'h9 == _q0_T_5 ? $signed(6'shb) : $signed(_GEN_408); // @[Arith.scala 530:{26,26}]
  wire [5:0] _GEN_410 = 7'ha == _q0_T_5 ? $signed(-6'she) : $signed(_GEN_409); // @[Arith.scala 530:{26,26}]
  wire [5:0] _GEN_411 = 7'hb == _q0_T_5 ? $signed(-6'sh8) : $signed(_GEN_410); // @[Arith.scala 530:{26,26}]
  wire [5:0] _GEN_412 = 7'hc == _q0_T_5 ? $signed(-6'sh7) : $signed(_GEN_411); // @[Arith.scala 530:{26,26}]
  wire [5:0] _GEN_413 = 7'hd == _q0_T_5 ? $signed(-6'sh3) : $signed(_GEN_412); // @[Arith.scala 530:{26,26}]
  wire [5:0] _GEN_414 = 7'he == _q0_T_5 ? $signed(-6'sh3) : $signed(_GEN_413); // @[Arith.scala 530:{26,26}]
  wire [5:0] _GEN_415 = 7'hf == _q0_T_5 ? $signed(6'sh2) : $signed(_GEN_414); // @[Arith.scala 530:{26,26}]
  wire [5:0] _GEN_416 = 7'h10 == _q0_T_5 ? $signed(6'sh2) : $signed(_GEN_415); // @[Arith.scala 530:{26,26}]
  wire [5:0] _GEN_417 = 7'h11 == _q0_T_5 ? $signed(6'sh6) : $signed(_GEN_416); // @[Arith.scala 530:{26,26}]
  wire [5:0] _GEN_418 = 7'h12 == _q0_T_5 ? $signed(6'sh7) : $signed(_GEN_417); // @[Arith.scala 530:{26,26}]
  wire [5:0] _GEN_419 = 7'h13 == _q0_T_5 ? $signed(6'shd) : $signed(_GEN_418); // @[Arith.scala 530:{26,26}]
  wire [5:0] _GEN_420 = 7'h14 == _q0_T_5 ? $signed(-6'shf) : $signed(_GEN_419); // @[Arith.scala 530:{26,26}]
  wire [5:0] _GEN_421 = 7'h15 == _q0_T_5 ? $signed(-6'sh9) : $signed(_GEN_420); // @[Arith.scala 530:{26,26}]
  wire [5:0] _GEN_422 = 7'h16 == _q0_T_5 ? $signed(-6'sh8) : $signed(_GEN_421); // @[Arith.scala 530:{26,26}]
  wire [5:0] _GEN_423 = 7'h17 == _q0_T_5 ? $signed(-6'sh3) : $signed(_GEN_422); // @[Arith.scala 530:{26,26}]
  wire [5:0] _GEN_424 = 7'h18 == _q0_T_5 ? $signed(-6'sh3) : $signed(_GEN_423); // @[Arith.scala 530:{26,26}]
  wire [5:0] _GEN_425 = 7'h19 == _q0_T_5 ? $signed(6'sh2) : $signed(_GEN_424); // @[Arith.scala 530:{26,26}]
  wire [5:0] _GEN_426 = 7'h1a == _q0_T_5 ? $signed(6'sh2) : $signed(_GEN_425); // @[Arith.scala 530:{26,26}]
  wire [5:0] _GEN_427 = 7'h1b == _q0_T_5 ? $signed(6'sh7) : $signed(_GEN_426); // @[Arith.scala 530:{26,26}]
  wire [5:0] _GEN_428 = 7'h1c == _q0_T_5 ? $signed(6'sh8) : $signed(_GEN_427); // @[Arith.scala 530:{26,26}]
  wire [5:0] _GEN_429 = 7'h1d == _q0_T_5 ? $signed(6'she) : $signed(_GEN_428); // @[Arith.scala 530:{26,26}]
  wire [5:0] _GEN_430 = 7'h1e == _q0_T_5 ? $signed(-6'sh10) : $signed(_GEN_429); // @[Arith.scala 530:{26,26}]
  wire [5:0] _GEN_431 = 7'h1f == _q0_T_5 ? $signed(-6'sh9) : $signed(_GEN_430); // @[Arith.scala 530:{26,26}]
  wire [5:0] _GEN_432 = 7'h20 == _q0_T_5 ? $signed(-6'sh9) : $signed(_GEN_431); // @[Arith.scala 530:{26,26}]
  wire [5:0] _GEN_433 = 7'h21 == _q0_T_5 ? $signed(-6'sh3) : $signed(_GEN_432); // @[Arith.scala 530:{26,26}]
  wire [5:0] _GEN_434 = 7'h22 == _q0_T_5 ? $signed(-6'sh3) : $signed(_GEN_433); // @[Arith.scala 530:{26,26}]
  wire [5:0] _GEN_435 = 7'h23 == _q0_T_5 ? $signed(6'sh2) : $signed(_GEN_434); // @[Arith.scala 530:{26,26}]
  wire [5:0] _GEN_436 = 7'h24 == _q0_T_5 ? $signed(6'sh2) : $signed(_GEN_435); // @[Arith.scala 530:{26,26}]
  wire [5:0] _GEN_437 = 7'h25 == _q0_T_5 ? $signed(6'sh8) : $signed(_GEN_436); // @[Arith.scala 530:{26,26}]
  wire [5:0] _GEN_438 = 7'h26 == _q0_T_5 ? $signed(6'sh8) : $signed(_GEN_437); // @[Arith.scala 530:{26,26}]
  wire [5:0] _GEN_439 = 7'h27 == _q0_T_5 ? $signed(6'shf) : $signed(_GEN_438); // @[Arith.scala 530:{26,26}]
  wire [5:0] _GEN_440 = 7'h28 == _q0_T_5 ? $signed(-6'sh12) : $signed(_GEN_439); // @[Arith.scala 530:{26,26}]
  wire [5:0] _GEN_441 = 7'h29 == _q0_T_5 ? $signed(-6'sha) : $signed(_GEN_440); // @[Arith.scala 530:{26,26}]
  wire [5:0] _GEN_442 = 7'h2a == _q0_T_5 ? $signed(-6'sha) : $signed(_GEN_441); // @[Arith.scala 530:{26,26}]
  wire [5:0] _GEN_443 = 7'h2b == _q0_T_5 ? $signed(-6'sh4) : $signed(_GEN_442); // @[Arith.scala 530:{26,26}]
  wire [5:0] _GEN_444 = 7'h2c == _q0_T_5 ? $signed(-6'sh4) : $signed(_GEN_443); // @[Arith.scala 530:{26,26}]
  wire [5:0] _GEN_445 = 7'h2d == _q0_T_5 ? $signed(6'sh3) : $signed(_GEN_444); // @[Arith.scala 530:{26,26}]
  wire [5:0] _GEN_446 = 7'h2e == _q0_T_5 ? $signed(6'sh3) : $signed(_GEN_445); // @[Arith.scala 530:{26,26}]
  wire [5:0] _GEN_447 = 7'h2f == _q0_T_5 ? $signed(6'sh9) : $signed(_GEN_446); // @[Arith.scala 530:{26,26}]
  wire [5:0] _GEN_448 = 7'h30 == _q0_T_5 ? $signed(6'sh9) : $signed(_GEN_447); // @[Arith.scala 530:{26,26}]
  wire [5:0] _GEN_449 = 7'h31 == _q0_T_5 ? $signed(6'sh11) : $signed(_GEN_448); // @[Arith.scala 530:{26,26}]
  wire [5:0] _GEN_450 = 7'h32 == _q0_T_5 ? $signed(-6'sh13) : $signed(_GEN_449); // @[Arith.scala 530:{26,26}]
  wire [5:0] _GEN_451 = 7'h33 == _q0_T_5 ? $signed(-6'shb) : $signed(_GEN_450); // @[Arith.scala 530:{26,26}]
  wire [5:0] _GEN_452 = 7'h34 == _q0_T_5 ? $signed(-6'sha) : $signed(_GEN_451); // @[Arith.scala 530:{26,26}]
  wire [5:0] _GEN_453 = 7'h35 == _q0_T_5 ? $signed(-6'sh4) : $signed(_GEN_452); // @[Arith.scala 530:{26,26}]
  wire [5:0] _GEN_454 = 7'h36 == _q0_T_5 ? $signed(-6'sh4) : $signed(_GEN_453); // @[Arith.scala 530:{26,26}]
  wire [5:0] _GEN_455 = 7'h37 == _q0_T_5 ? $signed(6'sh3) : $signed(_GEN_454); // @[Arith.scala 530:{26,26}]
  wire [5:0] _GEN_456 = 7'h38 == _q0_T_5 ? $signed(6'sh3) : $signed(_GEN_455); // @[Arith.scala 530:{26,26}]
  wire [5:0] _GEN_457 = 7'h39 == _q0_T_5 ? $signed(6'sh9) : $signed(_GEN_456); // @[Arith.scala 530:{26,26}]
  wire [5:0] _GEN_458 = 7'h3a == _q0_T_5 ? $signed(6'sha) : $signed(_GEN_457); // @[Arith.scala 530:{26,26}]
  wire [5:0] _GEN_459 = 7'h3b == _q0_T_5 ? $signed(6'sh12) : $signed(_GEN_458); // @[Arith.scala 530:{26,26}]
  wire [5:0] _GEN_460 = 7'h3c == _q0_T_5 ? $signed(-6'sh14) : $signed(_GEN_459); // @[Arith.scala 530:{26,26}]
  wire [5:0] _GEN_461 = 7'h3d == _q0_T_5 ? $signed(-6'shb) : $signed(_GEN_460); // @[Arith.scala 530:{26,26}]
  wire [5:0] _GEN_462 = 7'h3e == _q0_T_5 ? $signed(-6'shb) : $signed(_GEN_461); // @[Arith.scala 530:{26,26}]
  wire [5:0] _GEN_463 = 7'h3f == _q0_T_5 ? $signed(-6'sh4) : $signed(_GEN_462); // @[Arith.scala 530:{26,26}]
  wire [5:0] _GEN_464 = 7'h40 == _q0_T_5 ? $signed(-6'sh4) : $signed(_GEN_463); // @[Arith.scala 530:{26,26}]
  wire [5:0] _GEN_465 = 7'h41 == _q0_T_5 ? $signed(6'sh3) : $signed(_GEN_464); // @[Arith.scala 530:{26,26}]
  wire [5:0] _GEN_466 = 7'h42 == _q0_T_5 ? $signed(6'sh3) : $signed(_GEN_465); // @[Arith.scala 530:{26,26}]
  wire [5:0] _GEN_467 = 7'h43 == _q0_T_5 ? $signed(6'sha) : $signed(_GEN_466); // @[Arith.scala 530:{26,26}]
  wire [5:0] _GEN_468 = 7'h44 == _q0_T_5 ? $signed(6'sha) : $signed(_GEN_467); // @[Arith.scala 530:{26,26}]
  wire [5:0] _GEN_469 = 7'h45 == _q0_T_5 ? $signed(6'sh13) : $signed(_GEN_468); // @[Arith.scala 530:{26,26}]
  wire [5:0] _GEN_470 = 7'h46 == _q0_T_5 ? $signed(-6'sh16) : $signed(_GEN_469); // @[Arith.scala 530:{26,26}]
  wire [5:0] _GEN_471 = 7'h47 == _q0_T_5 ? $signed(-6'shc) : $signed(_GEN_470); // @[Arith.scala 530:{26,26}]
  wire [5:0] _GEN_472 = 7'h48 == _q0_T_5 ? $signed(-6'shc) : $signed(_GEN_471); // @[Arith.scala 530:{26,26}]
  wire [5:0] _GEN_473 = 7'h49 == _q0_T_5 ? $signed(-6'sh4) : $signed(_GEN_472); // @[Arith.scala 530:{26,26}]
  wire [5:0] _GEN_474 = 7'h4a == _q0_T_5 ? $signed(-6'sh5) : $signed(_GEN_473); // @[Arith.scala 530:{26,26}]
  wire [5:0] _GEN_475 = 7'h4b == _q0_T_5 ? $signed(6'sh4) : $signed(_GEN_474); // @[Arith.scala 530:{26,26}]
  wire [5:0] _GEN_476 = 7'h4c == _q0_T_5 ? $signed(6'sh3) : $signed(_GEN_475); // @[Arith.scala 530:{26,26}]
  wire [5:0] _GEN_477 = 7'h4d == _q0_T_5 ? $signed(6'shb) : $signed(_GEN_476); // @[Arith.scala 530:{26,26}]
  wire [5:0] _GEN_478 = 7'h4e == _q0_T_5 ? $signed(6'shb) : $signed(_GEN_477); // @[Arith.scala 530:{26,26}]
  wire [5:0] _GEN_479 = 7'h4f == _q0_T_5 ? $signed(6'sh15) : $signed(_GEN_478); // @[Arith.scala 530:{26,26}]
  wire  q0 = $signed(_qNeg2_T_1) >= $signed(_GEN_399) & $signed(_qNeg2_T_1) <= $signed(_GEN_479); // @[Arith.scala 530:19]
  wire [6:0] _q1_T_3 = offset + 7'h6; // @[Arith.scala 581:57]
  wire [6:0] _q1_T_5 = offset + 7'h7; // @[Arith.scala 581:77]
  wire [5:0] _GEN_481 = 7'h1 == _q1_T_3 ? $signed(-6'sh7) : $signed(-6'shc); // @[Arith.scala 530:{14,14}]
  wire [5:0] _GEN_482 = 7'h2 == _q1_T_3 ? $signed(-6'sh6) : $signed(_GEN_481); // @[Arith.scala 530:{14,14}]
  wire [5:0] _GEN_483 = 7'h3 == _q1_T_3 ? $signed(-6'sh3) : $signed(_GEN_482); // @[Arith.scala 530:{14,14}]
  wire [5:0] _GEN_484 = 7'h4 == _q1_T_3 ? $signed(-6'sh2) : $signed(_GEN_483); // @[Arith.scala 530:{14,14}]
  wire [5:0] _GEN_485 = 7'h5 == _q1_T_3 ? $signed(6'sh1) : $signed(_GEN_484); // @[Arith.scala 530:{14,14}]
  wire [5:0] _GEN_486 = 7'h6 == _q1_T_3 ? $signed(6'sh2) : $signed(_GEN_485); // @[Arith.scala 530:{14,14}]
  wire [5:0] _GEN_487 = 7'h7 == _q1_T_3 ? $signed(6'sh5) : $signed(_GEN_486); // @[Arith.scala 530:{14,14}]
  wire [5:0] _GEN_488 = 7'h8 == _q1_T_3 ? $signed(6'sh6) : $signed(_GEN_487); // @[Arith.scala 530:{14,14}]
  wire [5:0] _GEN_489 = 7'h9 == _q1_T_3 ? $signed(6'shb) : $signed(_GEN_488); // @[Arith.scala 530:{14,14}]
  wire [5:0] _GEN_490 = 7'ha == _q1_T_3 ? $signed(-6'she) : $signed(_GEN_489); // @[Arith.scala 530:{14,14}]
  wire [5:0] _GEN_491 = 7'hb == _q1_T_3 ? $signed(-6'sh8) : $signed(_GEN_490); // @[Arith.scala 530:{14,14}]
  wire [5:0] _GEN_492 = 7'hc == _q1_T_3 ? $signed(-6'sh7) : $signed(_GEN_491); // @[Arith.scala 530:{14,14}]
  wire [5:0] _GEN_493 = 7'hd == _q1_T_3 ? $signed(-6'sh3) : $signed(_GEN_492); // @[Arith.scala 530:{14,14}]
  wire [5:0] _GEN_494 = 7'he == _q1_T_3 ? $signed(-6'sh3) : $signed(_GEN_493); // @[Arith.scala 530:{14,14}]
  wire [5:0] _GEN_495 = 7'hf == _q1_T_3 ? $signed(6'sh2) : $signed(_GEN_494); // @[Arith.scala 530:{14,14}]
  wire [5:0] _GEN_496 = 7'h10 == _q1_T_3 ? $signed(6'sh2) : $signed(_GEN_495); // @[Arith.scala 530:{14,14}]
  wire [5:0] _GEN_497 = 7'h11 == _q1_T_3 ? $signed(6'sh6) : $signed(_GEN_496); // @[Arith.scala 530:{14,14}]
  wire [5:0] _GEN_498 = 7'h12 == _q1_T_3 ? $signed(6'sh7) : $signed(_GEN_497); // @[Arith.scala 530:{14,14}]
  wire [5:0] _GEN_499 = 7'h13 == _q1_T_3 ? $signed(6'shd) : $signed(_GEN_498); // @[Arith.scala 530:{14,14}]
  wire [5:0] _GEN_500 = 7'h14 == _q1_T_3 ? $signed(-6'shf) : $signed(_GEN_499); // @[Arith.scala 530:{14,14}]
  wire [5:0] _GEN_501 = 7'h15 == _q1_T_3 ? $signed(-6'sh9) : $signed(_GEN_500); // @[Arith.scala 530:{14,14}]
  wire [5:0] _GEN_502 = 7'h16 == _q1_T_3 ? $signed(-6'sh8) : $signed(_GEN_501); // @[Arith.scala 530:{14,14}]
  wire [5:0] _GEN_503 = 7'h17 == _q1_T_3 ? $signed(-6'sh3) : $signed(_GEN_502); // @[Arith.scala 530:{14,14}]
  wire [5:0] _GEN_504 = 7'h18 == _q1_T_3 ? $signed(-6'sh3) : $signed(_GEN_503); // @[Arith.scala 530:{14,14}]
  wire [5:0] _GEN_505 = 7'h19 == _q1_T_3 ? $signed(6'sh2) : $signed(_GEN_504); // @[Arith.scala 530:{14,14}]
  wire [5:0] _GEN_506 = 7'h1a == _q1_T_3 ? $signed(6'sh2) : $signed(_GEN_505); // @[Arith.scala 530:{14,14}]
  wire [5:0] _GEN_507 = 7'h1b == _q1_T_3 ? $signed(6'sh7) : $signed(_GEN_506); // @[Arith.scala 530:{14,14}]
  wire [5:0] _GEN_508 = 7'h1c == _q1_T_3 ? $signed(6'sh8) : $signed(_GEN_507); // @[Arith.scala 530:{14,14}]
  wire [5:0] _GEN_509 = 7'h1d == _q1_T_3 ? $signed(6'she) : $signed(_GEN_508); // @[Arith.scala 530:{14,14}]
  wire [5:0] _GEN_510 = 7'h1e == _q1_T_3 ? $signed(-6'sh10) : $signed(_GEN_509); // @[Arith.scala 530:{14,14}]
  wire [5:0] _GEN_511 = 7'h1f == _q1_T_3 ? $signed(-6'sh9) : $signed(_GEN_510); // @[Arith.scala 530:{14,14}]
  wire [5:0] _GEN_512 = 7'h20 == _q1_T_3 ? $signed(-6'sh9) : $signed(_GEN_511); // @[Arith.scala 530:{14,14}]
  wire [5:0] _GEN_513 = 7'h21 == _q1_T_3 ? $signed(-6'sh3) : $signed(_GEN_512); // @[Arith.scala 530:{14,14}]
  wire [5:0] _GEN_514 = 7'h22 == _q1_T_3 ? $signed(-6'sh3) : $signed(_GEN_513); // @[Arith.scala 530:{14,14}]
  wire [5:0] _GEN_515 = 7'h23 == _q1_T_3 ? $signed(6'sh2) : $signed(_GEN_514); // @[Arith.scala 530:{14,14}]
  wire [5:0] _GEN_516 = 7'h24 == _q1_T_3 ? $signed(6'sh2) : $signed(_GEN_515); // @[Arith.scala 530:{14,14}]
  wire [5:0] _GEN_517 = 7'h25 == _q1_T_3 ? $signed(6'sh8) : $signed(_GEN_516); // @[Arith.scala 530:{14,14}]
  wire [5:0] _GEN_518 = 7'h26 == _q1_T_3 ? $signed(6'sh8) : $signed(_GEN_517); // @[Arith.scala 530:{14,14}]
  wire [5:0] _GEN_519 = 7'h27 == _q1_T_3 ? $signed(6'shf) : $signed(_GEN_518); // @[Arith.scala 530:{14,14}]
  wire [5:0] _GEN_520 = 7'h28 == _q1_T_3 ? $signed(-6'sh12) : $signed(_GEN_519); // @[Arith.scala 530:{14,14}]
  wire [5:0] _GEN_521 = 7'h29 == _q1_T_3 ? $signed(-6'sha) : $signed(_GEN_520); // @[Arith.scala 530:{14,14}]
  wire [5:0] _GEN_522 = 7'h2a == _q1_T_3 ? $signed(-6'sha) : $signed(_GEN_521); // @[Arith.scala 530:{14,14}]
  wire [5:0] _GEN_523 = 7'h2b == _q1_T_3 ? $signed(-6'sh4) : $signed(_GEN_522); // @[Arith.scala 530:{14,14}]
  wire [5:0] _GEN_524 = 7'h2c == _q1_T_3 ? $signed(-6'sh4) : $signed(_GEN_523); // @[Arith.scala 530:{14,14}]
  wire [5:0] _GEN_525 = 7'h2d == _q1_T_3 ? $signed(6'sh3) : $signed(_GEN_524); // @[Arith.scala 530:{14,14}]
  wire [5:0] _GEN_526 = 7'h2e == _q1_T_3 ? $signed(6'sh3) : $signed(_GEN_525); // @[Arith.scala 530:{14,14}]
  wire [5:0] _GEN_527 = 7'h2f == _q1_T_3 ? $signed(6'sh9) : $signed(_GEN_526); // @[Arith.scala 530:{14,14}]
  wire [5:0] _GEN_528 = 7'h30 == _q1_T_3 ? $signed(6'sh9) : $signed(_GEN_527); // @[Arith.scala 530:{14,14}]
  wire [5:0] _GEN_529 = 7'h31 == _q1_T_3 ? $signed(6'sh11) : $signed(_GEN_528); // @[Arith.scala 530:{14,14}]
  wire [5:0] _GEN_530 = 7'h32 == _q1_T_3 ? $signed(-6'sh13) : $signed(_GEN_529); // @[Arith.scala 530:{14,14}]
  wire [5:0] _GEN_531 = 7'h33 == _q1_T_3 ? $signed(-6'shb) : $signed(_GEN_530); // @[Arith.scala 530:{14,14}]
  wire [5:0] _GEN_532 = 7'h34 == _q1_T_3 ? $signed(-6'sha) : $signed(_GEN_531); // @[Arith.scala 530:{14,14}]
  wire [5:0] _GEN_533 = 7'h35 == _q1_T_3 ? $signed(-6'sh4) : $signed(_GEN_532); // @[Arith.scala 530:{14,14}]
  wire [5:0] _GEN_534 = 7'h36 == _q1_T_3 ? $signed(-6'sh4) : $signed(_GEN_533); // @[Arith.scala 530:{14,14}]
  wire [5:0] _GEN_535 = 7'h37 == _q1_T_3 ? $signed(6'sh3) : $signed(_GEN_534); // @[Arith.scala 530:{14,14}]
  wire [5:0] _GEN_536 = 7'h38 == _q1_T_3 ? $signed(6'sh3) : $signed(_GEN_535); // @[Arith.scala 530:{14,14}]
  wire [5:0] _GEN_537 = 7'h39 == _q1_T_3 ? $signed(6'sh9) : $signed(_GEN_536); // @[Arith.scala 530:{14,14}]
  wire [5:0] _GEN_538 = 7'h3a == _q1_T_3 ? $signed(6'sha) : $signed(_GEN_537); // @[Arith.scala 530:{14,14}]
  wire [5:0] _GEN_539 = 7'h3b == _q1_T_3 ? $signed(6'sh12) : $signed(_GEN_538); // @[Arith.scala 530:{14,14}]
  wire [5:0] _GEN_540 = 7'h3c == _q1_T_3 ? $signed(-6'sh14) : $signed(_GEN_539); // @[Arith.scala 530:{14,14}]
  wire [5:0] _GEN_541 = 7'h3d == _q1_T_3 ? $signed(-6'shb) : $signed(_GEN_540); // @[Arith.scala 530:{14,14}]
  wire [5:0] _GEN_542 = 7'h3e == _q1_T_3 ? $signed(-6'shb) : $signed(_GEN_541); // @[Arith.scala 530:{14,14}]
  wire [5:0] _GEN_543 = 7'h3f == _q1_T_3 ? $signed(-6'sh4) : $signed(_GEN_542); // @[Arith.scala 530:{14,14}]
  wire [5:0] _GEN_544 = 7'h40 == _q1_T_3 ? $signed(-6'sh4) : $signed(_GEN_543); // @[Arith.scala 530:{14,14}]
  wire [5:0] _GEN_545 = 7'h41 == _q1_T_3 ? $signed(6'sh3) : $signed(_GEN_544); // @[Arith.scala 530:{14,14}]
  wire [5:0] _GEN_546 = 7'h42 == _q1_T_3 ? $signed(6'sh3) : $signed(_GEN_545); // @[Arith.scala 530:{14,14}]
  wire [5:0] _GEN_547 = 7'h43 == _q1_T_3 ? $signed(6'sha) : $signed(_GEN_546); // @[Arith.scala 530:{14,14}]
  wire [5:0] _GEN_548 = 7'h44 == _q1_T_3 ? $signed(6'sha) : $signed(_GEN_547); // @[Arith.scala 530:{14,14}]
  wire [5:0] _GEN_549 = 7'h45 == _q1_T_3 ? $signed(6'sh13) : $signed(_GEN_548); // @[Arith.scala 530:{14,14}]
  wire [5:0] _GEN_550 = 7'h46 == _q1_T_3 ? $signed(-6'sh16) : $signed(_GEN_549); // @[Arith.scala 530:{14,14}]
  wire [5:0] _GEN_551 = 7'h47 == _q1_T_3 ? $signed(-6'shc) : $signed(_GEN_550); // @[Arith.scala 530:{14,14}]
  wire [5:0] _GEN_552 = 7'h48 == _q1_T_3 ? $signed(-6'shc) : $signed(_GEN_551); // @[Arith.scala 530:{14,14}]
  wire [5:0] _GEN_553 = 7'h49 == _q1_T_3 ? $signed(-6'sh4) : $signed(_GEN_552); // @[Arith.scala 530:{14,14}]
  wire [5:0] _GEN_554 = 7'h4a == _q1_T_3 ? $signed(-6'sh5) : $signed(_GEN_553); // @[Arith.scala 530:{14,14}]
  wire [5:0] _GEN_555 = 7'h4b == _q1_T_3 ? $signed(6'sh4) : $signed(_GEN_554); // @[Arith.scala 530:{14,14}]
  wire [5:0] _GEN_556 = 7'h4c == _q1_T_3 ? $signed(6'sh3) : $signed(_GEN_555); // @[Arith.scala 530:{14,14}]
  wire [5:0] _GEN_557 = 7'h4d == _q1_T_3 ? $signed(6'shb) : $signed(_GEN_556); // @[Arith.scala 530:{14,14}]
  wire [5:0] _GEN_558 = 7'h4e == _q1_T_3 ? $signed(6'shb) : $signed(_GEN_557); // @[Arith.scala 530:{14,14}]
  wire [5:0] _GEN_559 = 7'h4f == _q1_T_3 ? $signed(6'sh15) : $signed(_GEN_558); // @[Arith.scala 530:{14,14}]
  wire [5:0] _GEN_561 = 7'h1 == _q1_T_5 ? $signed(-6'sh7) : $signed(-6'shc); // @[Arith.scala 530:{26,26}]
  wire [5:0] _GEN_562 = 7'h2 == _q1_T_5 ? $signed(-6'sh6) : $signed(_GEN_561); // @[Arith.scala 530:{26,26}]
  wire [5:0] _GEN_563 = 7'h3 == _q1_T_5 ? $signed(-6'sh3) : $signed(_GEN_562); // @[Arith.scala 530:{26,26}]
  wire [5:0] _GEN_564 = 7'h4 == _q1_T_5 ? $signed(-6'sh2) : $signed(_GEN_563); // @[Arith.scala 530:{26,26}]
  wire [5:0] _GEN_565 = 7'h5 == _q1_T_5 ? $signed(6'sh1) : $signed(_GEN_564); // @[Arith.scala 530:{26,26}]
  wire [5:0] _GEN_566 = 7'h6 == _q1_T_5 ? $signed(6'sh2) : $signed(_GEN_565); // @[Arith.scala 530:{26,26}]
  wire [5:0] _GEN_567 = 7'h7 == _q1_T_5 ? $signed(6'sh5) : $signed(_GEN_566); // @[Arith.scala 530:{26,26}]
  wire [5:0] _GEN_568 = 7'h8 == _q1_T_5 ? $signed(6'sh6) : $signed(_GEN_567); // @[Arith.scala 530:{26,26}]
  wire [5:0] _GEN_569 = 7'h9 == _q1_T_5 ? $signed(6'shb) : $signed(_GEN_568); // @[Arith.scala 530:{26,26}]
  wire [5:0] _GEN_570 = 7'ha == _q1_T_5 ? $signed(-6'she) : $signed(_GEN_569); // @[Arith.scala 530:{26,26}]
  wire [5:0] _GEN_571 = 7'hb == _q1_T_5 ? $signed(-6'sh8) : $signed(_GEN_570); // @[Arith.scala 530:{26,26}]
  wire [5:0] _GEN_572 = 7'hc == _q1_T_5 ? $signed(-6'sh7) : $signed(_GEN_571); // @[Arith.scala 530:{26,26}]
  wire [5:0] _GEN_573 = 7'hd == _q1_T_5 ? $signed(-6'sh3) : $signed(_GEN_572); // @[Arith.scala 530:{26,26}]
  wire [5:0] _GEN_574 = 7'he == _q1_T_5 ? $signed(-6'sh3) : $signed(_GEN_573); // @[Arith.scala 530:{26,26}]
  wire [5:0] _GEN_575 = 7'hf == _q1_T_5 ? $signed(6'sh2) : $signed(_GEN_574); // @[Arith.scala 530:{26,26}]
  wire [5:0] _GEN_576 = 7'h10 == _q1_T_5 ? $signed(6'sh2) : $signed(_GEN_575); // @[Arith.scala 530:{26,26}]
  wire [5:0] _GEN_577 = 7'h11 == _q1_T_5 ? $signed(6'sh6) : $signed(_GEN_576); // @[Arith.scala 530:{26,26}]
  wire [5:0] _GEN_578 = 7'h12 == _q1_T_5 ? $signed(6'sh7) : $signed(_GEN_577); // @[Arith.scala 530:{26,26}]
  wire [5:0] _GEN_579 = 7'h13 == _q1_T_5 ? $signed(6'shd) : $signed(_GEN_578); // @[Arith.scala 530:{26,26}]
  wire [5:0] _GEN_580 = 7'h14 == _q1_T_5 ? $signed(-6'shf) : $signed(_GEN_579); // @[Arith.scala 530:{26,26}]
  wire [5:0] _GEN_581 = 7'h15 == _q1_T_5 ? $signed(-6'sh9) : $signed(_GEN_580); // @[Arith.scala 530:{26,26}]
  wire [5:0] _GEN_582 = 7'h16 == _q1_T_5 ? $signed(-6'sh8) : $signed(_GEN_581); // @[Arith.scala 530:{26,26}]
  wire [5:0] _GEN_583 = 7'h17 == _q1_T_5 ? $signed(-6'sh3) : $signed(_GEN_582); // @[Arith.scala 530:{26,26}]
  wire [5:0] _GEN_584 = 7'h18 == _q1_T_5 ? $signed(-6'sh3) : $signed(_GEN_583); // @[Arith.scala 530:{26,26}]
  wire [5:0] _GEN_585 = 7'h19 == _q1_T_5 ? $signed(6'sh2) : $signed(_GEN_584); // @[Arith.scala 530:{26,26}]
  wire [5:0] _GEN_586 = 7'h1a == _q1_T_5 ? $signed(6'sh2) : $signed(_GEN_585); // @[Arith.scala 530:{26,26}]
  wire [5:0] _GEN_587 = 7'h1b == _q1_T_5 ? $signed(6'sh7) : $signed(_GEN_586); // @[Arith.scala 530:{26,26}]
  wire [5:0] _GEN_588 = 7'h1c == _q1_T_5 ? $signed(6'sh8) : $signed(_GEN_587); // @[Arith.scala 530:{26,26}]
  wire [5:0] _GEN_589 = 7'h1d == _q1_T_5 ? $signed(6'she) : $signed(_GEN_588); // @[Arith.scala 530:{26,26}]
  wire [5:0] _GEN_590 = 7'h1e == _q1_T_5 ? $signed(-6'sh10) : $signed(_GEN_589); // @[Arith.scala 530:{26,26}]
  wire [5:0] _GEN_591 = 7'h1f == _q1_T_5 ? $signed(-6'sh9) : $signed(_GEN_590); // @[Arith.scala 530:{26,26}]
  wire [5:0] _GEN_592 = 7'h20 == _q1_T_5 ? $signed(-6'sh9) : $signed(_GEN_591); // @[Arith.scala 530:{26,26}]
  wire [5:0] _GEN_593 = 7'h21 == _q1_T_5 ? $signed(-6'sh3) : $signed(_GEN_592); // @[Arith.scala 530:{26,26}]
  wire [5:0] _GEN_594 = 7'h22 == _q1_T_5 ? $signed(-6'sh3) : $signed(_GEN_593); // @[Arith.scala 530:{26,26}]
  wire [5:0] _GEN_595 = 7'h23 == _q1_T_5 ? $signed(6'sh2) : $signed(_GEN_594); // @[Arith.scala 530:{26,26}]
  wire [5:0] _GEN_596 = 7'h24 == _q1_T_5 ? $signed(6'sh2) : $signed(_GEN_595); // @[Arith.scala 530:{26,26}]
  wire [5:0] _GEN_597 = 7'h25 == _q1_T_5 ? $signed(6'sh8) : $signed(_GEN_596); // @[Arith.scala 530:{26,26}]
  wire [5:0] _GEN_598 = 7'h26 == _q1_T_5 ? $signed(6'sh8) : $signed(_GEN_597); // @[Arith.scala 530:{26,26}]
  wire [5:0] _GEN_599 = 7'h27 == _q1_T_5 ? $signed(6'shf) : $signed(_GEN_598); // @[Arith.scala 530:{26,26}]
  wire [5:0] _GEN_600 = 7'h28 == _q1_T_5 ? $signed(-6'sh12) : $signed(_GEN_599); // @[Arith.scala 530:{26,26}]
  wire [5:0] _GEN_601 = 7'h29 == _q1_T_5 ? $signed(-6'sha) : $signed(_GEN_600); // @[Arith.scala 530:{26,26}]
  wire [5:0] _GEN_602 = 7'h2a == _q1_T_5 ? $signed(-6'sha) : $signed(_GEN_601); // @[Arith.scala 530:{26,26}]
  wire [5:0] _GEN_603 = 7'h2b == _q1_T_5 ? $signed(-6'sh4) : $signed(_GEN_602); // @[Arith.scala 530:{26,26}]
  wire [5:0] _GEN_604 = 7'h2c == _q1_T_5 ? $signed(-6'sh4) : $signed(_GEN_603); // @[Arith.scala 530:{26,26}]
  wire [5:0] _GEN_605 = 7'h2d == _q1_T_5 ? $signed(6'sh3) : $signed(_GEN_604); // @[Arith.scala 530:{26,26}]
  wire [5:0] _GEN_606 = 7'h2e == _q1_T_5 ? $signed(6'sh3) : $signed(_GEN_605); // @[Arith.scala 530:{26,26}]
  wire [5:0] _GEN_607 = 7'h2f == _q1_T_5 ? $signed(6'sh9) : $signed(_GEN_606); // @[Arith.scala 530:{26,26}]
  wire [5:0] _GEN_608 = 7'h30 == _q1_T_5 ? $signed(6'sh9) : $signed(_GEN_607); // @[Arith.scala 530:{26,26}]
  wire [5:0] _GEN_609 = 7'h31 == _q1_T_5 ? $signed(6'sh11) : $signed(_GEN_608); // @[Arith.scala 530:{26,26}]
  wire [5:0] _GEN_610 = 7'h32 == _q1_T_5 ? $signed(-6'sh13) : $signed(_GEN_609); // @[Arith.scala 530:{26,26}]
  wire [5:0] _GEN_611 = 7'h33 == _q1_T_5 ? $signed(-6'shb) : $signed(_GEN_610); // @[Arith.scala 530:{26,26}]
  wire [5:0] _GEN_612 = 7'h34 == _q1_T_5 ? $signed(-6'sha) : $signed(_GEN_611); // @[Arith.scala 530:{26,26}]
  wire [5:0] _GEN_613 = 7'h35 == _q1_T_5 ? $signed(-6'sh4) : $signed(_GEN_612); // @[Arith.scala 530:{26,26}]
  wire [5:0] _GEN_614 = 7'h36 == _q1_T_5 ? $signed(-6'sh4) : $signed(_GEN_613); // @[Arith.scala 530:{26,26}]
  wire [5:0] _GEN_615 = 7'h37 == _q1_T_5 ? $signed(6'sh3) : $signed(_GEN_614); // @[Arith.scala 530:{26,26}]
  wire [5:0] _GEN_616 = 7'h38 == _q1_T_5 ? $signed(6'sh3) : $signed(_GEN_615); // @[Arith.scala 530:{26,26}]
  wire [5:0] _GEN_617 = 7'h39 == _q1_T_5 ? $signed(6'sh9) : $signed(_GEN_616); // @[Arith.scala 530:{26,26}]
  wire [5:0] _GEN_618 = 7'h3a == _q1_T_5 ? $signed(6'sha) : $signed(_GEN_617); // @[Arith.scala 530:{26,26}]
  wire [5:0] _GEN_619 = 7'h3b == _q1_T_5 ? $signed(6'sh12) : $signed(_GEN_618); // @[Arith.scala 530:{26,26}]
  wire [5:0] _GEN_620 = 7'h3c == _q1_T_5 ? $signed(-6'sh14) : $signed(_GEN_619); // @[Arith.scala 530:{26,26}]
  wire [5:0] _GEN_621 = 7'h3d == _q1_T_5 ? $signed(-6'shb) : $signed(_GEN_620); // @[Arith.scala 530:{26,26}]
  wire [5:0] _GEN_622 = 7'h3e == _q1_T_5 ? $signed(-6'shb) : $signed(_GEN_621); // @[Arith.scala 530:{26,26}]
  wire [5:0] _GEN_623 = 7'h3f == _q1_T_5 ? $signed(-6'sh4) : $signed(_GEN_622); // @[Arith.scala 530:{26,26}]
  wire [5:0] _GEN_624 = 7'h40 == _q1_T_5 ? $signed(-6'sh4) : $signed(_GEN_623); // @[Arith.scala 530:{26,26}]
  wire [5:0] _GEN_625 = 7'h41 == _q1_T_5 ? $signed(6'sh3) : $signed(_GEN_624); // @[Arith.scala 530:{26,26}]
  wire [5:0] _GEN_626 = 7'h42 == _q1_T_5 ? $signed(6'sh3) : $signed(_GEN_625); // @[Arith.scala 530:{26,26}]
  wire [5:0] _GEN_627 = 7'h43 == _q1_T_5 ? $signed(6'sha) : $signed(_GEN_626); // @[Arith.scala 530:{26,26}]
  wire [5:0] _GEN_628 = 7'h44 == _q1_T_5 ? $signed(6'sha) : $signed(_GEN_627); // @[Arith.scala 530:{26,26}]
  wire [5:0] _GEN_629 = 7'h45 == _q1_T_5 ? $signed(6'sh13) : $signed(_GEN_628); // @[Arith.scala 530:{26,26}]
  wire [5:0] _GEN_630 = 7'h46 == _q1_T_5 ? $signed(-6'sh16) : $signed(_GEN_629); // @[Arith.scala 530:{26,26}]
  wire [5:0] _GEN_631 = 7'h47 == _q1_T_5 ? $signed(-6'shc) : $signed(_GEN_630); // @[Arith.scala 530:{26,26}]
  wire [5:0] _GEN_632 = 7'h48 == _q1_T_5 ? $signed(-6'shc) : $signed(_GEN_631); // @[Arith.scala 530:{26,26}]
  wire [5:0] _GEN_633 = 7'h49 == _q1_T_5 ? $signed(-6'sh4) : $signed(_GEN_632); // @[Arith.scala 530:{26,26}]
  wire [5:0] _GEN_634 = 7'h4a == _q1_T_5 ? $signed(-6'sh5) : $signed(_GEN_633); // @[Arith.scala 530:{26,26}]
  wire [5:0] _GEN_635 = 7'h4b == _q1_T_5 ? $signed(6'sh4) : $signed(_GEN_634); // @[Arith.scala 530:{26,26}]
  wire [5:0] _GEN_636 = 7'h4c == _q1_T_5 ? $signed(6'sh3) : $signed(_GEN_635); // @[Arith.scala 530:{26,26}]
  wire [5:0] _GEN_637 = 7'h4d == _q1_T_5 ? $signed(6'shb) : $signed(_GEN_636); // @[Arith.scala 530:{26,26}]
  wire [5:0] _GEN_638 = 7'h4e == _q1_T_5 ? $signed(6'shb) : $signed(_GEN_637); // @[Arith.scala 530:{26,26}]
  wire [5:0] _GEN_639 = 7'h4f == _q1_T_5 ? $signed(6'sh15) : $signed(_GEN_638); // @[Arith.scala 530:{26,26}]
  wire  q1 = $signed(_qNeg2_T_1) >= $signed(_GEN_559) & $signed(_qNeg2_T_1) <= $signed(_GEN_639); // @[Arith.scala 530:19]
  wire [6:0] _q2_T_3 = offset + 7'h8; // @[Arith.scala 582:57]
  wire [6:0] _q2_T_5 = offset + 7'h9; // @[Arith.scala 582:77]
  wire [5:0] _GEN_641 = 7'h1 == _q2_T_3 ? $signed(-6'sh7) : $signed(-6'shc); // @[Arith.scala 530:{14,14}]
  wire [5:0] _GEN_642 = 7'h2 == _q2_T_3 ? $signed(-6'sh6) : $signed(_GEN_641); // @[Arith.scala 530:{14,14}]
  wire [5:0] _GEN_643 = 7'h3 == _q2_T_3 ? $signed(-6'sh3) : $signed(_GEN_642); // @[Arith.scala 530:{14,14}]
  wire [5:0] _GEN_644 = 7'h4 == _q2_T_3 ? $signed(-6'sh2) : $signed(_GEN_643); // @[Arith.scala 530:{14,14}]
  wire [5:0] _GEN_645 = 7'h5 == _q2_T_3 ? $signed(6'sh1) : $signed(_GEN_644); // @[Arith.scala 530:{14,14}]
  wire [5:0] _GEN_646 = 7'h6 == _q2_T_3 ? $signed(6'sh2) : $signed(_GEN_645); // @[Arith.scala 530:{14,14}]
  wire [5:0] _GEN_647 = 7'h7 == _q2_T_3 ? $signed(6'sh5) : $signed(_GEN_646); // @[Arith.scala 530:{14,14}]
  wire [5:0] _GEN_648 = 7'h8 == _q2_T_3 ? $signed(6'sh6) : $signed(_GEN_647); // @[Arith.scala 530:{14,14}]
  wire [5:0] _GEN_649 = 7'h9 == _q2_T_3 ? $signed(6'shb) : $signed(_GEN_648); // @[Arith.scala 530:{14,14}]
  wire [5:0] _GEN_650 = 7'ha == _q2_T_3 ? $signed(-6'she) : $signed(_GEN_649); // @[Arith.scala 530:{14,14}]
  wire [5:0] _GEN_651 = 7'hb == _q2_T_3 ? $signed(-6'sh8) : $signed(_GEN_650); // @[Arith.scala 530:{14,14}]
  wire [5:0] _GEN_652 = 7'hc == _q2_T_3 ? $signed(-6'sh7) : $signed(_GEN_651); // @[Arith.scala 530:{14,14}]
  wire [5:0] _GEN_653 = 7'hd == _q2_T_3 ? $signed(-6'sh3) : $signed(_GEN_652); // @[Arith.scala 530:{14,14}]
  wire [5:0] _GEN_654 = 7'he == _q2_T_3 ? $signed(-6'sh3) : $signed(_GEN_653); // @[Arith.scala 530:{14,14}]
  wire [5:0] _GEN_655 = 7'hf == _q2_T_3 ? $signed(6'sh2) : $signed(_GEN_654); // @[Arith.scala 530:{14,14}]
  wire [5:0] _GEN_656 = 7'h10 == _q2_T_3 ? $signed(6'sh2) : $signed(_GEN_655); // @[Arith.scala 530:{14,14}]
  wire [5:0] _GEN_657 = 7'h11 == _q2_T_3 ? $signed(6'sh6) : $signed(_GEN_656); // @[Arith.scala 530:{14,14}]
  wire [5:0] _GEN_658 = 7'h12 == _q2_T_3 ? $signed(6'sh7) : $signed(_GEN_657); // @[Arith.scala 530:{14,14}]
  wire [5:0] _GEN_659 = 7'h13 == _q2_T_3 ? $signed(6'shd) : $signed(_GEN_658); // @[Arith.scala 530:{14,14}]
  wire [5:0] _GEN_660 = 7'h14 == _q2_T_3 ? $signed(-6'shf) : $signed(_GEN_659); // @[Arith.scala 530:{14,14}]
  wire [5:0] _GEN_661 = 7'h15 == _q2_T_3 ? $signed(-6'sh9) : $signed(_GEN_660); // @[Arith.scala 530:{14,14}]
  wire [5:0] _GEN_662 = 7'h16 == _q2_T_3 ? $signed(-6'sh8) : $signed(_GEN_661); // @[Arith.scala 530:{14,14}]
  wire [5:0] _GEN_663 = 7'h17 == _q2_T_3 ? $signed(-6'sh3) : $signed(_GEN_662); // @[Arith.scala 530:{14,14}]
  wire [5:0] _GEN_664 = 7'h18 == _q2_T_3 ? $signed(-6'sh3) : $signed(_GEN_663); // @[Arith.scala 530:{14,14}]
  wire [5:0] _GEN_665 = 7'h19 == _q2_T_3 ? $signed(6'sh2) : $signed(_GEN_664); // @[Arith.scala 530:{14,14}]
  wire [5:0] _GEN_666 = 7'h1a == _q2_T_3 ? $signed(6'sh2) : $signed(_GEN_665); // @[Arith.scala 530:{14,14}]
  wire [5:0] _GEN_667 = 7'h1b == _q2_T_3 ? $signed(6'sh7) : $signed(_GEN_666); // @[Arith.scala 530:{14,14}]
  wire [5:0] _GEN_668 = 7'h1c == _q2_T_3 ? $signed(6'sh8) : $signed(_GEN_667); // @[Arith.scala 530:{14,14}]
  wire [5:0] _GEN_669 = 7'h1d == _q2_T_3 ? $signed(6'she) : $signed(_GEN_668); // @[Arith.scala 530:{14,14}]
  wire [5:0] _GEN_670 = 7'h1e == _q2_T_3 ? $signed(-6'sh10) : $signed(_GEN_669); // @[Arith.scala 530:{14,14}]
  wire [5:0] _GEN_671 = 7'h1f == _q2_T_3 ? $signed(-6'sh9) : $signed(_GEN_670); // @[Arith.scala 530:{14,14}]
  wire [5:0] _GEN_672 = 7'h20 == _q2_T_3 ? $signed(-6'sh9) : $signed(_GEN_671); // @[Arith.scala 530:{14,14}]
  wire [5:0] _GEN_673 = 7'h21 == _q2_T_3 ? $signed(-6'sh3) : $signed(_GEN_672); // @[Arith.scala 530:{14,14}]
  wire [5:0] _GEN_674 = 7'h22 == _q2_T_3 ? $signed(-6'sh3) : $signed(_GEN_673); // @[Arith.scala 530:{14,14}]
  wire [5:0] _GEN_675 = 7'h23 == _q2_T_3 ? $signed(6'sh2) : $signed(_GEN_674); // @[Arith.scala 530:{14,14}]
  wire [5:0] _GEN_676 = 7'h24 == _q2_T_3 ? $signed(6'sh2) : $signed(_GEN_675); // @[Arith.scala 530:{14,14}]
  wire [5:0] _GEN_677 = 7'h25 == _q2_T_3 ? $signed(6'sh8) : $signed(_GEN_676); // @[Arith.scala 530:{14,14}]
  wire [5:0] _GEN_678 = 7'h26 == _q2_T_3 ? $signed(6'sh8) : $signed(_GEN_677); // @[Arith.scala 530:{14,14}]
  wire [5:0] _GEN_679 = 7'h27 == _q2_T_3 ? $signed(6'shf) : $signed(_GEN_678); // @[Arith.scala 530:{14,14}]
  wire [5:0] _GEN_680 = 7'h28 == _q2_T_3 ? $signed(-6'sh12) : $signed(_GEN_679); // @[Arith.scala 530:{14,14}]
  wire [5:0] _GEN_681 = 7'h29 == _q2_T_3 ? $signed(-6'sha) : $signed(_GEN_680); // @[Arith.scala 530:{14,14}]
  wire [5:0] _GEN_682 = 7'h2a == _q2_T_3 ? $signed(-6'sha) : $signed(_GEN_681); // @[Arith.scala 530:{14,14}]
  wire [5:0] _GEN_683 = 7'h2b == _q2_T_3 ? $signed(-6'sh4) : $signed(_GEN_682); // @[Arith.scala 530:{14,14}]
  wire [5:0] _GEN_684 = 7'h2c == _q2_T_3 ? $signed(-6'sh4) : $signed(_GEN_683); // @[Arith.scala 530:{14,14}]
  wire [5:0] _GEN_685 = 7'h2d == _q2_T_3 ? $signed(6'sh3) : $signed(_GEN_684); // @[Arith.scala 530:{14,14}]
  wire [5:0] _GEN_686 = 7'h2e == _q2_T_3 ? $signed(6'sh3) : $signed(_GEN_685); // @[Arith.scala 530:{14,14}]
  wire [5:0] _GEN_687 = 7'h2f == _q2_T_3 ? $signed(6'sh9) : $signed(_GEN_686); // @[Arith.scala 530:{14,14}]
  wire [5:0] _GEN_688 = 7'h30 == _q2_T_3 ? $signed(6'sh9) : $signed(_GEN_687); // @[Arith.scala 530:{14,14}]
  wire [5:0] _GEN_689 = 7'h31 == _q2_T_3 ? $signed(6'sh11) : $signed(_GEN_688); // @[Arith.scala 530:{14,14}]
  wire [5:0] _GEN_690 = 7'h32 == _q2_T_3 ? $signed(-6'sh13) : $signed(_GEN_689); // @[Arith.scala 530:{14,14}]
  wire [5:0] _GEN_691 = 7'h33 == _q2_T_3 ? $signed(-6'shb) : $signed(_GEN_690); // @[Arith.scala 530:{14,14}]
  wire [5:0] _GEN_692 = 7'h34 == _q2_T_3 ? $signed(-6'sha) : $signed(_GEN_691); // @[Arith.scala 530:{14,14}]
  wire [5:0] _GEN_693 = 7'h35 == _q2_T_3 ? $signed(-6'sh4) : $signed(_GEN_692); // @[Arith.scala 530:{14,14}]
  wire [5:0] _GEN_694 = 7'h36 == _q2_T_3 ? $signed(-6'sh4) : $signed(_GEN_693); // @[Arith.scala 530:{14,14}]
  wire [5:0] _GEN_695 = 7'h37 == _q2_T_3 ? $signed(6'sh3) : $signed(_GEN_694); // @[Arith.scala 530:{14,14}]
  wire [5:0] _GEN_696 = 7'h38 == _q2_T_3 ? $signed(6'sh3) : $signed(_GEN_695); // @[Arith.scala 530:{14,14}]
  wire [5:0] _GEN_697 = 7'h39 == _q2_T_3 ? $signed(6'sh9) : $signed(_GEN_696); // @[Arith.scala 530:{14,14}]
  wire [5:0] _GEN_698 = 7'h3a == _q2_T_3 ? $signed(6'sha) : $signed(_GEN_697); // @[Arith.scala 530:{14,14}]
  wire [5:0] _GEN_699 = 7'h3b == _q2_T_3 ? $signed(6'sh12) : $signed(_GEN_698); // @[Arith.scala 530:{14,14}]
  wire [5:0] _GEN_700 = 7'h3c == _q2_T_3 ? $signed(-6'sh14) : $signed(_GEN_699); // @[Arith.scala 530:{14,14}]
  wire [5:0] _GEN_701 = 7'h3d == _q2_T_3 ? $signed(-6'shb) : $signed(_GEN_700); // @[Arith.scala 530:{14,14}]
  wire [5:0] _GEN_702 = 7'h3e == _q2_T_3 ? $signed(-6'shb) : $signed(_GEN_701); // @[Arith.scala 530:{14,14}]
  wire [5:0] _GEN_703 = 7'h3f == _q2_T_3 ? $signed(-6'sh4) : $signed(_GEN_702); // @[Arith.scala 530:{14,14}]
  wire [5:0] _GEN_704 = 7'h40 == _q2_T_3 ? $signed(-6'sh4) : $signed(_GEN_703); // @[Arith.scala 530:{14,14}]
  wire [5:0] _GEN_705 = 7'h41 == _q2_T_3 ? $signed(6'sh3) : $signed(_GEN_704); // @[Arith.scala 530:{14,14}]
  wire [5:0] _GEN_706 = 7'h42 == _q2_T_3 ? $signed(6'sh3) : $signed(_GEN_705); // @[Arith.scala 530:{14,14}]
  wire [5:0] _GEN_707 = 7'h43 == _q2_T_3 ? $signed(6'sha) : $signed(_GEN_706); // @[Arith.scala 530:{14,14}]
  wire [5:0] _GEN_708 = 7'h44 == _q2_T_3 ? $signed(6'sha) : $signed(_GEN_707); // @[Arith.scala 530:{14,14}]
  wire [5:0] _GEN_709 = 7'h45 == _q2_T_3 ? $signed(6'sh13) : $signed(_GEN_708); // @[Arith.scala 530:{14,14}]
  wire [5:0] _GEN_710 = 7'h46 == _q2_T_3 ? $signed(-6'sh16) : $signed(_GEN_709); // @[Arith.scala 530:{14,14}]
  wire [5:0] _GEN_711 = 7'h47 == _q2_T_3 ? $signed(-6'shc) : $signed(_GEN_710); // @[Arith.scala 530:{14,14}]
  wire [5:0] _GEN_712 = 7'h48 == _q2_T_3 ? $signed(-6'shc) : $signed(_GEN_711); // @[Arith.scala 530:{14,14}]
  wire [5:0] _GEN_713 = 7'h49 == _q2_T_3 ? $signed(-6'sh4) : $signed(_GEN_712); // @[Arith.scala 530:{14,14}]
  wire [5:0] _GEN_714 = 7'h4a == _q2_T_3 ? $signed(-6'sh5) : $signed(_GEN_713); // @[Arith.scala 530:{14,14}]
  wire [5:0] _GEN_715 = 7'h4b == _q2_T_3 ? $signed(6'sh4) : $signed(_GEN_714); // @[Arith.scala 530:{14,14}]
  wire [5:0] _GEN_716 = 7'h4c == _q2_T_3 ? $signed(6'sh3) : $signed(_GEN_715); // @[Arith.scala 530:{14,14}]
  wire [5:0] _GEN_717 = 7'h4d == _q2_T_3 ? $signed(6'shb) : $signed(_GEN_716); // @[Arith.scala 530:{14,14}]
  wire [5:0] _GEN_718 = 7'h4e == _q2_T_3 ? $signed(6'shb) : $signed(_GEN_717); // @[Arith.scala 530:{14,14}]
  wire [5:0] _GEN_719 = 7'h4f == _q2_T_3 ? $signed(6'sh15) : $signed(_GEN_718); // @[Arith.scala 530:{14,14}]
  wire [5:0] _GEN_721 = 7'h1 == _q2_T_5 ? $signed(-6'sh7) : $signed(-6'shc); // @[Arith.scala 530:{26,26}]
  wire [5:0] _GEN_722 = 7'h2 == _q2_T_5 ? $signed(-6'sh6) : $signed(_GEN_721); // @[Arith.scala 530:{26,26}]
  wire [5:0] _GEN_723 = 7'h3 == _q2_T_5 ? $signed(-6'sh3) : $signed(_GEN_722); // @[Arith.scala 530:{26,26}]
  wire [5:0] _GEN_724 = 7'h4 == _q2_T_5 ? $signed(-6'sh2) : $signed(_GEN_723); // @[Arith.scala 530:{26,26}]
  wire [5:0] _GEN_725 = 7'h5 == _q2_T_5 ? $signed(6'sh1) : $signed(_GEN_724); // @[Arith.scala 530:{26,26}]
  wire [5:0] _GEN_726 = 7'h6 == _q2_T_5 ? $signed(6'sh2) : $signed(_GEN_725); // @[Arith.scala 530:{26,26}]
  wire [5:0] _GEN_727 = 7'h7 == _q2_T_5 ? $signed(6'sh5) : $signed(_GEN_726); // @[Arith.scala 530:{26,26}]
  wire [5:0] _GEN_728 = 7'h8 == _q2_T_5 ? $signed(6'sh6) : $signed(_GEN_727); // @[Arith.scala 530:{26,26}]
  wire [5:0] _GEN_729 = 7'h9 == _q2_T_5 ? $signed(6'shb) : $signed(_GEN_728); // @[Arith.scala 530:{26,26}]
  wire [5:0] _GEN_730 = 7'ha == _q2_T_5 ? $signed(-6'she) : $signed(_GEN_729); // @[Arith.scala 530:{26,26}]
  wire [5:0] _GEN_731 = 7'hb == _q2_T_5 ? $signed(-6'sh8) : $signed(_GEN_730); // @[Arith.scala 530:{26,26}]
  wire [5:0] _GEN_732 = 7'hc == _q2_T_5 ? $signed(-6'sh7) : $signed(_GEN_731); // @[Arith.scala 530:{26,26}]
  wire [5:0] _GEN_733 = 7'hd == _q2_T_5 ? $signed(-6'sh3) : $signed(_GEN_732); // @[Arith.scala 530:{26,26}]
  wire [5:0] _GEN_734 = 7'he == _q2_T_5 ? $signed(-6'sh3) : $signed(_GEN_733); // @[Arith.scala 530:{26,26}]
  wire [5:0] _GEN_735 = 7'hf == _q2_T_5 ? $signed(6'sh2) : $signed(_GEN_734); // @[Arith.scala 530:{26,26}]
  wire [5:0] _GEN_736 = 7'h10 == _q2_T_5 ? $signed(6'sh2) : $signed(_GEN_735); // @[Arith.scala 530:{26,26}]
  wire [5:0] _GEN_737 = 7'h11 == _q2_T_5 ? $signed(6'sh6) : $signed(_GEN_736); // @[Arith.scala 530:{26,26}]
  wire [5:0] _GEN_738 = 7'h12 == _q2_T_5 ? $signed(6'sh7) : $signed(_GEN_737); // @[Arith.scala 530:{26,26}]
  wire [5:0] _GEN_739 = 7'h13 == _q2_T_5 ? $signed(6'shd) : $signed(_GEN_738); // @[Arith.scala 530:{26,26}]
  wire [5:0] _GEN_740 = 7'h14 == _q2_T_5 ? $signed(-6'shf) : $signed(_GEN_739); // @[Arith.scala 530:{26,26}]
  wire [5:0] _GEN_741 = 7'h15 == _q2_T_5 ? $signed(-6'sh9) : $signed(_GEN_740); // @[Arith.scala 530:{26,26}]
  wire [5:0] _GEN_742 = 7'h16 == _q2_T_5 ? $signed(-6'sh8) : $signed(_GEN_741); // @[Arith.scala 530:{26,26}]
  wire [5:0] _GEN_743 = 7'h17 == _q2_T_5 ? $signed(-6'sh3) : $signed(_GEN_742); // @[Arith.scala 530:{26,26}]
  wire [5:0] _GEN_744 = 7'h18 == _q2_T_5 ? $signed(-6'sh3) : $signed(_GEN_743); // @[Arith.scala 530:{26,26}]
  wire [5:0] _GEN_745 = 7'h19 == _q2_T_5 ? $signed(6'sh2) : $signed(_GEN_744); // @[Arith.scala 530:{26,26}]
  wire [5:0] _GEN_746 = 7'h1a == _q2_T_5 ? $signed(6'sh2) : $signed(_GEN_745); // @[Arith.scala 530:{26,26}]
  wire [5:0] _GEN_747 = 7'h1b == _q2_T_5 ? $signed(6'sh7) : $signed(_GEN_746); // @[Arith.scala 530:{26,26}]
  wire [5:0] _GEN_748 = 7'h1c == _q2_T_5 ? $signed(6'sh8) : $signed(_GEN_747); // @[Arith.scala 530:{26,26}]
  wire [5:0] _GEN_749 = 7'h1d == _q2_T_5 ? $signed(6'she) : $signed(_GEN_748); // @[Arith.scala 530:{26,26}]
  wire [5:0] _GEN_750 = 7'h1e == _q2_T_5 ? $signed(-6'sh10) : $signed(_GEN_749); // @[Arith.scala 530:{26,26}]
  wire [5:0] _GEN_751 = 7'h1f == _q2_T_5 ? $signed(-6'sh9) : $signed(_GEN_750); // @[Arith.scala 530:{26,26}]
  wire [5:0] _GEN_752 = 7'h20 == _q2_T_5 ? $signed(-6'sh9) : $signed(_GEN_751); // @[Arith.scala 530:{26,26}]
  wire [5:0] _GEN_753 = 7'h21 == _q2_T_5 ? $signed(-6'sh3) : $signed(_GEN_752); // @[Arith.scala 530:{26,26}]
  wire [5:0] _GEN_754 = 7'h22 == _q2_T_5 ? $signed(-6'sh3) : $signed(_GEN_753); // @[Arith.scala 530:{26,26}]
  wire [5:0] _GEN_755 = 7'h23 == _q2_T_5 ? $signed(6'sh2) : $signed(_GEN_754); // @[Arith.scala 530:{26,26}]
  wire [5:0] _GEN_756 = 7'h24 == _q2_T_5 ? $signed(6'sh2) : $signed(_GEN_755); // @[Arith.scala 530:{26,26}]
  wire [5:0] _GEN_757 = 7'h25 == _q2_T_5 ? $signed(6'sh8) : $signed(_GEN_756); // @[Arith.scala 530:{26,26}]
  wire [5:0] _GEN_758 = 7'h26 == _q2_T_5 ? $signed(6'sh8) : $signed(_GEN_757); // @[Arith.scala 530:{26,26}]
  wire [5:0] _GEN_759 = 7'h27 == _q2_T_5 ? $signed(6'shf) : $signed(_GEN_758); // @[Arith.scala 530:{26,26}]
  wire [5:0] _GEN_760 = 7'h28 == _q2_T_5 ? $signed(-6'sh12) : $signed(_GEN_759); // @[Arith.scala 530:{26,26}]
  wire [5:0] _GEN_761 = 7'h29 == _q2_T_5 ? $signed(-6'sha) : $signed(_GEN_760); // @[Arith.scala 530:{26,26}]
  wire [5:0] _GEN_762 = 7'h2a == _q2_T_5 ? $signed(-6'sha) : $signed(_GEN_761); // @[Arith.scala 530:{26,26}]
  wire [5:0] _GEN_763 = 7'h2b == _q2_T_5 ? $signed(-6'sh4) : $signed(_GEN_762); // @[Arith.scala 530:{26,26}]
  wire [5:0] _GEN_764 = 7'h2c == _q2_T_5 ? $signed(-6'sh4) : $signed(_GEN_763); // @[Arith.scala 530:{26,26}]
  wire [5:0] _GEN_765 = 7'h2d == _q2_T_5 ? $signed(6'sh3) : $signed(_GEN_764); // @[Arith.scala 530:{26,26}]
  wire [5:0] _GEN_766 = 7'h2e == _q2_T_5 ? $signed(6'sh3) : $signed(_GEN_765); // @[Arith.scala 530:{26,26}]
  wire [5:0] _GEN_767 = 7'h2f == _q2_T_5 ? $signed(6'sh9) : $signed(_GEN_766); // @[Arith.scala 530:{26,26}]
  wire [5:0] _GEN_768 = 7'h30 == _q2_T_5 ? $signed(6'sh9) : $signed(_GEN_767); // @[Arith.scala 530:{26,26}]
  wire [5:0] _GEN_769 = 7'h31 == _q2_T_5 ? $signed(6'sh11) : $signed(_GEN_768); // @[Arith.scala 530:{26,26}]
  wire [5:0] _GEN_770 = 7'h32 == _q2_T_5 ? $signed(-6'sh13) : $signed(_GEN_769); // @[Arith.scala 530:{26,26}]
  wire [5:0] _GEN_771 = 7'h33 == _q2_T_5 ? $signed(-6'shb) : $signed(_GEN_770); // @[Arith.scala 530:{26,26}]
  wire [5:0] _GEN_772 = 7'h34 == _q2_T_5 ? $signed(-6'sha) : $signed(_GEN_771); // @[Arith.scala 530:{26,26}]
  wire [5:0] _GEN_773 = 7'h35 == _q2_T_5 ? $signed(-6'sh4) : $signed(_GEN_772); // @[Arith.scala 530:{26,26}]
  wire [5:0] _GEN_774 = 7'h36 == _q2_T_5 ? $signed(-6'sh4) : $signed(_GEN_773); // @[Arith.scala 530:{26,26}]
  wire [5:0] _GEN_775 = 7'h37 == _q2_T_5 ? $signed(6'sh3) : $signed(_GEN_774); // @[Arith.scala 530:{26,26}]
  wire [5:0] _GEN_776 = 7'h38 == _q2_T_5 ? $signed(6'sh3) : $signed(_GEN_775); // @[Arith.scala 530:{26,26}]
  wire [5:0] _GEN_777 = 7'h39 == _q2_T_5 ? $signed(6'sh9) : $signed(_GEN_776); // @[Arith.scala 530:{26,26}]
  wire [5:0] _GEN_778 = 7'h3a == _q2_T_5 ? $signed(6'sha) : $signed(_GEN_777); // @[Arith.scala 530:{26,26}]
  wire [5:0] _GEN_779 = 7'h3b == _q2_T_5 ? $signed(6'sh12) : $signed(_GEN_778); // @[Arith.scala 530:{26,26}]
  wire [5:0] _GEN_780 = 7'h3c == _q2_T_5 ? $signed(-6'sh14) : $signed(_GEN_779); // @[Arith.scala 530:{26,26}]
  wire [5:0] _GEN_781 = 7'h3d == _q2_T_5 ? $signed(-6'shb) : $signed(_GEN_780); // @[Arith.scala 530:{26,26}]
  wire [5:0] _GEN_782 = 7'h3e == _q2_T_5 ? $signed(-6'shb) : $signed(_GEN_781); // @[Arith.scala 530:{26,26}]
  wire [5:0] _GEN_783 = 7'h3f == _q2_T_5 ? $signed(-6'sh4) : $signed(_GEN_782); // @[Arith.scala 530:{26,26}]
  wire [5:0] _GEN_784 = 7'h40 == _q2_T_5 ? $signed(-6'sh4) : $signed(_GEN_783); // @[Arith.scala 530:{26,26}]
  wire [5:0] _GEN_785 = 7'h41 == _q2_T_5 ? $signed(6'sh3) : $signed(_GEN_784); // @[Arith.scala 530:{26,26}]
  wire [5:0] _GEN_786 = 7'h42 == _q2_T_5 ? $signed(6'sh3) : $signed(_GEN_785); // @[Arith.scala 530:{26,26}]
  wire [5:0] _GEN_787 = 7'h43 == _q2_T_5 ? $signed(6'sha) : $signed(_GEN_786); // @[Arith.scala 530:{26,26}]
  wire [5:0] _GEN_788 = 7'h44 == _q2_T_5 ? $signed(6'sha) : $signed(_GEN_787); // @[Arith.scala 530:{26,26}]
  wire [5:0] _GEN_789 = 7'h45 == _q2_T_5 ? $signed(6'sh13) : $signed(_GEN_788); // @[Arith.scala 530:{26,26}]
  wire [5:0] _GEN_790 = 7'h46 == _q2_T_5 ? $signed(-6'sh16) : $signed(_GEN_789); // @[Arith.scala 530:{26,26}]
  wire [5:0] _GEN_791 = 7'h47 == _q2_T_5 ? $signed(-6'shc) : $signed(_GEN_790); // @[Arith.scala 530:{26,26}]
  wire [5:0] _GEN_792 = 7'h48 == _q2_T_5 ? $signed(-6'shc) : $signed(_GEN_791); // @[Arith.scala 530:{26,26}]
  wire [5:0] _GEN_793 = 7'h49 == _q2_T_5 ? $signed(-6'sh4) : $signed(_GEN_792); // @[Arith.scala 530:{26,26}]
  wire [5:0] _GEN_794 = 7'h4a == _q2_T_5 ? $signed(-6'sh5) : $signed(_GEN_793); // @[Arith.scala 530:{26,26}]
  wire [5:0] _GEN_795 = 7'h4b == _q2_T_5 ? $signed(6'sh4) : $signed(_GEN_794); // @[Arith.scala 530:{26,26}]
  wire [5:0] _GEN_796 = 7'h4c == _q2_T_5 ? $signed(6'sh3) : $signed(_GEN_795); // @[Arith.scala 530:{26,26}]
  wire [5:0] _GEN_797 = 7'h4d == _q2_T_5 ? $signed(6'shb) : $signed(_GEN_796); // @[Arith.scala 530:{26,26}]
  wire [5:0] _GEN_798 = 7'h4e == _q2_T_5 ? $signed(6'shb) : $signed(_GEN_797); // @[Arith.scala 530:{26,26}]
  wire [5:0] _GEN_799 = 7'h4f == _q2_T_5 ? $signed(6'sh15) : $signed(_GEN_798); // @[Arith.scala 530:{26,26}]
  wire  q2 = $signed(_qNeg2_T_1) >= $signed(_GEN_719) & $signed(_qNeg2_T_1) <= $signed(_GEN_799); // @[Arith.scala 530:19]
  wire [128:0] _PA_T = {65'h0,io_a}; // @[Cat.scala 31:58]
  wire [191:0] _GEN_0 = {{63'd0}, _PA_T}; // @[Arith.scala 588:48]
  wire [191:0] _PA_T_1 = _GEN_0 << clz; // @[Arith.scala 588:48]
  wire [126:0] _GEN_1 = {{63'd0}, io_b}; // @[Arith.scala 589:32]
  wire [126:0] _B_T = _GEN_1 << clz; // @[Arith.scala 589:32]
  wire [191:0] _GEN_801 = io_start ? _PA_T_1 : {{63'd0}, PA}; // @[Arith.scala 586:27 588:23 554:26]
  wire [126:0] _GEN_802 = io_start ? _B_T : {{63'd0}, B}; // @[Arith.scala 586:27 589:23 557:26]
  wire [2:0] _qSel_T = qNeg1 ? 3'h7 : 3'h6; // @[Mux.scala 47:70]
  wire [2:0] _qSel_T_1 = q2 ? 3'h2 : _qSel_T; // @[Mux.scala 47:70]
  wire [2:0] _qSel_T_2 = q1 ? 3'h1 : _qSel_T_1; // @[Mux.scala 47:70]
  wire [2:0] qSel = q0 ? 3'h0 : _qSel_T_2; // @[Mux.scala 47:70]
  wire [64:0] _PA_T_2 = {B, 1'h0}; // @[Arith.scala 617:47]
  wire [128:0] _PA_T_3 = {_PA_T_2,64'h0}; // @[Cat.scala 31:58]
  wire [130:0] _GEN_852 = {{2'd0}, _PA_T_3}; // @[Arith.scala 617:38]
  wire [130:0] _PA_T_5 = PASL2 + _GEN_852; // @[Arith.scala 617:38]
  wire [63:0] _neg_quo_T = 64'h1 << cnt; // @[Arith.scala 618:47]
  wire [64:0] _neg_quo_T_1 = {_neg_quo_T, 1'h0}; // @[Arith.scala 618:54]
  wire [64:0] _GEN_853 = {{1'd0}, neg_quo}; // @[Arith.scala 618:40]
  wire [64:0] _neg_quo_T_3 = _GEN_853 + _neg_quo_T_1; // @[Arith.scala 618:40]
  wire [127:0] _PA_T_6 = {B,64'h0}; // @[Cat.scala 31:58]
  wire [130:0] _GEN_854 = {{3'd0}, _PA_T_6}; // @[Arith.scala 621:38]
  wire [130:0] _PA_T_8 = PASL2 + _GEN_854; // @[Arith.scala 621:38]
  wire [63:0] _neg_quo_T_6 = neg_quo + _neg_quo_T; // @[Arith.scala 622:40]
  wire [128:0] _PA_T_9 = {negB,64'h0}; // @[Cat.scala 31:58]
  wire [130:0] _GEN_855 = {{2'd0}, _PA_T_9}; // @[Arith.scala 628:38]
  wire [130:0] _PA_T_11 = PASL2 + _GEN_855; // @[Arith.scala 628:38]
  wire [63:0] _pos_quo_T_2 = pos_quo + _neg_quo_T; // @[Arith.scala 629:40]
  wire [129:0] _PA_T_12 = {neg2B,64'h0}; // @[Cat.scala 31:58]
  wire [130:0] _GEN_856 = {{1'd0}, _PA_T_12}; // @[Arith.scala 632:38]
  wire [130:0] _PA_T_14 = PASL2 + _GEN_856; // @[Arith.scala 632:38]
  wire [64:0] _GEN_857 = {{1'd0}, pos_quo}; // @[Arith.scala 633:40]
  wire [64:0] _pos_quo_T_6 = _GEN_857 + _neg_quo_T_1; // @[Arith.scala 633:40]
  wire [130:0] _GEN_803 = 3'h2 == qSel ? _PA_T_14 : {{2'd0}, PA}; // @[Arith.scala 615:25 554:26 632:29]
  wire [64:0] _GEN_804 = 3'h2 == qSel ? _pos_quo_T_6 : {{1'd0}, pos_quo}; // @[Arith.scala 615:25 569:26 633:29]
  wire [130:0] _GEN_805 = 3'h1 == qSel ? _PA_T_11 : _GEN_803; // @[Arith.scala 615:25 628:29]
  wire [64:0] _GEN_806 = 3'h1 == qSel ? {{1'd0}, _pos_quo_T_2} : _GEN_804; // @[Arith.scala 615:25 629:29]
  wire [130:0] _GEN_807 = 3'h0 == qSel ? PASL2 : _GEN_805; // @[Arith.scala 615:25 625:29]
  wire [64:0] _GEN_808 = 3'h0 == qSel ? {{1'd0}, pos_quo} : _GEN_806; // @[Arith.scala 615:25 569:26]
  wire [130:0] _GEN_809 = 3'h7 == qSel ? _PA_T_8 : _GEN_807; // @[Arith.scala 615:25 621:29]
  wire [63:0] _GEN_810 = 3'h7 == qSel ? _neg_quo_T_6 : neg_quo; // @[Arith.scala 615:25 570:26 622:29]
  wire [64:0] _GEN_811 = 3'h7 == qSel ? {{1'd0}, pos_quo} : _GEN_808; // @[Arith.scala 615:25 569:26]
  wire [130:0] _GEN_812 = 3'h6 == qSel ? _PA_T_5 : _GEN_809; // @[Arith.scala 615:25 617:29]
  wire [64:0] _GEN_813 = 3'h6 == qSel ? _neg_quo_T_3 : {{1'd0}, _GEN_810}; // @[Arith.scala 615:25 618:29]
  wire [64:0] _GEN_814 = 3'h6 == qSel ? {{1'd0}, pos_quo} : _GEN_811; // @[Arith.scala 615:25 569:26]
  wire [5:0] _cnt_T_1 = cnt - 6'h2; // @[Arith.scala 637:24]
  wire [64:0] _GEN_858 = {{1'd0}, B}; // @[Arith.scala 650:41]
  wire [64:0] _io_rem_T_2 = P + _GEN_858; // @[Arith.scala 650:41]
  wire [64:0] _io_rem_T_3 = _io_rem_T_2 >> clz; // @[Arith.scala 650:46]
  wire [64:0] _io_rem_T_4 = P >> clz; // @[Arith.scala 650:56]
  wire [64:0] _io_rem_T_5 = P_neg ? _io_rem_T_3 : _io_rem_T_4; // @[Arith.scala 650:30]
  wire [63:0] _io_quo_T_5 = _io_quo_T_1 - 64'h1; // @[Arith.scala 651:56]
  wire [63:0] _io_quo_T_8 = P_neg ? _io_quo_T_5 : _io_quo_T_1; // @[Arith.scala 651:30]
  wire [1:0] _GEN_815 = 2'h2 == state ? 2'h2 : state; // @[Arith.scala 584:18 648:24 553:26]
  wire [5:0] _GEN_816 = 2'h2 == state ? 6'h0 : cnt; // @[Arith.scala 584:18 649:24 567:26]
  wire [64:0] _GEN_817 = 2'h2 == state ? _io_rem_T_5 : P; // @[Arith.scala 573:16 584:18 650:24]
  wire [63:0] _GEN_818 = 2'h2 == state ? _io_quo_T_8 : _io_quo_T_1; // @[Arith.scala 574:16 584:18 651:24]
  wire [63:0] _GEN_821 = 2'h3 == state ? 64'h0 : _GEN_818; // @[Arith.scala 584:18 642:24]
  wire [64:0] _GEN_822 = 2'h3 == state ? 65'h0 : _GEN_817; // @[Arith.scala 584:18 643:24]
  wire  _GEN_823 = 2'h3 == state | 2'h2 == state; // @[Arith.scala 584:18 644:24]
  wire  _GEN_827 = 2'h1 == state ? 1'h0 : _GEN_823; // @[Arith.scala 584:18 605:24]
  wire [130:0] _GEN_828 = 2'h1 == state ? _GEN_812 : {{2'd0}, PA}; // @[Arith.scala 584:18 554:26]
  wire [64:0] _GEN_829 = 2'h1 == state ? _GEN_813 : {{1'd0}, neg_quo}; // @[Arith.scala 584:18 570:26]
  wire [64:0] _GEN_830 = 2'h1 == state ? _GEN_814 : {{1'd0}, pos_quo}; // @[Arith.scala 584:18 569:26]
  wire [63:0] _GEN_832 = 2'h1 == state ? _io_quo_T_1 : _GEN_821; // @[Arith.scala 574:16 584:18]
  wire [64:0] _GEN_833 = 2'h1 == state ? P : _GEN_822; // @[Arith.scala 573:16 584:18]
  wire [191:0] _GEN_836 = 2'h0 == state ? _GEN_801 : {{61'd0}, _GEN_828}; // @[Arith.scala 584:18]
  wire [126:0] _GEN_837 = 2'h0 == state ? _GEN_802 : {{63'd0}, B}; // @[Arith.scala 584:18 557:26]
  wire [64:0] _GEN_840 = 2'h0 == state ? 65'h0 : _GEN_830; // @[Arith.scala 584:18 595:24]
  wire [64:0] _GEN_841 = 2'h0 == state ? 65'h0 : _GEN_829; // @[Arith.scala 584:18 596:24]
  wire [64:0] _GEN_843 = 2'h0 == state ? P : _GEN_833; // @[Arith.scala 573:16 584:18]
  wire [191:0] _GEN_859 = reset ? 192'h0 : _GEN_836; // @[Arith.scala 554:{26,26}]
  wire [126:0] _GEN_860 = reset ? 127'h0 : _GEN_837; // @[Arith.scala 557:{26,26}]
  wire [64:0] _GEN_861 = reset ? 65'h0 : _GEN_840; // @[Arith.scala 569:{26,26}]
  wire [64:0] _GEN_862 = reset ? 65'h0 : _GEN_841; // @[Arith.scala 570:{26,26}]
  assign io_rem = _GEN_843[63:0];
  assign io_quo = 2'h0 == state ? _io_quo_T_1 : _GEN_832; // @[Arith.scala 574:16 584:18]
  assign io_finish = 2'h0 == state ? 1'h0 : _GEN_827; // @[Arith.scala 584:18 594:24]
  always @(posedge clock) begin
    if (reset) begin // @[Arith.scala 553:26]
      state <= 2'h0; // @[Arith.scala 553:26]
    end else if (2'h0 == state) begin // @[Arith.scala 584:18]
      if (io_start) begin // @[Arith.scala 586:27]
        if (io_b == 64'h0) begin // @[Arith.scala 587:30]
          state <= 2'h3;
        end else begin
          state <= 2'h1;
        end
      end else begin
        state <= 2'h0; // @[Arith.scala 591:23]
      end
    end else if (2'h1 == state) begin // @[Arith.scala 584:18]
      if (cnt == 6'h0) begin // @[Arith.scala 604:30]
        state <= 2'h2;
      end else begin
        state <= 2'h1;
      end
    end else if (2'h3 == state) begin // @[Arith.scala 584:18]
      state <= 2'h2; // @[Arith.scala 641:24]
    end else begin
      state <= _GEN_815;
    end
    PA <= _GEN_859[128:0]; // @[Arith.scala 554:{26,26}]
    B <= _GEN_860[63:0]; // @[Arith.scala 557:{26,26}]
    if (reset) begin // @[Arith.scala 567:26]
      cnt <= 6'h0; // @[Arith.scala 567:26]
    end else if (2'h0 == state) begin // @[Arith.scala 584:18]
      cnt <= 6'h3e; // @[Arith.scala 593:24]
    end else if (2'h1 == state) begin // @[Arith.scala 584:18]
      cnt <= _cnt_T_1; // @[Arith.scala 637:17]
    end else if (!(2'h3 == state)) begin // @[Arith.scala 584:18]
      cnt <= _GEN_816;
    end
    pos_quo <= _GEN_861[63:0]; // @[Arith.scala 569:{26,26}]
    neg_quo <= _GEN_862[63:0]; // @[Arith.scala 570:{26,26}]
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
  state = _RAND_0[1:0];
  _RAND_1 = {5{`RANDOM}};
  PA = _RAND_1[128:0];
  _RAND_2 = {2{`RANDOM}};
  B = _RAND_2[63:0];
  _RAND_3 = {1{`RANDOM}};
  cnt = _RAND_3[5:0];
  _RAND_4 = {2{`RANDOM}};
  pos_quo = _RAND_4[63:0];
  _RAND_5 = {2{`RANDOM}};
  neg_quo = _RAND_5[63:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module Top(
  input         clock,
  input         reset,
  output [63:0] io_o1,
  output [31:0] io_o2,
  output [63:0] io_o3,
  output [63:0] io_o4
);
  wire  IF_clock; // @[Top.scala 17:29]
  wire  IF_reset; // @[Top.scala 17:29]
  wire  IF_io_stall; // @[Top.scala 17:29]
  wire  IF_io_excep_happen; // @[Top.scala 17:29]
  wire [63:0] IF_io_excep_new_pc; // @[Top.scala 17:29]
  wire  IF_io_branchOp_taken; // @[Top.scala 17:29]
  wire [63:0] IF_io_branchOp_target; // @[Top.scala 17:29]
  wire [63:0] IF_io_pc_o; // @[Top.scala 17:29]
  wire [31:0] IF_io_inst_o; // @[Top.scala 17:29]
  wire  CSR_clock; // @[Top.scala 18:29]
  wire  CSR_reset; // @[Top.scala 18:29]
  wire [11:0] CSR_io_ID_2_CSR_addr; // @[Top.scala 18:29]
  wire [63:0] CSR_io_ID_2_CSR_wdata; // @[Top.scala 18:29]
  wire  CSR_io_writeOp_en; // @[Top.scala 18:29]
  wire [63:0] CSR_io_writeOp_data; // @[Top.scala 18:29]
  wire [4:0] CSR_io_exception_cause; // @[Top.scala 18:29]
  wire [63:0] CSR_io_exception_pc; // @[Top.scala 18:29]
  wire [63:0] CSR_io_exception_xtval; // @[Top.scala 18:29]
  wire  CSR_io_exception_happen; // @[Top.scala 18:29]
  wire [63:0] CSR_io_CSR_2_ID_data; // @[Top.scala 18:29]
  wire  CSR_io_CSR_2_ID_legalWrite; // @[Top.scala 18:29]
  wire  CSR_io_CSR_2_ID_legalRead; // @[Top.scala 18:29]
  wire [1:0] CSR_io_CSR_2_ID_priv; // @[Top.scala 18:29]
  wire [63:0] CSR_io_CSR_2_ID_xtvec; // @[Top.scala 18:29]
  wire [63:0] CSR_io_CSR_2_ID_xepc; // @[Top.scala 18:29]
  wire  REGFILE_clock; // @[Top.scala 19:29]
  wire  REGFILE_reset; // @[Top.scala 19:29]
  wire [4:0] REGFILE_io_id2Rf_ReadIdx1; // @[Top.scala 19:29]
  wire [4:0] REGFILE_io_id2Rf_ReadIdx2; // @[Top.scala 19:29]
  wire  REGFILE_io_writeRfOp_en; // @[Top.scala 19:29]
  wire [63:0] REGFILE_io_writeRfOp_data; // @[Top.scala 19:29]
  wire [4:0] REGFILE_io_writeRfOp_addr; // @[Top.scala 19:29]
  wire [63:0] REGFILE_io_rf2Id_RegData1; // @[Top.scala 19:29]
  wire [63:0] REGFILE_io_rf2Id_RegData2; // @[Top.scala 19:29]
  wire  IF_ID_clock; // @[Top.scala 20:29]
  wire  IF_ID_reset; // @[Top.scala 20:29]
  wire  IF_ID_io_stall; // @[Top.scala 20:29]
  wire  IF_ID_io_flush; // @[Top.scala 20:29]
  wire [63:0] IF_ID_io_pc_i; // @[Top.scala 20:29]
  wire [31:0] IF_ID_io_inst_i; // @[Top.scala 20:29]
  wire [63:0] IF_ID_io_pc_o; // @[Top.scala 20:29]
  wire [31:0] IF_ID_io_inst_o; // @[Top.scala 20:29]
  wire [63:0] ID_io_pc; // @[Top.scala 21:29]
  wire [31:0] ID_io_inst_i; // @[Top.scala 21:29]
  wire [63:0] ID_io_rf2Id_RegData1; // @[Top.scala 21:29]
  wire [63:0] ID_io_rf2Id_RegData2; // @[Top.scala 21:29]
  wire [4:0] ID_io_fwd_rf_ex_addr; // @[Top.scala 21:29]
  wire [63:0] ID_io_fwd_rf_ex_data; // @[Top.scala 21:29]
  wire [4:0] ID_io_fwd_rf_mem_addr; // @[Top.scala 21:29]
  wire [63:0] ID_io_fwd_rf_mem_data; // @[Top.scala 21:29]
  wire [4:0] ID_io_fwd_rf_wb_addr; // @[Top.scala 21:29]
  wire [63:0] ID_io_fwd_rf_wb_data; // @[Top.scala 21:29]
  wire [11:0] ID_io_fwd_csr_ex_addr; // @[Top.scala 21:29]
  wire [63:0] ID_io_fwd_csr_ex_data; // @[Top.scala 21:29]
  wire [11:0] ID_io_fwd_csr_mem_addr; // @[Top.scala 21:29]
  wire [63:0] ID_io_fwd_csr_mem_data; // @[Top.scala 21:29]
  wire [11:0] ID_io_fwd_csr_wb_addr; // @[Top.scala 21:29]
  wire [63:0] ID_io_fwd_csr_wb_data; // @[Top.scala 21:29]
  wire [63:0] ID_io_CSR_2_ID_data; // @[Top.scala 21:29]
  wire  ID_io_CSR_2_ID_legalWrite; // @[Top.scala 21:29]
  wire  ID_io_CSR_2_ID_legalRead; // @[Top.scala 21:29]
  wire [1:0] ID_io_CSR_2_ID_priv; // @[Top.scala 21:29]
  wire [63:0] ID_io_CSR_2_ID_xtvec; // @[Top.scala 21:29]
  wire [63:0] ID_io_CSR_2_ID_xepc; // @[Top.scala 21:29]
  wire  ID_io_prev_is_load; // @[Top.scala 21:29]
  wire [4:0] ID_io_prev_rd; // @[Top.scala 21:29]
  wire [11:0] ID_io_ID_2_CSR_addr; // @[Top.scala 21:29]
  wire [63:0] ID_io_ID_2_CSR_wdata; // @[Top.scala 21:29]
  wire [4:0] ID_io_id2Rf_ReadIdx1; // @[Top.scala 21:29]
  wire [4:0] ID_io_id2Rf_ReadIdx2; // @[Top.scala 21:29]
  wire [63:0] ID_io_decInfo_oprand1; // @[Top.scala 21:29]
  wire [63:0] ID_io_decInfo_oprand2; // @[Top.scala 21:29]
  wire [4:0] ID_io_decInfo_rd; // @[Top.scala 21:29]
  wire [2:0] ID_io_decInfo_InstType; // @[Top.scala 21:29]
  wire [4:0] ID_io_decInfo_aluop; // @[Top.scala 21:29]
  wire  ID_io_decInfo_branchOp_taken; // @[Top.scala 21:29]
  wire [63:0] ID_io_decInfo_branchOp_target; // @[Top.scala 21:29]
  wire  ID_io_decInfo_storeOp_en; // @[Top.scala 21:29]
  wire [63:0] ID_io_decInfo_storeOp_data; // @[Top.scala 21:29]
  wire [1:0] ID_io_decInfo_storeOp_Width; // @[Top.scala 21:29]
  wire  ID_io_decInfo_loadOp_isLoad; // @[Top.scala 21:29]
  wire [1:0] ID_io_decInfo_loadOp_Width; // @[Top.scala 21:29]
  wire  ID_io_decInfo_loadOp_sign; // @[Top.scala 21:29]
  wire  ID_io_decInfo_writeCSROp_en; // @[Top.scala 21:29]
  wire [11:0] ID_io_decInfo_writeCSROp_addr; // @[Top.scala 21:29]
  wire [63:0] ID_io_decInfo_writeCSROp_data; // @[Top.scala 21:29]
  wire  ID_io_flush_req; // @[Top.scala 21:29]
  wire  ID_io_stall_req; // @[Top.scala 21:29]
  wire [4:0] ID_io_exception_cause; // @[Top.scala 21:29]
  wire [63:0] ID_io_exception_pc; // @[Top.scala 21:29]
  wire [63:0] ID_io_exception_xtval; // @[Top.scala 21:29]
  wire  ID_io_exception_happen; // @[Top.scala 21:29]
  wire [63:0] ID_io_exception_new_pc; // @[Top.scala 21:29]
  wire  ID_EX_clock; // @[Top.scala 22:29]
  wire  ID_EX_reset; // @[Top.scala 22:29]
  wire  ID_EX_io_stall; // @[Top.scala 22:29]
  wire  ID_EX_io_flush; // @[Top.scala 22:29]
  wire [63:0] ID_EX_io_decInfo_i_oprand1; // @[Top.scala 22:29]
  wire [63:0] ID_EX_io_decInfo_i_oprand2; // @[Top.scala 22:29]
  wire [4:0] ID_EX_io_decInfo_i_rd; // @[Top.scala 22:29]
  wire [2:0] ID_EX_io_decInfo_i_InstType; // @[Top.scala 22:29]
  wire [4:0] ID_EX_io_decInfo_i_aluop; // @[Top.scala 22:29]
  wire  ID_EX_io_decInfo_i_storeOp_en; // @[Top.scala 22:29]
  wire [63:0] ID_EX_io_decInfo_i_storeOp_data; // @[Top.scala 22:29]
  wire [1:0] ID_EX_io_decInfo_i_storeOp_Width; // @[Top.scala 22:29]
  wire  ID_EX_io_decInfo_i_loadOp_isLoad; // @[Top.scala 22:29]
  wire [1:0] ID_EX_io_decInfo_i_loadOp_Width; // @[Top.scala 22:29]
  wire  ID_EX_io_decInfo_i_loadOp_sign; // @[Top.scala 22:29]
  wire  ID_EX_io_decInfo_i_writeCSROp_en; // @[Top.scala 22:29]
  wire [11:0] ID_EX_io_decInfo_i_writeCSROp_addr; // @[Top.scala 22:29]
  wire [63:0] ID_EX_io_decInfo_i_writeCSROp_data; // @[Top.scala 22:29]
  wire [4:0] ID_EX_io_exception_i_cause; // @[Top.scala 22:29]
  wire [63:0] ID_EX_io_exception_i_pc; // @[Top.scala 22:29]
  wire [63:0] ID_EX_io_exception_i_xtval; // @[Top.scala 22:29]
  wire  ID_EX_io_exception_i_happen; // @[Top.scala 22:29]
  wire [63:0] ID_EX_io_exception_i_new_pc; // @[Top.scala 22:29]
  wire [63:0] ID_EX_io_decInfo_o_oprand1; // @[Top.scala 22:29]
  wire [63:0] ID_EX_io_decInfo_o_oprand2; // @[Top.scala 22:29]
  wire [4:0] ID_EX_io_decInfo_o_rd; // @[Top.scala 22:29]
  wire [2:0] ID_EX_io_decInfo_o_InstType; // @[Top.scala 22:29]
  wire [4:0] ID_EX_io_decInfo_o_aluop; // @[Top.scala 22:29]
  wire  ID_EX_io_decInfo_o_storeOp_en; // @[Top.scala 22:29]
  wire [63:0] ID_EX_io_decInfo_o_storeOp_data; // @[Top.scala 22:29]
  wire [1:0] ID_EX_io_decInfo_o_storeOp_Width; // @[Top.scala 22:29]
  wire  ID_EX_io_decInfo_o_loadOp_isLoad; // @[Top.scala 22:29]
  wire [1:0] ID_EX_io_decInfo_o_loadOp_Width; // @[Top.scala 22:29]
  wire  ID_EX_io_decInfo_o_loadOp_sign; // @[Top.scala 22:29]
  wire  ID_EX_io_decInfo_o_writeCSROp_en; // @[Top.scala 22:29]
  wire [11:0] ID_EX_io_decInfo_o_writeCSROp_addr; // @[Top.scala 22:29]
  wire [63:0] ID_EX_io_decInfo_o_writeCSROp_data; // @[Top.scala 22:29]
  wire [4:0] ID_EX_io_exception_o_cause; // @[Top.scala 22:29]
  wire [63:0] ID_EX_io_exception_o_pc; // @[Top.scala 22:29]
  wire [63:0] ID_EX_io_exception_o_xtval; // @[Top.scala 22:29]
  wire  ID_EX_io_exception_o_happen; // @[Top.scala 22:29]
  wire [63:0] ID_EX_io_exception_o_new_pc; // @[Top.scala 22:29]
  wire [63:0] EX_io_decInfo_oprand1; // @[Top.scala 23:29]
  wire [63:0] EX_io_decInfo_oprand2; // @[Top.scala 23:29]
  wire [4:0] EX_io_decInfo_rd; // @[Top.scala 23:29]
  wire [2:0] EX_io_decInfo_InstType; // @[Top.scala 23:29]
  wire [4:0] EX_io_decInfo_aluop; // @[Top.scala 23:29]
  wire  EX_io_decInfo_storeOp_en; // @[Top.scala 23:29]
  wire [63:0] EX_io_decInfo_storeOp_data; // @[Top.scala 23:29]
  wire [1:0] EX_io_decInfo_storeOp_Width; // @[Top.scala 23:29]
  wire  EX_io_decInfo_loadOp_isLoad; // @[Top.scala 23:29]
  wire [1:0] EX_io_decInfo_loadOp_Width; // @[Top.scala 23:29]
  wire  EX_io_decInfo_loadOp_sign; // @[Top.scala 23:29]
  wire  EX_io_decInfo_writeCSROp_en; // @[Top.scala 23:29]
  wire [11:0] EX_io_decInfo_writeCSROp_addr; // @[Top.scala 23:29]
  wire [63:0] EX_io_decInfo_writeCSROp_data; // @[Top.scala 23:29]
  wire [63:0] EX_io_divRes_quo; // @[Top.scala 23:29]
  wire [63:0] EX_io_divRes_rem; // @[Top.scala 23:29]
  wire  EX_io_divRes_finish; // @[Top.scala 23:29]
  wire [4:0] EX_io_exception_i_cause; // @[Top.scala 23:29]
  wire [63:0] EX_io_exception_i_pc; // @[Top.scala 23:29]
  wire [63:0] EX_io_exception_i_xtval; // @[Top.scala 23:29]
  wire  EX_io_exception_i_happen; // @[Top.scala 23:29]
  wire [63:0] EX_io_exception_i_new_pc; // @[Top.scala 23:29]
  wire [4:0] EX_io_rf_fwd_addr; // @[Top.scala 23:29]
  wire [63:0] EX_io_rf_fwd_data; // @[Top.scala 23:29]
  wire [11:0] EX_io_csr_fwd_addr; // @[Top.scala 23:29]
  wire [63:0] EX_io_csr_fwd_data; // @[Top.scala 23:29]
  wire  EX_io_writeRfOp_en; // @[Top.scala 23:29]
  wire [63:0] EX_io_writeRfOp_data; // @[Top.scala 23:29]
  wire [4:0] EX_io_writeRfOp_addr; // @[Top.scala 23:29]
  wire  EX_io_writeCSROp_en; // @[Top.scala 23:29]
  wire [11:0] EX_io_writeCSROp_addr; // @[Top.scala 23:29]
  wire [63:0] EX_io_writeCSROp_data; // @[Top.scala 23:29]
  wire  EX_io_loadOp_isLoad; // @[Top.scala 23:29]
  wire [63:0] EX_io_loadOp_addr; // @[Top.scala 23:29]
  wire [1:0] EX_io_loadOp_Width; // @[Top.scala 23:29]
  wire  EX_io_loadOp_sign; // @[Top.scala 23:29]
  wire  EX_io_storeOp_en; // @[Top.scala 23:29]
  wire [63:0] EX_io_storeOp_addr; // @[Top.scala 23:29]
  wire [63:0] EX_io_storeOp_data; // @[Top.scala 23:29]
  wire [1:0] EX_io_storeOp_Width; // @[Top.scala 23:29]
  wire  EX_io_divOP_start; // @[Top.scala 23:29]
  wire [63:0] EX_io_divOP_a; // @[Top.scala 23:29]
  wire [63:0] EX_io_divOP_b; // @[Top.scala 23:29]
  wire  EX_io_stall_req; // @[Top.scala 23:29]
  wire [4:0] EX_io_exception_o_cause; // @[Top.scala 23:29]
  wire [63:0] EX_io_exception_o_pc; // @[Top.scala 23:29]
  wire [63:0] EX_io_exception_o_xtval; // @[Top.scala 23:29]
  wire  EX_io_exception_o_happen; // @[Top.scala 23:29]
  wire [63:0] EX_io_exception_o_new_pc; // @[Top.scala 23:29]
  wire  EX_MEM_clock; // @[Top.scala 24:29]
  wire  EX_MEM_reset; // @[Top.scala 24:29]
  wire  EX_MEM_io_stall; // @[Top.scala 24:29]
  wire  EX_MEM_io_flush; // @[Top.scala 24:29]
  wire  EX_MEM_io_loadOp_i_isLoad; // @[Top.scala 24:29]
  wire [63:0] EX_MEM_io_loadOp_i_addr; // @[Top.scala 24:29]
  wire [1:0] EX_MEM_io_loadOp_i_Width; // @[Top.scala 24:29]
  wire  EX_MEM_io_loadOp_i_sign; // @[Top.scala 24:29]
  wire  EX_MEM_io_storeOp_i_en; // @[Top.scala 24:29]
  wire [63:0] EX_MEM_io_storeOp_i_addr; // @[Top.scala 24:29]
  wire [63:0] EX_MEM_io_storeOp_i_data; // @[Top.scala 24:29]
  wire [1:0] EX_MEM_io_storeOp_i_Width; // @[Top.scala 24:29]
  wire  EX_MEM_io_writeRfOp_i_en; // @[Top.scala 24:29]
  wire [63:0] EX_MEM_io_writeRfOp_i_data; // @[Top.scala 24:29]
  wire [4:0] EX_MEM_io_writeRfOp_i_addr; // @[Top.scala 24:29]
  wire  EX_MEM_io_writeCSROp_i_en; // @[Top.scala 24:29]
  wire [11:0] EX_MEM_io_writeCSROp_i_addr; // @[Top.scala 24:29]
  wire [63:0] EX_MEM_io_writeCSROp_i_data; // @[Top.scala 24:29]
  wire [4:0] EX_MEM_io_exception_i_cause; // @[Top.scala 24:29]
  wire [63:0] EX_MEM_io_exception_i_pc; // @[Top.scala 24:29]
  wire [63:0] EX_MEM_io_exception_i_xtval; // @[Top.scala 24:29]
  wire  EX_MEM_io_exception_i_happen; // @[Top.scala 24:29]
  wire [63:0] EX_MEM_io_exception_i_new_pc; // @[Top.scala 24:29]
  wire  EX_MEM_io_loadOp_o_isLoad; // @[Top.scala 24:29]
  wire [63:0] EX_MEM_io_loadOp_o_addr; // @[Top.scala 24:29]
  wire [1:0] EX_MEM_io_loadOp_o_Width; // @[Top.scala 24:29]
  wire  EX_MEM_io_loadOp_o_sign; // @[Top.scala 24:29]
  wire  EX_MEM_io_storeOp_o_en; // @[Top.scala 24:29]
  wire [63:0] EX_MEM_io_storeOp_o_addr; // @[Top.scala 24:29]
  wire [63:0] EX_MEM_io_storeOp_o_data; // @[Top.scala 24:29]
  wire [1:0] EX_MEM_io_storeOp_o_Width; // @[Top.scala 24:29]
  wire  EX_MEM_io_writeRfOp_o_en; // @[Top.scala 24:29]
  wire [63:0] EX_MEM_io_writeRfOp_o_data; // @[Top.scala 24:29]
  wire [4:0] EX_MEM_io_writeRfOp_o_addr; // @[Top.scala 24:29]
  wire  EX_MEM_io_writeCSROp_o_en; // @[Top.scala 24:29]
  wire [11:0] EX_MEM_io_writeCSROp_o_addr; // @[Top.scala 24:29]
  wire [63:0] EX_MEM_io_writeCSROp_o_data; // @[Top.scala 24:29]
  wire [4:0] EX_MEM_io_exception_o_cause; // @[Top.scala 24:29]
  wire [63:0] EX_MEM_io_exception_o_pc; // @[Top.scala 24:29]
  wire [63:0] EX_MEM_io_exception_o_xtval; // @[Top.scala 24:29]
  wire  EX_MEM_io_exception_o_happen; // @[Top.scala 24:29]
  wire [63:0] EX_MEM_io_exception_o_new_pc; // @[Top.scala 24:29]
  wire  MEM_clock; // @[Top.scala 25:29]
  wire  MEM_io_writeRfOp_i_en; // @[Top.scala 25:29]
  wire [63:0] MEM_io_writeRfOp_i_data; // @[Top.scala 25:29]
  wire [4:0] MEM_io_writeRfOp_i_addr; // @[Top.scala 25:29]
  wire  MEM_io_writeCSROp_i_en; // @[Top.scala 25:29]
  wire [11:0] MEM_io_writeCSROp_i_addr; // @[Top.scala 25:29]
  wire [63:0] MEM_io_writeCSROp_i_data; // @[Top.scala 25:29]
  wire  MEM_io_loadOp_isLoad; // @[Top.scala 25:29]
  wire [63:0] MEM_io_loadOp_addr; // @[Top.scala 25:29]
  wire [1:0] MEM_io_loadOp_Width; // @[Top.scala 25:29]
  wire  MEM_io_loadOp_sign; // @[Top.scala 25:29]
  wire  MEM_io_storeOp_en; // @[Top.scala 25:29]
  wire [63:0] MEM_io_storeOp_addr; // @[Top.scala 25:29]
  wire [63:0] MEM_io_storeOp_data; // @[Top.scala 25:29]
  wire [1:0] MEM_io_storeOp_Width; // @[Top.scala 25:29]
  wire [4:0] MEM_io_exception_i_cause; // @[Top.scala 25:29]
  wire [63:0] MEM_io_exception_i_pc; // @[Top.scala 25:29]
  wire [63:0] MEM_io_exception_i_xtval; // @[Top.scala 25:29]
  wire  MEM_io_exception_i_happen; // @[Top.scala 25:29]
  wire [63:0] MEM_io_exception_i_new_pc; // @[Top.scala 25:29]
  wire [4:0] MEM_io_rf_fwd_addr; // @[Top.scala 25:29]
  wire [63:0] MEM_io_rf_fwd_data; // @[Top.scala 25:29]
  wire [11:0] MEM_io_csr_fwd_addr; // @[Top.scala 25:29]
  wire [63:0] MEM_io_csr_fwd_data; // @[Top.scala 25:29]
  wire  MEM_io_writeRfOp_o_en; // @[Top.scala 25:29]
  wire [63:0] MEM_io_writeRfOp_o_data; // @[Top.scala 25:29]
  wire [4:0] MEM_io_writeRfOp_o_addr; // @[Top.scala 25:29]
  wire  MEM_io_writeCSROp_o_en; // @[Top.scala 25:29]
  wire [11:0] MEM_io_writeCSROp_o_addr; // @[Top.scala 25:29]
  wire [63:0] MEM_io_writeCSROp_o_data; // @[Top.scala 25:29]
  wire [4:0] MEM_io_exception_o_cause; // @[Top.scala 25:29]
  wire [63:0] MEM_io_exception_o_pc; // @[Top.scala 25:29]
  wire [63:0] MEM_io_exception_o_xtval; // @[Top.scala 25:29]
  wire  MEM_io_exception_o_happen; // @[Top.scala 25:29]
  wire [63:0] MEM_io_exception_o_new_pc; // @[Top.scala 25:29]
  wire  MEM_WB_clock; // @[Top.scala 26:29]
  wire  MEM_WB_reset; // @[Top.scala 26:29]
  wire  MEM_WB_io_stall; // @[Top.scala 26:29]
  wire  MEM_WB_io_flush; // @[Top.scala 26:29]
  wire  MEM_WB_io_writeRfOp_i_en; // @[Top.scala 26:29]
  wire [63:0] MEM_WB_io_writeRfOp_i_data; // @[Top.scala 26:29]
  wire [4:0] MEM_WB_io_writeRfOp_i_addr; // @[Top.scala 26:29]
  wire  MEM_WB_io_writeCSROp_i_en; // @[Top.scala 26:29]
  wire [11:0] MEM_WB_io_writeCSROp_i_addr; // @[Top.scala 26:29]
  wire [63:0] MEM_WB_io_writeCSROp_i_data; // @[Top.scala 26:29]
  wire [4:0] MEM_WB_io_exception_i_cause; // @[Top.scala 26:29]
  wire [63:0] MEM_WB_io_exception_i_pc; // @[Top.scala 26:29]
  wire [63:0] MEM_WB_io_exception_i_xtval; // @[Top.scala 26:29]
  wire  MEM_WB_io_exception_i_happen; // @[Top.scala 26:29]
  wire [63:0] MEM_WB_io_exception_i_new_pc; // @[Top.scala 26:29]
  wire  MEM_WB_io_writeRfOp_o_en; // @[Top.scala 26:29]
  wire [63:0] MEM_WB_io_writeRfOp_o_data; // @[Top.scala 26:29]
  wire [4:0] MEM_WB_io_writeRfOp_o_addr; // @[Top.scala 26:29]
  wire  MEM_WB_io_writeCSROp_o_en; // @[Top.scala 26:29]
  wire [11:0] MEM_WB_io_writeCSROp_o_addr; // @[Top.scala 26:29]
  wire [63:0] MEM_WB_io_writeCSROp_o_data; // @[Top.scala 26:29]
  wire [4:0] MEM_WB_io_exception_o_cause; // @[Top.scala 26:29]
  wire [63:0] MEM_WB_io_exception_o_pc; // @[Top.scala 26:29]
  wire [63:0] MEM_WB_io_exception_o_xtval; // @[Top.scala 26:29]
  wire  MEM_WB_io_exception_o_happen; // @[Top.scala 26:29]
  wire [63:0] MEM_WB_io_exception_o_new_pc; // @[Top.scala 26:29]
  wire  WB_io_writeRfOp_i_en; // @[Top.scala 27:29]
  wire [63:0] WB_io_writeRfOp_i_data; // @[Top.scala 27:29]
  wire [4:0] WB_io_writeRfOp_i_addr; // @[Top.scala 27:29]
  wire  WB_io_writeCSROp_i_en; // @[Top.scala 27:29]
  wire [11:0] WB_io_writeCSROp_i_addr; // @[Top.scala 27:29]
  wire [63:0] WB_io_writeCSROp_i_data; // @[Top.scala 27:29]
  wire [4:0] WB_io_exception_i_cause; // @[Top.scala 27:29]
  wire [63:0] WB_io_exception_i_pc; // @[Top.scala 27:29]
  wire [63:0] WB_io_exception_i_xtval; // @[Top.scala 27:29]
  wire  WB_io_exception_i_happen; // @[Top.scala 27:29]
  wire [63:0] WB_io_exception_i_new_pc; // @[Top.scala 27:29]
  wire  WB_io_writeRfOp_o_en; // @[Top.scala 27:29]
  wire [63:0] WB_io_writeRfOp_o_data; // @[Top.scala 27:29]
  wire [4:0] WB_io_writeRfOp_o_addr; // @[Top.scala 27:29]
  wire  WB_io_writeCSROp_o_en; // @[Top.scala 27:29]
  wire [63:0] WB_io_writeCSROp_o_data; // @[Top.scala 27:29]
  wire [4:0] WB_io_exception_o_cause; // @[Top.scala 27:29]
  wire [63:0] WB_io_exception_o_pc; // @[Top.scala 27:29]
  wire [63:0] WB_io_exception_o_xtval; // @[Top.scala 27:29]
  wire  WB_io_exception_o_happen; // @[Top.scala 27:29]
  wire [4:0] WB_io_rf_fwd_addr; // @[Top.scala 27:29]
  wire [63:0] WB_io_rf_fwd_data; // @[Top.scala 27:29]
  wire [11:0] WB_io_csr_fwd_addr; // @[Top.scala 27:29]
  wire [63:0] WB_io_csr_fwd_data; // @[Top.scala 27:29]
  wire  WB_io_if_excep_happen; // @[Top.scala 27:29]
  wire [63:0] WB_io_if_excep_new_pc; // @[Top.scala 27:29]
  wire  CTRL_io_excep; // @[Top.scala 28:29]
  wire  CTRL_io_id_stall_req; // @[Top.scala 28:29]
  wire  CTRL_io_id_flush_req; // @[Top.scala 28:29]
  wire  CTRL_io_ex_stall_req; // @[Top.scala 28:29]
  wire [4:0] CTRL_io_stall; // @[Top.scala 28:29]
  wire [4:0] CTRL_io_flush; // @[Top.scala 28:29]
  wire  DIV_clock; // @[Top.scala 29:29]
  wire  DIV_reset; // @[Top.scala 29:29]
  wire [63:0] DIV_io_a; // @[Top.scala 29:29]
  wire [63:0] DIV_io_b; // @[Top.scala 29:29]
  wire  DIV_io_start; // @[Top.scala 29:29]
  wire [63:0] DIV_io_rem; // @[Top.scala 29:29]
  wire [63:0] DIV_io_quo; // @[Top.scala 29:29]
  wire  DIV_io_finish; // @[Top.scala 29:29]
  If IF ( // @[Top.scala 17:29]
    .clock(IF_clock),
    .reset(IF_reset),
    .io_stall(IF_io_stall),
    .io_excep_happen(IF_io_excep_happen),
    .io_excep_new_pc(IF_io_excep_new_pc),
    .io_branchOp_taken(IF_io_branchOp_taken),
    .io_branchOp_target(IF_io_branchOp_target),
    .io_pc_o(IF_io_pc_o),
    .io_inst_o(IF_io_inst_o)
  );
  CSR CSR ( // @[Top.scala 18:29]
    .clock(CSR_clock),
    .reset(CSR_reset),
    .io_ID_2_CSR_addr(CSR_io_ID_2_CSR_addr),
    .io_ID_2_CSR_wdata(CSR_io_ID_2_CSR_wdata),
    .io_writeOp_en(CSR_io_writeOp_en),
    .io_writeOp_data(CSR_io_writeOp_data),
    .io_exception_cause(CSR_io_exception_cause),
    .io_exception_pc(CSR_io_exception_pc),
    .io_exception_xtval(CSR_io_exception_xtval),
    .io_exception_happen(CSR_io_exception_happen),
    .io_CSR_2_ID_data(CSR_io_CSR_2_ID_data),
    .io_CSR_2_ID_legalWrite(CSR_io_CSR_2_ID_legalWrite),
    .io_CSR_2_ID_legalRead(CSR_io_CSR_2_ID_legalRead),
    .io_CSR_2_ID_priv(CSR_io_CSR_2_ID_priv),
    .io_CSR_2_ID_xtvec(CSR_io_CSR_2_ID_xtvec),
    .io_CSR_2_ID_xepc(CSR_io_CSR_2_ID_xepc)
  );
  Regfile REGFILE ( // @[Top.scala 19:29]
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
  If_Id IF_ID ( // @[Top.scala 20:29]
    .clock(IF_ID_clock),
    .reset(IF_ID_reset),
    .io_stall(IF_ID_io_stall),
    .io_flush(IF_ID_io_flush),
    .io_pc_i(IF_ID_io_pc_i),
    .io_inst_i(IF_ID_io_inst_i),
    .io_pc_o(IF_ID_io_pc_o),
    .io_inst_o(IF_ID_io_inst_o)
  );
  Id ID ( // @[Top.scala 21:29]
    .io_pc(ID_io_pc),
    .io_inst_i(ID_io_inst_i),
    .io_rf2Id_RegData1(ID_io_rf2Id_RegData1),
    .io_rf2Id_RegData2(ID_io_rf2Id_RegData2),
    .io_fwd_rf_ex_addr(ID_io_fwd_rf_ex_addr),
    .io_fwd_rf_ex_data(ID_io_fwd_rf_ex_data),
    .io_fwd_rf_mem_addr(ID_io_fwd_rf_mem_addr),
    .io_fwd_rf_mem_data(ID_io_fwd_rf_mem_data),
    .io_fwd_rf_wb_addr(ID_io_fwd_rf_wb_addr),
    .io_fwd_rf_wb_data(ID_io_fwd_rf_wb_data),
    .io_fwd_csr_ex_addr(ID_io_fwd_csr_ex_addr),
    .io_fwd_csr_ex_data(ID_io_fwd_csr_ex_data),
    .io_fwd_csr_mem_addr(ID_io_fwd_csr_mem_addr),
    .io_fwd_csr_mem_data(ID_io_fwd_csr_mem_data),
    .io_fwd_csr_wb_addr(ID_io_fwd_csr_wb_addr),
    .io_fwd_csr_wb_data(ID_io_fwd_csr_wb_data),
    .io_CSR_2_ID_data(ID_io_CSR_2_ID_data),
    .io_CSR_2_ID_legalWrite(ID_io_CSR_2_ID_legalWrite),
    .io_CSR_2_ID_legalRead(ID_io_CSR_2_ID_legalRead),
    .io_CSR_2_ID_priv(ID_io_CSR_2_ID_priv),
    .io_CSR_2_ID_xtvec(ID_io_CSR_2_ID_xtvec),
    .io_CSR_2_ID_xepc(ID_io_CSR_2_ID_xepc),
    .io_prev_is_load(ID_io_prev_is_load),
    .io_prev_rd(ID_io_prev_rd),
    .io_ID_2_CSR_addr(ID_io_ID_2_CSR_addr),
    .io_ID_2_CSR_wdata(ID_io_ID_2_CSR_wdata),
    .io_id2Rf_ReadIdx1(ID_io_id2Rf_ReadIdx1),
    .io_id2Rf_ReadIdx2(ID_io_id2Rf_ReadIdx2),
    .io_decInfo_oprand1(ID_io_decInfo_oprand1),
    .io_decInfo_oprand2(ID_io_decInfo_oprand2),
    .io_decInfo_rd(ID_io_decInfo_rd),
    .io_decInfo_InstType(ID_io_decInfo_InstType),
    .io_decInfo_aluop(ID_io_decInfo_aluop),
    .io_decInfo_branchOp_taken(ID_io_decInfo_branchOp_taken),
    .io_decInfo_branchOp_target(ID_io_decInfo_branchOp_target),
    .io_decInfo_storeOp_en(ID_io_decInfo_storeOp_en),
    .io_decInfo_storeOp_data(ID_io_decInfo_storeOp_data),
    .io_decInfo_storeOp_Width(ID_io_decInfo_storeOp_Width),
    .io_decInfo_loadOp_isLoad(ID_io_decInfo_loadOp_isLoad),
    .io_decInfo_loadOp_Width(ID_io_decInfo_loadOp_Width),
    .io_decInfo_loadOp_sign(ID_io_decInfo_loadOp_sign),
    .io_decInfo_writeCSROp_en(ID_io_decInfo_writeCSROp_en),
    .io_decInfo_writeCSROp_addr(ID_io_decInfo_writeCSROp_addr),
    .io_decInfo_writeCSROp_data(ID_io_decInfo_writeCSROp_data),
    .io_flush_req(ID_io_flush_req),
    .io_stall_req(ID_io_stall_req),
    .io_exception_cause(ID_io_exception_cause),
    .io_exception_pc(ID_io_exception_pc),
    .io_exception_xtval(ID_io_exception_xtval),
    .io_exception_happen(ID_io_exception_happen),
    .io_exception_new_pc(ID_io_exception_new_pc)
  );
  Id_Ex ID_EX ( // @[Top.scala 22:29]
    .clock(ID_EX_clock),
    .reset(ID_EX_reset),
    .io_stall(ID_EX_io_stall),
    .io_flush(ID_EX_io_flush),
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
    .io_decInfo_i_loadOp_sign(ID_EX_io_decInfo_i_loadOp_sign),
    .io_decInfo_i_writeCSROp_en(ID_EX_io_decInfo_i_writeCSROp_en),
    .io_decInfo_i_writeCSROp_addr(ID_EX_io_decInfo_i_writeCSROp_addr),
    .io_decInfo_i_writeCSROp_data(ID_EX_io_decInfo_i_writeCSROp_data),
    .io_exception_i_cause(ID_EX_io_exception_i_cause),
    .io_exception_i_pc(ID_EX_io_exception_i_pc),
    .io_exception_i_xtval(ID_EX_io_exception_i_xtval),
    .io_exception_i_happen(ID_EX_io_exception_i_happen),
    .io_exception_i_new_pc(ID_EX_io_exception_i_new_pc),
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
    .io_decInfo_o_loadOp_sign(ID_EX_io_decInfo_o_loadOp_sign),
    .io_decInfo_o_writeCSROp_en(ID_EX_io_decInfo_o_writeCSROp_en),
    .io_decInfo_o_writeCSROp_addr(ID_EX_io_decInfo_o_writeCSROp_addr),
    .io_decInfo_o_writeCSROp_data(ID_EX_io_decInfo_o_writeCSROp_data),
    .io_exception_o_cause(ID_EX_io_exception_o_cause),
    .io_exception_o_pc(ID_EX_io_exception_o_pc),
    .io_exception_o_xtval(ID_EX_io_exception_o_xtval),
    .io_exception_o_happen(ID_EX_io_exception_o_happen),
    .io_exception_o_new_pc(ID_EX_io_exception_o_new_pc)
  );
  Ex EX ( // @[Top.scala 23:29]
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
    .io_decInfo_loadOp_sign(EX_io_decInfo_loadOp_sign),
    .io_decInfo_writeCSROp_en(EX_io_decInfo_writeCSROp_en),
    .io_decInfo_writeCSROp_addr(EX_io_decInfo_writeCSROp_addr),
    .io_decInfo_writeCSROp_data(EX_io_decInfo_writeCSROp_data),
    .io_divRes_quo(EX_io_divRes_quo),
    .io_divRes_rem(EX_io_divRes_rem),
    .io_divRes_finish(EX_io_divRes_finish),
    .io_exception_i_cause(EX_io_exception_i_cause),
    .io_exception_i_pc(EX_io_exception_i_pc),
    .io_exception_i_xtval(EX_io_exception_i_xtval),
    .io_exception_i_happen(EX_io_exception_i_happen),
    .io_exception_i_new_pc(EX_io_exception_i_new_pc),
    .io_rf_fwd_addr(EX_io_rf_fwd_addr),
    .io_rf_fwd_data(EX_io_rf_fwd_data),
    .io_csr_fwd_addr(EX_io_csr_fwd_addr),
    .io_csr_fwd_data(EX_io_csr_fwd_data),
    .io_writeRfOp_en(EX_io_writeRfOp_en),
    .io_writeRfOp_data(EX_io_writeRfOp_data),
    .io_writeRfOp_addr(EX_io_writeRfOp_addr),
    .io_writeCSROp_en(EX_io_writeCSROp_en),
    .io_writeCSROp_addr(EX_io_writeCSROp_addr),
    .io_writeCSROp_data(EX_io_writeCSROp_data),
    .io_loadOp_isLoad(EX_io_loadOp_isLoad),
    .io_loadOp_addr(EX_io_loadOp_addr),
    .io_loadOp_Width(EX_io_loadOp_Width),
    .io_loadOp_sign(EX_io_loadOp_sign),
    .io_storeOp_en(EX_io_storeOp_en),
    .io_storeOp_addr(EX_io_storeOp_addr),
    .io_storeOp_data(EX_io_storeOp_data),
    .io_storeOp_Width(EX_io_storeOp_Width),
    .io_divOP_start(EX_io_divOP_start),
    .io_divOP_a(EX_io_divOP_a),
    .io_divOP_b(EX_io_divOP_b),
    .io_stall_req(EX_io_stall_req),
    .io_exception_o_cause(EX_io_exception_o_cause),
    .io_exception_o_pc(EX_io_exception_o_pc),
    .io_exception_o_xtval(EX_io_exception_o_xtval),
    .io_exception_o_happen(EX_io_exception_o_happen),
    .io_exception_o_new_pc(EX_io_exception_o_new_pc)
  );
  Ex_Mem EX_MEM ( // @[Top.scala 24:29]
    .clock(EX_MEM_clock),
    .reset(EX_MEM_reset),
    .io_stall(EX_MEM_io_stall),
    .io_flush(EX_MEM_io_flush),
    .io_loadOp_i_isLoad(EX_MEM_io_loadOp_i_isLoad),
    .io_loadOp_i_addr(EX_MEM_io_loadOp_i_addr),
    .io_loadOp_i_Width(EX_MEM_io_loadOp_i_Width),
    .io_loadOp_i_sign(EX_MEM_io_loadOp_i_sign),
    .io_storeOp_i_en(EX_MEM_io_storeOp_i_en),
    .io_storeOp_i_addr(EX_MEM_io_storeOp_i_addr),
    .io_storeOp_i_data(EX_MEM_io_storeOp_i_data),
    .io_storeOp_i_Width(EX_MEM_io_storeOp_i_Width),
    .io_writeRfOp_i_en(EX_MEM_io_writeRfOp_i_en),
    .io_writeRfOp_i_data(EX_MEM_io_writeRfOp_i_data),
    .io_writeRfOp_i_addr(EX_MEM_io_writeRfOp_i_addr),
    .io_writeCSROp_i_en(EX_MEM_io_writeCSROp_i_en),
    .io_writeCSROp_i_addr(EX_MEM_io_writeCSROp_i_addr),
    .io_writeCSROp_i_data(EX_MEM_io_writeCSROp_i_data),
    .io_exception_i_cause(EX_MEM_io_exception_i_cause),
    .io_exception_i_pc(EX_MEM_io_exception_i_pc),
    .io_exception_i_xtval(EX_MEM_io_exception_i_xtval),
    .io_exception_i_happen(EX_MEM_io_exception_i_happen),
    .io_exception_i_new_pc(EX_MEM_io_exception_i_new_pc),
    .io_loadOp_o_isLoad(EX_MEM_io_loadOp_o_isLoad),
    .io_loadOp_o_addr(EX_MEM_io_loadOp_o_addr),
    .io_loadOp_o_Width(EX_MEM_io_loadOp_o_Width),
    .io_loadOp_o_sign(EX_MEM_io_loadOp_o_sign),
    .io_storeOp_o_en(EX_MEM_io_storeOp_o_en),
    .io_storeOp_o_addr(EX_MEM_io_storeOp_o_addr),
    .io_storeOp_o_data(EX_MEM_io_storeOp_o_data),
    .io_storeOp_o_Width(EX_MEM_io_storeOp_o_Width),
    .io_writeRfOp_o_en(EX_MEM_io_writeRfOp_o_en),
    .io_writeRfOp_o_data(EX_MEM_io_writeRfOp_o_data),
    .io_writeRfOp_o_addr(EX_MEM_io_writeRfOp_o_addr),
    .io_writeCSROp_o_en(EX_MEM_io_writeCSROp_o_en),
    .io_writeCSROp_o_addr(EX_MEM_io_writeCSROp_o_addr),
    .io_writeCSROp_o_data(EX_MEM_io_writeCSROp_o_data),
    .io_exception_o_cause(EX_MEM_io_exception_o_cause),
    .io_exception_o_pc(EX_MEM_io_exception_o_pc),
    .io_exception_o_xtval(EX_MEM_io_exception_o_xtval),
    .io_exception_o_happen(EX_MEM_io_exception_o_happen),
    .io_exception_o_new_pc(EX_MEM_io_exception_o_new_pc)
  );
  MEM MEM ( // @[Top.scala 25:29]
    .clock(MEM_clock),
    .io_writeRfOp_i_en(MEM_io_writeRfOp_i_en),
    .io_writeRfOp_i_data(MEM_io_writeRfOp_i_data),
    .io_writeRfOp_i_addr(MEM_io_writeRfOp_i_addr),
    .io_writeCSROp_i_en(MEM_io_writeCSROp_i_en),
    .io_writeCSROp_i_addr(MEM_io_writeCSROp_i_addr),
    .io_writeCSROp_i_data(MEM_io_writeCSROp_i_data),
    .io_loadOp_isLoad(MEM_io_loadOp_isLoad),
    .io_loadOp_addr(MEM_io_loadOp_addr),
    .io_loadOp_Width(MEM_io_loadOp_Width),
    .io_loadOp_sign(MEM_io_loadOp_sign),
    .io_storeOp_en(MEM_io_storeOp_en),
    .io_storeOp_addr(MEM_io_storeOp_addr),
    .io_storeOp_data(MEM_io_storeOp_data),
    .io_storeOp_Width(MEM_io_storeOp_Width),
    .io_exception_i_cause(MEM_io_exception_i_cause),
    .io_exception_i_pc(MEM_io_exception_i_pc),
    .io_exception_i_xtval(MEM_io_exception_i_xtval),
    .io_exception_i_happen(MEM_io_exception_i_happen),
    .io_exception_i_new_pc(MEM_io_exception_i_new_pc),
    .io_rf_fwd_addr(MEM_io_rf_fwd_addr),
    .io_rf_fwd_data(MEM_io_rf_fwd_data),
    .io_csr_fwd_addr(MEM_io_csr_fwd_addr),
    .io_csr_fwd_data(MEM_io_csr_fwd_data),
    .io_writeRfOp_o_en(MEM_io_writeRfOp_o_en),
    .io_writeRfOp_o_data(MEM_io_writeRfOp_o_data),
    .io_writeRfOp_o_addr(MEM_io_writeRfOp_o_addr),
    .io_writeCSROp_o_en(MEM_io_writeCSROp_o_en),
    .io_writeCSROp_o_addr(MEM_io_writeCSROp_o_addr),
    .io_writeCSROp_o_data(MEM_io_writeCSROp_o_data),
    .io_exception_o_cause(MEM_io_exception_o_cause),
    .io_exception_o_pc(MEM_io_exception_o_pc),
    .io_exception_o_xtval(MEM_io_exception_o_xtval),
    .io_exception_o_happen(MEM_io_exception_o_happen),
    .io_exception_o_new_pc(MEM_io_exception_o_new_pc)
  );
  Mem_Wb MEM_WB ( // @[Top.scala 26:29]
    .clock(MEM_WB_clock),
    .reset(MEM_WB_reset),
    .io_stall(MEM_WB_io_stall),
    .io_flush(MEM_WB_io_flush),
    .io_writeRfOp_i_en(MEM_WB_io_writeRfOp_i_en),
    .io_writeRfOp_i_data(MEM_WB_io_writeRfOp_i_data),
    .io_writeRfOp_i_addr(MEM_WB_io_writeRfOp_i_addr),
    .io_writeCSROp_i_en(MEM_WB_io_writeCSROp_i_en),
    .io_writeCSROp_i_addr(MEM_WB_io_writeCSROp_i_addr),
    .io_writeCSROp_i_data(MEM_WB_io_writeCSROp_i_data),
    .io_exception_i_cause(MEM_WB_io_exception_i_cause),
    .io_exception_i_pc(MEM_WB_io_exception_i_pc),
    .io_exception_i_xtval(MEM_WB_io_exception_i_xtval),
    .io_exception_i_happen(MEM_WB_io_exception_i_happen),
    .io_exception_i_new_pc(MEM_WB_io_exception_i_new_pc),
    .io_writeRfOp_o_en(MEM_WB_io_writeRfOp_o_en),
    .io_writeRfOp_o_data(MEM_WB_io_writeRfOp_o_data),
    .io_writeRfOp_o_addr(MEM_WB_io_writeRfOp_o_addr),
    .io_writeCSROp_o_en(MEM_WB_io_writeCSROp_o_en),
    .io_writeCSROp_o_addr(MEM_WB_io_writeCSROp_o_addr),
    .io_writeCSROp_o_data(MEM_WB_io_writeCSROp_o_data),
    .io_exception_o_cause(MEM_WB_io_exception_o_cause),
    .io_exception_o_pc(MEM_WB_io_exception_o_pc),
    .io_exception_o_xtval(MEM_WB_io_exception_o_xtval),
    .io_exception_o_happen(MEM_WB_io_exception_o_happen),
    .io_exception_o_new_pc(MEM_WB_io_exception_o_new_pc)
  );
  Wb WB ( // @[Top.scala 27:29]
    .io_writeRfOp_i_en(WB_io_writeRfOp_i_en),
    .io_writeRfOp_i_data(WB_io_writeRfOp_i_data),
    .io_writeRfOp_i_addr(WB_io_writeRfOp_i_addr),
    .io_writeCSROp_i_en(WB_io_writeCSROp_i_en),
    .io_writeCSROp_i_addr(WB_io_writeCSROp_i_addr),
    .io_writeCSROp_i_data(WB_io_writeCSROp_i_data),
    .io_exception_i_cause(WB_io_exception_i_cause),
    .io_exception_i_pc(WB_io_exception_i_pc),
    .io_exception_i_xtval(WB_io_exception_i_xtval),
    .io_exception_i_happen(WB_io_exception_i_happen),
    .io_exception_i_new_pc(WB_io_exception_i_new_pc),
    .io_writeRfOp_o_en(WB_io_writeRfOp_o_en),
    .io_writeRfOp_o_data(WB_io_writeRfOp_o_data),
    .io_writeRfOp_o_addr(WB_io_writeRfOp_o_addr),
    .io_writeCSROp_o_en(WB_io_writeCSROp_o_en),
    .io_writeCSROp_o_data(WB_io_writeCSROp_o_data),
    .io_exception_o_cause(WB_io_exception_o_cause),
    .io_exception_o_pc(WB_io_exception_o_pc),
    .io_exception_o_xtval(WB_io_exception_o_xtval),
    .io_exception_o_happen(WB_io_exception_o_happen),
    .io_rf_fwd_addr(WB_io_rf_fwd_addr),
    .io_rf_fwd_data(WB_io_rf_fwd_data),
    .io_csr_fwd_addr(WB_io_csr_fwd_addr),
    .io_csr_fwd_data(WB_io_csr_fwd_data),
    .io_if_excep_happen(WB_io_if_excep_happen),
    .io_if_excep_new_pc(WB_io_if_excep_new_pc)
  );
  Ctrl CTRL ( // @[Top.scala 28:29]
    .io_excep(CTRL_io_excep),
    .io_id_stall_req(CTRL_io_id_stall_req),
    .io_id_flush_req(CTRL_io_id_flush_req),
    .io_ex_stall_req(CTRL_io_ex_stall_req),
    .io_stall(CTRL_io_stall),
    .io_flush(CTRL_io_flush)
  );
  Div DIV ( // @[Top.scala 29:29]
    .clock(DIV_clock),
    .reset(DIV_reset),
    .io_a(DIV_io_a),
    .io_b(DIV_io_b),
    .io_start(DIV_io_start),
    .io_rem(DIV_io_rem),
    .io_quo(DIV_io_quo),
    .io_finish(DIV_io_finish)
  );
  assign io_o1 = WB_io_writeRfOp_o_data; // @[Top.scala 117:7]
  assign io_o2 = WB_io_writeCSROp_o_data[31:0]; // @[Top.scala 118:7]
  assign io_o3 = 64'h0; // @[Top.scala 119:7]
  assign io_o4 = 64'h0; // @[Top.scala 120:7]
  assign IF_clock = clock;
  assign IF_reset = reset;
  assign IF_io_stall = CTRL_io_stall[0]; // @[Top.scala 31:41]
  assign IF_io_excep_happen = WB_io_if_excep_happen; // @[Top.scala 44:25]
  assign IF_io_excep_new_pc = WB_io_if_excep_new_pc; // @[Top.scala 44:25]
  assign IF_io_branchOp_taken = ID_io_decInfo_branchOp_taken; // @[Top.scala 43:25]
  assign IF_io_branchOp_target = ID_io_decInfo_branchOp_target; // @[Top.scala 43:25]
  assign CSR_clock = clock;
  assign CSR_reset = reset;
  assign CSR_io_ID_2_CSR_addr = ID_io_ID_2_CSR_addr; // @[Top.scala 58:29]
  assign CSR_io_ID_2_CSR_wdata = ID_io_ID_2_CSR_wdata; // @[Top.scala 58:29]
  assign CSR_io_writeOp_en = WB_io_writeCSROp_o_en; // @[Top.scala 89:29]
  assign CSR_io_writeOp_data = WB_io_writeCSROp_o_data; // @[Top.scala 89:29]
  assign CSR_io_exception_cause = WB_io_exception_o_cause; // @[Top.scala 90:29]
  assign CSR_io_exception_pc = WB_io_exception_o_pc; // @[Top.scala 90:29]
  assign CSR_io_exception_xtval = WB_io_exception_o_xtval; // @[Top.scala 90:29]
  assign CSR_io_exception_happen = WB_io_exception_o_happen; // @[Top.scala 90:29]
  assign REGFILE_clock = clock;
  assign REGFILE_reset = reset;
  assign REGFILE_io_id2Rf_ReadIdx1 = ID_io_id2Rf_ReadIdx1; // @[Top.scala 55:29]
  assign REGFILE_io_id2Rf_ReadIdx2 = ID_io_id2Rf_ReadIdx2; // @[Top.scala 55:29]
  assign REGFILE_io_writeRfOp_en = WB_io_writeRfOp_o_en; // @[Top.scala 88:29]
  assign REGFILE_io_writeRfOp_data = WB_io_writeRfOp_o_data; // @[Top.scala 88:29]
  assign REGFILE_io_writeRfOp_addr = WB_io_writeRfOp_o_addr; // @[Top.scala 88:29]
  assign IF_ID_clock = clock;
  assign IF_ID_reset = reset;
  assign IF_ID_io_stall = CTRL_io_stall[1]; // @[Top.scala 32:41]
  assign IF_ID_io_flush = CTRL_io_flush[1]; // @[Top.scala 38:41]
  assign IF_ID_io_pc_i = IF_io_pc_o; // @[Top.scala 47:25]
  assign IF_ID_io_inst_i = IF_io_inst_o; // @[Top.scala 46:25]
  assign ID_io_pc = IF_ID_io_pc_o; // @[Top.scala 50:25]
  assign ID_io_inst_i = IF_ID_io_inst_o; // @[Top.scala 49:25]
  assign ID_io_rf2Id_RegData1 = REGFILE_io_rf2Id_RegData1; // @[Top.scala 56:29]
  assign ID_io_rf2Id_RegData2 = REGFILE_io_rf2Id_RegData2; // @[Top.scala 56:29]
  assign ID_io_fwd_rf_ex_addr = EX_io_rf_fwd_addr; // @[Top.scala 94:26]
  assign ID_io_fwd_rf_ex_data = EX_io_rf_fwd_data; // @[Top.scala 94:26]
  assign ID_io_fwd_rf_mem_addr = MEM_io_rf_fwd_addr; // @[Top.scala 93:26]
  assign ID_io_fwd_rf_mem_data = MEM_io_rf_fwd_data; // @[Top.scala 93:26]
  assign ID_io_fwd_rf_wb_addr = WB_io_rf_fwd_addr; // @[Top.scala 92:26]
  assign ID_io_fwd_rf_wb_data = WB_io_rf_fwd_data; // @[Top.scala 92:26]
  assign ID_io_fwd_csr_ex_addr = EX_io_csr_fwd_addr; // @[Top.scala 97:26]
  assign ID_io_fwd_csr_ex_data = EX_io_csr_fwd_data; // @[Top.scala 97:26]
  assign ID_io_fwd_csr_mem_addr = MEM_io_csr_fwd_addr; // @[Top.scala 96:26]
  assign ID_io_fwd_csr_mem_data = MEM_io_csr_fwd_data; // @[Top.scala 96:26]
  assign ID_io_fwd_csr_wb_addr = WB_io_csr_fwd_addr; // @[Top.scala 95:26]
  assign ID_io_fwd_csr_wb_data = WB_io_csr_fwd_data; // @[Top.scala 95:26]
  assign ID_io_CSR_2_ID_data = CSR_io_CSR_2_ID_data; // @[Top.scala 59:29]
  assign ID_io_CSR_2_ID_legalWrite = CSR_io_CSR_2_ID_legalWrite; // @[Top.scala 59:29]
  assign ID_io_CSR_2_ID_legalRead = CSR_io_CSR_2_ID_legalRead; // @[Top.scala 59:29]
  assign ID_io_CSR_2_ID_priv = CSR_io_CSR_2_ID_priv; // @[Top.scala 59:29]
  assign ID_io_CSR_2_ID_xtvec = CSR_io_CSR_2_ID_xtvec; // @[Top.scala 59:29]
  assign ID_io_CSR_2_ID_xepc = CSR_io_CSR_2_ID_xepc; // @[Top.scala 59:29]
  assign ID_io_prev_is_load = ID_EX_io_decInfo_o_loadOp_isLoad; // @[Top.scala 53:25]
  assign ID_io_prev_rd = ID_EX_io_decInfo_o_rd; // @[Top.scala 52:25]
  assign ID_EX_clock = clock;
  assign ID_EX_reset = reset;
  assign ID_EX_io_stall = CTRL_io_stall[2]; // @[Top.scala 33:41]
  assign ID_EX_io_flush = CTRL_io_flush[2]; // @[Top.scala 39:41]
  assign ID_EX_io_decInfo_i_oprand1 = ID_io_decInfo_oprand1; // @[Top.scala 61:29]
  assign ID_EX_io_decInfo_i_oprand2 = ID_io_decInfo_oprand2; // @[Top.scala 61:29]
  assign ID_EX_io_decInfo_i_rd = ID_io_decInfo_rd; // @[Top.scala 61:29]
  assign ID_EX_io_decInfo_i_InstType = ID_io_decInfo_InstType; // @[Top.scala 61:29]
  assign ID_EX_io_decInfo_i_aluop = ID_io_decInfo_aluop; // @[Top.scala 61:29]
  assign ID_EX_io_decInfo_i_storeOp_en = ID_io_decInfo_storeOp_en; // @[Top.scala 61:29]
  assign ID_EX_io_decInfo_i_storeOp_data = ID_io_decInfo_storeOp_data; // @[Top.scala 61:29]
  assign ID_EX_io_decInfo_i_storeOp_Width = ID_io_decInfo_storeOp_Width; // @[Top.scala 61:29]
  assign ID_EX_io_decInfo_i_loadOp_isLoad = ID_io_decInfo_loadOp_isLoad; // @[Top.scala 61:29]
  assign ID_EX_io_decInfo_i_loadOp_Width = ID_io_decInfo_loadOp_Width; // @[Top.scala 61:29]
  assign ID_EX_io_decInfo_i_loadOp_sign = ID_io_decInfo_loadOp_sign; // @[Top.scala 61:29]
  assign ID_EX_io_decInfo_i_writeCSROp_en = ID_io_decInfo_writeCSROp_en; // @[Top.scala 61:29]
  assign ID_EX_io_decInfo_i_writeCSROp_addr = ID_io_decInfo_writeCSROp_addr; // @[Top.scala 61:29]
  assign ID_EX_io_decInfo_i_writeCSROp_data = ID_io_decInfo_writeCSROp_data; // @[Top.scala 61:29]
  assign ID_EX_io_exception_i_cause = ID_io_exception_cause; // @[Top.scala 62:29]
  assign ID_EX_io_exception_i_pc = ID_io_exception_pc; // @[Top.scala 62:29]
  assign ID_EX_io_exception_i_xtval = ID_io_exception_xtval; // @[Top.scala 62:29]
  assign ID_EX_io_exception_i_happen = ID_io_exception_happen; // @[Top.scala 62:29]
  assign ID_EX_io_exception_i_new_pc = ID_io_exception_new_pc; // @[Top.scala 62:29]
  assign EX_io_decInfo_oprand1 = ID_EX_io_decInfo_o_oprand1; // @[Top.scala 65:29]
  assign EX_io_decInfo_oprand2 = ID_EX_io_decInfo_o_oprand2; // @[Top.scala 65:29]
  assign EX_io_decInfo_rd = ID_EX_io_decInfo_o_rd; // @[Top.scala 65:29]
  assign EX_io_decInfo_InstType = ID_EX_io_decInfo_o_InstType; // @[Top.scala 65:29]
  assign EX_io_decInfo_aluop = ID_EX_io_decInfo_o_aluop; // @[Top.scala 65:29]
  assign EX_io_decInfo_storeOp_en = ID_EX_io_decInfo_o_storeOp_en; // @[Top.scala 65:29]
  assign EX_io_decInfo_storeOp_data = ID_EX_io_decInfo_o_storeOp_data; // @[Top.scala 65:29]
  assign EX_io_decInfo_storeOp_Width = ID_EX_io_decInfo_o_storeOp_Width; // @[Top.scala 65:29]
  assign EX_io_decInfo_loadOp_isLoad = ID_EX_io_decInfo_o_loadOp_isLoad; // @[Top.scala 65:29]
  assign EX_io_decInfo_loadOp_Width = ID_EX_io_decInfo_o_loadOp_Width; // @[Top.scala 65:29]
  assign EX_io_decInfo_loadOp_sign = ID_EX_io_decInfo_o_loadOp_sign; // @[Top.scala 65:29]
  assign EX_io_decInfo_writeCSROp_en = ID_EX_io_decInfo_o_writeCSROp_en; // @[Top.scala 65:29]
  assign EX_io_decInfo_writeCSROp_addr = ID_EX_io_decInfo_o_writeCSROp_addr; // @[Top.scala 65:29]
  assign EX_io_decInfo_writeCSROp_data = ID_EX_io_decInfo_o_writeCSROp_data; // @[Top.scala 65:29]
  assign EX_io_divRes_quo = DIV_io_quo; // @[Top.scala 111:25]
  assign EX_io_divRes_rem = DIV_io_rem; // @[Top.scala 112:25]
  assign EX_io_divRes_finish = DIV_io_finish; // @[Top.scala 113:25]
  assign EX_io_exception_i_cause = ID_EX_io_exception_o_cause; // @[Top.scala 66:29]
  assign EX_io_exception_i_pc = ID_EX_io_exception_o_pc; // @[Top.scala 66:29]
  assign EX_io_exception_i_xtval = ID_EX_io_exception_o_xtval; // @[Top.scala 66:29]
  assign EX_io_exception_i_happen = ID_EX_io_exception_o_happen; // @[Top.scala 66:29]
  assign EX_io_exception_i_new_pc = ID_EX_io_exception_o_new_pc; // @[Top.scala 66:29]
  assign EX_MEM_clock = clock;
  assign EX_MEM_reset = reset;
  assign EX_MEM_io_stall = CTRL_io_stall[3]; // @[Top.scala 34:41]
  assign EX_MEM_io_flush = CTRL_io_flush[3]; // @[Top.scala 40:41]
  assign EX_MEM_io_loadOp_i_isLoad = EX_io_loadOp_isLoad; // @[Top.scala 70:29]
  assign EX_MEM_io_loadOp_i_addr = EX_io_loadOp_addr; // @[Top.scala 70:29]
  assign EX_MEM_io_loadOp_i_Width = EX_io_loadOp_Width; // @[Top.scala 70:29]
  assign EX_MEM_io_loadOp_i_sign = EX_io_loadOp_sign; // @[Top.scala 70:29]
  assign EX_MEM_io_storeOp_i_en = EX_io_storeOp_en; // @[Top.scala 68:29]
  assign EX_MEM_io_storeOp_i_addr = EX_io_storeOp_addr; // @[Top.scala 68:29]
  assign EX_MEM_io_storeOp_i_data = EX_io_storeOp_data; // @[Top.scala 68:29]
  assign EX_MEM_io_storeOp_i_Width = EX_io_storeOp_Width; // @[Top.scala 68:29]
  assign EX_MEM_io_writeRfOp_i_en = EX_io_writeRfOp_en; // @[Top.scala 69:29]
  assign EX_MEM_io_writeRfOp_i_data = EX_io_writeRfOp_data; // @[Top.scala 69:29]
  assign EX_MEM_io_writeRfOp_i_addr = EX_io_writeRfOp_addr; // @[Top.scala 69:29]
  assign EX_MEM_io_writeCSROp_i_en = EX_io_writeCSROp_en; // @[Top.scala 71:29]
  assign EX_MEM_io_writeCSROp_i_addr = EX_io_writeCSROp_addr; // @[Top.scala 71:29]
  assign EX_MEM_io_writeCSROp_i_data = EX_io_writeCSROp_data; // @[Top.scala 71:29]
  assign EX_MEM_io_exception_i_cause = EX_io_exception_o_cause; // @[Top.scala 72:29]
  assign EX_MEM_io_exception_i_pc = EX_io_exception_o_pc; // @[Top.scala 72:29]
  assign EX_MEM_io_exception_i_xtval = EX_io_exception_o_xtval; // @[Top.scala 72:29]
  assign EX_MEM_io_exception_i_happen = EX_io_exception_o_happen; // @[Top.scala 72:29]
  assign EX_MEM_io_exception_i_new_pc = EX_io_exception_o_new_pc; // @[Top.scala 72:29]
  assign MEM_clock = clock;
  assign MEM_io_writeRfOp_i_en = EX_MEM_io_writeRfOp_o_en; // @[Top.scala 76:29]
  assign MEM_io_writeRfOp_i_data = EX_MEM_io_writeRfOp_o_data; // @[Top.scala 76:29]
  assign MEM_io_writeRfOp_i_addr = EX_MEM_io_writeRfOp_o_addr; // @[Top.scala 76:29]
  assign MEM_io_writeCSROp_i_en = EX_MEM_io_writeCSROp_o_en; // @[Top.scala 77:29]
  assign MEM_io_writeCSROp_i_addr = EX_MEM_io_writeCSROp_o_addr; // @[Top.scala 77:29]
  assign MEM_io_writeCSROp_i_data = EX_MEM_io_writeCSROp_o_data; // @[Top.scala 77:29]
  assign MEM_io_loadOp_isLoad = EX_MEM_io_loadOp_o_isLoad; // @[Top.scala 74:29]
  assign MEM_io_loadOp_addr = EX_MEM_io_loadOp_o_addr; // @[Top.scala 74:29]
  assign MEM_io_loadOp_Width = EX_MEM_io_loadOp_o_Width; // @[Top.scala 74:29]
  assign MEM_io_loadOp_sign = EX_MEM_io_loadOp_o_sign; // @[Top.scala 74:29]
  assign MEM_io_storeOp_en = EX_MEM_io_storeOp_o_en; // @[Top.scala 75:29]
  assign MEM_io_storeOp_addr = EX_MEM_io_storeOp_o_addr; // @[Top.scala 75:29]
  assign MEM_io_storeOp_data = EX_MEM_io_storeOp_o_data; // @[Top.scala 75:29]
  assign MEM_io_storeOp_Width = EX_MEM_io_storeOp_o_Width; // @[Top.scala 75:29]
  assign MEM_io_exception_i_cause = EX_MEM_io_exception_o_cause; // @[Top.scala 78:29]
  assign MEM_io_exception_i_pc = EX_MEM_io_exception_o_pc; // @[Top.scala 78:29]
  assign MEM_io_exception_i_xtval = EX_MEM_io_exception_o_xtval; // @[Top.scala 78:29]
  assign MEM_io_exception_i_happen = EX_MEM_io_exception_o_happen; // @[Top.scala 78:29]
  assign MEM_io_exception_i_new_pc = EX_MEM_io_exception_o_new_pc; // @[Top.scala 78:29]
  assign MEM_WB_clock = clock;
  assign MEM_WB_reset = reset;
  assign MEM_WB_io_stall = CTRL_io_stall[4]; // @[Top.scala 35:41]
  assign MEM_WB_io_flush = CTRL_io_flush[4]; // @[Top.scala 41:41]
  assign MEM_WB_io_writeRfOp_i_en = MEM_io_writeRfOp_o_en; // @[Top.scala 80:29]
  assign MEM_WB_io_writeRfOp_i_data = MEM_io_writeRfOp_o_data; // @[Top.scala 80:29]
  assign MEM_WB_io_writeRfOp_i_addr = MEM_io_writeRfOp_o_addr; // @[Top.scala 80:29]
  assign MEM_WB_io_writeCSROp_i_en = MEM_io_writeCSROp_o_en; // @[Top.scala 81:29]
  assign MEM_WB_io_writeCSROp_i_addr = MEM_io_writeCSROp_o_addr; // @[Top.scala 81:29]
  assign MEM_WB_io_writeCSROp_i_data = MEM_io_writeCSROp_o_data; // @[Top.scala 81:29]
  assign MEM_WB_io_exception_i_cause = MEM_io_exception_o_cause; // @[Top.scala 82:29]
  assign MEM_WB_io_exception_i_pc = MEM_io_exception_o_pc; // @[Top.scala 82:29]
  assign MEM_WB_io_exception_i_xtval = MEM_io_exception_o_xtval; // @[Top.scala 82:29]
  assign MEM_WB_io_exception_i_happen = MEM_io_exception_o_happen; // @[Top.scala 82:29]
  assign MEM_WB_io_exception_i_new_pc = MEM_io_exception_o_new_pc; // @[Top.scala 82:29]
  assign WB_io_writeRfOp_i_en = MEM_WB_io_writeRfOp_o_en; // @[Top.scala 84:29]
  assign WB_io_writeRfOp_i_data = MEM_WB_io_writeRfOp_o_data; // @[Top.scala 84:29]
  assign WB_io_writeRfOp_i_addr = MEM_WB_io_writeRfOp_o_addr; // @[Top.scala 84:29]
  assign WB_io_writeCSROp_i_en = MEM_WB_io_writeCSROp_o_en; // @[Top.scala 85:29]
  assign WB_io_writeCSROp_i_addr = MEM_WB_io_writeCSROp_o_addr; // @[Top.scala 85:29]
  assign WB_io_writeCSROp_i_data = MEM_WB_io_writeCSROp_o_data; // @[Top.scala 85:29]
  assign WB_io_exception_i_cause = MEM_WB_io_exception_o_cause; // @[Top.scala 86:29]
  assign WB_io_exception_i_pc = MEM_WB_io_exception_o_pc; // @[Top.scala 86:29]
  assign WB_io_exception_i_xtval = MEM_WB_io_exception_o_xtval; // @[Top.scala 86:29]
  assign WB_io_exception_i_happen = MEM_WB_io_exception_o_happen; // @[Top.scala 86:29]
  assign WB_io_exception_i_new_pc = MEM_WB_io_exception_o_new_pc; // @[Top.scala 86:29]
  assign CTRL_io_excep = WB_io_exception_o_happen; // @[Top.scala 103:29]
  assign CTRL_io_id_stall_req = ID_io_stall_req; // @[Top.scala 99:29]
  assign CTRL_io_id_flush_req = ID_io_flush_req; // @[Top.scala 101:29]
  assign CTRL_io_ex_stall_req = EX_io_stall_req; // @[Top.scala 100:29]
  assign DIV_clock = clock;
  assign DIV_reset = reset;
  assign DIV_io_a = EX_io_divOP_a; // @[Top.scala 106:19]
  assign DIV_io_b = EX_io_divOP_b; // @[Top.scala 107:19]
  assign DIV_io_start = EX_io_divOP_start; // @[Top.scala 109:19]
endmodule