module BoothEncoder8(
  input  [8:0] io_data,
  output       io_neg,
  output [7:0] io_weight
);
  wire [7:0] _io_weight_tmp_T_1 = {io_data[8], 7'h0}; // @[Mult.scala 506:23]
  wire [7:0] _io_weight_tmp_T_2 = ~_io_weight_tmp_T_1; // @[Mult.scala 506:13]
  wire [7:0] _io_weight_tmp_T_4 = _io_weight_tmp_T_2 + 8'h1; // @[Mult.scala 506:29]
  wire [6:0] _io_weight_tmp_T_6 = {io_data[7], 6'h0}; // @[Mult.scala 507:22]
  wire [7:0] _GEN_0 = {{1'd0}, _io_weight_tmp_T_6}; // @[Mult.scala 506:35]
  wire [7:0] _io_weight_tmp_T_8 = _io_weight_tmp_T_4 + _GEN_0; // @[Mult.scala 506:35]
  wire [5:0] _io_weight_tmp_T_10 = {io_data[6], 5'h0}; // @[Mult.scala 508:22]
  wire [7:0] _GEN_1 = {{2'd0}, _io_weight_tmp_T_10}; // @[Mult.scala 507:28]
  wire [7:0] _io_weight_tmp_T_12 = _io_weight_tmp_T_8 + _GEN_1; // @[Mult.scala 507:28]
  wire [4:0] _io_weight_tmp_T_14 = {io_data[5], 4'h0}; // @[Mult.scala 509:22]
  wire [7:0] _GEN_2 = {{3'd0}, _io_weight_tmp_T_14}; // @[Mult.scala 508:28]
  wire [7:0] _io_weight_tmp_T_16 = _io_weight_tmp_T_12 + _GEN_2; // @[Mult.scala 508:28]
  wire [3:0] _io_weight_tmp_T_18 = {io_data[4], 3'h0}; // @[Mult.scala 510:22]
  wire [7:0] _GEN_3 = {{4'd0}, _io_weight_tmp_T_18}; // @[Mult.scala 509:28]
  wire [7:0] _io_weight_tmp_T_20 = _io_weight_tmp_T_16 + _GEN_3; // @[Mult.scala 509:28]
  wire [2:0] _io_weight_tmp_T_22 = {io_data[3], 2'h0}; // @[Mult.scala 511:22]
  wire [7:0] _GEN_4 = {{5'd0}, _io_weight_tmp_T_22}; // @[Mult.scala 510:28]
  wire [7:0] _io_weight_tmp_T_24 = _io_weight_tmp_T_20 + _GEN_4; // @[Mult.scala 510:28]
  wire [1:0] _io_weight_tmp_T_26 = {io_data[2], 1'h0}; // @[Mult.scala 512:22]
  wire [7:0] _GEN_5 = {{6'd0}, _io_weight_tmp_T_26}; // @[Mult.scala 511:28]
  wire [7:0] _io_weight_tmp_T_28 = _io_weight_tmp_T_24 + _GEN_5; // @[Mult.scala 511:28]
  wire [7:0] _GEN_6 = {{7'd0}, io_data[1]}; // @[Mult.scala 512:28]
  wire [7:0] _io_weight_tmp_T_31 = _io_weight_tmp_T_28 + _GEN_6; // @[Mult.scala 512:28]
  wire [7:0] _GEN_7 = {{7'd0}, io_data[0]}; // @[Mult.scala 513:21]
  wire [7:0] io_weight_tmp = _io_weight_tmp_T_31 + _GEN_7; // @[Mult.scala 513:21]
  wire [8:0] _GEN_8 = {{1'd0}, io_weight_tmp}; // @[Mult.scala 514:31]
  wire [8:0] _io_weight_T_2 = 9'h100 - _GEN_8; // @[Mult.scala 514:31]
  wire [8:0] _io_weight_T_3 = io_data[8] ? _io_weight_T_2 : {{1'd0}, io_weight_tmp}; // @[Mult.scala 514:12]
  assign io_neg = io_data[8]; // @[Mult.scala 524:29]
  assign io_weight = _io_weight_T_3[7:0]; // @[Mult.scala 523:15]
endmodule
module Csa(
  input  [127:0] io_a,
  input  [127:0] io_b,
  input  [127:0] io_c,
  output [127:0] io_carry,
  output [127:0] io_temp_sum
);
  wire [127:0] _io_carry_T = io_a & io_b; // @[Mult.scala 475:24]
  wire [127:0] _io_carry_T_1 = io_a & io_c; // @[Mult.scala 475:40]
  wire [127:0] _io_carry_T_2 = _io_carry_T | _io_carry_T_1; // @[Mult.scala 475:32]
  wire [127:0] _io_carry_T_3 = io_b & io_c; // @[Mult.scala 475:56]
  wire [127:0] _io_carry_T_4 = _io_carry_T_2 | _io_carry_T_3; // @[Mult.scala 475:48]
  wire [128:0] _io_carry_T_5 = {_io_carry_T_4, 1'h0}; // @[Mult.scala 475:65]
  wire [127:0] _io_temp_sum_T = io_a ^ io_b; // @[Mult.scala 476:25]
  assign io_carry = _io_carry_T_5[127:0]; // @[Mult.scala 475:14]
  assign io_temp_sum = _io_temp_sum_T ^ io_c; // @[Mult.scala 476:32]
endmodule
module BoothEncoder2(
  input  [2:0] io_data,
  output [1:0] io_weight,
  output       io_neg
);
  wire [1:0] _io_weight_tmp_T_1 = io_data[2] ? 2'h2 : 2'h0; // @[Mult.scala 530:21]
  wire [1:0] _GEN_0 = {{1'd0}, io_data[1]}; // @[Mult.scala 530:47]
  wire [1:0] _io_weight_tmp_T_4 = _io_weight_tmp_T_1 + _GEN_0; // @[Mult.scala 530:47]
  wire [1:0] _GEN_1 = {{1'd0}, io_data[0]}; // @[Mult.scala 530:57]
  wire [1:0] io_weight_tmp = _io_weight_tmp_T_4 + _GEN_1; // @[Mult.scala 530:57]
  wire [2:0] _GEN_2 = {{1'd0}, io_weight_tmp}; // @[Mult.scala 531:29]
  wire [2:0] _io_weight_T_2 = 3'h4 - _GEN_2; // @[Mult.scala 531:29]
  wire [2:0] _io_weight_T_3 = io_data[2] ? _io_weight_T_2 : {{1'd0}, io_weight_tmp}; // @[Mult.scala 531:12]
  assign io_weight = _io_weight_T_3[1:0]; // @[Mult.scala 538:15]
  assign io_neg = io_data[2]; // @[Mult.scala 539:25]
endmodule
module Ppg2(
  input  [1:0]   io_weight,
  input          io_neg,
  input  [127:0] io_data,
  output [127:0] io_output
);
  wire [127:0] _tmp_T = ~io_data; // @[Mult.scala 550:29]
  wire [127:0] _tmp_T_2 = _tmp_T + 128'h1; // @[Mult.scala 550:38]
  wire [127:0] tmp = io_neg ? _tmp_T_2 : io_data; // @[Mult.scala 550:20]
  wire [128:0] _res_T = {tmp,1'h0}; // @[Cat.scala 31:58]
  wire [127:0] _res_T_4 = 2'h1 == io_weight ? tmp : 128'h0; // @[Mux.scala 81:58]
  wire [128:0] res = 2'h2 == io_weight ? _res_T : {{1'd0}, _res_T_4}; // @[Mux.scala 81:58]
  assign io_output = res[127:0]; // @[Mult.scala 556:15]
endmodule
module Mult(
  input          clock,
  input          reset,
  input  [63:0]  io_a,
  input  [63:0]  io_b,
  input          io_sign,
  output [127:0] io_result,
  output [127:0] io_unsigned,
  output [127:0] io_signed
);
  wire [8:0] be8_0_io_data; // @[Mult.scala 30:23]
  wire  be8_0_io_neg; // @[Mult.scala 30:23]
  wire [7:0] be8_0_io_weight; // @[Mult.scala 30:23]
  wire [8:0] be8_1_io_data; // @[Mult.scala 31:23]
  wire  be8_1_io_neg; // @[Mult.scala 31:23]
  wire [7:0] be8_1_io_weight; // @[Mult.scala 31:23]
  wire [8:0] be8_2_io_data; // @[Mult.scala 32:23]
  wire  be8_2_io_neg; // @[Mult.scala 32:23]
  wire [7:0] be8_2_io_weight; // @[Mult.scala 32:23]
  wire [8:0] be8_3_io_data; // @[Mult.scala 33:23]
  wire  be8_3_io_neg; // @[Mult.scala 33:23]
  wire [7:0] be8_3_io_weight; // @[Mult.scala 33:23]
  wire [8:0] be8_4_io_data; // @[Mult.scala 34:23]
  wire  be8_4_io_neg; // @[Mult.scala 34:23]
  wire [7:0] be8_4_io_weight; // @[Mult.scala 34:23]
  wire [8:0] be8_5_io_data; // @[Mult.scala 35:23]
  wire  be8_5_io_neg; // @[Mult.scala 35:23]
  wire [7:0] be8_5_io_weight; // @[Mult.scala 35:23]
  wire [8:0] be8_6_io_data; // @[Mult.scala 36:23]
  wire  be8_6_io_neg; // @[Mult.scala 36:23]
  wire [7:0] be8_6_io_weight; // @[Mult.scala 36:23]
  wire [8:0] be8_7_io_data; // @[Mult.scala 37:23]
  wire  be8_7_io_neg; // @[Mult.scala 37:23]
  wire [7:0] be8_7_io_weight; // @[Mult.scala 37:23]
  wire [127:0] csa0_io_a; // @[Mult.scala 39:22]
  wire [127:0] csa0_io_b; // @[Mult.scala 39:22]
  wire [127:0] csa0_io_c; // @[Mult.scala 39:22]
  wire [127:0] csa0_io_carry; // @[Mult.scala 39:22]
  wire [127:0] csa0_io_temp_sum; // @[Mult.scala 39:22]
  wire [127:0] csa1_io_a; // @[Mult.scala 40:22]
  wire [127:0] csa1_io_b; // @[Mult.scala 40:22]
  wire [127:0] csa1_io_c; // @[Mult.scala 40:22]
  wire [127:0] csa1_io_carry; // @[Mult.scala 40:22]
  wire [127:0] csa1_io_temp_sum; // @[Mult.scala 40:22]
  wire [127:0] csa2_io_a; // @[Mult.scala 41:22]
  wire [127:0] csa2_io_b; // @[Mult.scala 41:22]
  wire [127:0] csa2_io_c; // @[Mult.scala 41:22]
  wire [127:0] csa2_io_carry; // @[Mult.scala 41:22]
  wire [127:0] csa2_io_temp_sum; // @[Mult.scala 41:22]
  wire [127:0] csa3_io_a; // @[Mult.scala 42:22]
  wire [127:0] csa3_io_b; // @[Mult.scala 42:22]
  wire [127:0] csa3_io_c; // @[Mult.scala 42:22]
  wire [127:0] csa3_io_carry; // @[Mult.scala 42:22]
  wire [127:0] csa3_io_temp_sum; // @[Mult.scala 42:22]
  wire [127:0] csa4_io_a; // @[Mult.scala 43:22]
  wire [127:0] csa4_io_b; // @[Mult.scala 43:22]
  wire [127:0] csa4_io_c; // @[Mult.scala 43:22]
  wire [127:0] csa4_io_carry; // @[Mult.scala 43:22]
  wire [127:0] csa4_io_temp_sum; // @[Mult.scala 43:22]
  wire [127:0] csa5_io_a; // @[Mult.scala 44:22]
  wire [127:0] csa5_io_b; // @[Mult.scala 44:22]
  wire [127:0] csa5_io_c; // @[Mult.scala 44:22]
  wire [127:0] csa5_io_carry; // @[Mult.scala 44:22]
  wire [127:0] csa5_io_temp_sum; // @[Mult.scala 44:22]
  wire [2:0] be2_0_0_io_data; // @[Mult.scala 73:25]
  wire [1:0] be2_0_0_io_weight; // @[Mult.scala 73:25]
  wire  be2_0_0_io_neg; // @[Mult.scala 73:25]
  wire [2:0] be2_0_1_io_data; // @[Mult.scala 74:25]
  wire [1:0] be2_0_1_io_weight; // @[Mult.scala 74:25]
  wire  be2_0_1_io_neg; // @[Mult.scala 74:25]
  wire [2:0] be2_0_2_io_data; // @[Mult.scala 75:25]
  wire [1:0] be2_0_2_io_weight; // @[Mult.scala 75:25]
  wire  be2_0_2_io_neg; // @[Mult.scala 75:25]
  wire [2:0] be2_0_3_io_data; // @[Mult.scala 76:25]
  wire [1:0] be2_0_3_io_weight; // @[Mult.scala 76:25]
  wire  be2_0_3_io_neg; // @[Mult.scala 76:25]
  wire [1:0] ppg2_0_0_io_weight; // @[Mult.scala 77:27]
  wire  ppg2_0_0_io_neg; // @[Mult.scala 77:27]
  wire [127:0] ppg2_0_0_io_data; // @[Mult.scala 77:27]
  wire [127:0] ppg2_0_0_io_output; // @[Mult.scala 77:27]
  wire [1:0] ppg2_0_1_io_weight; // @[Mult.scala 78:27]
  wire  ppg2_0_1_io_neg; // @[Mult.scala 78:27]
  wire [127:0] ppg2_0_1_io_data; // @[Mult.scala 78:27]
  wire [127:0] ppg2_0_1_io_output; // @[Mult.scala 78:27]
  wire [1:0] ppg2_0_2_io_weight; // @[Mult.scala 79:27]
  wire  ppg2_0_2_io_neg; // @[Mult.scala 79:27]
  wire [127:0] ppg2_0_2_io_data; // @[Mult.scala 79:27]
  wire [127:0] ppg2_0_2_io_output; // @[Mult.scala 79:27]
  wire [1:0] ppg2_0_3_io_weight; // @[Mult.scala 80:27]
  wire  ppg2_0_3_io_neg; // @[Mult.scala 80:27]
  wire [127:0] ppg2_0_3_io_data; // @[Mult.scala 80:27]
  wire [127:0] ppg2_0_3_io_output; // @[Mult.scala 80:27]
  wire [127:0] csa0_0_io_a; // @[Mult.scala 81:27]
  wire [127:0] csa0_0_io_b; // @[Mult.scala 81:27]
  wire [127:0] csa0_0_io_c; // @[Mult.scala 81:27]
  wire [127:0] csa0_0_io_carry; // @[Mult.scala 81:27]
  wire [127:0] csa0_0_io_temp_sum; // @[Mult.scala 81:27]
  wire [127:0] csa0_1_io_a; // @[Mult.scala 82:27]
  wire [127:0] csa0_1_io_b; // @[Mult.scala 82:27]
  wire [127:0] csa0_1_io_c; // @[Mult.scala 82:27]
  wire [127:0] csa0_1_io_carry; // @[Mult.scala 82:27]
  wire [127:0] csa0_1_io_temp_sum; // @[Mult.scala 82:27]
  wire [2:0] be2_1_0_io_data; // @[Mult.scala 84:25]
  wire [1:0] be2_1_0_io_weight; // @[Mult.scala 84:25]
  wire  be2_1_0_io_neg; // @[Mult.scala 84:25]
  wire [2:0] be2_1_1_io_data; // @[Mult.scala 85:25]
  wire [1:0] be2_1_1_io_weight; // @[Mult.scala 85:25]
  wire  be2_1_1_io_neg; // @[Mult.scala 85:25]
  wire [2:0] be2_1_2_io_data; // @[Mult.scala 86:25]
  wire [1:0] be2_1_2_io_weight; // @[Mult.scala 86:25]
  wire  be2_1_2_io_neg; // @[Mult.scala 86:25]
  wire [2:0] be2_1_3_io_data; // @[Mult.scala 87:25]
  wire [1:0] be2_1_3_io_weight; // @[Mult.scala 87:25]
  wire  be2_1_3_io_neg; // @[Mult.scala 87:25]
  wire [1:0] ppg2_1_0_io_weight; // @[Mult.scala 88:27]
  wire  ppg2_1_0_io_neg; // @[Mult.scala 88:27]
  wire [127:0] ppg2_1_0_io_data; // @[Mult.scala 88:27]
  wire [127:0] ppg2_1_0_io_output; // @[Mult.scala 88:27]
  wire [1:0] ppg2_1_1_io_weight; // @[Mult.scala 89:27]
  wire  ppg2_1_1_io_neg; // @[Mult.scala 89:27]
  wire [127:0] ppg2_1_1_io_data; // @[Mult.scala 89:27]
  wire [127:0] ppg2_1_1_io_output; // @[Mult.scala 89:27]
  wire [1:0] ppg2_1_2_io_weight; // @[Mult.scala 90:27]
  wire  ppg2_1_2_io_neg; // @[Mult.scala 90:27]
  wire [127:0] ppg2_1_2_io_data; // @[Mult.scala 90:27]
  wire [127:0] ppg2_1_2_io_output; // @[Mult.scala 90:27]
  wire [1:0] ppg2_1_3_io_weight; // @[Mult.scala 91:27]
  wire  ppg2_1_3_io_neg; // @[Mult.scala 91:27]
  wire [127:0] ppg2_1_3_io_data; // @[Mult.scala 91:27]
  wire [127:0] ppg2_1_3_io_output; // @[Mult.scala 91:27]
  wire [127:0] csa1_0_io_a; // @[Mult.scala 92:27]
  wire [127:0] csa1_0_io_b; // @[Mult.scala 92:27]
  wire [127:0] csa1_0_io_c; // @[Mult.scala 92:27]
  wire [127:0] csa1_0_io_carry; // @[Mult.scala 92:27]
  wire [127:0] csa1_0_io_temp_sum; // @[Mult.scala 92:27]
  wire [127:0] csa1_1_io_a; // @[Mult.scala 93:27]
  wire [127:0] csa1_1_io_b; // @[Mult.scala 93:27]
  wire [127:0] csa1_1_io_c; // @[Mult.scala 93:27]
  wire [127:0] csa1_1_io_carry; // @[Mult.scala 93:27]
  wire [127:0] csa1_1_io_temp_sum; // @[Mult.scala 93:27]
  wire [2:0] be2_2_0_io_data; // @[Mult.scala 95:25]
  wire [1:0] be2_2_0_io_weight; // @[Mult.scala 95:25]
  wire  be2_2_0_io_neg; // @[Mult.scala 95:25]
  wire [2:0] be2_2_1_io_data; // @[Mult.scala 96:25]
  wire [1:0] be2_2_1_io_weight; // @[Mult.scala 96:25]
  wire  be2_2_1_io_neg; // @[Mult.scala 96:25]
  wire [2:0] be2_2_2_io_data; // @[Mult.scala 97:25]
  wire [1:0] be2_2_2_io_weight; // @[Mult.scala 97:25]
  wire  be2_2_2_io_neg; // @[Mult.scala 97:25]
  wire [2:0] be2_2_3_io_data; // @[Mult.scala 98:25]
  wire [1:0] be2_2_3_io_weight; // @[Mult.scala 98:25]
  wire  be2_2_3_io_neg; // @[Mult.scala 98:25]
  wire [1:0] ppg2_2_0_io_weight; // @[Mult.scala 99:27]
  wire  ppg2_2_0_io_neg; // @[Mult.scala 99:27]
  wire [127:0] ppg2_2_0_io_data; // @[Mult.scala 99:27]
  wire [127:0] ppg2_2_0_io_output; // @[Mult.scala 99:27]
  wire [1:0] ppg2_2_1_io_weight; // @[Mult.scala 100:27]
  wire  ppg2_2_1_io_neg; // @[Mult.scala 100:27]
  wire [127:0] ppg2_2_1_io_data; // @[Mult.scala 100:27]
  wire [127:0] ppg2_2_1_io_output; // @[Mult.scala 100:27]
  wire [1:0] ppg2_2_2_io_weight; // @[Mult.scala 101:27]
  wire  ppg2_2_2_io_neg; // @[Mult.scala 101:27]
  wire [127:0] ppg2_2_2_io_data; // @[Mult.scala 101:27]
  wire [127:0] ppg2_2_2_io_output; // @[Mult.scala 101:27]
  wire [1:0] ppg2_2_3_io_weight; // @[Mult.scala 102:27]
  wire  ppg2_2_3_io_neg; // @[Mult.scala 102:27]
  wire [127:0] ppg2_2_3_io_data; // @[Mult.scala 102:27]
  wire [127:0] ppg2_2_3_io_output; // @[Mult.scala 102:27]
  wire [127:0] csa2_0_io_a; // @[Mult.scala 103:27]
  wire [127:0] csa2_0_io_b; // @[Mult.scala 103:27]
  wire [127:0] csa2_0_io_c; // @[Mult.scala 103:27]
  wire [127:0] csa2_0_io_carry; // @[Mult.scala 103:27]
  wire [127:0] csa2_0_io_temp_sum; // @[Mult.scala 103:27]
  wire [127:0] csa2_1_io_a; // @[Mult.scala 104:27]
  wire [127:0] csa2_1_io_b; // @[Mult.scala 104:27]
  wire [127:0] csa2_1_io_c; // @[Mult.scala 104:27]
  wire [127:0] csa2_1_io_carry; // @[Mult.scala 104:27]
  wire [127:0] csa2_1_io_temp_sum; // @[Mult.scala 104:27]
  wire [2:0] be2_3_0_io_data; // @[Mult.scala 106:25]
  wire [1:0] be2_3_0_io_weight; // @[Mult.scala 106:25]
  wire  be2_3_0_io_neg; // @[Mult.scala 106:25]
  wire [2:0] be2_3_1_io_data; // @[Mult.scala 107:25]
  wire [1:0] be2_3_1_io_weight; // @[Mult.scala 107:25]
  wire  be2_3_1_io_neg; // @[Mult.scala 107:25]
  wire [2:0] be2_3_2_io_data; // @[Mult.scala 108:25]
  wire [1:0] be2_3_2_io_weight; // @[Mult.scala 108:25]
  wire  be2_3_2_io_neg; // @[Mult.scala 108:25]
  wire [2:0] be2_3_3_io_data; // @[Mult.scala 109:25]
  wire [1:0] be2_3_3_io_weight; // @[Mult.scala 109:25]
  wire  be2_3_3_io_neg; // @[Mult.scala 109:25]
  wire [1:0] ppg2_3_0_io_weight; // @[Mult.scala 110:27]
  wire  ppg2_3_0_io_neg; // @[Mult.scala 110:27]
  wire [127:0] ppg2_3_0_io_data; // @[Mult.scala 110:27]
  wire [127:0] ppg2_3_0_io_output; // @[Mult.scala 110:27]
  wire [1:0] ppg2_3_1_io_weight; // @[Mult.scala 111:27]
  wire  ppg2_3_1_io_neg; // @[Mult.scala 111:27]
  wire [127:0] ppg2_3_1_io_data; // @[Mult.scala 111:27]
  wire [127:0] ppg2_3_1_io_output; // @[Mult.scala 111:27]
  wire [1:0] ppg2_3_2_io_weight; // @[Mult.scala 112:27]
  wire  ppg2_3_2_io_neg; // @[Mult.scala 112:27]
  wire [127:0] ppg2_3_2_io_data; // @[Mult.scala 112:27]
  wire [127:0] ppg2_3_2_io_output; // @[Mult.scala 112:27]
  wire [1:0] ppg2_3_3_io_weight; // @[Mult.scala 113:27]
  wire  ppg2_3_3_io_neg; // @[Mult.scala 113:27]
  wire [127:0] ppg2_3_3_io_data; // @[Mult.scala 113:27]
  wire [127:0] ppg2_3_3_io_output; // @[Mult.scala 113:27]
  wire [127:0] csa3_0_io_a; // @[Mult.scala 114:27]
  wire [127:0] csa3_0_io_b; // @[Mult.scala 114:27]
  wire [127:0] csa3_0_io_c; // @[Mult.scala 114:27]
  wire [127:0] csa3_0_io_carry; // @[Mult.scala 114:27]
  wire [127:0] csa3_0_io_temp_sum; // @[Mult.scala 114:27]
  wire [127:0] csa3_1_io_a; // @[Mult.scala 115:27]
  wire [127:0] csa3_1_io_b; // @[Mult.scala 115:27]
  wire [127:0] csa3_1_io_c; // @[Mult.scala 115:27]
  wire [127:0] csa3_1_io_carry; // @[Mult.scala 115:27]
  wire [127:0] csa3_1_io_temp_sum; // @[Mult.scala 115:27]
  wire [2:0] be2_4_0_io_data; // @[Mult.scala 117:25]
  wire [1:0] be2_4_0_io_weight; // @[Mult.scala 117:25]
  wire  be2_4_0_io_neg; // @[Mult.scala 117:25]
  wire [2:0] be2_4_1_io_data; // @[Mult.scala 118:25]
  wire [1:0] be2_4_1_io_weight; // @[Mult.scala 118:25]
  wire  be2_4_1_io_neg; // @[Mult.scala 118:25]
  wire [2:0] be2_4_2_io_data; // @[Mult.scala 119:25]
  wire [1:0] be2_4_2_io_weight; // @[Mult.scala 119:25]
  wire  be2_4_2_io_neg; // @[Mult.scala 119:25]
  wire [2:0] be2_4_3_io_data; // @[Mult.scala 120:25]
  wire [1:0] be2_4_3_io_weight; // @[Mult.scala 120:25]
  wire  be2_4_3_io_neg; // @[Mult.scala 120:25]
  wire [1:0] ppg2_4_0_io_weight; // @[Mult.scala 121:27]
  wire  ppg2_4_0_io_neg; // @[Mult.scala 121:27]
  wire [127:0] ppg2_4_0_io_data; // @[Mult.scala 121:27]
  wire [127:0] ppg2_4_0_io_output; // @[Mult.scala 121:27]
  wire [1:0] ppg2_4_1_io_weight; // @[Mult.scala 122:27]
  wire  ppg2_4_1_io_neg; // @[Mult.scala 122:27]
  wire [127:0] ppg2_4_1_io_data; // @[Mult.scala 122:27]
  wire [127:0] ppg2_4_1_io_output; // @[Mult.scala 122:27]
  wire [1:0] ppg2_4_2_io_weight; // @[Mult.scala 123:27]
  wire  ppg2_4_2_io_neg; // @[Mult.scala 123:27]
  wire [127:0] ppg2_4_2_io_data; // @[Mult.scala 123:27]
  wire [127:0] ppg2_4_2_io_output; // @[Mult.scala 123:27]
  wire [1:0] ppg2_4_3_io_weight; // @[Mult.scala 124:27]
  wire  ppg2_4_3_io_neg; // @[Mult.scala 124:27]
  wire [127:0] ppg2_4_3_io_data; // @[Mult.scala 124:27]
  wire [127:0] ppg2_4_3_io_output; // @[Mult.scala 124:27]
  wire [127:0] csa4_0_io_a; // @[Mult.scala 125:27]
  wire [127:0] csa4_0_io_b; // @[Mult.scala 125:27]
  wire [127:0] csa4_0_io_c; // @[Mult.scala 125:27]
  wire [127:0] csa4_0_io_carry; // @[Mult.scala 125:27]
  wire [127:0] csa4_0_io_temp_sum; // @[Mult.scala 125:27]
  wire [127:0] csa4_1_io_a; // @[Mult.scala 126:27]
  wire [127:0] csa4_1_io_b; // @[Mult.scala 126:27]
  wire [127:0] csa4_1_io_c; // @[Mult.scala 126:27]
  wire [127:0] csa4_1_io_carry; // @[Mult.scala 126:27]
  wire [127:0] csa4_1_io_temp_sum; // @[Mult.scala 126:27]
  wire [2:0] be2_5_0_io_data; // @[Mult.scala 128:25]
  wire [1:0] be2_5_0_io_weight; // @[Mult.scala 128:25]
  wire  be2_5_0_io_neg; // @[Mult.scala 128:25]
  wire [2:0] be2_5_1_io_data; // @[Mult.scala 129:25]
  wire [1:0] be2_5_1_io_weight; // @[Mult.scala 129:25]
  wire  be2_5_1_io_neg; // @[Mult.scala 129:25]
  wire [2:0] be2_5_2_io_data; // @[Mult.scala 130:25]
  wire [1:0] be2_5_2_io_weight; // @[Mult.scala 130:25]
  wire  be2_5_2_io_neg; // @[Mult.scala 130:25]
  wire [2:0] be2_5_3_io_data; // @[Mult.scala 131:25]
  wire [1:0] be2_5_3_io_weight; // @[Mult.scala 131:25]
  wire  be2_5_3_io_neg; // @[Mult.scala 131:25]
  wire [1:0] ppg2_5_0_io_weight; // @[Mult.scala 132:27]
  wire  ppg2_5_0_io_neg; // @[Mult.scala 132:27]
  wire [127:0] ppg2_5_0_io_data; // @[Mult.scala 132:27]
  wire [127:0] ppg2_5_0_io_output; // @[Mult.scala 132:27]
  wire [1:0] ppg2_5_1_io_weight; // @[Mult.scala 133:27]
  wire  ppg2_5_1_io_neg; // @[Mult.scala 133:27]
  wire [127:0] ppg2_5_1_io_data; // @[Mult.scala 133:27]
  wire [127:0] ppg2_5_1_io_output; // @[Mult.scala 133:27]
  wire [1:0] ppg2_5_2_io_weight; // @[Mult.scala 134:27]
  wire  ppg2_5_2_io_neg; // @[Mult.scala 134:27]
  wire [127:0] ppg2_5_2_io_data; // @[Mult.scala 134:27]
  wire [127:0] ppg2_5_2_io_output; // @[Mult.scala 134:27]
  wire [1:0] ppg2_5_3_io_weight; // @[Mult.scala 135:27]
  wire  ppg2_5_3_io_neg; // @[Mult.scala 135:27]
  wire [127:0] ppg2_5_3_io_data; // @[Mult.scala 135:27]
  wire [127:0] ppg2_5_3_io_output; // @[Mult.scala 135:27]
  wire [127:0] csa5_0_io_a; // @[Mult.scala 136:27]
  wire [127:0] csa5_0_io_b; // @[Mult.scala 136:27]
  wire [127:0] csa5_0_io_c; // @[Mult.scala 136:27]
  wire [127:0] csa5_0_io_carry; // @[Mult.scala 136:27]
  wire [127:0] csa5_0_io_temp_sum; // @[Mult.scala 136:27]
  wire [127:0] csa5_1_io_a; // @[Mult.scala 137:27]
  wire [127:0] csa5_1_io_b; // @[Mult.scala 137:27]
  wire [127:0] csa5_1_io_c; // @[Mult.scala 137:27]
  wire [127:0] csa5_1_io_carry; // @[Mult.scala 137:27]
  wire [127:0] csa5_1_io_temp_sum; // @[Mult.scala 137:27]
  wire [2:0] be2_6_0_io_data; // @[Mult.scala 139:25]
  wire [1:0] be2_6_0_io_weight; // @[Mult.scala 139:25]
  wire  be2_6_0_io_neg; // @[Mult.scala 139:25]
  wire [2:0] be2_6_1_io_data; // @[Mult.scala 140:25]
  wire [1:0] be2_6_1_io_weight; // @[Mult.scala 140:25]
  wire  be2_6_1_io_neg; // @[Mult.scala 140:25]
  wire [2:0] be2_6_2_io_data; // @[Mult.scala 141:25]
  wire [1:0] be2_6_2_io_weight; // @[Mult.scala 141:25]
  wire  be2_6_2_io_neg; // @[Mult.scala 141:25]
  wire [2:0] be2_6_3_io_data; // @[Mult.scala 142:25]
  wire [1:0] be2_6_3_io_weight; // @[Mult.scala 142:25]
  wire  be2_6_3_io_neg; // @[Mult.scala 142:25]
  wire [1:0] ppg2_6_0_io_weight; // @[Mult.scala 143:27]
  wire  ppg2_6_0_io_neg; // @[Mult.scala 143:27]
  wire [127:0] ppg2_6_0_io_data; // @[Mult.scala 143:27]
  wire [127:0] ppg2_6_0_io_output; // @[Mult.scala 143:27]
  wire [1:0] ppg2_6_1_io_weight; // @[Mult.scala 144:27]
  wire  ppg2_6_1_io_neg; // @[Mult.scala 144:27]
  wire [127:0] ppg2_6_1_io_data; // @[Mult.scala 144:27]
  wire [127:0] ppg2_6_1_io_output; // @[Mult.scala 144:27]
  wire [1:0] ppg2_6_2_io_weight; // @[Mult.scala 145:27]
  wire  ppg2_6_2_io_neg; // @[Mult.scala 145:27]
  wire [127:0] ppg2_6_2_io_data; // @[Mult.scala 145:27]
  wire [127:0] ppg2_6_2_io_output; // @[Mult.scala 145:27]
  wire [1:0] ppg2_6_3_io_weight; // @[Mult.scala 146:27]
  wire  ppg2_6_3_io_neg; // @[Mult.scala 146:27]
  wire [127:0] ppg2_6_3_io_data; // @[Mult.scala 146:27]
  wire [127:0] ppg2_6_3_io_output; // @[Mult.scala 146:27]
  wire [127:0] csa6_0_io_a; // @[Mult.scala 147:27]
  wire [127:0] csa6_0_io_b; // @[Mult.scala 147:27]
  wire [127:0] csa6_0_io_c; // @[Mult.scala 147:27]
  wire [127:0] csa6_0_io_carry; // @[Mult.scala 147:27]
  wire [127:0] csa6_0_io_temp_sum; // @[Mult.scala 147:27]
  wire [127:0] csa6_1_io_a; // @[Mult.scala 148:27]
  wire [127:0] csa6_1_io_b; // @[Mult.scala 148:27]
  wire [127:0] csa6_1_io_c; // @[Mult.scala 148:27]
  wire [127:0] csa6_1_io_carry; // @[Mult.scala 148:27]
  wire [127:0] csa6_1_io_temp_sum; // @[Mult.scala 148:27]
  wire [2:0] be2_7_0_io_data; // @[Mult.scala 150:25]
  wire [1:0] be2_7_0_io_weight; // @[Mult.scala 150:25]
  wire  be2_7_0_io_neg; // @[Mult.scala 150:25]
  wire [2:0] be2_7_1_io_data; // @[Mult.scala 151:25]
  wire [1:0] be2_7_1_io_weight; // @[Mult.scala 151:25]
  wire  be2_7_1_io_neg; // @[Mult.scala 151:25]
  wire [2:0] be2_7_2_io_data; // @[Mult.scala 152:25]
  wire [1:0] be2_7_2_io_weight; // @[Mult.scala 152:25]
  wire  be2_7_2_io_neg; // @[Mult.scala 152:25]
  wire [2:0] be2_7_3_io_data; // @[Mult.scala 153:25]
  wire [1:0] be2_7_3_io_weight; // @[Mult.scala 153:25]
  wire  be2_7_3_io_neg; // @[Mult.scala 153:25]
  wire [1:0] ppg2_7_0_io_weight; // @[Mult.scala 154:27]
  wire  ppg2_7_0_io_neg; // @[Mult.scala 154:27]
  wire [127:0] ppg2_7_0_io_data; // @[Mult.scala 154:27]
  wire [127:0] ppg2_7_0_io_output; // @[Mult.scala 154:27]
  wire [1:0] ppg2_7_1_io_weight; // @[Mult.scala 155:27]
  wire  ppg2_7_1_io_neg; // @[Mult.scala 155:27]
  wire [127:0] ppg2_7_1_io_data; // @[Mult.scala 155:27]
  wire [127:0] ppg2_7_1_io_output; // @[Mult.scala 155:27]
  wire [1:0] ppg2_7_2_io_weight; // @[Mult.scala 156:27]
  wire  ppg2_7_2_io_neg; // @[Mult.scala 156:27]
  wire [127:0] ppg2_7_2_io_data; // @[Mult.scala 156:27]
  wire [127:0] ppg2_7_2_io_output; // @[Mult.scala 156:27]
  wire [1:0] ppg2_7_3_io_weight; // @[Mult.scala 157:27]
  wire  ppg2_7_3_io_neg; // @[Mult.scala 157:27]
  wire [127:0] ppg2_7_3_io_data; // @[Mult.scala 157:27]
  wire [127:0] ppg2_7_3_io_output; // @[Mult.scala 157:27]
  wire [127:0] csa7_0_io_a; // @[Mult.scala 158:27]
  wire [127:0] csa7_0_io_b; // @[Mult.scala 158:27]
  wire [127:0] csa7_0_io_c; // @[Mult.scala 158:27]
  wire [127:0] csa7_0_io_carry; // @[Mult.scala 158:27]
  wire [127:0] csa7_0_io_temp_sum; // @[Mult.scala 158:27]
  wire [127:0] csa7_1_io_a; // @[Mult.scala 159:27]
  wire [127:0] csa7_1_io_b; // @[Mult.scala 159:27]
  wire [127:0] csa7_1_io_c; // @[Mult.scala 159:27]
  wire [127:0] csa7_1_io_carry; // @[Mult.scala 159:27]
  wire [127:0] csa7_1_io_temp_sum; // @[Mult.scala 159:27]
  wire [71:0] shift1 = {io_b, 8'h0}; // @[Mult.scala 46:56]
  wire [79:0] shift2 = {shift1, 8'h0}; // @[Mult.scala 46:86]
  wire [87:0] shift3 = {shift2, 8'h0}; // @[Mult.scala 47:26]
  wire [95:0] shift4 = {shift3, 8'h0}; // @[Mult.scala 47:56]
  wire [103:0] shift5 = {shift4, 8'h0}; // @[Mult.scala 47:86]
  wire [111:0] shift6 = {shift5, 8'h0}; // @[Mult.scala 48:26]
  wire [119:0] shift7 = {shift6, 8'h0}; // @[Mult.scala 48:56]
  wire [63:0] _data0_T = ~io_b; // @[Mult.scala 52:37]
  wire [63:0] _data0_T_2 = _data0_T + 64'h1; // @[Mult.scala 52:45]
  wire [63:0] b64 = be8_0_io_neg ? _data0_T_2 : io_b; // @[Mult.scala 52:22]
  wire [71:0] _data1_T = ~shift1; // @[Mult.scala 53:37]
  wire [71:0] _data1_T_2 = _data1_T + 72'h1; // @[Mult.scala 53:45]
  wire [71:0] b72 = be8_1_io_neg ? _data1_T_2 : shift1; // @[Mult.scala 53:22]
  wire [79:0] _data2_T = ~shift2; // @[Mult.scala 54:37]
  wire [79:0] _data2_T_2 = _data2_T + 80'h1; // @[Mult.scala 54:45]
  wire [79:0] b80 = be8_2_io_neg ? _data2_T_2 : shift2; // @[Mult.scala 54:22]
  wire [87:0] _data3_T = ~shift3; // @[Mult.scala 55:37]
  wire [87:0] _data3_T_2 = _data3_T + 88'h1; // @[Mult.scala 55:45]
  wire [87:0] b88 = be8_3_io_neg ? _data3_T_2 : shift3; // @[Mult.scala 55:22]
  wire [95:0] _data4_T = ~shift4; // @[Mult.scala 56:37]
  wire [95:0] _data4_T_2 = _data4_T + 96'h1; // @[Mult.scala 56:45]
  wire [95:0] b96 = be8_4_io_neg ? _data4_T_2 : shift4; // @[Mult.scala 56:22]
  wire [103:0] _data5_T = ~shift5; // @[Mult.scala 57:37]
  wire [103:0] _data5_T_2 = _data5_T + 104'h1; // @[Mult.scala 57:45]
  wire [103:0] b104 = be8_5_io_neg ? _data5_T_2 : shift5; // @[Mult.scala 57:22]
  wire [111:0] _data6_T = ~shift6; // @[Mult.scala 58:37]
  wire [111:0] _data6_T_2 = _data6_T + 112'h1; // @[Mult.scala 58:45]
  wire [111:0] b112 = be8_6_io_neg ? _data6_T_2 : shift6; // @[Mult.scala 58:22]
  wire [119:0] _data7_T = ~shift7; // @[Mult.scala 59:37]
  wire [119:0] _data7_T_2 = _data7_T + 120'h1; // @[Mult.scala 59:45]
  wire [119:0] b120 = be8_7_io_neg ? _data7_T_2 : shift7; // @[Mult.scala 59:22]
  wire [65:0] b66 = {b64, 2'h0}; // @[Mult.scala 61:39]
  wire [67:0] b68 = {b66, 2'h0}; // @[Mult.scala 61:61]
  wire [69:0] b70 = {b68, 2'h0}; // @[Mult.scala 61:83]
  wire [73:0] b74 = {b72, 2'h0}; // @[Mult.scala 62:39]
  wire [75:0] b76 = {b74, 2'h0}; // @[Mult.scala 62:61]
  wire [77:0] b78 = {b76, 2'h0}; // @[Mult.scala 62:83]
  wire [81:0] b82 = {b80, 2'h0}; // @[Mult.scala 63:39]
  wire [83:0] b84 = {b82, 2'h0}; // @[Mult.scala 63:61]
  wire [85:0] b86 = {b84, 2'h0}; // @[Mult.scala 63:83]
  wire [89:0] b90 = {b88, 2'h0}; // @[Mult.scala 64:39]
  wire [91:0] b92 = {b90, 2'h0}; // @[Mult.scala 64:61]
  wire [97:0] b98 = {b96, 2'h0}; // @[Mult.scala 65:39]
  wire [99:0] b100 = {b98, 2'h0}; // @[Mult.scala 65:61]
  wire [101:0] b102 = {b100, 2'h0}; // @[Mult.scala 65:83]
  wire [105:0] b106 = {b104, 2'h0}; // @[Mult.scala 66:39]
  wire [107:0] b108 = {b106, 2'h0}; // @[Mult.scala 66:61]
  wire [109:0] b110 = {b108, 2'h0}; // @[Mult.scala 66:83]
  wire [113:0] b114 = {b112, 2'h0}; // @[Mult.scala 67:39]
  wire [115:0] b116 = {b114, 2'h0}; // @[Mult.scala 67:61]
  wire [117:0] b118 = {b116, 2'h0}; // @[Mult.scala 67:83]
  wire [121:0] b122 = {b120, 2'h0}; // @[Mult.scala 68:39]
  wire [123:0] b124 = {b122, 2'h0}; // @[Mult.scala 68:61]
  wire [125:0] b126 = {b124, 2'h0}; // @[Mult.scala 68:83]
  BoothEncoder8 be8_0 ( // @[Mult.scala 30:23]
    .io_data(be8_0_io_data),
    .io_neg(be8_0_io_neg),
    .io_weight(be8_0_io_weight)
  );
  BoothEncoder8 be8_1 ( // @[Mult.scala 31:23]
    .io_data(be8_1_io_data),
    .io_neg(be8_1_io_neg),
    .io_weight(be8_1_io_weight)
  );
  BoothEncoder8 be8_2 ( // @[Mult.scala 32:23]
    .io_data(be8_2_io_data),
    .io_neg(be8_2_io_neg),
    .io_weight(be8_2_io_weight)
  );
  BoothEncoder8 be8_3 ( // @[Mult.scala 33:23]
    .io_data(be8_3_io_data),
    .io_neg(be8_3_io_neg),
    .io_weight(be8_3_io_weight)
  );
  BoothEncoder8 be8_4 ( // @[Mult.scala 34:23]
    .io_data(be8_4_io_data),
    .io_neg(be8_4_io_neg),
    .io_weight(be8_4_io_weight)
  );
  BoothEncoder8 be8_5 ( // @[Mult.scala 35:23]
    .io_data(be8_5_io_data),
    .io_neg(be8_5_io_neg),
    .io_weight(be8_5_io_weight)
  );
  BoothEncoder8 be8_6 ( // @[Mult.scala 36:23]
    .io_data(be8_6_io_data),
    .io_neg(be8_6_io_neg),
    .io_weight(be8_6_io_weight)
  );
  BoothEncoder8 be8_7 ( // @[Mult.scala 37:23]
    .io_data(be8_7_io_data),
    .io_neg(be8_7_io_neg),
    .io_weight(be8_7_io_weight)
  );
  Csa csa0 ( // @[Mult.scala 39:22]
    .io_a(csa0_io_a),
    .io_b(csa0_io_b),
    .io_c(csa0_io_c),
    .io_carry(csa0_io_carry),
    .io_temp_sum(csa0_io_temp_sum)
  );
  Csa csa1 ( // @[Mult.scala 40:22]
    .io_a(csa1_io_a),
    .io_b(csa1_io_b),
    .io_c(csa1_io_c),
    .io_carry(csa1_io_carry),
    .io_temp_sum(csa1_io_temp_sum)
  );
  Csa csa2 ( // @[Mult.scala 41:22]
    .io_a(csa2_io_a),
    .io_b(csa2_io_b),
    .io_c(csa2_io_c),
    .io_carry(csa2_io_carry),
    .io_temp_sum(csa2_io_temp_sum)
  );
  Csa csa3 ( // @[Mult.scala 42:22]
    .io_a(csa3_io_a),
    .io_b(csa3_io_b),
    .io_c(csa3_io_c),
    .io_carry(csa3_io_carry),
    .io_temp_sum(csa3_io_temp_sum)
  );
  Csa csa4 ( // @[Mult.scala 43:22]
    .io_a(csa4_io_a),
    .io_b(csa4_io_b),
    .io_c(csa4_io_c),
    .io_carry(csa4_io_carry),
    .io_temp_sum(csa4_io_temp_sum)
  );
  Csa csa5 ( // @[Mult.scala 44:22]
    .io_a(csa5_io_a),
    .io_b(csa5_io_b),
    .io_c(csa5_io_c),
    .io_carry(csa5_io_carry),
    .io_temp_sum(csa5_io_temp_sum)
  );
  BoothEncoder2 be2_0_0 ( // @[Mult.scala 73:25]
    .io_data(be2_0_0_io_data),
    .io_weight(be2_0_0_io_weight),
    .io_neg(be2_0_0_io_neg)
  );
  BoothEncoder2 be2_0_1 ( // @[Mult.scala 74:25]
    .io_data(be2_0_1_io_data),
    .io_weight(be2_0_1_io_weight),
    .io_neg(be2_0_1_io_neg)
  );
  BoothEncoder2 be2_0_2 ( // @[Mult.scala 75:25]
    .io_data(be2_0_2_io_data),
    .io_weight(be2_0_2_io_weight),
    .io_neg(be2_0_2_io_neg)
  );
  BoothEncoder2 be2_0_3 ( // @[Mult.scala 76:25]
    .io_data(be2_0_3_io_data),
    .io_weight(be2_0_3_io_weight),
    .io_neg(be2_0_3_io_neg)
  );
  Ppg2 ppg2_0_0 ( // @[Mult.scala 77:27]
    .io_weight(ppg2_0_0_io_weight),
    .io_neg(ppg2_0_0_io_neg),
    .io_data(ppg2_0_0_io_data),
    .io_output(ppg2_0_0_io_output)
  );
  Ppg2 ppg2_0_1 ( // @[Mult.scala 78:27]
    .io_weight(ppg2_0_1_io_weight),
    .io_neg(ppg2_0_1_io_neg),
    .io_data(ppg2_0_1_io_data),
    .io_output(ppg2_0_1_io_output)
  );
  Ppg2 ppg2_0_2 ( // @[Mult.scala 79:27]
    .io_weight(ppg2_0_2_io_weight),
    .io_neg(ppg2_0_2_io_neg),
    .io_data(ppg2_0_2_io_data),
    .io_output(ppg2_0_2_io_output)
  );
  Ppg2 ppg2_0_3 ( // @[Mult.scala 80:27]
    .io_weight(ppg2_0_3_io_weight),
    .io_neg(ppg2_0_3_io_neg),
    .io_data(ppg2_0_3_io_data),
    .io_output(ppg2_0_3_io_output)
  );
  Csa csa0_0 ( // @[Mult.scala 81:27]
    .io_a(csa0_0_io_a),
    .io_b(csa0_0_io_b),
    .io_c(csa0_0_io_c),
    .io_carry(csa0_0_io_carry),
    .io_temp_sum(csa0_0_io_temp_sum)
  );
  Csa csa0_1 ( // @[Mult.scala 82:27]
    .io_a(csa0_1_io_a),
    .io_b(csa0_1_io_b),
    .io_c(csa0_1_io_c),
    .io_carry(csa0_1_io_carry),
    .io_temp_sum(csa0_1_io_temp_sum)
  );
  BoothEncoder2 be2_1_0 ( // @[Mult.scala 84:25]
    .io_data(be2_1_0_io_data),
    .io_weight(be2_1_0_io_weight),
    .io_neg(be2_1_0_io_neg)
  );
  BoothEncoder2 be2_1_1 ( // @[Mult.scala 85:25]
    .io_data(be2_1_1_io_data),
    .io_weight(be2_1_1_io_weight),
    .io_neg(be2_1_1_io_neg)
  );
  BoothEncoder2 be2_1_2 ( // @[Mult.scala 86:25]
    .io_data(be2_1_2_io_data),
    .io_weight(be2_1_2_io_weight),
    .io_neg(be2_1_2_io_neg)
  );
  BoothEncoder2 be2_1_3 ( // @[Mult.scala 87:25]
    .io_data(be2_1_3_io_data),
    .io_weight(be2_1_3_io_weight),
    .io_neg(be2_1_3_io_neg)
  );
  Ppg2 ppg2_1_0 ( // @[Mult.scala 88:27]
    .io_weight(ppg2_1_0_io_weight),
    .io_neg(ppg2_1_0_io_neg),
    .io_data(ppg2_1_0_io_data),
    .io_output(ppg2_1_0_io_output)
  );
  Ppg2 ppg2_1_1 ( // @[Mult.scala 89:27]
    .io_weight(ppg2_1_1_io_weight),
    .io_neg(ppg2_1_1_io_neg),
    .io_data(ppg2_1_1_io_data),
    .io_output(ppg2_1_1_io_output)
  );
  Ppg2 ppg2_1_2 ( // @[Mult.scala 90:27]
    .io_weight(ppg2_1_2_io_weight),
    .io_neg(ppg2_1_2_io_neg),
    .io_data(ppg2_1_2_io_data),
    .io_output(ppg2_1_2_io_output)
  );
  Ppg2 ppg2_1_3 ( // @[Mult.scala 91:27]
    .io_weight(ppg2_1_3_io_weight),
    .io_neg(ppg2_1_3_io_neg),
    .io_data(ppg2_1_3_io_data),
    .io_output(ppg2_1_3_io_output)
  );
  Csa csa1_0 ( // @[Mult.scala 92:27]
    .io_a(csa1_0_io_a),
    .io_b(csa1_0_io_b),
    .io_c(csa1_0_io_c),
    .io_carry(csa1_0_io_carry),
    .io_temp_sum(csa1_0_io_temp_sum)
  );
  Csa csa1_1 ( // @[Mult.scala 93:27]
    .io_a(csa1_1_io_a),
    .io_b(csa1_1_io_b),
    .io_c(csa1_1_io_c),
    .io_carry(csa1_1_io_carry),
    .io_temp_sum(csa1_1_io_temp_sum)
  );
  BoothEncoder2 be2_2_0 ( // @[Mult.scala 95:25]
    .io_data(be2_2_0_io_data),
    .io_weight(be2_2_0_io_weight),
    .io_neg(be2_2_0_io_neg)
  );
  BoothEncoder2 be2_2_1 ( // @[Mult.scala 96:25]
    .io_data(be2_2_1_io_data),
    .io_weight(be2_2_1_io_weight),
    .io_neg(be2_2_1_io_neg)
  );
  BoothEncoder2 be2_2_2 ( // @[Mult.scala 97:25]
    .io_data(be2_2_2_io_data),
    .io_weight(be2_2_2_io_weight),
    .io_neg(be2_2_2_io_neg)
  );
  BoothEncoder2 be2_2_3 ( // @[Mult.scala 98:25]
    .io_data(be2_2_3_io_data),
    .io_weight(be2_2_3_io_weight),
    .io_neg(be2_2_3_io_neg)
  );
  Ppg2 ppg2_2_0 ( // @[Mult.scala 99:27]
    .io_weight(ppg2_2_0_io_weight),
    .io_neg(ppg2_2_0_io_neg),
    .io_data(ppg2_2_0_io_data),
    .io_output(ppg2_2_0_io_output)
  );
  Ppg2 ppg2_2_1 ( // @[Mult.scala 100:27]
    .io_weight(ppg2_2_1_io_weight),
    .io_neg(ppg2_2_1_io_neg),
    .io_data(ppg2_2_1_io_data),
    .io_output(ppg2_2_1_io_output)
  );
  Ppg2 ppg2_2_2 ( // @[Mult.scala 101:27]
    .io_weight(ppg2_2_2_io_weight),
    .io_neg(ppg2_2_2_io_neg),
    .io_data(ppg2_2_2_io_data),
    .io_output(ppg2_2_2_io_output)
  );
  Ppg2 ppg2_2_3 ( // @[Mult.scala 102:27]
    .io_weight(ppg2_2_3_io_weight),
    .io_neg(ppg2_2_3_io_neg),
    .io_data(ppg2_2_3_io_data),
    .io_output(ppg2_2_3_io_output)
  );
  Csa csa2_0 ( // @[Mult.scala 103:27]
    .io_a(csa2_0_io_a),
    .io_b(csa2_0_io_b),
    .io_c(csa2_0_io_c),
    .io_carry(csa2_0_io_carry),
    .io_temp_sum(csa2_0_io_temp_sum)
  );
  Csa csa2_1 ( // @[Mult.scala 104:27]
    .io_a(csa2_1_io_a),
    .io_b(csa2_1_io_b),
    .io_c(csa2_1_io_c),
    .io_carry(csa2_1_io_carry),
    .io_temp_sum(csa2_1_io_temp_sum)
  );
  BoothEncoder2 be2_3_0 ( // @[Mult.scala 106:25]
    .io_data(be2_3_0_io_data),
    .io_weight(be2_3_0_io_weight),
    .io_neg(be2_3_0_io_neg)
  );
  BoothEncoder2 be2_3_1 ( // @[Mult.scala 107:25]
    .io_data(be2_3_1_io_data),
    .io_weight(be2_3_1_io_weight),
    .io_neg(be2_3_1_io_neg)
  );
  BoothEncoder2 be2_3_2 ( // @[Mult.scala 108:25]
    .io_data(be2_3_2_io_data),
    .io_weight(be2_3_2_io_weight),
    .io_neg(be2_3_2_io_neg)
  );
  BoothEncoder2 be2_3_3 ( // @[Mult.scala 109:25]
    .io_data(be2_3_3_io_data),
    .io_weight(be2_3_3_io_weight),
    .io_neg(be2_3_3_io_neg)
  );
  Ppg2 ppg2_3_0 ( // @[Mult.scala 110:27]
    .io_weight(ppg2_3_0_io_weight),
    .io_neg(ppg2_3_0_io_neg),
    .io_data(ppg2_3_0_io_data),
    .io_output(ppg2_3_0_io_output)
  );
  Ppg2 ppg2_3_1 ( // @[Mult.scala 111:27]
    .io_weight(ppg2_3_1_io_weight),
    .io_neg(ppg2_3_1_io_neg),
    .io_data(ppg2_3_1_io_data),
    .io_output(ppg2_3_1_io_output)
  );
  Ppg2 ppg2_3_2 ( // @[Mult.scala 112:27]
    .io_weight(ppg2_3_2_io_weight),
    .io_neg(ppg2_3_2_io_neg),
    .io_data(ppg2_3_2_io_data),
    .io_output(ppg2_3_2_io_output)
  );
  Ppg2 ppg2_3_3 ( // @[Mult.scala 113:27]
    .io_weight(ppg2_3_3_io_weight),
    .io_neg(ppg2_3_3_io_neg),
    .io_data(ppg2_3_3_io_data),
    .io_output(ppg2_3_3_io_output)
  );
  Csa csa3_0 ( // @[Mult.scala 114:27]
    .io_a(csa3_0_io_a),
    .io_b(csa3_0_io_b),
    .io_c(csa3_0_io_c),
    .io_carry(csa3_0_io_carry),
    .io_temp_sum(csa3_0_io_temp_sum)
  );
  Csa csa3_1 ( // @[Mult.scala 115:27]
    .io_a(csa3_1_io_a),
    .io_b(csa3_1_io_b),
    .io_c(csa3_1_io_c),
    .io_carry(csa3_1_io_carry),
    .io_temp_sum(csa3_1_io_temp_sum)
  );
  BoothEncoder2 be2_4_0 ( // @[Mult.scala 117:25]
    .io_data(be2_4_0_io_data),
    .io_weight(be2_4_0_io_weight),
    .io_neg(be2_4_0_io_neg)
  );
  BoothEncoder2 be2_4_1 ( // @[Mult.scala 118:25]
    .io_data(be2_4_1_io_data),
    .io_weight(be2_4_1_io_weight),
    .io_neg(be2_4_1_io_neg)
  );
  BoothEncoder2 be2_4_2 ( // @[Mult.scala 119:25]
    .io_data(be2_4_2_io_data),
    .io_weight(be2_4_2_io_weight),
    .io_neg(be2_4_2_io_neg)
  );
  BoothEncoder2 be2_4_3 ( // @[Mult.scala 120:25]
    .io_data(be2_4_3_io_data),
    .io_weight(be2_4_3_io_weight),
    .io_neg(be2_4_3_io_neg)
  );
  Ppg2 ppg2_4_0 ( // @[Mult.scala 121:27]
    .io_weight(ppg2_4_0_io_weight),
    .io_neg(ppg2_4_0_io_neg),
    .io_data(ppg2_4_0_io_data),
    .io_output(ppg2_4_0_io_output)
  );
  Ppg2 ppg2_4_1 ( // @[Mult.scala 122:27]
    .io_weight(ppg2_4_1_io_weight),
    .io_neg(ppg2_4_1_io_neg),
    .io_data(ppg2_4_1_io_data),
    .io_output(ppg2_4_1_io_output)
  );
  Ppg2 ppg2_4_2 ( // @[Mult.scala 123:27]
    .io_weight(ppg2_4_2_io_weight),
    .io_neg(ppg2_4_2_io_neg),
    .io_data(ppg2_4_2_io_data),
    .io_output(ppg2_4_2_io_output)
  );
  Ppg2 ppg2_4_3 ( // @[Mult.scala 124:27]
    .io_weight(ppg2_4_3_io_weight),
    .io_neg(ppg2_4_3_io_neg),
    .io_data(ppg2_4_3_io_data),
    .io_output(ppg2_4_3_io_output)
  );
  Csa csa4_0 ( // @[Mult.scala 125:27]
    .io_a(csa4_0_io_a),
    .io_b(csa4_0_io_b),
    .io_c(csa4_0_io_c),
    .io_carry(csa4_0_io_carry),
    .io_temp_sum(csa4_0_io_temp_sum)
  );
  Csa csa4_1 ( // @[Mult.scala 126:27]
    .io_a(csa4_1_io_a),
    .io_b(csa4_1_io_b),
    .io_c(csa4_1_io_c),
    .io_carry(csa4_1_io_carry),
    .io_temp_sum(csa4_1_io_temp_sum)
  );
  BoothEncoder2 be2_5_0 ( // @[Mult.scala 128:25]
    .io_data(be2_5_0_io_data),
    .io_weight(be2_5_0_io_weight),
    .io_neg(be2_5_0_io_neg)
  );
  BoothEncoder2 be2_5_1 ( // @[Mult.scala 129:25]
    .io_data(be2_5_1_io_data),
    .io_weight(be2_5_1_io_weight),
    .io_neg(be2_5_1_io_neg)
  );
  BoothEncoder2 be2_5_2 ( // @[Mult.scala 130:25]
    .io_data(be2_5_2_io_data),
    .io_weight(be2_5_2_io_weight),
    .io_neg(be2_5_2_io_neg)
  );
  BoothEncoder2 be2_5_3 ( // @[Mult.scala 131:25]
    .io_data(be2_5_3_io_data),
    .io_weight(be2_5_3_io_weight),
    .io_neg(be2_5_3_io_neg)
  );
  Ppg2 ppg2_5_0 ( // @[Mult.scala 132:27]
    .io_weight(ppg2_5_0_io_weight),
    .io_neg(ppg2_5_0_io_neg),
    .io_data(ppg2_5_0_io_data),
    .io_output(ppg2_5_0_io_output)
  );
  Ppg2 ppg2_5_1 ( // @[Mult.scala 133:27]
    .io_weight(ppg2_5_1_io_weight),
    .io_neg(ppg2_5_1_io_neg),
    .io_data(ppg2_5_1_io_data),
    .io_output(ppg2_5_1_io_output)
  );
  Ppg2 ppg2_5_2 ( // @[Mult.scala 134:27]
    .io_weight(ppg2_5_2_io_weight),
    .io_neg(ppg2_5_2_io_neg),
    .io_data(ppg2_5_2_io_data),
    .io_output(ppg2_5_2_io_output)
  );
  Ppg2 ppg2_5_3 ( // @[Mult.scala 135:27]
    .io_weight(ppg2_5_3_io_weight),
    .io_neg(ppg2_5_3_io_neg),
    .io_data(ppg2_5_3_io_data),
    .io_output(ppg2_5_3_io_output)
  );
  Csa csa5_0 ( // @[Mult.scala 136:27]
    .io_a(csa5_0_io_a),
    .io_b(csa5_0_io_b),
    .io_c(csa5_0_io_c),
    .io_carry(csa5_0_io_carry),
    .io_temp_sum(csa5_0_io_temp_sum)
  );
  Csa csa5_1 ( // @[Mult.scala 137:27]
    .io_a(csa5_1_io_a),
    .io_b(csa5_1_io_b),
    .io_c(csa5_1_io_c),
    .io_carry(csa5_1_io_carry),
    .io_temp_sum(csa5_1_io_temp_sum)
  );
  BoothEncoder2 be2_6_0 ( // @[Mult.scala 139:25]
    .io_data(be2_6_0_io_data),
    .io_weight(be2_6_0_io_weight),
    .io_neg(be2_6_0_io_neg)
  );
  BoothEncoder2 be2_6_1 ( // @[Mult.scala 140:25]
    .io_data(be2_6_1_io_data),
    .io_weight(be2_6_1_io_weight),
    .io_neg(be2_6_1_io_neg)
  );
  BoothEncoder2 be2_6_2 ( // @[Mult.scala 141:25]
    .io_data(be2_6_2_io_data),
    .io_weight(be2_6_2_io_weight),
    .io_neg(be2_6_2_io_neg)
  );
  BoothEncoder2 be2_6_3 ( // @[Mult.scala 142:25]
    .io_data(be2_6_3_io_data),
    .io_weight(be2_6_3_io_weight),
    .io_neg(be2_6_3_io_neg)
  );
  Ppg2 ppg2_6_0 ( // @[Mult.scala 143:27]
    .io_weight(ppg2_6_0_io_weight),
    .io_neg(ppg2_6_0_io_neg),
    .io_data(ppg2_6_0_io_data),
    .io_output(ppg2_6_0_io_output)
  );
  Ppg2 ppg2_6_1 ( // @[Mult.scala 144:27]
    .io_weight(ppg2_6_1_io_weight),
    .io_neg(ppg2_6_1_io_neg),
    .io_data(ppg2_6_1_io_data),
    .io_output(ppg2_6_1_io_output)
  );
  Ppg2 ppg2_6_2 ( // @[Mult.scala 145:27]
    .io_weight(ppg2_6_2_io_weight),
    .io_neg(ppg2_6_2_io_neg),
    .io_data(ppg2_6_2_io_data),
    .io_output(ppg2_6_2_io_output)
  );
  Ppg2 ppg2_6_3 ( // @[Mult.scala 146:27]
    .io_weight(ppg2_6_3_io_weight),
    .io_neg(ppg2_6_3_io_neg),
    .io_data(ppg2_6_3_io_data),
    .io_output(ppg2_6_3_io_output)
  );
  Csa csa6_0 ( // @[Mult.scala 147:27]
    .io_a(csa6_0_io_a),
    .io_b(csa6_0_io_b),
    .io_c(csa6_0_io_c),
    .io_carry(csa6_0_io_carry),
    .io_temp_sum(csa6_0_io_temp_sum)
  );
  Csa csa6_1 ( // @[Mult.scala 148:27]
    .io_a(csa6_1_io_a),
    .io_b(csa6_1_io_b),
    .io_c(csa6_1_io_c),
    .io_carry(csa6_1_io_carry),
    .io_temp_sum(csa6_1_io_temp_sum)
  );
  BoothEncoder2 be2_7_0 ( // @[Mult.scala 150:25]
    .io_data(be2_7_0_io_data),
    .io_weight(be2_7_0_io_weight),
    .io_neg(be2_7_0_io_neg)
  );
  BoothEncoder2 be2_7_1 ( // @[Mult.scala 151:25]
    .io_data(be2_7_1_io_data),
    .io_weight(be2_7_1_io_weight),
    .io_neg(be2_7_1_io_neg)
  );
  BoothEncoder2 be2_7_2 ( // @[Mult.scala 152:25]
    .io_data(be2_7_2_io_data),
    .io_weight(be2_7_2_io_weight),
    .io_neg(be2_7_2_io_neg)
  );
  BoothEncoder2 be2_7_3 ( // @[Mult.scala 153:25]
    .io_data(be2_7_3_io_data),
    .io_weight(be2_7_3_io_weight),
    .io_neg(be2_7_3_io_neg)
  );
  Ppg2 ppg2_7_0 ( // @[Mult.scala 154:27]
    .io_weight(ppg2_7_0_io_weight),
    .io_neg(ppg2_7_0_io_neg),
    .io_data(ppg2_7_0_io_data),
    .io_output(ppg2_7_0_io_output)
  );
  Ppg2 ppg2_7_1 ( // @[Mult.scala 155:27]
    .io_weight(ppg2_7_1_io_weight),
    .io_neg(ppg2_7_1_io_neg),
    .io_data(ppg2_7_1_io_data),
    .io_output(ppg2_7_1_io_output)
  );
  Ppg2 ppg2_7_2 ( // @[Mult.scala 156:27]
    .io_weight(ppg2_7_2_io_weight),
    .io_neg(ppg2_7_2_io_neg),
    .io_data(ppg2_7_2_io_data),
    .io_output(ppg2_7_2_io_output)
  );
  Ppg2 ppg2_7_3 ( // @[Mult.scala 157:27]
    .io_weight(ppg2_7_3_io_weight),
    .io_neg(ppg2_7_3_io_neg),
    .io_data(ppg2_7_3_io_data),
    .io_output(ppg2_7_3_io_output)
  );
  Csa csa7_0 ( // @[Mult.scala 158:27]
    .io_a(csa7_0_io_a),
    .io_b(csa7_0_io_b),
    .io_c(csa7_0_io_c),
    .io_carry(csa7_0_io_carry),
    .io_temp_sum(csa7_0_io_temp_sum)
  );
  Csa csa7_1 ( // @[Mult.scala 159:27]
    .io_a(csa7_1_io_a),
    .io_b(csa7_1_io_b),
    .io_c(csa7_1_io_c),
    .io_carry(csa7_1_io_carry),
    .io_temp_sum(csa7_1_io_temp_sum)
  );
  assign io_result = csa5_io_temp_sum + csa5_io_carry; // @[Mult.scala 456:37]
  assign io_unsigned = io_a * io_b; // @[Mult.scala 25:27]
  assign io_signed = $signed(io_a) * $signed(io_b); // @[Mult.scala 26:34]
  assign be8_0_io_data = {io_a[7:0],1'h0}; // @[Cat.scala 31:58]
  assign be8_1_io_data = io_a[15:7]; // @[Mult.scala 421:29]
  assign be8_2_io_data = io_a[23:15]; // @[Mult.scala 422:29]
  assign be8_3_io_data = io_a[31:23]; // @[Mult.scala 423:29]
  assign be8_4_io_data = io_a[39:31]; // @[Mult.scala 424:29]
  assign be8_5_io_data = io_a[47:39]; // @[Mult.scala 425:29]
  assign be8_6_io_data = io_a[55:47]; // @[Mult.scala 426:29]
  assign be8_7_io_data = io_a[63:55]; // @[Mult.scala 427:29]
  assign csa0_io_a = csa0_1_io_temp_sum + csa0_1_io_carry; // @[Mult.scala 191:33]
  assign csa0_io_b = csa1_1_io_temp_sum + csa1_1_io_carry; // @[Mult.scala 223:33]
  assign csa0_io_c = csa2_1_io_temp_sum + csa2_1_io_carry; // @[Mult.scala 255:33]
  assign csa1_io_a = csa5_1_io_temp_sum + csa5_1_io_carry; // @[Mult.scala 351:33]
  assign csa1_io_b = csa4_1_io_temp_sum + csa4_1_io_carry; // @[Mult.scala 319:33]
  assign csa1_io_c = csa3_1_io_temp_sum + csa3_1_io_carry; // @[Mult.scala 287:33]
  assign csa2_io_a = csa6_1_io_temp_sum + csa6_1_io_carry; // @[Mult.scala 383:33]
  assign csa2_io_b = csa1_io_carry; // @[Mult.scala 440:17]
  assign csa2_io_c = csa1_io_temp_sum; // @[Mult.scala 441:17]
  assign csa3_io_a = csa2_io_carry; // @[Mult.scala 443:17]
  assign csa3_io_b = csa0_io_temp_sum; // @[Mult.scala 444:17]
  assign csa3_io_c = csa0_io_carry; // @[Mult.scala 445:17]
  assign csa4_io_a = csa2_io_temp_sum; // @[Mult.scala 447:17]
  assign csa4_io_b = csa3_io_temp_sum; // @[Mult.scala 448:17]
  assign csa4_io_c = csa3_io_carry; // @[Mult.scala 449:17]
  assign csa5_io_a = csa7_1_io_temp_sum + csa7_1_io_carry; // @[Mult.scala 415:33]
  assign csa5_io_b = csa4_io_temp_sum; // @[Mult.scala 452:17]
  assign csa5_io_c = csa4_io_carry; // @[Mult.scala 453:17]
  assign be2_0_0_io_data = {be8_0_io_weight[1:0],1'h0}; // @[Cat.scala 31:58]
  assign be2_0_1_io_data = be8_0_io_weight[3:1]; // @[Mult.scala 163:40]
  assign be2_0_2_io_data = be8_0_io_weight[5:3]; // @[Mult.scala 164:40]
  assign be2_0_3_io_data = be8_0_io_weight[7:5]; // @[Mult.scala 165:40]
  assign ppg2_0_0_io_weight = be2_0_0_io_weight; // @[Mult.scala 167:25]
  assign ppg2_0_0_io_neg = be2_0_0_io_neg; // @[Mult.scala 168:25]
  assign ppg2_0_0_io_data = {{64'd0}, b64}; // @[Mult.scala 169:25]
  assign ppg2_0_1_io_weight = be2_0_1_io_weight; // @[Mult.scala 171:25]
  assign ppg2_0_1_io_neg = be2_0_1_io_neg; // @[Mult.scala 172:25]
  assign ppg2_0_1_io_data = {{62'd0}, b66}; // @[Mult.scala 173:25]
  assign ppg2_0_2_io_weight = be2_0_2_io_weight; // @[Mult.scala 175:25]
  assign ppg2_0_2_io_neg = be2_0_2_io_neg; // @[Mult.scala 176:25]
  assign ppg2_0_2_io_data = {{60'd0}, b68}; // @[Mult.scala 177:25]
  assign ppg2_0_3_io_weight = be2_0_3_io_weight; // @[Mult.scala 179:25]
  assign ppg2_0_3_io_neg = be2_0_3_io_neg; // @[Mult.scala 180:25]
  assign ppg2_0_3_io_data = {{58'd0}, b70}; // @[Mult.scala 181:25]
  assign csa0_0_io_a = ppg2_0_0_io_output; // @[Mult.scala 183:25]
  assign csa0_0_io_b = ppg2_0_1_io_output; // @[Mult.scala 184:25]
  assign csa0_0_io_c = ppg2_0_2_io_output; // @[Mult.scala 185:25]
  assign csa0_1_io_a = csa0_0_io_carry; // @[Mult.scala 187:25]
  assign csa0_1_io_b = csa0_0_io_temp_sum; // @[Mult.scala 188:25]
  assign csa0_1_io_c = ppg2_0_3_io_output; // @[Mult.scala 189:25]
  assign be2_1_0_io_data = {be8_1_io_weight[1:0],1'h0}; // @[Cat.scala 31:58]
  assign be2_1_1_io_data = be8_1_io_weight[3:1]; // @[Mult.scala 195:40]
  assign be2_1_2_io_data = be8_1_io_weight[5:3]; // @[Mult.scala 196:40]
  assign be2_1_3_io_data = be8_1_io_weight[7:5]; // @[Mult.scala 197:40]
  assign ppg2_1_0_io_weight = be2_1_0_io_weight; // @[Mult.scala 199:25]
  assign ppg2_1_0_io_neg = be2_1_0_io_neg; // @[Mult.scala 200:25]
  assign ppg2_1_0_io_data = {{56'd0}, b72}; // @[Mult.scala 201:25]
  assign ppg2_1_1_io_weight = be2_1_1_io_weight; // @[Mult.scala 203:25]
  assign ppg2_1_1_io_neg = be2_1_1_io_neg; // @[Mult.scala 204:25]
  assign ppg2_1_1_io_data = {{54'd0}, b74}; // @[Mult.scala 205:25]
  assign ppg2_1_2_io_weight = be2_1_2_io_weight; // @[Mult.scala 207:25]
  assign ppg2_1_2_io_neg = be2_1_2_io_neg; // @[Mult.scala 208:25]
  assign ppg2_1_2_io_data = {{52'd0}, b76}; // @[Mult.scala 209:25]
  assign ppg2_1_3_io_weight = be2_1_3_io_weight; // @[Mult.scala 211:25]
  assign ppg2_1_3_io_neg = be2_1_3_io_neg; // @[Mult.scala 212:25]
  assign ppg2_1_3_io_data = {{50'd0}, b78}; // @[Mult.scala 213:25]
  assign csa1_0_io_a = ppg2_1_0_io_output; // @[Mult.scala 215:25]
  assign csa1_0_io_b = ppg2_1_1_io_output; // @[Mult.scala 216:25]
  assign csa1_0_io_c = ppg2_1_2_io_output; // @[Mult.scala 217:25]
  assign csa1_1_io_a = csa1_0_io_carry; // @[Mult.scala 219:25]
  assign csa1_1_io_b = csa1_0_io_temp_sum; // @[Mult.scala 220:25]
  assign csa1_1_io_c = ppg2_1_3_io_output; // @[Mult.scala 221:25]
  assign be2_2_0_io_data = {be8_2_io_weight[1:0],1'h0}; // @[Cat.scala 31:58]
  assign be2_2_1_io_data = be8_2_io_weight[3:1]; // @[Mult.scala 227:40]
  assign be2_2_2_io_data = be8_2_io_weight[5:3]; // @[Mult.scala 228:40]
  assign be2_2_3_io_data = be8_2_io_weight[7:5]; // @[Mult.scala 229:40]
  assign ppg2_2_0_io_weight = be2_2_0_io_weight; // @[Mult.scala 231:25]
  assign ppg2_2_0_io_neg = be2_2_0_io_neg; // @[Mult.scala 232:25]
  assign ppg2_2_0_io_data = {{48'd0}, b80}; // @[Mult.scala 233:25]
  assign ppg2_2_1_io_weight = be2_2_1_io_weight; // @[Mult.scala 235:25]
  assign ppg2_2_1_io_neg = be2_2_1_io_neg; // @[Mult.scala 236:25]
  assign ppg2_2_1_io_data = {{46'd0}, b82}; // @[Mult.scala 237:25]
  assign ppg2_2_2_io_weight = be2_2_2_io_weight; // @[Mult.scala 239:25]
  assign ppg2_2_2_io_neg = be2_2_2_io_neg; // @[Mult.scala 240:25]
  assign ppg2_2_2_io_data = {{44'd0}, b84}; // @[Mult.scala 241:25]
  assign ppg2_2_3_io_weight = be2_2_3_io_weight; // @[Mult.scala 243:25]
  assign ppg2_2_3_io_neg = be2_2_3_io_neg; // @[Mult.scala 244:25]
  assign ppg2_2_3_io_data = {{42'd0}, b86}; // @[Mult.scala 245:25]
  assign csa2_0_io_a = ppg2_2_0_io_output; // @[Mult.scala 247:25]
  assign csa2_0_io_b = ppg2_2_1_io_output; // @[Mult.scala 248:25]
  assign csa2_0_io_c = ppg2_2_2_io_output; // @[Mult.scala 249:25]
  assign csa2_1_io_a = csa2_0_io_carry; // @[Mult.scala 251:25]
  assign csa2_1_io_b = csa2_0_io_temp_sum; // @[Mult.scala 252:25]
  assign csa2_1_io_c = ppg2_2_3_io_output; // @[Mult.scala 253:25]
  assign be2_3_0_io_data = {be8_3_io_weight[1:0],1'h0}; // @[Cat.scala 31:58]
  assign be2_3_1_io_data = be8_3_io_weight[3:1]; // @[Mult.scala 259:40]
  assign be2_3_2_io_data = be8_3_io_weight[5:3]; // @[Mult.scala 260:40]
  assign be2_3_3_io_data = be8_3_io_weight[7:5]; // @[Mult.scala 261:40]
  assign ppg2_3_0_io_weight = be2_3_0_io_weight; // @[Mult.scala 263:25]
  assign ppg2_3_0_io_neg = be2_3_0_io_neg; // @[Mult.scala 264:25]
  assign ppg2_3_0_io_data = {{40'd0}, b88}; // @[Mult.scala 265:25]
  assign ppg2_3_1_io_weight = be2_3_1_io_weight; // @[Mult.scala 267:25]
  assign ppg2_3_1_io_neg = be2_3_1_io_neg; // @[Mult.scala 268:25]
  assign ppg2_3_1_io_data = {{38'd0}, b90}; // @[Mult.scala 269:25]
  assign ppg2_3_2_io_weight = be2_3_2_io_weight; // @[Mult.scala 271:25]
  assign ppg2_3_2_io_neg = be2_3_2_io_neg; // @[Mult.scala 272:25]
  assign ppg2_3_2_io_data = {{36'd0}, b92}; // @[Mult.scala 273:25]
  assign ppg2_3_3_io_weight = be2_3_3_io_weight; // @[Mult.scala 275:25]
  assign ppg2_3_3_io_neg = be2_3_3_io_neg; // @[Mult.scala 276:25]
  assign ppg2_3_3_io_data = {{36'd0}, b92}; // @[Mult.scala 277:25]
  assign csa3_0_io_a = ppg2_3_0_io_output; // @[Mult.scala 279:25]
  assign csa3_0_io_b = ppg2_3_1_io_output; // @[Mult.scala 280:25]
  assign csa3_0_io_c = ppg2_3_2_io_output; // @[Mult.scala 281:25]
  assign csa3_1_io_a = csa3_0_io_carry; // @[Mult.scala 283:25]
  assign csa3_1_io_b = csa3_0_io_temp_sum; // @[Mult.scala 284:25]
  assign csa3_1_io_c = ppg2_3_3_io_output; // @[Mult.scala 285:25]
  assign be2_4_0_io_data = {be8_4_io_weight[1:0],1'h0}; // @[Cat.scala 31:58]
  assign be2_4_1_io_data = be8_4_io_weight[3:1]; // @[Mult.scala 291:40]
  assign be2_4_2_io_data = be8_4_io_weight[5:3]; // @[Mult.scala 292:40]
  assign be2_4_3_io_data = be8_4_io_weight[7:5]; // @[Mult.scala 293:40]
  assign ppg2_4_0_io_weight = be2_4_0_io_weight; // @[Mult.scala 295:25]
  assign ppg2_4_0_io_neg = be2_4_0_io_neg; // @[Mult.scala 296:25]
  assign ppg2_4_0_io_data = {{32'd0}, b96}; // @[Mult.scala 297:25]
  assign ppg2_4_1_io_weight = be2_4_1_io_weight; // @[Mult.scala 299:25]
  assign ppg2_4_1_io_neg = be2_4_1_io_neg; // @[Mult.scala 300:25]
  assign ppg2_4_1_io_data = {{30'd0}, b98}; // @[Mult.scala 301:25]
  assign ppg2_4_2_io_weight = be2_4_2_io_weight; // @[Mult.scala 303:25]
  assign ppg2_4_2_io_neg = be2_4_2_io_neg; // @[Mult.scala 304:25]
  assign ppg2_4_2_io_data = {{28'd0}, b100}; // @[Mult.scala 305:25]
  assign ppg2_4_3_io_weight = be2_4_3_io_weight; // @[Mult.scala 307:25]
  assign ppg2_4_3_io_neg = be2_4_3_io_neg; // @[Mult.scala 308:25]
  assign ppg2_4_3_io_data = {{26'd0}, b102}; // @[Mult.scala 309:25]
  assign csa4_0_io_a = ppg2_4_0_io_output; // @[Mult.scala 311:25]
  assign csa4_0_io_b = ppg2_4_1_io_output; // @[Mult.scala 312:25]
  assign csa4_0_io_c = ppg2_4_2_io_output; // @[Mult.scala 313:25]
  assign csa4_1_io_a = csa4_0_io_carry; // @[Mult.scala 315:25]
  assign csa4_1_io_b = csa4_0_io_temp_sum; // @[Mult.scala 316:25]
  assign csa4_1_io_c = ppg2_4_3_io_output; // @[Mult.scala 317:25]
  assign be2_5_0_io_data = {be8_5_io_weight[1:0],1'h0}; // @[Cat.scala 31:58]
  assign be2_5_1_io_data = be8_5_io_weight[3:1]; // @[Mult.scala 323:40]
  assign be2_5_2_io_data = be8_5_io_weight[5:3]; // @[Mult.scala 324:40]
  assign be2_5_3_io_data = be8_5_io_weight[7:5]; // @[Mult.scala 325:40]
  assign ppg2_5_0_io_weight = be2_5_0_io_weight; // @[Mult.scala 327:25]
  assign ppg2_5_0_io_neg = be2_5_0_io_neg; // @[Mult.scala 328:25]
  assign ppg2_5_0_io_data = {{24'd0}, b104}; // @[Mult.scala 329:25]
  assign ppg2_5_1_io_weight = be2_5_1_io_weight; // @[Mult.scala 331:25]
  assign ppg2_5_1_io_neg = be2_5_1_io_neg; // @[Mult.scala 332:25]
  assign ppg2_5_1_io_data = {{22'd0}, b106}; // @[Mult.scala 333:25]
  assign ppg2_5_2_io_weight = be2_5_2_io_weight; // @[Mult.scala 335:25]
  assign ppg2_5_2_io_neg = be2_5_2_io_neg; // @[Mult.scala 336:25]
  assign ppg2_5_2_io_data = {{20'd0}, b108}; // @[Mult.scala 337:25]
  assign ppg2_5_3_io_weight = be2_5_3_io_weight; // @[Mult.scala 339:25]
  assign ppg2_5_3_io_neg = be2_5_3_io_neg; // @[Mult.scala 340:25]
  assign ppg2_5_3_io_data = {{18'd0}, b110}; // @[Mult.scala 341:25]
  assign csa5_0_io_a = ppg2_5_0_io_output; // @[Mult.scala 343:25]
  assign csa5_0_io_b = ppg2_5_1_io_output; // @[Mult.scala 344:25]
  assign csa5_0_io_c = ppg2_5_2_io_output; // @[Mult.scala 345:25]
  assign csa5_1_io_a = csa5_0_io_carry; // @[Mult.scala 347:25]
  assign csa5_1_io_b = csa5_0_io_temp_sum; // @[Mult.scala 348:25]
  assign csa5_1_io_c = ppg2_5_3_io_output; // @[Mult.scala 349:25]
  assign be2_6_0_io_data = {be8_6_io_weight[1:0],1'h0}; // @[Cat.scala 31:58]
  assign be2_6_1_io_data = be8_6_io_weight[3:1]; // @[Mult.scala 355:40]
  assign be2_6_2_io_data = be8_6_io_weight[5:3]; // @[Mult.scala 356:40]
  assign be2_6_3_io_data = be8_6_io_weight[7:5]; // @[Mult.scala 357:40]
  assign ppg2_6_0_io_weight = be2_6_0_io_weight; // @[Mult.scala 359:25]
  assign ppg2_6_0_io_neg = be2_6_0_io_neg; // @[Mult.scala 360:25]
  assign ppg2_6_0_io_data = {{16'd0}, b112}; // @[Mult.scala 361:25]
  assign ppg2_6_1_io_weight = be2_6_1_io_weight; // @[Mult.scala 363:25]
  assign ppg2_6_1_io_neg = be2_6_1_io_neg; // @[Mult.scala 364:25]
  assign ppg2_6_1_io_data = {{14'd0}, b114}; // @[Mult.scala 365:25]
  assign ppg2_6_2_io_weight = be2_6_2_io_weight; // @[Mult.scala 367:25]
  assign ppg2_6_2_io_neg = be2_6_2_io_neg; // @[Mult.scala 368:25]
  assign ppg2_6_2_io_data = {{12'd0}, b116}; // @[Mult.scala 369:25]
  assign ppg2_6_3_io_weight = be2_6_3_io_weight; // @[Mult.scala 371:25]
  assign ppg2_6_3_io_neg = be2_6_3_io_neg; // @[Mult.scala 372:25]
  assign ppg2_6_3_io_data = {{10'd0}, b118}; // @[Mult.scala 373:25]
  assign csa6_0_io_a = ppg2_6_0_io_output; // @[Mult.scala 375:25]
  assign csa6_0_io_b = ppg2_6_1_io_output; // @[Mult.scala 376:25]
  assign csa6_0_io_c = ppg2_6_2_io_output; // @[Mult.scala 377:25]
  assign csa6_1_io_a = csa6_0_io_carry; // @[Mult.scala 379:25]
  assign csa6_1_io_b = csa6_0_io_temp_sum; // @[Mult.scala 380:25]
  assign csa6_1_io_c = ppg2_6_3_io_output; // @[Mult.scala 381:25]
  assign be2_7_0_io_data = {be8_7_io_weight[1:0],1'h0}; // @[Cat.scala 31:58]
  assign be2_7_1_io_data = be8_7_io_weight[3:1]; // @[Mult.scala 387:40]
  assign be2_7_2_io_data = be8_7_io_weight[5:3]; // @[Mult.scala 388:40]
  assign be2_7_3_io_data = be8_7_io_weight[7:5]; // @[Mult.scala 389:40]
  assign ppg2_7_0_io_weight = be2_7_0_io_weight; // @[Mult.scala 391:25]
  assign ppg2_7_0_io_neg = be2_7_0_io_neg; // @[Mult.scala 392:25]
  assign ppg2_7_0_io_data = {{8'd0}, b120}; // @[Mult.scala 393:25]
  assign ppg2_7_1_io_weight = be2_7_1_io_weight; // @[Mult.scala 395:25]
  assign ppg2_7_1_io_neg = be2_7_1_io_neg; // @[Mult.scala 396:25]
  assign ppg2_7_1_io_data = {{6'd0}, b122}; // @[Mult.scala 397:25]
  assign ppg2_7_2_io_weight = be2_7_2_io_weight; // @[Mult.scala 399:25]
  assign ppg2_7_2_io_neg = be2_7_2_io_neg; // @[Mult.scala 400:25]
  assign ppg2_7_2_io_data = {{4'd0}, b124}; // @[Mult.scala 401:25]
  assign ppg2_7_3_io_weight = be2_7_3_io_weight; // @[Mult.scala 403:25]
  assign ppg2_7_3_io_neg = be2_7_3_io_neg; // @[Mult.scala 404:25]
  assign ppg2_7_3_io_data = {{2'd0}, b126}; // @[Mult.scala 405:25]
  assign csa7_0_io_a = ppg2_7_0_io_output; // @[Mult.scala 407:25]
  assign csa7_0_io_b = ppg2_7_1_io_output; // @[Mult.scala 408:25]
  assign csa7_0_io_c = ppg2_7_2_io_output; // @[Mult.scala 409:25]
  assign csa7_1_io_a = csa7_0_io_carry; // @[Mult.scala 411:25]
  assign csa7_1_io_b = csa7_0_io_temp_sum; // @[Mult.scala 412:25]
  assign csa7_1_io_c = ppg2_7_3_io_output; // @[Mult.scala 413:25]
endmodule
