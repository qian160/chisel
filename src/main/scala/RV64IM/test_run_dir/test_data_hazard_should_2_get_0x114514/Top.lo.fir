circuit Top :
  module If :
    input clock : Clock
    input reset : UInt<1>
    input io_reset : UInt<1>
    input io_inst_i : UInt<32>
    output io_pc_o : UInt<64>
    output io_inst_o : UInt<32>

    reg pc : UInt<64>, clock with :
      reset => (UInt<1>("h0"), pc) @[If.scala 15:21]
    node _pc_T = add(pc, UInt<1>("h0")) @[If.scala 20:27]
    node _pc_T_1 = tail(_pc_T, 1) @[If.scala 20:27]
    node _pc_T_2 = add(pc, UInt<3>("h4")) @[If.scala 25:27]
    node _pc_T_3 = tail(_pc_T_2, 1) @[If.scala 25:27]
    node _GEN_0 = mux(io_reset, UInt<1>("h0"), pc) @[If.scala 17:19 18:21 23:21]
    node _GEN_1 = mux(io_reset, UInt<1>("h0"), io_inst_i) @[If.scala 17:19 19:21 24:21]
    node _GEN_2 = mux(io_reset, _pc_T_1, _pc_T_3) @[If.scala 17:19 20:21 25:21]
    io_pc_o <= _GEN_0
    io_inst_o <= _GEN_1
    pc <= mux(reset, UInt<64>("h0"), _GEN_2) @[If.scala 15:{21,21}]

  module Inst_Rom :
    input clock : Clock
    input reset : UInt<1>
    input io_reset : UInt<1>
    input io_addr_i : UInt<64>
    output io_inst_o : UInt<32>

    mem mem : @[Inst_Rom.scala 15:27]
      data-type => UInt<32>
      depth => 8192
      read-latency => 1
      write-latency => 1
      reader => io_inst_o_MPORT
      read-under-write => undefined
    node _io_inst_o_T = shr(io_addr_i, 2) @[Inst_Rom.scala 17:51]
    node _io_inst_o_T_1 = bits(_io_inst_o_T, 12, 0) @[Inst_Rom.scala 17:40]
    node _io_inst_o_T_2 = mux(io_reset, UInt<1>("h0"), mem.io_inst_o_MPORT.data) @[Inst_Rom.scala 17:21]
    io_inst_o <= _io_inst_o_T_2 @[Inst_Rom.scala 17:15]
    mem.io_inst_o_MPORT.addr <= _io_inst_o_T_1 @[Inst_Rom.scala 17:40]
    mem.io_inst_o_MPORT.en <= UInt<1>("h1") @[Inst_Rom.scala 17:40]
    mem.io_inst_o_MPORT.clk <= clock @[Inst_Rom.scala 17:40]

  module Regfile :
    input clock : Clock
    input reset : UInt<1>
    input io_id2Rf_ReadIdx1 : UInt<5>
    input io_id2Rf_ReadIdx2 : UInt<5>
    input io_writeRfOp_en : UInt<1>
    input io_writeRfOp_data : UInt<64>
    input io_writeRfOp_addr : UInt<5>
    output io_rf2Id_RegData1 : UInt<64>
    output io_rf2Id_RegData2 : UInt<64>

    reg rf_0 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), rf_0) @[Regfile.scala 15:24]
    reg rf_1 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), rf_1) @[Regfile.scala 15:24]
    reg rf_2 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), rf_2) @[Regfile.scala 15:24]
    reg rf_3 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), rf_3) @[Regfile.scala 15:24]
    reg rf_4 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), rf_4) @[Regfile.scala 15:24]
    reg rf_5 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), rf_5) @[Regfile.scala 15:24]
    reg rf_6 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), rf_6) @[Regfile.scala 15:24]
    reg rf_7 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), rf_7) @[Regfile.scala 15:24]
    reg rf_8 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), rf_8) @[Regfile.scala 15:24]
    reg rf_9 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), rf_9) @[Regfile.scala 15:24]
    reg rf_10 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), rf_10) @[Regfile.scala 15:24]
    reg rf_11 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), rf_11) @[Regfile.scala 15:24]
    reg rf_12 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), rf_12) @[Regfile.scala 15:24]
    reg rf_13 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), rf_13) @[Regfile.scala 15:24]
    reg rf_14 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), rf_14) @[Regfile.scala 15:24]
    reg rf_15 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), rf_15) @[Regfile.scala 15:24]
    reg rf_16 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), rf_16) @[Regfile.scala 15:24]
    reg rf_17 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), rf_17) @[Regfile.scala 15:24]
    reg rf_18 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), rf_18) @[Regfile.scala 15:24]
    reg rf_19 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), rf_19) @[Regfile.scala 15:24]
    reg rf_20 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), rf_20) @[Regfile.scala 15:24]
    reg rf_21 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), rf_21) @[Regfile.scala 15:24]
    reg rf_22 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), rf_22) @[Regfile.scala 15:24]
    reg rf_23 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), rf_23) @[Regfile.scala 15:24]
    reg rf_24 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), rf_24) @[Regfile.scala 15:24]
    reg rf_25 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), rf_25) @[Regfile.scala 15:24]
    reg rf_26 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), rf_26) @[Regfile.scala 15:24]
    reg rf_27 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), rf_27) @[Regfile.scala 15:24]
    reg rf_28 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), rf_28) @[Regfile.scala 15:24]
    reg rf_29 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), rf_29) @[Regfile.scala 15:24]
    reg rf_30 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), rf_30) @[Regfile.scala 15:24]
    reg latch : UInt<64>, clock with :
      reset => (UInt<1>("h0"), latch) @[Regfile.scala 16:24]
    node _rf_io_writeRfOp_addr = bits(latch, 31, 0) @[Regfile.scala 22:{35,35}]
    node _GEN_0 = mux(eq(UInt<1>("h0"), io_writeRfOp_addr), _rf_io_writeRfOp_addr, UInt<1>("h0")) @[Regfile.scala 17:11 22:{35,35}]
    node _GEN_1 = mux(eq(UInt<1>("h1"), io_writeRfOp_addr), _rf_io_writeRfOp_addr, UInt<17>("h1bf52")) @[Regfile.scala 18:11 22:{35,35}]
    node _GEN_2 = mux(eq(UInt<2>("h2"), io_writeRfOp_addr), _rf_io_writeRfOp_addr, rf_2) @[Regfile.scala 15:24 22:{35,35}]
    node _GEN_3 = mux(eq(UInt<2>("h3"), io_writeRfOp_addr), _rf_io_writeRfOp_addr, rf_3) @[Regfile.scala 15:24 22:{35,35}]
    node _GEN_4 = mux(eq(UInt<3>("h4"), io_writeRfOp_addr), _rf_io_writeRfOp_addr, rf_4) @[Regfile.scala 15:24 22:{35,35}]
    node _GEN_5 = mux(eq(UInt<3>("h5"), io_writeRfOp_addr), _rf_io_writeRfOp_addr, rf_5) @[Regfile.scala 15:24 22:{35,35}]
    node _GEN_6 = mux(eq(UInt<3>("h6"), io_writeRfOp_addr), _rf_io_writeRfOp_addr, rf_6) @[Regfile.scala 15:24 22:{35,35}]
    node _GEN_7 = mux(eq(UInt<3>("h7"), io_writeRfOp_addr), _rf_io_writeRfOp_addr, rf_7) @[Regfile.scala 15:24 22:{35,35}]
    node _GEN_8 = mux(eq(UInt<4>("h8"), io_writeRfOp_addr), _rf_io_writeRfOp_addr, rf_8) @[Regfile.scala 15:24 22:{35,35}]
    node _GEN_9 = mux(eq(UInt<4>("h9"), io_writeRfOp_addr), _rf_io_writeRfOp_addr, rf_9) @[Regfile.scala 15:24 22:{35,35}]
    node _GEN_10 = mux(eq(UInt<4>("ha"), io_writeRfOp_addr), _rf_io_writeRfOp_addr, rf_10) @[Regfile.scala 15:24 22:{35,35}]
    node _GEN_11 = mux(eq(UInt<4>("hb"), io_writeRfOp_addr), _rf_io_writeRfOp_addr, rf_11) @[Regfile.scala 15:24 22:{35,35}]
    node _GEN_12 = mux(eq(UInt<4>("hc"), io_writeRfOp_addr), _rf_io_writeRfOp_addr, rf_12) @[Regfile.scala 15:24 22:{35,35}]
    node _GEN_13 = mux(eq(UInt<4>("hd"), io_writeRfOp_addr), _rf_io_writeRfOp_addr, rf_13) @[Regfile.scala 15:24 22:{35,35}]
    node _GEN_14 = mux(eq(UInt<4>("he"), io_writeRfOp_addr), _rf_io_writeRfOp_addr, rf_14) @[Regfile.scala 15:24 22:{35,35}]
    node _GEN_15 = mux(eq(UInt<4>("hf"), io_writeRfOp_addr), _rf_io_writeRfOp_addr, rf_15) @[Regfile.scala 15:24 22:{35,35}]
    node _GEN_16 = mux(eq(UInt<5>("h10"), io_writeRfOp_addr), _rf_io_writeRfOp_addr, rf_16) @[Regfile.scala 15:24 22:{35,35}]
    node _GEN_17 = mux(eq(UInt<5>("h11"), io_writeRfOp_addr), _rf_io_writeRfOp_addr, rf_17) @[Regfile.scala 15:24 22:{35,35}]
    node _GEN_18 = mux(eq(UInt<5>("h12"), io_writeRfOp_addr), _rf_io_writeRfOp_addr, rf_18) @[Regfile.scala 15:24 22:{35,35}]
    node _GEN_19 = mux(eq(UInt<5>("h13"), io_writeRfOp_addr), _rf_io_writeRfOp_addr, rf_19) @[Regfile.scala 15:24 22:{35,35}]
    node _GEN_20 = mux(eq(UInt<5>("h14"), io_writeRfOp_addr), _rf_io_writeRfOp_addr, rf_20) @[Regfile.scala 15:24 22:{35,35}]
    node _GEN_21 = mux(eq(UInt<5>("h15"), io_writeRfOp_addr), _rf_io_writeRfOp_addr, rf_21) @[Regfile.scala 15:24 22:{35,35}]
    node _GEN_22 = mux(eq(UInt<5>("h16"), io_writeRfOp_addr), _rf_io_writeRfOp_addr, rf_22) @[Regfile.scala 15:24 22:{35,35}]
    node _GEN_23 = mux(eq(UInt<5>("h17"), io_writeRfOp_addr), _rf_io_writeRfOp_addr, rf_23) @[Regfile.scala 15:24 22:{35,35}]
    node _GEN_24 = mux(eq(UInt<5>("h18"), io_writeRfOp_addr), _rf_io_writeRfOp_addr, rf_24) @[Regfile.scala 15:24 22:{35,35}]
    node _GEN_25 = mux(eq(UInt<5>("h19"), io_writeRfOp_addr), _rf_io_writeRfOp_addr, rf_25) @[Regfile.scala 15:24 22:{35,35}]
    node _GEN_26 = mux(eq(UInt<5>("h1a"), io_writeRfOp_addr), _rf_io_writeRfOp_addr, rf_26) @[Regfile.scala 15:24 22:{35,35}]
    node _GEN_27 = mux(eq(UInt<5>("h1b"), io_writeRfOp_addr), _rf_io_writeRfOp_addr, rf_27) @[Regfile.scala 15:24 22:{35,35}]
    node _GEN_28 = mux(eq(UInt<5>("h1c"), io_writeRfOp_addr), _rf_io_writeRfOp_addr, rf_28) @[Regfile.scala 15:24 22:{35,35}]
    node _GEN_29 = mux(eq(UInt<5>("h1d"), io_writeRfOp_addr), _rf_io_writeRfOp_addr, rf_29) @[Regfile.scala 15:24 22:{35,35}]
    node _GEN_30 = mux(eq(UInt<5>("h1e"), io_writeRfOp_addr), _rf_io_writeRfOp_addr, rf_30) @[Regfile.scala 15:24 22:{35,35}]
    node _GEN_31 = mux(io_writeRfOp_en, _GEN_0, UInt<1>("h0")) @[Regfile.scala 17:11 20:26]
    node _GEN_32 = mux(io_writeRfOp_en, _GEN_1, UInt<17>("h1bf52")) @[Regfile.scala 18:11 20:26]
    node _GEN_33 = mux(io_writeRfOp_en, _GEN_2, rf_2) @[Regfile.scala 15:24 20:26]
    node _GEN_34 = mux(io_writeRfOp_en, _GEN_3, rf_3) @[Regfile.scala 15:24 20:26]
    node _GEN_35 = mux(io_writeRfOp_en, _GEN_4, rf_4) @[Regfile.scala 15:24 20:26]
    node _GEN_36 = mux(io_writeRfOp_en, _GEN_5, rf_5) @[Regfile.scala 15:24 20:26]
    node _GEN_37 = mux(io_writeRfOp_en, _GEN_6, rf_6) @[Regfile.scala 15:24 20:26]
    node _GEN_38 = mux(io_writeRfOp_en, _GEN_7, rf_7) @[Regfile.scala 15:24 20:26]
    node _GEN_39 = mux(io_writeRfOp_en, _GEN_8, rf_8) @[Regfile.scala 15:24 20:26]
    node _GEN_40 = mux(io_writeRfOp_en, _GEN_9, rf_9) @[Regfile.scala 15:24 20:26]
    node _GEN_41 = mux(io_writeRfOp_en, _GEN_10, rf_10) @[Regfile.scala 15:24 20:26]
    node _GEN_42 = mux(io_writeRfOp_en, _GEN_11, rf_11) @[Regfile.scala 15:24 20:26]
    node _GEN_43 = mux(io_writeRfOp_en, _GEN_12, rf_12) @[Regfile.scala 15:24 20:26]
    node _GEN_44 = mux(io_writeRfOp_en, _GEN_13, rf_13) @[Regfile.scala 15:24 20:26]
    node _GEN_45 = mux(io_writeRfOp_en, _GEN_14, rf_14) @[Regfile.scala 15:24 20:26]
    node _GEN_46 = mux(io_writeRfOp_en, _GEN_15, rf_15) @[Regfile.scala 15:24 20:26]
    node _GEN_47 = mux(io_writeRfOp_en, _GEN_16, rf_16) @[Regfile.scala 15:24 20:26]
    node _GEN_48 = mux(io_writeRfOp_en, _GEN_17, rf_17) @[Regfile.scala 15:24 20:26]
    node _GEN_49 = mux(io_writeRfOp_en, _GEN_18, rf_18) @[Regfile.scala 15:24 20:26]
    node _GEN_50 = mux(io_writeRfOp_en, _GEN_19, rf_19) @[Regfile.scala 15:24 20:26]
    node _GEN_51 = mux(io_writeRfOp_en, _GEN_20, rf_20) @[Regfile.scala 15:24 20:26]
    node _GEN_52 = mux(io_writeRfOp_en, _GEN_21, rf_21) @[Regfile.scala 15:24 20:26]
    node _GEN_53 = mux(io_writeRfOp_en, _GEN_22, rf_22) @[Regfile.scala 15:24 20:26]
    node _GEN_54 = mux(io_writeRfOp_en, _GEN_23, rf_23) @[Regfile.scala 15:24 20:26]
    node _GEN_55 = mux(io_writeRfOp_en, _GEN_24, rf_24) @[Regfile.scala 15:24 20:26]
    node _GEN_56 = mux(io_writeRfOp_en, _GEN_25, rf_25) @[Regfile.scala 15:24 20:26]
    node _GEN_57 = mux(io_writeRfOp_en, _GEN_26, rf_26) @[Regfile.scala 15:24 20:26]
    node _GEN_58 = mux(io_writeRfOp_en, _GEN_27, rf_27) @[Regfile.scala 15:24 20:26]
    node _GEN_59 = mux(io_writeRfOp_en, _GEN_28, rf_28) @[Regfile.scala 15:24 20:26]
    node _GEN_60 = mux(io_writeRfOp_en, _GEN_29, rf_29) @[Regfile.scala 15:24 20:26]
    node _GEN_61 = mux(io_writeRfOp_en, _GEN_30, rf_30) @[Regfile.scala 15:24 20:26]
    node _GEN_62 = validif(eq(UInt<1>("h0"), io_id2Rf_ReadIdx1), rf_0) @[Regfile.scala 25:{23,23}]
    node _GEN_63 = mux(eq(UInt<1>("h1"), io_id2Rf_ReadIdx1), rf_1, _GEN_62) @[Regfile.scala 25:{23,23}]
    node _GEN_64 = mux(eq(UInt<2>("h2"), io_id2Rf_ReadIdx1), rf_2, _GEN_63) @[Regfile.scala 25:{23,23}]
    node _GEN_65 = mux(eq(UInt<2>("h3"), io_id2Rf_ReadIdx1), rf_3, _GEN_64) @[Regfile.scala 25:{23,23}]
    node _GEN_66 = mux(eq(UInt<3>("h4"), io_id2Rf_ReadIdx1), rf_4, _GEN_65) @[Regfile.scala 25:{23,23}]
    node _GEN_67 = mux(eq(UInt<3>("h5"), io_id2Rf_ReadIdx1), rf_5, _GEN_66) @[Regfile.scala 25:{23,23}]
    node _GEN_68 = mux(eq(UInt<3>("h6"), io_id2Rf_ReadIdx1), rf_6, _GEN_67) @[Regfile.scala 25:{23,23}]
    node _GEN_69 = mux(eq(UInt<3>("h7"), io_id2Rf_ReadIdx1), rf_7, _GEN_68) @[Regfile.scala 25:{23,23}]
    node _GEN_70 = mux(eq(UInt<4>("h8"), io_id2Rf_ReadIdx1), rf_8, _GEN_69) @[Regfile.scala 25:{23,23}]
    node _GEN_71 = mux(eq(UInt<4>("h9"), io_id2Rf_ReadIdx1), rf_9, _GEN_70) @[Regfile.scala 25:{23,23}]
    node _GEN_72 = mux(eq(UInt<4>("ha"), io_id2Rf_ReadIdx1), rf_10, _GEN_71) @[Regfile.scala 25:{23,23}]
    node _GEN_73 = mux(eq(UInt<4>("hb"), io_id2Rf_ReadIdx1), rf_11, _GEN_72) @[Regfile.scala 25:{23,23}]
    node _GEN_74 = mux(eq(UInt<4>("hc"), io_id2Rf_ReadIdx1), rf_12, _GEN_73) @[Regfile.scala 25:{23,23}]
    node _GEN_75 = mux(eq(UInt<4>("hd"), io_id2Rf_ReadIdx1), rf_13, _GEN_74) @[Regfile.scala 25:{23,23}]
    node _GEN_76 = mux(eq(UInt<4>("he"), io_id2Rf_ReadIdx1), rf_14, _GEN_75) @[Regfile.scala 25:{23,23}]
    node _GEN_77 = mux(eq(UInt<4>("hf"), io_id2Rf_ReadIdx1), rf_15, _GEN_76) @[Regfile.scala 25:{23,23}]
    node _GEN_78 = mux(eq(UInt<5>("h10"), io_id2Rf_ReadIdx1), rf_16, _GEN_77) @[Regfile.scala 25:{23,23}]
    node _GEN_79 = mux(eq(UInt<5>("h11"), io_id2Rf_ReadIdx1), rf_17, _GEN_78) @[Regfile.scala 25:{23,23}]
    node _GEN_80 = mux(eq(UInt<5>("h12"), io_id2Rf_ReadIdx1), rf_18, _GEN_79) @[Regfile.scala 25:{23,23}]
    node _GEN_81 = mux(eq(UInt<5>("h13"), io_id2Rf_ReadIdx1), rf_19, _GEN_80) @[Regfile.scala 25:{23,23}]
    node _GEN_82 = mux(eq(UInt<5>("h14"), io_id2Rf_ReadIdx1), rf_20, _GEN_81) @[Regfile.scala 25:{23,23}]
    node _GEN_83 = mux(eq(UInt<5>("h15"), io_id2Rf_ReadIdx1), rf_21, _GEN_82) @[Regfile.scala 25:{23,23}]
    node _GEN_84 = mux(eq(UInt<5>("h16"), io_id2Rf_ReadIdx1), rf_22, _GEN_83) @[Regfile.scala 25:{23,23}]
    node _GEN_85 = mux(eq(UInt<5>("h17"), io_id2Rf_ReadIdx1), rf_23, _GEN_84) @[Regfile.scala 25:{23,23}]
    node _GEN_86 = mux(eq(UInt<5>("h18"), io_id2Rf_ReadIdx1), rf_24, _GEN_85) @[Regfile.scala 25:{23,23}]
    node _GEN_87 = mux(eq(UInt<5>("h19"), io_id2Rf_ReadIdx1), rf_25, _GEN_86) @[Regfile.scala 25:{23,23}]
    node _GEN_88 = mux(eq(UInt<5>("h1a"), io_id2Rf_ReadIdx1), rf_26, _GEN_87) @[Regfile.scala 25:{23,23}]
    node _GEN_89 = mux(eq(UInt<5>("h1b"), io_id2Rf_ReadIdx1), rf_27, _GEN_88) @[Regfile.scala 25:{23,23}]
    node _GEN_90 = mux(eq(UInt<5>("h1c"), io_id2Rf_ReadIdx1), rf_28, _GEN_89) @[Regfile.scala 25:{23,23}]
    node _GEN_91 = mux(eq(UInt<5>("h1d"), io_id2Rf_ReadIdx1), rf_29, _GEN_90) @[Regfile.scala 25:{23,23}]
    node _GEN_92 = mux(eq(UInt<5>("h1e"), io_id2Rf_ReadIdx1), rf_30, _GEN_91) @[Regfile.scala 25:{23,23}]
    node _GEN_93 = validif(eq(UInt<1>("h0"), io_id2Rf_ReadIdx2), rf_0) @[Regfile.scala 26:{23,23}]
    node _GEN_94 = mux(eq(UInt<1>("h1"), io_id2Rf_ReadIdx2), rf_1, _GEN_93) @[Regfile.scala 26:{23,23}]
    node _GEN_95 = mux(eq(UInt<2>("h2"), io_id2Rf_ReadIdx2), rf_2, _GEN_94) @[Regfile.scala 26:{23,23}]
    node _GEN_96 = mux(eq(UInt<2>("h3"), io_id2Rf_ReadIdx2), rf_3, _GEN_95) @[Regfile.scala 26:{23,23}]
    node _GEN_97 = mux(eq(UInt<3>("h4"), io_id2Rf_ReadIdx2), rf_4, _GEN_96) @[Regfile.scala 26:{23,23}]
    node _GEN_98 = mux(eq(UInt<3>("h5"), io_id2Rf_ReadIdx2), rf_5, _GEN_97) @[Regfile.scala 26:{23,23}]
    node _GEN_99 = mux(eq(UInt<3>("h6"), io_id2Rf_ReadIdx2), rf_6, _GEN_98) @[Regfile.scala 26:{23,23}]
    node _GEN_100 = mux(eq(UInt<3>("h7"), io_id2Rf_ReadIdx2), rf_7, _GEN_99) @[Regfile.scala 26:{23,23}]
    node _GEN_101 = mux(eq(UInt<4>("h8"), io_id2Rf_ReadIdx2), rf_8, _GEN_100) @[Regfile.scala 26:{23,23}]
    node _GEN_102 = mux(eq(UInt<4>("h9"), io_id2Rf_ReadIdx2), rf_9, _GEN_101) @[Regfile.scala 26:{23,23}]
    node _GEN_103 = mux(eq(UInt<4>("ha"), io_id2Rf_ReadIdx2), rf_10, _GEN_102) @[Regfile.scala 26:{23,23}]
    node _GEN_104 = mux(eq(UInt<4>("hb"), io_id2Rf_ReadIdx2), rf_11, _GEN_103) @[Regfile.scala 26:{23,23}]
    node _GEN_105 = mux(eq(UInt<4>("hc"), io_id2Rf_ReadIdx2), rf_12, _GEN_104) @[Regfile.scala 26:{23,23}]
    node _GEN_106 = mux(eq(UInt<4>("hd"), io_id2Rf_ReadIdx2), rf_13, _GEN_105) @[Regfile.scala 26:{23,23}]
    node _GEN_107 = mux(eq(UInt<4>("he"), io_id2Rf_ReadIdx2), rf_14, _GEN_106) @[Regfile.scala 26:{23,23}]
    node _GEN_108 = mux(eq(UInt<4>("hf"), io_id2Rf_ReadIdx2), rf_15, _GEN_107) @[Regfile.scala 26:{23,23}]
    node _GEN_109 = mux(eq(UInt<5>("h10"), io_id2Rf_ReadIdx2), rf_16, _GEN_108) @[Regfile.scala 26:{23,23}]
    node _GEN_110 = mux(eq(UInt<5>("h11"), io_id2Rf_ReadIdx2), rf_17, _GEN_109) @[Regfile.scala 26:{23,23}]
    node _GEN_111 = mux(eq(UInt<5>("h12"), io_id2Rf_ReadIdx2), rf_18, _GEN_110) @[Regfile.scala 26:{23,23}]
    node _GEN_112 = mux(eq(UInt<5>("h13"), io_id2Rf_ReadIdx2), rf_19, _GEN_111) @[Regfile.scala 26:{23,23}]
    node _GEN_113 = mux(eq(UInt<5>("h14"), io_id2Rf_ReadIdx2), rf_20, _GEN_112) @[Regfile.scala 26:{23,23}]
    node _GEN_114 = mux(eq(UInt<5>("h15"), io_id2Rf_ReadIdx2), rf_21, _GEN_113) @[Regfile.scala 26:{23,23}]
    node _GEN_115 = mux(eq(UInt<5>("h16"), io_id2Rf_ReadIdx2), rf_22, _GEN_114) @[Regfile.scala 26:{23,23}]
    node _GEN_116 = mux(eq(UInt<5>("h17"), io_id2Rf_ReadIdx2), rf_23, _GEN_115) @[Regfile.scala 26:{23,23}]
    node _GEN_117 = mux(eq(UInt<5>("h18"), io_id2Rf_ReadIdx2), rf_24, _GEN_116) @[Regfile.scala 26:{23,23}]
    node _GEN_118 = mux(eq(UInt<5>("h19"), io_id2Rf_ReadIdx2), rf_25, _GEN_117) @[Regfile.scala 26:{23,23}]
    node _GEN_119 = mux(eq(UInt<5>("h1a"), io_id2Rf_ReadIdx2), rf_26, _GEN_118) @[Regfile.scala 26:{23,23}]
    node _GEN_120 = mux(eq(UInt<5>("h1b"), io_id2Rf_ReadIdx2), rf_27, _GEN_119) @[Regfile.scala 26:{23,23}]
    node _GEN_121 = mux(eq(UInt<5>("h1c"), io_id2Rf_ReadIdx2), rf_28, _GEN_120) @[Regfile.scala 26:{23,23}]
    node _GEN_122 = mux(eq(UInt<5>("h1d"), io_id2Rf_ReadIdx2), rf_29, _GEN_121) @[Regfile.scala 26:{23,23}]
    node _GEN_123 = mux(eq(UInt<5>("h1e"), io_id2Rf_ReadIdx2), rf_30, _GEN_122) @[Regfile.scala 26:{23,23}]
    node _rf_WIRE_0 = UInt<32>("h0") @[Regfile.scala 15:{32,32}]
    node _rf_WIRE_1 = UInt<32>("h0") @[Regfile.scala 15:{32,32}]
    node _rf_WIRE_2 = UInt<32>("h0") @[Regfile.scala 15:{32,32}]
    node _rf_WIRE_3 = UInt<32>("h0") @[Regfile.scala 15:{32,32}]
    node _rf_WIRE_4 = UInt<32>("h0") @[Regfile.scala 15:{32,32}]
    node _rf_WIRE_5 = UInt<32>("h0") @[Regfile.scala 15:{32,32}]
    node _rf_WIRE_6 = UInt<32>("h0") @[Regfile.scala 15:{32,32}]
    node _rf_WIRE_7 = UInt<32>("h0") @[Regfile.scala 15:{32,32}]
    node _rf_WIRE_8 = UInt<32>("h0") @[Regfile.scala 15:{32,32}]
    node _rf_WIRE_9 = UInt<32>("h0") @[Regfile.scala 15:{32,32}]
    node _rf_WIRE_10 = UInt<32>("h0") @[Regfile.scala 15:{32,32}]
    node _rf_WIRE_11 = UInt<32>("h0") @[Regfile.scala 15:{32,32}]
    node _rf_WIRE_12 = UInt<32>("h0") @[Regfile.scala 15:{32,32}]
    node _rf_WIRE_13 = UInt<32>("h0") @[Regfile.scala 15:{32,32}]
    node _rf_WIRE_14 = UInt<32>("h0") @[Regfile.scala 15:{32,32}]
    node _rf_WIRE_15 = UInt<32>("h0") @[Regfile.scala 15:{32,32}]
    node _rf_WIRE_16 = UInt<32>("h0") @[Regfile.scala 15:{32,32}]
    node _rf_WIRE_17 = UInt<32>("h0") @[Regfile.scala 15:{32,32}]
    node _rf_WIRE_18 = UInt<32>("h0") @[Regfile.scala 15:{32,32}]
    node _rf_WIRE_19 = UInt<32>("h0") @[Regfile.scala 15:{32,32}]
    node _rf_WIRE_20 = UInt<32>("h0") @[Regfile.scala 15:{32,32}]
    node _rf_WIRE_21 = UInt<32>("h0") @[Regfile.scala 15:{32,32}]
    node _rf_WIRE_22 = UInt<32>("h0") @[Regfile.scala 15:{32,32}]
    node _rf_WIRE_23 = UInt<32>("h0") @[Regfile.scala 15:{32,32}]
    node _rf_WIRE_24 = UInt<32>("h0") @[Regfile.scala 15:{32,32}]
    node _rf_WIRE_25 = UInt<32>("h0") @[Regfile.scala 15:{32,32}]
    node _rf_WIRE_26 = UInt<32>("h0") @[Regfile.scala 15:{32,32}]
    node _rf_WIRE_27 = UInt<32>("h0") @[Regfile.scala 15:{32,32}]
    node _rf_WIRE_28 = UInt<32>("h0") @[Regfile.scala 15:{32,32}]
    node _rf_WIRE_29 = UInt<32>("h0") @[Regfile.scala 15:{32,32}]
    node _rf_WIRE_30 = UInt<32>("h0") @[Regfile.scala 15:{32,32}]
    node _rf_io_id2Rf_ReadIdx1 = _GEN_92 @[Regfile.scala 25:23]
    node _rf_io_id2Rf_ReadIdx2 = _GEN_123 @[Regfile.scala 26:23]
    io_rf2Id_RegData1 <= pad(_rf_io_id2Rf_ReadIdx1, 64) @[Regfile.scala 25:23]
    io_rf2Id_RegData2 <= pad(_rf_io_id2Rf_ReadIdx2, 64) @[Regfile.scala 26:23]
    rf_0 <= mux(reset, _rf_WIRE_0, _GEN_31) @[Regfile.scala 15:{24,24}]
    rf_1 <= mux(reset, _rf_WIRE_1, _GEN_32) @[Regfile.scala 15:{24,24}]
    rf_2 <= mux(reset, _rf_WIRE_2, _GEN_33) @[Regfile.scala 15:{24,24}]
    rf_3 <= mux(reset, _rf_WIRE_3, _GEN_34) @[Regfile.scala 15:{24,24}]
    rf_4 <= mux(reset, _rf_WIRE_4, _GEN_35) @[Regfile.scala 15:{24,24}]
    rf_5 <= mux(reset, _rf_WIRE_5, _GEN_36) @[Regfile.scala 15:{24,24}]
    rf_6 <= mux(reset, _rf_WIRE_6, _GEN_37) @[Regfile.scala 15:{24,24}]
    rf_7 <= mux(reset, _rf_WIRE_7, _GEN_38) @[Regfile.scala 15:{24,24}]
    rf_8 <= mux(reset, _rf_WIRE_8, _GEN_39) @[Regfile.scala 15:{24,24}]
    rf_9 <= mux(reset, _rf_WIRE_9, _GEN_40) @[Regfile.scala 15:{24,24}]
    rf_10 <= mux(reset, _rf_WIRE_10, _GEN_41) @[Regfile.scala 15:{24,24}]
    rf_11 <= mux(reset, _rf_WIRE_11, _GEN_42) @[Regfile.scala 15:{24,24}]
    rf_12 <= mux(reset, _rf_WIRE_12, _GEN_43) @[Regfile.scala 15:{24,24}]
    rf_13 <= mux(reset, _rf_WIRE_13, _GEN_44) @[Regfile.scala 15:{24,24}]
    rf_14 <= mux(reset, _rf_WIRE_14, _GEN_45) @[Regfile.scala 15:{24,24}]
    rf_15 <= mux(reset, _rf_WIRE_15, _GEN_46) @[Regfile.scala 15:{24,24}]
    rf_16 <= mux(reset, _rf_WIRE_16, _GEN_47) @[Regfile.scala 15:{24,24}]
    rf_17 <= mux(reset, _rf_WIRE_17, _GEN_48) @[Regfile.scala 15:{24,24}]
    rf_18 <= mux(reset, _rf_WIRE_18, _GEN_49) @[Regfile.scala 15:{24,24}]
    rf_19 <= mux(reset, _rf_WIRE_19, _GEN_50) @[Regfile.scala 15:{24,24}]
    rf_20 <= mux(reset, _rf_WIRE_20, _GEN_51) @[Regfile.scala 15:{24,24}]
    rf_21 <= mux(reset, _rf_WIRE_21, _GEN_52) @[Regfile.scala 15:{24,24}]
    rf_22 <= mux(reset, _rf_WIRE_22, _GEN_53) @[Regfile.scala 15:{24,24}]
    rf_23 <= mux(reset, _rf_WIRE_23, _GEN_54) @[Regfile.scala 15:{24,24}]
    rf_24 <= mux(reset, _rf_WIRE_24, _GEN_55) @[Regfile.scala 15:{24,24}]
    rf_25 <= mux(reset, _rf_WIRE_25, _GEN_56) @[Regfile.scala 15:{24,24}]
    rf_26 <= mux(reset, _rf_WIRE_26, _GEN_57) @[Regfile.scala 15:{24,24}]
    rf_27 <= mux(reset, _rf_WIRE_27, _GEN_58) @[Regfile.scala 15:{24,24}]
    rf_28 <= mux(reset, _rf_WIRE_28, _GEN_59) @[Regfile.scala 15:{24,24}]
    rf_29 <= mux(reset, _rf_WIRE_29, _GEN_60) @[Regfile.scala 15:{24,24}]
    rf_30 <= mux(reset, _rf_WIRE_30, _GEN_61) @[Regfile.scala 15:{24,24}]
    latch <= io_writeRfOp_data @[Regfile.scala 16:24]

  module If_Id :
    input clock : Clock
    input reset : UInt<1>
    input io_reset : UInt<1>
    input io_if_inst_i : UInt<32>
    output io_if_inst_o : UInt<32>

    reg inst : UInt<32>, clock with :
      reset => (UInt<1>("h0"), inst) @[If_Id.scala 13:23]
    node _GEN_0 = mux(io_reset, UInt<1>("h0"), inst) @[If_Id.scala 15:19 16:22 18:22]
    io_if_inst_o <= _GEN_0
    inst <= io_if_inst_i @[If_Id.scala 13:23]

  module Id :
    input clock : Clock
    input reset : UInt<1>
    input io_id_inst_i : UInt<32>
    input io_rf2Id_RegData1 : UInt<64>
    input io_rf2Id_RegData2 : UInt<64>
    input io_exForwarding_addr : UInt<5>
    input io_exForwarding_data : UInt<64>
    input io_memForwarding_addr : UInt<5>
    input io_memForwarding_data : UInt<64>
    input io_wbForwarding_addr : UInt<5>
    input io_wbForwarding_data : UInt<64>
    output io_id2Rf_ReadIdx1 : UInt<5>
    output io_id2Rf_ReadIdx2 : UInt<5>
    output io_exInfo_oprand1 : UInt<64>
    output io_exInfo_oprand2 : UInt<64>
    output io_exInfo_rd : UInt<5>
    output io_exInfo_wreg : UInt<1>
    output io_exInfo_opcode : UInt<7>
    output io_exInfo_aluop : UInt<5>
    output io_rs1 : UInt<64>
    output io_rs2 : UInt<64>

    node rd = bits(io_id_inst_i, 11, 7) @[Id.scala 37:24]
    node rs1 = bits(io_id_inst_i, 19, 15) @[Id.scala 38:24]
    node rs2 = bits(io_id_inst_i, 24, 20) @[Id.scala 39:24]
    node _decRes_T = and(io_id_inst_i, UInt<15>("h707f")) @[Lookup.scala 31:38]
    node _decRes_T_1 = eq(UInt<5>("h13"), _decRes_T) @[Lookup.scala 31:38]
    node _decRes_T_2 = and(io_id_inst_i, UInt<15>("h707f")) @[Lookup.scala 31:38]
    node _decRes_T_3 = eq(UInt<14>("h2013"), _decRes_T_2) @[Lookup.scala 31:38]
    node _decRes_T_4 = and(io_id_inst_i, UInt<15>("h707f")) @[Lookup.scala 31:38]
    node _decRes_T_5 = eq(UInt<14>("h3013"), _decRes_T_4) @[Lookup.scala 31:38]
    node _decRes_T_6 = and(io_id_inst_i, UInt<15>("h707f")) @[Lookup.scala 31:38]
    node _decRes_T_7 = eq(UInt<15>("h4013"), _decRes_T_6) @[Lookup.scala 31:38]
    node _decRes_T_8 = and(io_id_inst_i, UInt<15>("h707f")) @[Lookup.scala 31:38]
    node _decRes_T_9 = eq(UInt<15>("h6013"), _decRes_T_8) @[Lookup.scala 31:38]
    node _decRes_T_10 = and(io_id_inst_i, UInt<15>("h707f")) @[Lookup.scala 31:38]
    node _decRes_T_11 = eq(UInt<15>("h7013"), _decRes_T_10) @[Lookup.scala 31:38]
    node _decRes_T_12 = and(io_id_inst_i, UInt<32>("hfe00707f")) @[Lookup.scala 31:38]
    node _decRes_T_13 = eq(UInt<13>("h1013"), _decRes_T_12) @[Lookup.scala 31:38]
    node _decRes_T_14 = and(io_id_inst_i, UInt<32>("hfe00707f")) @[Lookup.scala 31:38]
    node _decRes_T_15 = eq(UInt<15>("h5013"), _decRes_T_14) @[Lookup.scala 31:38]
    node _decRes_T_16 = and(io_id_inst_i, UInt<32>("hfe00707f")) @[Lookup.scala 31:38]
    node _decRes_T_17 = eq(UInt<31>("h40005013"), _decRes_T_16) @[Lookup.scala 31:38]
    node _decRes_T_18 = and(io_id_inst_i, UInt<15>("h707f")) @[Lookup.scala 31:38]
    node _decRes_T_19 = eq(UInt<2>("h3"), _decRes_T_18) @[Lookup.scala 31:38]
    node _decRes_T_20 = and(io_id_inst_i, UInt<15>("h707f")) @[Lookup.scala 31:38]
    node _decRes_T_21 = eq(UInt<13>("h1003"), _decRes_T_20) @[Lookup.scala 31:38]
    node _decRes_T_22 = and(io_id_inst_i, UInt<15>("h707f")) @[Lookup.scala 31:38]
    node _decRes_T_23 = eq(UInt<14>("h2003"), _decRes_T_22) @[Lookup.scala 31:38]
    node _decRes_T_24 = and(io_id_inst_i, UInt<15>("h707f")) @[Lookup.scala 31:38]
    node _decRes_T_25 = eq(UInt<15>("h4003"), _decRes_T_24) @[Lookup.scala 31:38]
    node _decRes_T_26 = and(io_id_inst_i, UInt<15>("h707f")) @[Lookup.scala 31:38]
    node _decRes_T_27 = eq(UInt<15>("h5003"), _decRes_T_26) @[Lookup.scala 31:38]
    node _decRes_T_28 = and(io_id_inst_i, UInt<32>("hfe00707f")) @[Lookup.scala 31:38]
    node _decRes_T_29 = eq(UInt<6>("h33"), _decRes_T_28) @[Lookup.scala 31:38]
    node _decRes_T_30 = and(io_id_inst_i, UInt<32>("hfe00707f")) @[Lookup.scala 31:38]
    node _decRes_T_31 = eq(UInt<31>("h40000033"), _decRes_T_30) @[Lookup.scala 31:38]
    node _decRes_T_32 = and(io_id_inst_i, UInt<32>("hfe00707f")) @[Lookup.scala 31:38]
    node _decRes_T_33 = eq(UInt<13>("h1033"), _decRes_T_32) @[Lookup.scala 31:38]
    node _decRes_T_34 = and(io_id_inst_i, UInt<32>("hfe00707f")) @[Lookup.scala 31:38]
    node _decRes_T_35 = eq(UInt<14>("h2033"), _decRes_T_34) @[Lookup.scala 31:38]
    node _decRes_T_36 = and(io_id_inst_i, UInt<32>("hfe00707f")) @[Lookup.scala 31:38]
    node _decRes_T_37 = eq(UInt<14>("h3033"), _decRes_T_36) @[Lookup.scala 31:38]
    node _decRes_T_38 = and(io_id_inst_i, UInt<32>("hfe00707f")) @[Lookup.scala 31:38]
    node _decRes_T_39 = eq(UInt<15>("h4033"), _decRes_T_38) @[Lookup.scala 31:38]
    node _decRes_T_40 = and(io_id_inst_i, UInt<32>("hfe00707f")) @[Lookup.scala 31:38]
    node _decRes_T_41 = eq(UInt<15>("h5033"), _decRes_T_40) @[Lookup.scala 31:38]
    node _decRes_T_42 = and(io_id_inst_i, UInt<32>("hfe00707f")) @[Lookup.scala 31:38]
    node _decRes_T_43 = eq(UInt<31>("h40005033"), _decRes_T_42) @[Lookup.scala 31:38]
    node _decRes_T_44 = and(io_id_inst_i, UInt<32>("hfe00707f")) @[Lookup.scala 31:38]
    node _decRes_T_45 = eq(UInt<15>("h6033"), _decRes_T_44) @[Lookup.scala 31:38]
    node _decRes_T_46 = and(io_id_inst_i, UInt<32>("hfe00707f")) @[Lookup.scala 31:38]
    node _decRes_T_47 = eq(UInt<15>("h7033"), _decRes_T_46) @[Lookup.scala 31:38]
    node _decRes_T_48 = and(io_id_inst_i, UInt<32>("hfe00707f")) @[Lookup.scala 31:38]
    node _decRes_T_49 = eq(UInt<26>("h2000033"), _decRes_T_48) @[Lookup.scala 31:38]
    node _decRes_T_50 = and(io_id_inst_i, UInt<32>("hfe00707f")) @[Lookup.scala 31:38]
    node _decRes_T_51 = eq(UInt<26>("h2001033"), _decRes_T_50) @[Lookup.scala 31:38]
    node _decRes_T_52 = and(io_id_inst_i, UInt<32>("hfe00707f")) @[Lookup.scala 31:38]
    node _decRes_T_53 = eq(UInt<26>("h2002033"), _decRes_T_52) @[Lookup.scala 31:38]
    node _decRes_T_54 = and(io_id_inst_i, UInt<32>("hfe00707f")) @[Lookup.scala 31:38]
    node _decRes_T_55 = eq(UInt<26>("h2004033"), _decRes_T_54) @[Lookup.scala 31:38]
    node _decRes_T_56 = and(io_id_inst_i, UInt<32>("hfe00707f")) @[Lookup.scala 31:38]
    node _decRes_T_57 = eq(UInt<26>("h2005033"), _decRes_T_56) @[Lookup.scala 31:38]
    node _decRes_T_58 = and(io_id_inst_i, UInt<32>("hfe00707f")) @[Lookup.scala 31:38]
    node _decRes_T_59 = eq(UInt<26>("h2006033"), _decRes_T_58) @[Lookup.scala 31:38]
    node _decRes_T_60 = and(io_id_inst_i, UInt<32>("hfe00707f")) @[Lookup.scala 31:38]
    node _decRes_T_61 = eq(UInt<26>("h2007033"), _decRes_T_60) @[Lookup.scala 31:38]
    node _decRes_T_62 = and(io_id_inst_i, UInt<15>("h707f")) @[Lookup.scala 31:38]
    node _decRes_T_63 = eq(UInt<6>("h23"), _decRes_T_62) @[Lookup.scala 31:38]
    node _decRes_T_64 = and(io_id_inst_i, UInt<15>("h707f")) @[Lookup.scala 31:38]
    node _decRes_T_65 = eq(UInt<13>("h1023"), _decRes_T_64) @[Lookup.scala 31:38]
    node _decRes_T_66 = and(io_id_inst_i, UInt<15>("h707f")) @[Lookup.scala 31:38]
    node _decRes_T_67 = eq(UInt<14>("h2023"), _decRes_T_66) @[Lookup.scala 31:38]
    node _decRes_T_68 = mux(_decRes_T_67, UInt<4>("h3"), UInt<4>("h0")) @[Lookup.scala 34:39]
    node _decRes_T_69 = mux(_decRes_T_65, UInt<4>("h3"), _decRes_T_68) @[Lookup.scala 34:39]
    node _decRes_T_70 = mux(_decRes_T_63, UInt<4>("h3"), _decRes_T_69) @[Lookup.scala 34:39]
    node _decRes_T_71 = mux(_decRes_T_61, UInt<4>("h1"), _decRes_T_70) @[Lookup.scala 34:39]
    node _decRes_T_72 = mux(_decRes_T_59, UInt<4>("h1"), _decRes_T_71) @[Lookup.scala 34:39]
    node _decRes_T_73 = mux(_decRes_T_57, UInt<4>("h1"), _decRes_T_72) @[Lookup.scala 34:39]
    node _decRes_T_74 = mux(_decRes_T_55, UInt<4>("h1"), _decRes_T_73) @[Lookup.scala 34:39]
    node _decRes_T_75 = mux(_decRes_T_53, UInt<4>("h1"), _decRes_T_74) @[Lookup.scala 34:39]
    node _decRes_T_76 = mux(_decRes_T_51, UInt<4>("h1"), _decRes_T_75) @[Lookup.scala 34:39]
    node _decRes_T_77 = mux(_decRes_T_49, UInt<4>("h1"), _decRes_T_76) @[Lookup.scala 34:39]
    node _decRes_T_78 = mux(_decRes_T_47, UInt<4>("h1"), _decRes_T_77) @[Lookup.scala 34:39]
    node _decRes_T_79 = mux(_decRes_T_45, UInt<4>("h1"), _decRes_T_78) @[Lookup.scala 34:39]
    node _decRes_T_80 = mux(_decRes_T_43, UInt<4>("h1"), _decRes_T_79) @[Lookup.scala 34:39]
    node _decRes_T_81 = mux(_decRes_T_41, UInt<4>("h1"), _decRes_T_80) @[Lookup.scala 34:39]
    node _decRes_T_82 = mux(_decRes_T_39, UInt<4>("h1"), _decRes_T_81) @[Lookup.scala 34:39]
    node _decRes_T_83 = mux(_decRes_T_37, UInt<4>("h1"), _decRes_T_82) @[Lookup.scala 34:39]
    node _decRes_T_84 = mux(_decRes_T_35, UInt<4>("h1"), _decRes_T_83) @[Lookup.scala 34:39]
    node _decRes_T_85 = mux(_decRes_T_33, UInt<4>("h1"), _decRes_T_84) @[Lookup.scala 34:39]
    node _decRes_T_86 = mux(_decRes_T_31, UInt<4>("h1"), _decRes_T_85) @[Lookup.scala 34:39]
    node _decRes_T_87 = mux(_decRes_T_29, UInt<4>("h1"), _decRes_T_86) @[Lookup.scala 34:39]
    node _decRes_T_88 = mux(_decRes_T_27, UInt<4>("h2"), _decRes_T_87) @[Lookup.scala 34:39]
    node _decRes_T_89 = mux(_decRes_T_25, UInt<4>("h2"), _decRes_T_88) @[Lookup.scala 34:39]
    node _decRes_T_90 = mux(_decRes_T_23, UInt<4>("h2"), _decRes_T_89) @[Lookup.scala 34:39]
    node _decRes_T_91 = mux(_decRes_T_21, UInt<4>("h2"), _decRes_T_90) @[Lookup.scala 34:39]
    node _decRes_T_92 = mux(_decRes_T_19, UInt<4>("h2"), _decRes_T_91) @[Lookup.scala 34:39]
    node _decRes_T_93 = mux(_decRes_T_17, UInt<4>("h2"), _decRes_T_92) @[Lookup.scala 34:39]
    node _decRes_T_94 = mux(_decRes_T_15, UInt<4>("h2"), _decRes_T_93) @[Lookup.scala 34:39]
    node _decRes_T_95 = mux(_decRes_T_13, UInt<4>("h2"), _decRes_T_94) @[Lookup.scala 34:39]
    node _decRes_T_96 = mux(_decRes_T_11, UInt<4>("h2"), _decRes_T_95) @[Lookup.scala 34:39]
    node _decRes_T_97 = mux(_decRes_T_9, UInt<4>("h2"), _decRes_T_96) @[Lookup.scala 34:39]
    node _decRes_T_98 = mux(_decRes_T_7, UInt<4>("h2"), _decRes_T_97) @[Lookup.scala 34:39]
    node _decRes_T_99 = mux(_decRes_T_5, UInt<4>("h2"), _decRes_T_98) @[Lookup.scala 34:39]
    node _decRes_T_100 = mux(_decRes_T_3, UInt<4>("h2"), _decRes_T_99) @[Lookup.scala 34:39]
    node decRes_0 = mux(_decRes_T_1, UInt<4>("h2"), _decRes_T_100) @[Lookup.scala 34:39]
    node _decRes_T_101 = mux(_decRes_T_67, UInt<5>("h14"), UInt<5>("h0")) @[Lookup.scala 34:39]
    node _decRes_T_102 = mux(_decRes_T_65, UInt<5>("h15"), _decRes_T_101) @[Lookup.scala 34:39]
    node _decRes_T_103 = mux(_decRes_T_63, UInt<5>("h16"), _decRes_T_102) @[Lookup.scala 34:39]
    node _decRes_T_104 = mux(_decRes_T_61, UInt<5>("h12"), _decRes_T_103) @[Lookup.scala 34:39]
    node _decRes_T_105 = mux(_decRes_T_59, UInt<5>("h11"), _decRes_T_104) @[Lookup.scala 34:39]
    node _decRes_T_106 = mux(_decRes_T_57, UInt<5>("h10"), _decRes_T_105) @[Lookup.scala 34:39]
    node _decRes_T_107 = mux(_decRes_T_55, UInt<5>("hf"), _decRes_T_106) @[Lookup.scala 34:39]
    node _decRes_T_108 = mux(_decRes_T_53, UInt<5>("hd"), _decRes_T_107) @[Lookup.scala 34:39]
    node _decRes_T_109 = mux(_decRes_T_51, UInt<5>("hc"), _decRes_T_108) @[Lookup.scala 34:39]
    node _decRes_T_110 = mux(_decRes_T_49, UInt<5>("hb"), _decRes_T_109) @[Lookup.scala 34:39]
    node _decRes_T_111 = mux(_decRes_T_47, UInt<5>("h6"), _decRes_T_110) @[Lookup.scala 34:39]
    node _decRes_T_112 = mux(_decRes_T_45, UInt<5>("h5"), _decRes_T_111) @[Lookup.scala 34:39]
    node _decRes_T_113 = mux(_decRes_T_43, UInt<5>("h9"), _decRes_T_112) @[Lookup.scala 34:39]
    node _decRes_T_114 = mux(_decRes_T_41, UInt<5>("h8"), _decRes_T_113) @[Lookup.scala 34:39]
    node _decRes_T_115 = mux(_decRes_T_39, UInt<5>("h4"), _decRes_T_114) @[Lookup.scala 34:39]
    node _decRes_T_116 = mux(_decRes_T_37, UInt<5>("h3"), _decRes_T_115) @[Lookup.scala 34:39]
    node _decRes_T_117 = mux(_decRes_T_35, UInt<5>("h2"), _decRes_T_116) @[Lookup.scala 34:39]
    node _decRes_T_118 = mux(_decRes_T_33, UInt<5>("h7"), _decRes_T_117) @[Lookup.scala 34:39]
    node _decRes_T_119 = mux(_decRes_T_31, UInt<5>("h1"), _decRes_T_118) @[Lookup.scala 34:39]
    node _decRes_T_120 = mux(_decRes_T_29, UInt<5>("h0"), _decRes_T_119) @[Lookup.scala 34:39]
    node _decRes_T_121 = mux(_decRes_T_27, UInt<5>("h1b"), _decRes_T_120) @[Lookup.scala 34:39]
    node _decRes_T_122 = mux(_decRes_T_25, UInt<5>("h1d"), _decRes_T_121) @[Lookup.scala 34:39]
    node _decRes_T_123 = mux(_decRes_T_23, UInt<5>("h18"), _decRes_T_122) @[Lookup.scala 34:39]
    node _decRes_T_124 = mux(_decRes_T_21, UInt<5>("h1a"), _decRes_T_123) @[Lookup.scala 34:39]
    node _decRes_T_125 = mux(_decRes_T_19, UInt<5>("h1c"), _decRes_T_124) @[Lookup.scala 34:39]
    node _decRes_T_126 = mux(_decRes_T_17, UInt<5>("h9"), _decRes_T_125) @[Lookup.scala 34:39]
    node _decRes_T_127 = mux(_decRes_T_15, UInt<5>("h8"), _decRes_T_126) @[Lookup.scala 34:39]
    node _decRes_T_128 = mux(_decRes_T_13, UInt<5>("h7"), _decRes_T_127) @[Lookup.scala 34:39]
    node _decRes_T_129 = mux(_decRes_T_11, UInt<5>("h6"), _decRes_T_128) @[Lookup.scala 34:39]
    node _decRes_T_130 = mux(_decRes_T_9, UInt<5>("h5"), _decRes_T_129) @[Lookup.scala 34:39]
    node _decRes_T_131 = mux(_decRes_T_7, UInt<5>("h4"), _decRes_T_130) @[Lookup.scala 34:39]
    node _decRes_T_132 = mux(_decRes_T_5, UInt<5>("h3"), _decRes_T_131) @[Lookup.scala 34:39]
    node _decRes_T_133 = mux(_decRes_T_3, UInt<5>("h2"), _decRes_T_132) @[Lookup.scala 34:39]
    node decRes_1 = mux(_decRes_T_1, UInt<5>("h0"), _decRes_T_133) @[Lookup.scala 34:39]
    node _rs1Val_T = eq(rs1, UInt<1>("h0")) @[Id.scala 45:14]
    node _rs1Val_T_1 = eq(rs1, io_wbForwarding_addr) @[Id.scala 46:14]
    node _rs1Val_T_2 = eq(rs1, io_memForwarding_addr) @[Id.scala 47:14]
    node _rs1Val_T_3 = eq(rs1, io_exForwarding_addr) @[Id.scala 48:14]
    node _rs1Val_T_4 = mux(_rs1Val_T_3, io_exForwarding_data, io_rf2Id_RegData1) @[Mux.scala 47:70]
    node _rs1Val_T_5 = mux(_rs1Val_T_2, io_memForwarding_data, _rs1Val_T_4) @[Mux.scala 47:70]
    node _rs1Val_T_6 = mux(_rs1Val_T_1, io_wbForwarding_data, _rs1Val_T_5) @[Mux.scala 47:70]
    node rs1Val = mux(_rs1Val_T, UInt<1>("h0"), _rs1Val_T_6) @[Mux.scala 47:70]
    node _rs2Val_T = eq(rs2, UInt<1>("h0")) @[Id.scala 53:14]
    node _rs2Val_T_1 = eq(rs2, io_wbForwarding_addr) @[Id.scala 54:14]
    node _rs2Val_T_2 = eq(rs2, io_memForwarding_addr) @[Id.scala 55:14]
    node _rs2Val_T_3 = eq(rs2, io_exForwarding_addr) @[Id.scala 56:14]
    node _rs2Val_T_4 = mux(_rs2Val_T_3, io_exForwarding_data, io_rf2Id_RegData2) @[Mux.scala 47:70]
    node _rs2Val_T_5 = mux(_rs2Val_T_2, io_memForwarding_data, _rs2Val_T_4) @[Mux.scala 47:70]
    node _rs2Val_T_6 = mux(_rs2Val_T_1, io_wbForwarding_data, _rs2Val_T_5) @[Mux.scala 47:70]
    node rs2Val = mux(_rs2Val_T, UInt<1>("h0"), _rs2Val_T_6) @[Mux.scala 47:70]
    node _T = eq(UInt<4>("h0"), decRes_0) @[Id.scala 63:21]
    node _T_1 = eq(UInt<4>("h1"), decRes_0) @[Id.scala 63:21]
    node _GEN_0 = mux(_T_1, rs1Val, UInt<1>("h0")) @[Id.scala 63:21 70:29 28:53]
    node _GEN_1 = mux(_T_1, rs2Val, UInt<1>("h0")) @[Id.scala 63:21 71:29 29:53]
    node _GEN_2 = mux(_T_1, UInt<1>("h1"), UInt<1>("h0")) @[Id.scala 63:21 72:29 30:53]
    node _GEN_3 = mux(_T, UInt<1>("h0"), _GEN_0) @[Id.scala 63:21 65:29]
    node _GEN_4 = mux(_T, UInt<1>("h0"), _GEN_1) @[Id.scala 63:21 66:29]
    node _GEN_5 = mux(_T, UInt<1>("h0"), _GEN_2) @[Id.scala 63:21 67:29]
    node _io_exInfo_opcode_T = bits(io_id_inst_i, 6, 0) @[Id.scala 79:32]
    node oprand1 = _GEN_3 @[Id.scala 28:24]
    node oprand2 = _GEN_4 @[Id.scala 29:24]
    node wreg = _GEN_5 @[Id.scala 30:24]
    io_id2Rf_ReadIdx1 <= rs1 @[Id.scala 83:25]
    io_id2Rf_ReadIdx2 <= rs2 @[Id.scala 84:25]
    io_exInfo_oprand1 <= oprand1 @[Id.scala 76:25]
    io_exInfo_oprand2 <= oprand2 @[Id.scala 77:25]
    io_exInfo_rd <= rd @[Id.scala 78:25]
    io_exInfo_wreg <= wreg @[Id.scala 81:25]
    io_exInfo_opcode <= _io_exInfo_opcode_T @[Id.scala 79:25]
    io_exInfo_aluop <= decRes_1 @[Id.scala 80:25]
    io_rs1 <= rs1Val @[Id.scala 86:12]
    io_rs2 <= rs2Val @[Id.scala 87:12]

  module Id_Ex :
    input clock : Clock
    input reset : UInt<1>
    input io_reset : UInt<1>
    input io_exInfo_i_oprand1 : UInt<64>
    input io_exInfo_i_oprand2 : UInt<64>
    input io_exInfo_i_rd : UInt<5>
    input io_exInfo_i_wreg : UInt<1>
    input io_exInfo_i_opcode : UInt<7>
    input io_exInfo_i_aluop : UInt<5>
    output io_exInfo_o_oprand1 : UInt<64>
    output io_exInfo_o_oprand2 : UInt<64>
    output io_exInfo_o_rd : UInt<5>
    output io_exInfo_o_wreg : UInt<1>
    output io_exInfo_o_opcode : UInt<7>
    output io_exInfo_o_aluop : UInt<5>

    reg exInfo_oprand1 : UInt<64>, clock with :
      reset => (UInt<1>("h0"), exInfo_oprand1) @[Id_Ex.scala 13:26]
    reg exInfo_oprand2 : UInt<64>, clock with :
      reset => (UInt<1>("h0"), exInfo_oprand2) @[Id_Ex.scala 13:26]
    reg exInfo_rd : UInt<5>, clock with :
      reset => (UInt<1>("h0"), exInfo_rd) @[Id_Ex.scala 13:26]
    reg exInfo_wreg : UInt<1>, clock with :
      reset => (UInt<1>("h0"), exInfo_wreg) @[Id_Ex.scala 13:26]
    reg exInfo_opcode : UInt<7>, clock with :
      reset => (UInt<1>("h0"), exInfo_opcode) @[Id_Ex.scala 13:26]
    reg exInfo_aluop : UInt<5>, clock with :
      reset => (UInt<1>("h0"), exInfo_aluop) @[Id_Ex.scala 13:26]
    node _io_exInfo_o_WIRE_aluop = UInt<5>("h0") @[Id_Ex.scala 15:{39,39}]
    node _GEN_0 = mux(io_reset, _io_exInfo_o_WIRE_aluop, exInfo_aluop) @[Id_Ex.scala 14:19 15:24 17:24]
    node _io_exInfo_o_WIRE_opcode = UInt<7>("h0") @[Id_Ex.scala 15:{39,39}]
    node _GEN_1 = mux(io_reset, _io_exInfo_o_WIRE_opcode, exInfo_opcode) @[Id_Ex.scala 14:19 15:24 17:24]
    node _io_exInfo_o_WIRE_wreg = UInt<1>("h0") @[Id_Ex.scala 15:{39,39}]
    node _GEN_2 = mux(io_reset, _io_exInfo_o_WIRE_wreg, exInfo_wreg) @[Id_Ex.scala 14:19 15:24 17:24]
    node _io_exInfo_o_WIRE_rd = UInt<5>("h0") @[Id_Ex.scala 15:{39,39}]
    node _GEN_3 = mux(io_reset, _io_exInfo_o_WIRE_rd, exInfo_rd) @[Id_Ex.scala 14:19 15:24 17:24]
    node _io_exInfo_o_WIRE_oprand2 = UInt<64>("h0") @[Id_Ex.scala 15:{39,39}]
    node _GEN_4 = mux(io_reset, _io_exInfo_o_WIRE_oprand2, exInfo_oprand2) @[Id_Ex.scala 14:19 15:24 17:24]
    node _io_exInfo_o_WIRE_oprand1 = UInt<64>("h0") @[Id_Ex.scala 15:{39,39}]
    node _GEN_5 = mux(io_reset, _io_exInfo_o_WIRE_oprand1, exInfo_oprand1) @[Id_Ex.scala 14:19 15:24 17:24]
    io_exInfo_o_oprand1 <= _GEN_5
    io_exInfo_o_oprand2 <= _GEN_4
    io_exInfo_o_rd <= _GEN_3
    io_exInfo_o_wreg <= _GEN_2
    io_exInfo_o_opcode <= _GEN_1
    io_exInfo_o_aluop <= _GEN_0
    exInfo_oprand1 <= io_exInfo_i_oprand1 @[Id_Ex.scala 13:26]
    exInfo_oprand2 <= io_exInfo_i_oprand2 @[Id_Ex.scala 13:26]
    exInfo_rd <= io_exInfo_i_rd @[Id_Ex.scala 13:26]
    exInfo_wreg <= io_exInfo_i_wreg @[Id_Ex.scala 13:26]
    exInfo_opcode <= io_exInfo_i_opcode @[Id_Ex.scala 13:26]
    exInfo_aluop <= io_exInfo_i_aluop @[Id_Ex.scala 13:26]

  module Ex :
    input io_exInfo_oprand1 : UInt<64>
    input io_exInfo_oprand2 : UInt<64>
    input io_exInfo_rd : UInt<5>
    input io_exInfo_wreg : UInt<1>
    input io_exInfo_opcode : UInt<7>
    input io_exInfo_aluop : UInt<5>
    output io_exForwarding_addr : UInt<5>
    output io_exForwarding_data : UInt<64>
    output io_writeRfOp_en : UInt<1>
    output io_writeRfOp_data : UInt<64>
    output io_writeRfOp_addr : UInt<5>

    node _aluRes_T = add(io_exInfo_oprand1, io_exInfo_oprand2) @[Ex.scala 19:26]
    node _aluRes_T_1 = tail(_aluRes_T, 1) @[Ex.scala 19:26]
    node _aluRes_T_2 = sub(io_exInfo_oprand1, io_exInfo_oprand2) @[Ex.scala 20:26]
    node _aluRes_T_3 = tail(_aluRes_T_2, 1) @[Ex.scala 20:26]
    node _aluRes_T_4 = asSInt(io_exInfo_oprand1) @[Ex.scala 21:29]
    node _aluRes_T_5 = asSInt(io_exInfo_oprand2) @[Ex.scala 21:46]
    node _aluRes_T_6 = lt(_aluRes_T_4, _aluRes_T_5) @[Ex.scala 21:36]
    node _aluRes_T_7 = mux(_aluRes_T_6, UInt<1>("h1"), UInt<1>("h0")) @[Ex.scala 21:20]
    node _aluRes_T_8 = lt(io_exInfo_oprand1, io_exInfo_oprand2) @[Ex.scala 22:29]
    node _aluRes_T_9 = mux(_aluRes_T_8, UInt<1>("h1"), UInt<1>("h0")) @[Ex.scala 22:20]
    node _aluRes_T_10 = xor(io_exInfo_oprand1, io_exInfo_oprand2) @[Ex.scala 23:26]
    node _aluRes_T_11 = or(io_exInfo_oprand1, io_exInfo_oprand2) @[Ex.scala 24:26]
    node _aluRes_T_12 = and(io_exInfo_oprand1, io_exInfo_oprand2) @[Ex.scala 25:26]
    node _aluRes_T_13 = bits(io_exInfo_oprand2, 4, 0) @[Ex.scala 26:36]
    node _aluRes_T_14 = dshl(io_exInfo_oprand1, _aluRes_T_13) @[Ex.scala 26:26]
    node _aluRes_T_15 = bits(io_exInfo_oprand2, 4, 0) @[Ex.scala 27:36]
    node _aluRes_T_16 = dshr(io_exInfo_oprand1, _aluRes_T_15) @[Ex.scala 27:26]
    node _aluRes_T_17 = asSInt(io_exInfo_oprand1) @[Ex.scala 28:26]
    node _aluRes_T_18 = bits(io_exInfo_oprand2, 4, 0) @[Ex.scala 28:43]
    node _aluRes_T_19 = dshr(_aluRes_T_17, _aluRes_T_18) @[Ex.scala 28:33]
    node _aluRes_T_20 = asUInt(_aluRes_T_19) @[Ex.scala 28:50]
    node _aluRes_T_21 = eq(UInt<5>("h0"), io_exInfo_aluop) @[Mux.scala 81:61]
    node _aluRes_T_22 = mux(_aluRes_T_21, _aluRes_T_1, UInt<1>("h0")) @[Mux.scala 81:58]
    node _aluRes_T_23 = eq(UInt<5>("h1"), io_exInfo_aluop) @[Mux.scala 81:61]
    node _aluRes_T_24 = mux(_aluRes_T_23, _aluRes_T_3, _aluRes_T_22) @[Mux.scala 81:58]
    node _aluRes_T_25 = eq(UInt<5>("h2"), io_exInfo_aluop) @[Mux.scala 81:61]
    node _aluRes_T_26 = mux(_aluRes_T_25, _aluRes_T_7, _aluRes_T_24) @[Mux.scala 81:58]
    node _aluRes_T_27 = eq(UInt<5>("h3"), io_exInfo_aluop) @[Mux.scala 81:61]
    node _aluRes_T_28 = mux(_aluRes_T_27, _aluRes_T_9, _aluRes_T_26) @[Mux.scala 81:58]
    node _aluRes_T_29 = eq(UInt<5>("h4"), io_exInfo_aluop) @[Mux.scala 81:61]
    node _aluRes_T_30 = mux(_aluRes_T_29, _aluRes_T_10, _aluRes_T_28) @[Mux.scala 81:58]
    node _aluRes_T_31 = eq(UInt<5>("h5"), io_exInfo_aluop) @[Mux.scala 81:61]
    node _aluRes_T_32 = mux(_aluRes_T_31, _aluRes_T_11, _aluRes_T_30) @[Mux.scala 81:58]
    node _aluRes_T_33 = eq(UInt<5>("h6"), io_exInfo_aluop) @[Mux.scala 81:61]
    node _aluRes_T_34 = mux(_aluRes_T_33, _aluRes_T_12, _aluRes_T_32) @[Mux.scala 81:58]
    node _aluRes_T_35 = eq(UInt<5>("h7"), io_exInfo_aluop) @[Mux.scala 81:61]
    node _aluRes_T_36 = mux(_aluRes_T_35, _aluRes_T_14, _aluRes_T_34) @[Mux.scala 81:58]
    node _aluRes_T_37 = eq(UInt<5>("h8"), io_exInfo_aluop) @[Mux.scala 81:61]
    node _aluRes_T_38 = mux(_aluRes_T_37, _aluRes_T_16, _aluRes_T_36) @[Mux.scala 81:58]
    node _aluRes_T_39 = eq(UInt<5>("h9"), io_exInfo_aluop) @[Mux.scala 81:61]
    node aluRes = mux(_aluRes_T_39, _aluRes_T_20, _aluRes_T_38) @[Mux.scala 81:58]
    node _T = eq(UInt<6>("h33"), io_exInfo_opcode) @[Ex.scala 35:29]
    node _io_writeRfOp_WIRE_data = UInt<64>("h0") @[Ex.scala 33:{36,36}]
    node _GEN_0 = mux(_T, aluRes, _io_writeRfOp_WIRE_data) @[Ex.scala 33:21 35:29 37:32]
    node _io_writeRfOp_WIRE_en = UInt<1>("h0") @[Ex.scala 33:{36,36}]
    node _GEN_1 = mux(_T, UInt<1>("h1"), _io_writeRfOp_WIRE_en) @[Ex.scala 33:21 35:29 38:32]
    node _io_writeRfOp_WIRE_addr = UInt<5>("h0") @[Ex.scala 33:{36,36}]
    node _GEN_2 = mux(_T, io_exInfo_rd, _io_writeRfOp_WIRE_addr) @[Ex.scala 33:21 35:29 39:32]
    io_exForwarding_addr <= io_exInfo_rd @[Ex.scala 44:28]
    io_exForwarding_data <= bits(aluRes, 63, 0) @[Ex.scala 43:28]
    io_writeRfOp_en <= _GEN_1
    io_writeRfOp_data <= bits(_GEN_0, 63, 0)
    io_writeRfOp_addr <= _GEN_2

  module Ex_Mem :
    input clock : Clock
    input reset : UInt<1>
    input io_reset : UInt<1>
    input io_writeRfOp_i_en : UInt<1>
    input io_writeRfOp_i_data : UInt<64>
    input io_writeRfOp_i_addr : UInt<5>
    output io_writeRfOp_o_en : UInt<1>
    output io_writeRfOp_o_data : UInt<64>
    output io_writeRfOp_o_addr : UInt<5>

    reg writeRfOp_en : UInt<1>, clock with :
      reset => (UInt<1>("h0"), writeRfOp_en) @[Ex_Mem.scala 14:36]
    reg writeRfOp_data : UInt<64>, clock with :
      reset => (UInt<1>("h0"), writeRfOp_data) @[Ex_Mem.scala 14:36]
    reg writeRfOp_addr : UInt<5>, clock with :
      reset => (UInt<1>("h0"), writeRfOp_addr) @[Ex_Mem.scala 14:36]
    node _io_writeRfOp_o_WIRE_addr = UInt<5>("h0") @[Ex_Mem.scala 17:{41,41}]
    node _GEN_0 = mux(io_reset, _io_writeRfOp_o_WIRE_addr, writeRfOp_addr) @[Ex_Mem.scala 16:19 17:26 19:26]
    node _io_writeRfOp_o_WIRE_data = UInt<64>("h0") @[Ex_Mem.scala 17:{41,41}]
    node _GEN_1 = mux(io_reset, _io_writeRfOp_o_WIRE_data, writeRfOp_data) @[Ex_Mem.scala 16:19 17:26 19:26]
    node _io_writeRfOp_o_WIRE_en = UInt<1>("h0") @[Ex_Mem.scala 17:{41,41}]
    node _GEN_2 = mux(io_reset, _io_writeRfOp_o_WIRE_en, writeRfOp_en) @[Ex_Mem.scala 16:19 17:26 19:26]
    io_writeRfOp_o_en <= _GEN_2
    io_writeRfOp_o_data <= _GEN_1
    io_writeRfOp_o_addr <= _GEN_0
    writeRfOp_en <= io_writeRfOp_i_en @[Ex_Mem.scala 14:36]
    writeRfOp_data <= io_writeRfOp_i_data @[Ex_Mem.scala 14:36]
    writeRfOp_addr <= io_writeRfOp_i_addr @[Ex_Mem.scala 14:36]

  module Memory :
    input io_writeRfOp_i_en : UInt<1>
    input io_writeRfOp_i_data : UInt<64>
    input io_writeRfOp_i_addr : UInt<5>
    output io_memForwarding_addr : UInt<5>
    output io_memForwarding_data : UInt<64>
    output io_writeRfOp_o_en : UInt<1>
    output io_writeRfOp_o_data : UInt<64>
    output io_writeRfOp_o_addr : UInt<5>

    io_memForwarding_addr <= io_writeRfOp_i_addr @[Memory.scala 14:27]
    io_memForwarding_data <= io_writeRfOp_i_data @[Memory.scala 15:27]
    io_writeRfOp_o_en <= io_writeRfOp_i_en @[Memory.scala 13:27]
    io_writeRfOp_o_data <= io_writeRfOp_i_data @[Memory.scala 13:27]
    io_writeRfOp_o_addr <= io_writeRfOp_i_addr @[Memory.scala 13:27]

  module Wb :
    input io_writeRfOp_i_en : UInt<1>
    input io_writeRfOp_i_data : UInt<64>
    input io_writeRfOp_i_addr : UInt<5>
    output io_wbForwarding_addr : UInt<5>
    output io_wbForwarding_data : UInt<64>
    output io_writeRfOp_o_en : UInt<1>
    output io_writeRfOp_o_data : UInt<64>
    output io_writeRfOp_o_addr : UInt<5>

    io_wbForwarding_addr <= io_writeRfOp_i_addr @[Wb.scala 14:21]
    io_wbForwarding_data <= io_writeRfOp_i_data @[Wb.scala 14:21]
    io_writeRfOp_o_en <= io_writeRfOp_i_en @[Wb.scala 13:21]
    io_writeRfOp_o_data <= io_writeRfOp_i_data @[Wb.scala 13:21]
    io_writeRfOp_o_addr <= io_writeRfOp_i_addr @[Wb.scala 13:21]

  module Top :
    input clock : Clock
    input reset : UInt<1>
    output io_o1 : UInt<64>
    output io_o2 : UInt<32>
    output io_o3 : UInt<64>
    output io_o4 : UInt<64>

    inst IF of If @[Top.scala 19:29]
    inst INST_ROM of Inst_Rom @[Top.scala 20:29]
    inst REGFILE of Regfile @[Top.scala 21:29]
    inst IF_ID of If_Id @[Top.scala 22:29]
    inst ID of Id @[Top.scala 23:29]
    inst ID_EX of Id_Ex @[Top.scala 24:29]
    inst EX of Ex @[Top.scala 25:29]
    inst EX_MEM of Ex_Mem @[Top.scala 26:29]
    inst MEM of Memory @[Top.scala 27:29]
    inst MEM_WB of Ex_Mem @[Top.scala 28:29]
    inst WB of Wb @[Top.scala 29:29]
    io_o1 <= WB.io_writeRfOp_o_data @[Top.scala 82:7]
    io_o2 <= UInt<32>("h0") @[Top.scala 83:7]
    io_o3 <= UInt<64>("h0") @[Top.scala 84:7]
    io_o4 <= UInt<64>("h0") @[Top.scala 85:7]
    IF.clock <= clock
    IF.reset <= reset
    IF.io_reset <= UInt<1>("h0") @[Top.scala 34:25]
    IF.io_inst_i <= INST_ROM.io_inst_o @[Top.scala 46:25]
    INST_ROM.clock <= clock
    INST_ROM.reset <= reset
    INST_ROM.io_reset <= UInt<1>("h0") @[Top.scala 33:25]
    INST_ROM.io_addr_i <= IF.io_pc_o @[Top.scala 47:25]
    REGFILE.clock <= clock
    REGFILE.reset <= reset
    REGFILE.io_id2Rf_ReadIdx1 <= ID.io_id2Rf_ReadIdx1 @[Top.scala 52:29]
    REGFILE.io_id2Rf_ReadIdx2 <= ID.io_id2Rf_ReadIdx2 @[Top.scala 52:29]
    REGFILE.io_writeRfOp_en <= WB.io_writeRfOp_o_en @[Top.scala 67:29]
    REGFILE.io_writeRfOp_data <= WB.io_writeRfOp_o_data @[Top.scala 67:29]
    REGFILE.io_writeRfOp_addr <= WB.io_writeRfOp_o_addr @[Top.scala 67:29]
    IF_ID.clock <= clock
    IF_ID.reset <= reset
    IF_ID.io_reset <= UInt<1>("h0") @[Top.scala 35:25]
    IF_ID.io_if_inst_i <= IF.io_inst_o @[Top.scala 48:25]
    ID.clock <= clock
    ID.reset <= reset
    ID.io_id_inst_i <= IF_ID.io_if_inst_o @[Top.scala 50:25]
    ID.io_rf2Id_RegData1 <= REGFILE.io_rf2Id_RegData1 @[Top.scala 53:29]
    ID.io_rf2Id_RegData2 <= REGFILE.io_rf2Id_RegData2 @[Top.scala 53:29]
    ID.io_exForwarding_addr <= EX.io_exForwarding_addr @[Top.scala 73:29]
    ID.io_exForwarding_data <= EX.io_exForwarding_data @[Top.scala 73:29]
    ID.io_memForwarding_addr <= MEM.io_memForwarding_addr @[Top.scala 72:29]
    ID.io_memForwarding_data <= MEM.io_memForwarding_data @[Top.scala 72:29]
    ID.io_wbForwarding_addr <= WB.io_wbForwarding_addr @[Top.scala 71:29]
    ID.io_wbForwarding_data <= WB.io_wbForwarding_data @[Top.scala 71:29]
    ID_EX.clock <= clock
    ID_EX.reset <= reset
    ID_EX.io_reset <= UInt<1>("h0") @[Top.scala 36:25]
    ID_EX.io_exInfo_i_oprand1 <= ID.io_exInfo_oprand1 @[Top.scala 55:29]
    ID_EX.io_exInfo_i_oprand2 <= ID.io_exInfo_oprand2 @[Top.scala 55:29]
    ID_EX.io_exInfo_i_rd <= ID.io_exInfo_rd @[Top.scala 55:29]
    ID_EX.io_exInfo_i_wreg <= ID.io_exInfo_wreg @[Top.scala 55:29]
    ID_EX.io_exInfo_i_opcode <= ID.io_exInfo_opcode @[Top.scala 55:29]
    ID_EX.io_exInfo_i_aluop <= ID.io_exInfo_aluop @[Top.scala 55:29]
    EX.io_exInfo_oprand1 <= ID_EX.io_exInfo_o_oprand1 @[Top.scala 57:29]
    EX.io_exInfo_oprand2 <= ID_EX.io_exInfo_o_oprand2 @[Top.scala 57:29]
    EX.io_exInfo_rd <= ID_EX.io_exInfo_o_rd @[Top.scala 57:29]
    EX.io_exInfo_wreg <= ID_EX.io_exInfo_o_wreg @[Top.scala 57:29]
    EX.io_exInfo_opcode <= ID_EX.io_exInfo_o_opcode @[Top.scala 57:29]
    EX.io_exInfo_aluop <= ID_EX.io_exInfo_o_aluop @[Top.scala 57:29]
    EX_MEM.clock <= clock
    EX_MEM.reset <= reset
    EX_MEM.io_reset <= UInt<1>("h0") @[Top.scala 37:25]
    EX_MEM.io_writeRfOp_i_en <= EX.io_writeRfOp_en @[Top.scala 59:29]
    EX_MEM.io_writeRfOp_i_data <= EX.io_writeRfOp_data @[Top.scala 59:29]
    EX_MEM.io_writeRfOp_i_addr <= EX.io_writeRfOp_addr @[Top.scala 59:29]
    MEM.io_writeRfOp_i_en <= EX_MEM.io_writeRfOp_o_en @[Top.scala 61:29]
    MEM.io_writeRfOp_i_data <= EX_MEM.io_writeRfOp_o_data @[Top.scala 61:29]
    MEM.io_writeRfOp_i_addr <= EX_MEM.io_writeRfOp_o_addr @[Top.scala 61:29]
    MEM_WB.clock <= clock
    MEM_WB.reset <= reset
    MEM_WB.io_reset <= UInt<1>("h0") @[Top.scala 38:25]
    MEM_WB.io_writeRfOp_i_en <= MEM.io_writeRfOp_o_en @[Top.scala 63:29]
    MEM_WB.io_writeRfOp_i_data <= MEM.io_writeRfOp_o_data @[Top.scala 63:29]
    MEM_WB.io_writeRfOp_i_addr <= MEM.io_writeRfOp_o_addr @[Top.scala 63:29]
    WB.io_writeRfOp_i_en <= MEM_WB.io_writeRfOp_o_en @[Top.scala 65:29]
    WB.io_writeRfOp_i_data <= MEM_WB.io_writeRfOp_o_data @[Top.scala 65:29]
    WB.io_writeRfOp_i_addr <= MEM_WB.io_writeRfOp_o_addr @[Top.scala 65:29]
