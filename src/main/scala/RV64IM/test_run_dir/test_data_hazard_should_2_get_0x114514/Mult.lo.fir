circuit Mult :
  module BoothEncoder8 :
    input clock : Clock
    input reset : UInt<1>
    input io_data : UInt<9>
    output io_neg : UInt<1>
    output io_weight : UInt<8>

    node _io_weight_tmp_T = bits(io_data, 8, 8) @[Mult.scala 176:19]
    node _io_weight_tmp_T_1 = shl(_io_weight_tmp_T, 7) @[Mult.scala 176:23]
    node _io_weight_tmp_T_2 = not(_io_weight_tmp_T_1) @[Mult.scala 176:13]
    node _io_weight_tmp_T_3 = add(_io_weight_tmp_T_2, UInt<1>("h1")) @[Mult.scala 176:29]
    node _io_weight_tmp_T_4 = tail(_io_weight_tmp_T_3, 1) @[Mult.scala 176:29]
    node _io_weight_tmp_T_5 = bits(io_data, 7, 7) @[Mult.scala 177:18]
    node _io_weight_tmp_T_6 = shl(_io_weight_tmp_T_5, 6) @[Mult.scala 177:22]
    node _io_weight_tmp_T_7 = add(_io_weight_tmp_T_4, _io_weight_tmp_T_6) @[Mult.scala 176:35]
    node _io_weight_tmp_T_8 = tail(_io_weight_tmp_T_7, 1) @[Mult.scala 176:35]
    node _io_weight_tmp_T_9 = bits(io_data, 6, 6) @[Mult.scala 178:18]
    node _io_weight_tmp_T_10 = shl(_io_weight_tmp_T_9, 5) @[Mult.scala 178:22]
    node _io_weight_tmp_T_11 = add(_io_weight_tmp_T_8, _io_weight_tmp_T_10) @[Mult.scala 177:28]
    node _io_weight_tmp_T_12 = tail(_io_weight_tmp_T_11, 1) @[Mult.scala 177:28]
    node _io_weight_tmp_T_13 = bits(io_data, 5, 5) @[Mult.scala 179:18]
    node _io_weight_tmp_T_14 = shl(_io_weight_tmp_T_13, 4) @[Mult.scala 179:22]
    node _io_weight_tmp_T_15 = add(_io_weight_tmp_T_12, _io_weight_tmp_T_14) @[Mult.scala 178:28]
    node _io_weight_tmp_T_16 = tail(_io_weight_tmp_T_15, 1) @[Mult.scala 178:28]
    node _io_weight_tmp_T_17 = bits(io_data, 4, 4) @[Mult.scala 180:18]
    node _io_weight_tmp_T_18 = shl(_io_weight_tmp_T_17, 3) @[Mult.scala 180:22]
    node _io_weight_tmp_T_19 = add(_io_weight_tmp_T_16, _io_weight_tmp_T_18) @[Mult.scala 179:28]
    node _io_weight_tmp_T_20 = tail(_io_weight_tmp_T_19, 1) @[Mult.scala 179:28]
    node _io_weight_tmp_T_21 = bits(io_data, 3, 3) @[Mult.scala 181:18]
    node _io_weight_tmp_T_22 = shl(_io_weight_tmp_T_21, 2) @[Mult.scala 181:22]
    node _io_weight_tmp_T_23 = add(_io_weight_tmp_T_20, _io_weight_tmp_T_22) @[Mult.scala 180:28]
    node _io_weight_tmp_T_24 = tail(_io_weight_tmp_T_23, 1) @[Mult.scala 180:28]
    node _io_weight_tmp_T_25 = bits(io_data, 2, 2) @[Mult.scala 182:18]
    node _io_weight_tmp_T_26 = shl(_io_weight_tmp_T_25, 1) @[Mult.scala 182:22]
    node _io_weight_tmp_T_27 = add(_io_weight_tmp_T_24, _io_weight_tmp_T_26) @[Mult.scala 181:28]
    node _io_weight_tmp_T_28 = tail(_io_weight_tmp_T_27, 1) @[Mult.scala 181:28]
    node _io_weight_tmp_T_29 = bits(io_data, 1, 1) @[Mult.scala 183:17]
    node _io_weight_tmp_T_30 = add(_io_weight_tmp_T_28, _io_weight_tmp_T_29) @[Mult.scala 182:28]
    node _io_weight_tmp_T_31 = tail(_io_weight_tmp_T_30, 1) @[Mult.scala 182:28]
    node _io_weight_tmp_T_32 = bits(io_data, 0, 0) @[Mult.scala 183:27]
    node _io_weight_tmp_T_33 = add(_io_weight_tmp_T_31, _io_weight_tmp_T_32) @[Mult.scala 183:21]
    node io_weight_tmp = tail(_io_weight_tmp_T_33, 1) @[Mult.scala 183:21]
    node _io_weight_T = bits(io_data, 8, 8) @[Mult.scala 184:20]
    node _io_weight_T_1 = sub(UInt<9>("h100"), io_weight_tmp) @[Mult.scala 184:31]
    node _io_weight_T_2 = tail(_io_weight_T_1, 1) @[Mult.scala 184:31]
    node _io_weight_T_3 = mux(_io_weight_T, _io_weight_T_2, io_weight_tmp) @[Mult.scala 184:12]
    node _io_neg_T = bits(io_data, 8, 8) @[Mult.scala 194:29]
    node _io_neg_T_1 = mux(_io_neg_T, UInt<1>("h1"), UInt<1>("h0")) @[Mult.scala 194:21]
    io_neg <= _io_neg_T_1 @[Mult.scala 194:15]
    io_weight <= bits(_io_weight_T_3, 7, 0) @[Mult.scala 193:15]

  module Ppg8 :
    input clock : Clock
    input reset : UInt<1>
    input io_weight : UInt<8>
    input io_data : UInt<128>
    input io_neg : UInt<1>
    output io_output : UInt<128>

    node _tmp_T = not(io_data) @[Mult.scala 159:30]
    node _tmp_T_1 = add(_tmp_T, UInt<1>("h1")) @[Mult.scala 159:41]
    node _tmp_T_2 = tail(_tmp_T_1, 1) @[Mult.scala 159:41]
    node tmp = mux(io_neg, _tmp_T_2, io_data) @[Mult.scala 159:21]
    node _io_output_T = mul(io_weight, tmp) @[Mult.scala 160:28]
    io_output <= bits(_io_output_T, 127, 0) @[Mult.scala 160:15]

  module Csa :
    input clock : Clock
    input reset : UInt<1>
    input io_a : UInt<128>
    input io_b : UInt<128>
    input io_c : UInt<128>
    output io_carry : UInt<128>
    output io_temp_sum : UInt<128>

    node _io_carry_T = and(io_a, io_b) @[Mult.scala 146:24]
    node _io_carry_T_1 = and(io_a, io_c) @[Mult.scala 146:40]
    node _io_carry_T_2 = or(_io_carry_T, _io_carry_T_1) @[Mult.scala 146:32]
    node _io_carry_T_3 = and(io_b, io_c) @[Mult.scala 146:56]
    node _io_carry_T_4 = or(_io_carry_T_2, _io_carry_T_3) @[Mult.scala 146:48]
    node _io_carry_T_5 = shl(_io_carry_T_4, 1) @[Mult.scala 146:65]
    node _io_temp_sum_T = xor(io_a, io_b) @[Mult.scala 147:25]
    node _io_temp_sum_T_1 = xor(_io_temp_sum_T, io_c) @[Mult.scala 147:32]
    io_carry <= bits(_io_carry_T_5, 127, 0) @[Mult.scala 146:14]
    io_temp_sum <= _io_temp_sum_T_1 @[Mult.scala 147:17]

  module Mult :
    input clock : Clock
    input reset : UInt<1>
    input io_a : UInt<64>
    input io_b : UInt<64>
    input io_sign : UInt<1>
    output io_result : UInt<128>
    output io_unsigned : UInt<128>
    output io_signed : SInt<128>

    inst be8_0 of BoothEncoder8 @[Mult.scala 30:23]
    inst be8_1 of BoothEncoder8 @[Mult.scala 31:23]
    inst be8_2 of BoothEncoder8 @[Mult.scala 32:23]
    inst be8_3 of BoothEncoder8 @[Mult.scala 33:23]
    inst be8_4 of BoothEncoder8 @[Mult.scala 34:23]
    inst be8_5 of BoothEncoder8 @[Mult.scala 35:23]
    inst be8_6 of BoothEncoder8 @[Mult.scala 36:23]
    inst be8_7 of BoothEncoder8 @[Mult.scala 37:23]
    inst ppg8_0 of Ppg8 @[Mult.scala 39:24]
    inst ppg8_1 of Ppg8 @[Mult.scala 40:24]
    inst ppg8_2 of Ppg8 @[Mult.scala 41:24]
    inst ppg8_3 of Ppg8 @[Mult.scala 42:24]
    inst ppg8_4 of Ppg8 @[Mult.scala 43:24]
    inst ppg8_5 of Ppg8 @[Mult.scala 44:24]
    inst ppg8_6 of Ppg8 @[Mult.scala 45:24]
    inst ppg8_7 of Ppg8 @[Mult.scala 46:24]
    inst csa0 of Csa @[Mult.scala 48:22]
    inst csa1 of Csa @[Mult.scala 49:22]
    inst csa2 of Csa @[Mult.scala 50:22]
    inst csa3 of Csa @[Mult.scala 51:22]
    inst csa4 of Csa @[Mult.scala 52:22]
    inst csa5 of Csa @[Mult.scala 53:22]
    node _io_unsigned_T = mul(io_a, io_b) @[Mult.scala 25:27]
    node _io_signed_T = asSInt(io_a) @[Mult.scala 26:27]
    node _io_signed_T_1 = asSInt(io_b) @[Mult.scala 26:41]
    node _io_signed_T_2 = mul(_io_signed_T, _io_signed_T_1) @[Mult.scala 26:34]
    node _be8_0_io_data_T = bits(io_a, 7, 0) @[Mult.scala 55:33]
    node _be8_0_io_data_T_1 = cat(_be8_0_io_data_T, UInt<1>("h0")) @[Cat.scala 31:58]
    node _be8_1_io_data_T = bits(io_a, 15, 7) @[Mult.scala 56:29]
    node _be8_2_io_data_T = bits(io_a, 23, 15) @[Mult.scala 57:29]
    node _be8_3_io_data_T = bits(io_a, 31, 23) @[Mult.scala 58:29]
    node _be8_4_io_data_T = bits(io_a, 39, 31) @[Mult.scala 59:29]
    node _be8_5_io_data_T = bits(io_a, 47, 39) @[Mult.scala 60:29]
    node _be8_6_io_data_T = bits(io_a, 55, 47) @[Mult.scala 61:29]
    node _be8_7_io_data_T = bits(io_a, 63, 55) @[Mult.scala 62:29]
    node shift1 = shl(io_b, 8) @[Mult.scala 65:56]
    node shift2 = shl(shift1, 8) @[Mult.scala 65:86]
    node shift3 = shl(shift2, 8) @[Mult.scala 66:26]
    node shift4 = shl(shift3, 8) @[Mult.scala 66:56]
    node shift5 = shl(shift4, 8) @[Mult.scala 66:86]
    node shift6 = shl(shift5, 8) @[Mult.scala 67:26]
    node shift7 = shl(shift6, 8) @[Mult.scala 67:56]
    node _io_result_T = add(csa5.io_temp_sum, csa5.io_carry) @[Mult.scala 127:37]
    node _io_result_T_1 = tail(_io_result_T, 1) @[Mult.scala 127:37]
    io_result <= _io_result_T_1 @[Mult.scala 127:17]
    io_unsigned <= _io_unsigned_T @[Mult.scala 25:19]
    io_signed <= _io_signed_T_2 @[Mult.scala 26:19]
    be8_0.clock <= clock
    be8_0.reset <= reset
    be8_0.io_data <= _be8_0_io_data_T_1 @[Mult.scala 55:21]
    be8_1.clock <= clock
    be8_1.reset <= reset
    be8_1.io_data <= _be8_1_io_data_T @[Mult.scala 56:21]
    be8_2.clock <= clock
    be8_2.reset <= reset
    be8_2.io_data <= _be8_2_io_data_T @[Mult.scala 57:21]
    be8_3.clock <= clock
    be8_3.reset <= reset
    be8_3.io_data <= _be8_3_io_data_T @[Mult.scala 58:21]
    be8_4.clock <= clock
    be8_4.reset <= reset
    be8_4.io_data <= _be8_4_io_data_T @[Mult.scala 59:21]
    be8_5.clock <= clock
    be8_5.reset <= reset
    be8_5.io_data <= _be8_5_io_data_T @[Mult.scala 60:21]
    be8_6.clock <= clock
    be8_6.reset <= reset
    be8_6.io_data <= _be8_6_io_data_T @[Mult.scala 61:21]
    be8_7.clock <= clock
    be8_7.reset <= reset
    be8_7.io_data <= _be8_7_io_data_T @[Mult.scala 62:21]
    ppg8_0.clock <= clock
    ppg8_0.reset <= reset
    ppg8_0.io_weight <= be8_0.io_weight @[Mult.scala 69:25]
    ppg8_0.io_data <= pad(io_b, 128) @[Mult.scala 70:25]
    ppg8_0.io_neg <= be8_0.io_neg @[Mult.scala 71:25]
    ppg8_1.clock <= clock
    ppg8_1.reset <= reset
    ppg8_1.io_weight <= be8_1.io_weight @[Mult.scala 73:25]
    ppg8_1.io_data <= pad(shift1, 128) @[Mult.scala 74:25]
    ppg8_1.io_neg <= be8_1.io_neg @[Mult.scala 75:25]
    ppg8_2.clock <= clock
    ppg8_2.reset <= reset
    ppg8_2.io_weight <= be8_2.io_weight @[Mult.scala 77:25]
    ppg8_2.io_data <= pad(shift2, 128) @[Mult.scala 78:25]
    ppg8_2.io_neg <= be8_2.io_neg @[Mult.scala 79:25]
    ppg8_3.clock <= clock
    ppg8_3.reset <= reset
    ppg8_3.io_weight <= be8_3.io_weight @[Mult.scala 81:25]
    ppg8_3.io_data <= pad(shift3, 128) @[Mult.scala 82:25]
    ppg8_3.io_neg <= be8_3.io_neg @[Mult.scala 83:25]
    ppg8_4.clock <= clock
    ppg8_4.reset <= reset
    ppg8_4.io_weight <= be8_4.io_weight @[Mult.scala 85:25]
    ppg8_4.io_data <= pad(shift4, 128) @[Mult.scala 86:25]
    ppg8_4.io_neg <= be8_4.io_neg @[Mult.scala 87:25]
    ppg8_5.clock <= clock
    ppg8_5.reset <= reset
    ppg8_5.io_weight <= be8_5.io_weight @[Mult.scala 89:25]
    ppg8_5.io_data <= pad(shift5, 128) @[Mult.scala 90:25]
    ppg8_5.io_neg <= be8_5.io_neg @[Mult.scala 91:25]
    ppg8_6.clock <= clock
    ppg8_6.reset <= reset
    ppg8_6.io_weight <= be8_6.io_weight @[Mult.scala 93:25]
    ppg8_6.io_data <= pad(shift6, 128) @[Mult.scala 94:25]
    ppg8_6.io_neg <= be8_6.io_neg @[Mult.scala 95:25]
    ppg8_7.clock <= clock
    ppg8_7.reset <= reset
    ppg8_7.io_weight <= be8_7.io_weight @[Mult.scala 97:25]
    ppg8_7.io_data <= pad(shift7, 128) @[Mult.scala 98:25]
    ppg8_7.io_neg <= be8_7.io_neg @[Mult.scala 99:25]
    csa0.clock <= clock
    csa0.reset <= reset
    csa0.io_a <= ppg8_2.io_output @[Mult.scala 102:17]
    csa0.io_b <= ppg8_1.io_output @[Mult.scala 103:17]
    csa0.io_c <= ppg8_0.io_output @[Mult.scala 104:17]
    csa1.clock <= clock
    csa1.reset <= reset
    csa1.io_a <= ppg8_5.io_output @[Mult.scala 106:17]
    csa1.io_b <= ppg8_4.io_output @[Mult.scala 107:17]
    csa1.io_c <= ppg8_3.io_output @[Mult.scala 108:17]
    csa2.clock <= clock
    csa2.reset <= reset
    csa2.io_a <= ppg8_6.io_output @[Mult.scala 110:17]
    csa2.io_b <= csa1.io_carry @[Mult.scala 111:17]
    csa2.io_c <= csa1.io_temp_sum @[Mult.scala 112:17]
    csa3.clock <= clock
    csa3.reset <= reset
    csa3.io_a <= csa2.io_carry @[Mult.scala 114:17]
    csa3.io_b <= csa0.io_temp_sum @[Mult.scala 115:17]
    csa3.io_c <= csa0.io_carry @[Mult.scala 116:17]
    csa4.clock <= clock
    csa4.reset <= reset
    csa4.io_a <= csa2.io_temp_sum @[Mult.scala 118:17]
    csa4.io_b <= csa3.io_temp_sum @[Mult.scala 119:17]
    csa4.io_c <= csa3.io_carry @[Mult.scala 120:17]
    csa5.clock <= clock
    csa5.reset <= reset
    csa5.io_a <= ppg8_7.io_output @[Mult.scala 122:17]
    csa5.io_b <= csa4.io_temp_sum @[Mult.scala 123:17]
    csa5.io_c <= csa4.io_carry @[Mult.scala 124:17]
