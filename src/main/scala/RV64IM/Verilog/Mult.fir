circuit Mult :
  module BoothEncoder8 :
    input clock : Clock
    input reset : Reset
    output io : { flip data : UInt<9>, neg : UInt<1>, weight : UInt<8>}

    node _io_weight_tmp_T = bits(io.data, 8, 8) @[Mult.scala 506:19]
    node _io_weight_tmp_T_1 = shl(_io_weight_tmp_T, 7) @[Mult.scala 506:23]
    node _io_weight_tmp_T_2 = not(_io_weight_tmp_T_1) @[Mult.scala 506:13]
    node _io_weight_tmp_T_3 = add(_io_weight_tmp_T_2, UInt<1>("h1")) @[Mult.scala 506:29]
    node _io_weight_tmp_T_4 = tail(_io_weight_tmp_T_3, 1) @[Mult.scala 506:29]
    node _io_weight_tmp_T_5 = bits(io.data, 7, 7) @[Mult.scala 507:18]
    node _io_weight_tmp_T_6 = shl(_io_weight_tmp_T_5, 6) @[Mult.scala 507:22]
    node _io_weight_tmp_T_7 = add(_io_weight_tmp_T_4, _io_weight_tmp_T_6) @[Mult.scala 506:35]
    node _io_weight_tmp_T_8 = tail(_io_weight_tmp_T_7, 1) @[Mult.scala 506:35]
    node _io_weight_tmp_T_9 = bits(io.data, 6, 6) @[Mult.scala 508:18]
    node _io_weight_tmp_T_10 = shl(_io_weight_tmp_T_9, 5) @[Mult.scala 508:22]
    node _io_weight_tmp_T_11 = add(_io_weight_tmp_T_8, _io_weight_tmp_T_10) @[Mult.scala 507:28]
    node _io_weight_tmp_T_12 = tail(_io_weight_tmp_T_11, 1) @[Mult.scala 507:28]
    node _io_weight_tmp_T_13 = bits(io.data, 5, 5) @[Mult.scala 509:18]
    node _io_weight_tmp_T_14 = shl(_io_weight_tmp_T_13, 4) @[Mult.scala 509:22]
    node _io_weight_tmp_T_15 = add(_io_weight_tmp_T_12, _io_weight_tmp_T_14) @[Mult.scala 508:28]
    node _io_weight_tmp_T_16 = tail(_io_weight_tmp_T_15, 1) @[Mult.scala 508:28]
    node _io_weight_tmp_T_17 = bits(io.data, 4, 4) @[Mult.scala 510:18]
    node _io_weight_tmp_T_18 = shl(_io_weight_tmp_T_17, 3) @[Mult.scala 510:22]
    node _io_weight_tmp_T_19 = add(_io_weight_tmp_T_16, _io_weight_tmp_T_18) @[Mult.scala 509:28]
    node _io_weight_tmp_T_20 = tail(_io_weight_tmp_T_19, 1) @[Mult.scala 509:28]
    node _io_weight_tmp_T_21 = bits(io.data, 3, 3) @[Mult.scala 511:18]
    node _io_weight_tmp_T_22 = shl(_io_weight_tmp_T_21, 2) @[Mult.scala 511:22]
    node _io_weight_tmp_T_23 = add(_io_weight_tmp_T_20, _io_weight_tmp_T_22) @[Mult.scala 510:28]
    node _io_weight_tmp_T_24 = tail(_io_weight_tmp_T_23, 1) @[Mult.scala 510:28]
    node _io_weight_tmp_T_25 = bits(io.data, 2, 2) @[Mult.scala 512:18]
    node _io_weight_tmp_T_26 = shl(_io_weight_tmp_T_25, 1) @[Mult.scala 512:22]
    node _io_weight_tmp_T_27 = add(_io_weight_tmp_T_24, _io_weight_tmp_T_26) @[Mult.scala 511:28]
    node _io_weight_tmp_T_28 = tail(_io_weight_tmp_T_27, 1) @[Mult.scala 511:28]
    node _io_weight_tmp_T_29 = bits(io.data, 1, 1) @[Mult.scala 513:17]
    node _io_weight_tmp_T_30 = add(_io_weight_tmp_T_28, _io_weight_tmp_T_29) @[Mult.scala 512:28]
    node _io_weight_tmp_T_31 = tail(_io_weight_tmp_T_30, 1) @[Mult.scala 512:28]
    node _io_weight_tmp_T_32 = bits(io.data, 0, 0) @[Mult.scala 513:27]
    node _io_weight_tmp_T_33 = add(_io_weight_tmp_T_31, _io_weight_tmp_T_32) @[Mult.scala 513:21]
    node io_weight_tmp = tail(_io_weight_tmp_T_33, 1) @[Mult.scala 513:21]
    node _io_weight_T = bits(io.data, 8, 8) @[Mult.scala 514:20]
    node _io_weight_T_1 = sub(UInt<9>("h100"), io_weight_tmp) @[Mult.scala 514:31]
    node _io_weight_T_2 = tail(_io_weight_T_1, 1) @[Mult.scala 514:31]
    node _io_weight_T_3 = mux(_io_weight_T, _io_weight_T_2, io_weight_tmp) @[Mult.scala 514:12]
    io.weight <= _io_weight_T_3 @[Mult.scala 523:15]
    node _io_neg_T = bits(io.data, 8, 8) @[Mult.scala 524:29]
    node _io_neg_T_1 = mux(_io_neg_T, UInt<1>("h1"), UInt<1>("h0")) @[Mult.scala 524:21]
    io.neg <= _io_neg_T_1 @[Mult.scala 524:15]

  module BoothEncoder8_1 :
    input clock : Clock
    input reset : Reset
    output io : { flip data : UInt<9>, neg : UInt<1>, weight : UInt<8>}

    node _io_weight_tmp_T = bits(io.data, 8, 8) @[Mult.scala 506:19]
    node _io_weight_tmp_T_1 = shl(_io_weight_tmp_T, 7) @[Mult.scala 506:23]
    node _io_weight_tmp_T_2 = not(_io_weight_tmp_T_1) @[Mult.scala 506:13]
    node _io_weight_tmp_T_3 = add(_io_weight_tmp_T_2, UInt<1>("h1")) @[Mult.scala 506:29]
    node _io_weight_tmp_T_4 = tail(_io_weight_tmp_T_3, 1) @[Mult.scala 506:29]
    node _io_weight_tmp_T_5 = bits(io.data, 7, 7) @[Mult.scala 507:18]
    node _io_weight_tmp_T_6 = shl(_io_weight_tmp_T_5, 6) @[Mult.scala 507:22]
    node _io_weight_tmp_T_7 = add(_io_weight_tmp_T_4, _io_weight_tmp_T_6) @[Mult.scala 506:35]
    node _io_weight_tmp_T_8 = tail(_io_weight_tmp_T_7, 1) @[Mult.scala 506:35]
    node _io_weight_tmp_T_9 = bits(io.data, 6, 6) @[Mult.scala 508:18]
    node _io_weight_tmp_T_10 = shl(_io_weight_tmp_T_9, 5) @[Mult.scala 508:22]
    node _io_weight_tmp_T_11 = add(_io_weight_tmp_T_8, _io_weight_tmp_T_10) @[Mult.scala 507:28]
    node _io_weight_tmp_T_12 = tail(_io_weight_tmp_T_11, 1) @[Mult.scala 507:28]
    node _io_weight_tmp_T_13 = bits(io.data, 5, 5) @[Mult.scala 509:18]
    node _io_weight_tmp_T_14 = shl(_io_weight_tmp_T_13, 4) @[Mult.scala 509:22]
    node _io_weight_tmp_T_15 = add(_io_weight_tmp_T_12, _io_weight_tmp_T_14) @[Mult.scala 508:28]
    node _io_weight_tmp_T_16 = tail(_io_weight_tmp_T_15, 1) @[Mult.scala 508:28]
    node _io_weight_tmp_T_17 = bits(io.data, 4, 4) @[Mult.scala 510:18]
    node _io_weight_tmp_T_18 = shl(_io_weight_tmp_T_17, 3) @[Mult.scala 510:22]
    node _io_weight_tmp_T_19 = add(_io_weight_tmp_T_16, _io_weight_tmp_T_18) @[Mult.scala 509:28]
    node _io_weight_tmp_T_20 = tail(_io_weight_tmp_T_19, 1) @[Mult.scala 509:28]
    node _io_weight_tmp_T_21 = bits(io.data, 3, 3) @[Mult.scala 511:18]
    node _io_weight_tmp_T_22 = shl(_io_weight_tmp_T_21, 2) @[Mult.scala 511:22]
    node _io_weight_tmp_T_23 = add(_io_weight_tmp_T_20, _io_weight_tmp_T_22) @[Mult.scala 510:28]
    node _io_weight_tmp_T_24 = tail(_io_weight_tmp_T_23, 1) @[Mult.scala 510:28]
    node _io_weight_tmp_T_25 = bits(io.data, 2, 2) @[Mult.scala 512:18]
    node _io_weight_tmp_T_26 = shl(_io_weight_tmp_T_25, 1) @[Mult.scala 512:22]
    node _io_weight_tmp_T_27 = add(_io_weight_tmp_T_24, _io_weight_tmp_T_26) @[Mult.scala 511:28]
    node _io_weight_tmp_T_28 = tail(_io_weight_tmp_T_27, 1) @[Mult.scala 511:28]
    node _io_weight_tmp_T_29 = bits(io.data, 1, 1) @[Mult.scala 513:17]
    node _io_weight_tmp_T_30 = add(_io_weight_tmp_T_28, _io_weight_tmp_T_29) @[Mult.scala 512:28]
    node _io_weight_tmp_T_31 = tail(_io_weight_tmp_T_30, 1) @[Mult.scala 512:28]
    node _io_weight_tmp_T_32 = bits(io.data, 0, 0) @[Mult.scala 513:27]
    node _io_weight_tmp_T_33 = add(_io_weight_tmp_T_31, _io_weight_tmp_T_32) @[Mult.scala 513:21]
    node io_weight_tmp = tail(_io_weight_tmp_T_33, 1) @[Mult.scala 513:21]
    node _io_weight_T = bits(io.data, 8, 8) @[Mult.scala 514:20]
    node _io_weight_T_1 = sub(UInt<9>("h100"), io_weight_tmp) @[Mult.scala 514:31]
    node _io_weight_T_2 = tail(_io_weight_T_1, 1) @[Mult.scala 514:31]
    node _io_weight_T_3 = mux(_io_weight_T, _io_weight_T_2, io_weight_tmp) @[Mult.scala 514:12]
    io.weight <= _io_weight_T_3 @[Mult.scala 523:15]
    node _io_neg_T = bits(io.data, 8, 8) @[Mult.scala 524:29]
    node _io_neg_T_1 = mux(_io_neg_T, UInt<1>("h1"), UInt<1>("h0")) @[Mult.scala 524:21]
    io.neg <= _io_neg_T_1 @[Mult.scala 524:15]

  module BoothEncoder8_2 :
    input clock : Clock
    input reset : Reset
    output io : { flip data : UInt<9>, neg : UInt<1>, weight : UInt<8>}

    node _io_weight_tmp_T = bits(io.data, 8, 8) @[Mult.scala 506:19]
    node _io_weight_tmp_T_1 = shl(_io_weight_tmp_T, 7) @[Mult.scala 506:23]
    node _io_weight_tmp_T_2 = not(_io_weight_tmp_T_1) @[Mult.scala 506:13]
    node _io_weight_tmp_T_3 = add(_io_weight_tmp_T_2, UInt<1>("h1")) @[Mult.scala 506:29]
    node _io_weight_tmp_T_4 = tail(_io_weight_tmp_T_3, 1) @[Mult.scala 506:29]
    node _io_weight_tmp_T_5 = bits(io.data, 7, 7) @[Mult.scala 507:18]
    node _io_weight_tmp_T_6 = shl(_io_weight_tmp_T_5, 6) @[Mult.scala 507:22]
    node _io_weight_tmp_T_7 = add(_io_weight_tmp_T_4, _io_weight_tmp_T_6) @[Mult.scala 506:35]
    node _io_weight_tmp_T_8 = tail(_io_weight_tmp_T_7, 1) @[Mult.scala 506:35]
    node _io_weight_tmp_T_9 = bits(io.data, 6, 6) @[Mult.scala 508:18]
    node _io_weight_tmp_T_10 = shl(_io_weight_tmp_T_9, 5) @[Mult.scala 508:22]
    node _io_weight_tmp_T_11 = add(_io_weight_tmp_T_8, _io_weight_tmp_T_10) @[Mult.scala 507:28]
    node _io_weight_tmp_T_12 = tail(_io_weight_tmp_T_11, 1) @[Mult.scala 507:28]
    node _io_weight_tmp_T_13 = bits(io.data, 5, 5) @[Mult.scala 509:18]
    node _io_weight_tmp_T_14 = shl(_io_weight_tmp_T_13, 4) @[Mult.scala 509:22]
    node _io_weight_tmp_T_15 = add(_io_weight_tmp_T_12, _io_weight_tmp_T_14) @[Mult.scala 508:28]
    node _io_weight_tmp_T_16 = tail(_io_weight_tmp_T_15, 1) @[Mult.scala 508:28]
    node _io_weight_tmp_T_17 = bits(io.data, 4, 4) @[Mult.scala 510:18]
    node _io_weight_tmp_T_18 = shl(_io_weight_tmp_T_17, 3) @[Mult.scala 510:22]
    node _io_weight_tmp_T_19 = add(_io_weight_tmp_T_16, _io_weight_tmp_T_18) @[Mult.scala 509:28]
    node _io_weight_tmp_T_20 = tail(_io_weight_tmp_T_19, 1) @[Mult.scala 509:28]
    node _io_weight_tmp_T_21 = bits(io.data, 3, 3) @[Mult.scala 511:18]
    node _io_weight_tmp_T_22 = shl(_io_weight_tmp_T_21, 2) @[Mult.scala 511:22]
    node _io_weight_tmp_T_23 = add(_io_weight_tmp_T_20, _io_weight_tmp_T_22) @[Mult.scala 510:28]
    node _io_weight_tmp_T_24 = tail(_io_weight_tmp_T_23, 1) @[Mult.scala 510:28]
    node _io_weight_tmp_T_25 = bits(io.data, 2, 2) @[Mult.scala 512:18]
    node _io_weight_tmp_T_26 = shl(_io_weight_tmp_T_25, 1) @[Mult.scala 512:22]
    node _io_weight_tmp_T_27 = add(_io_weight_tmp_T_24, _io_weight_tmp_T_26) @[Mult.scala 511:28]
    node _io_weight_tmp_T_28 = tail(_io_weight_tmp_T_27, 1) @[Mult.scala 511:28]
    node _io_weight_tmp_T_29 = bits(io.data, 1, 1) @[Mult.scala 513:17]
    node _io_weight_tmp_T_30 = add(_io_weight_tmp_T_28, _io_weight_tmp_T_29) @[Mult.scala 512:28]
    node _io_weight_tmp_T_31 = tail(_io_weight_tmp_T_30, 1) @[Mult.scala 512:28]
    node _io_weight_tmp_T_32 = bits(io.data, 0, 0) @[Mult.scala 513:27]
    node _io_weight_tmp_T_33 = add(_io_weight_tmp_T_31, _io_weight_tmp_T_32) @[Mult.scala 513:21]
    node io_weight_tmp = tail(_io_weight_tmp_T_33, 1) @[Mult.scala 513:21]
    node _io_weight_T = bits(io.data, 8, 8) @[Mult.scala 514:20]
    node _io_weight_T_1 = sub(UInt<9>("h100"), io_weight_tmp) @[Mult.scala 514:31]
    node _io_weight_T_2 = tail(_io_weight_T_1, 1) @[Mult.scala 514:31]
    node _io_weight_T_3 = mux(_io_weight_T, _io_weight_T_2, io_weight_tmp) @[Mult.scala 514:12]
    io.weight <= _io_weight_T_3 @[Mult.scala 523:15]
    node _io_neg_T = bits(io.data, 8, 8) @[Mult.scala 524:29]
    node _io_neg_T_1 = mux(_io_neg_T, UInt<1>("h1"), UInt<1>("h0")) @[Mult.scala 524:21]
    io.neg <= _io_neg_T_1 @[Mult.scala 524:15]

  module BoothEncoder8_3 :
    input clock : Clock
    input reset : Reset
    output io : { flip data : UInt<9>, neg : UInt<1>, weight : UInt<8>}

    node _io_weight_tmp_T = bits(io.data, 8, 8) @[Mult.scala 506:19]
    node _io_weight_tmp_T_1 = shl(_io_weight_tmp_T, 7) @[Mult.scala 506:23]
    node _io_weight_tmp_T_2 = not(_io_weight_tmp_T_1) @[Mult.scala 506:13]
    node _io_weight_tmp_T_3 = add(_io_weight_tmp_T_2, UInt<1>("h1")) @[Mult.scala 506:29]
    node _io_weight_tmp_T_4 = tail(_io_weight_tmp_T_3, 1) @[Mult.scala 506:29]
    node _io_weight_tmp_T_5 = bits(io.data, 7, 7) @[Mult.scala 507:18]
    node _io_weight_tmp_T_6 = shl(_io_weight_tmp_T_5, 6) @[Mult.scala 507:22]
    node _io_weight_tmp_T_7 = add(_io_weight_tmp_T_4, _io_weight_tmp_T_6) @[Mult.scala 506:35]
    node _io_weight_tmp_T_8 = tail(_io_weight_tmp_T_7, 1) @[Mult.scala 506:35]
    node _io_weight_tmp_T_9 = bits(io.data, 6, 6) @[Mult.scala 508:18]
    node _io_weight_tmp_T_10 = shl(_io_weight_tmp_T_9, 5) @[Mult.scala 508:22]
    node _io_weight_tmp_T_11 = add(_io_weight_tmp_T_8, _io_weight_tmp_T_10) @[Mult.scala 507:28]
    node _io_weight_tmp_T_12 = tail(_io_weight_tmp_T_11, 1) @[Mult.scala 507:28]
    node _io_weight_tmp_T_13 = bits(io.data, 5, 5) @[Mult.scala 509:18]
    node _io_weight_tmp_T_14 = shl(_io_weight_tmp_T_13, 4) @[Mult.scala 509:22]
    node _io_weight_tmp_T_15 = add(_io_weight_tmp_T_12, _io_weight_tmp_T_14) @[Mult.scala 508:28]
    node _io_weight_tmp_T_16 = tail(_io_weight_tmp_T_15, 1) @[Mult.scala 508:28]
    node _io_weight_tmp_T_17 = bits(io.data, 4, 4) @[Mult.scala 510:18]
    node _io_weight_tmp_T_18 = shl(_io_weight_tmp_T_17, 3) @[Mult.scala 510:22]
    node _io_weight_tmp_T_19 = add(_io_weight_tmp_T_16, _io_weight_tmp_T_18) @[Mult.scala 509:28]
    node _io_weight_tmp_T_20 = tail(_io_weight_tmp_T_19, 1) @[Mult.scala 509:28]
    node _io_weight_tmp_T_21 = bits(io.data, 3, 3) @[Mult.scala 511:18]
    node _io_weight_tmp_T_22 = shl(_io_weight_tmp_T_21, 2) @[Mult.scala 511:22]
    node _io_weight_tmp_T_23 = add(_io_weight_tmp_T_20, _io_weight_tmp_T_22) @[Mult.scala 510:28]
    node _io_weight_tmp_T_24 = tail(_io_weight_tmp_T_23, 1) @[Mult.scala 510:28]
    node _io_weight_tmp_T_25 = bits(io.data, 2, 2) @[Mult.scala 512:18]
    node _io_weight_tmp_T_26 = shl(_io_weight_tmp_T_25, 1) @[Mult.scala 512:22]
    node _io_weight_tmp_T_27 = add(_io_weight_tmp_T_24, _io_weight_tmp_T_26) @[Mult.scala 511:28]
    node _io_weight_tmp_T_28 = tail(_io_weight_tmp_T_27, 1) @[Mult.scala 511:28]
    node _io_weight_tmp_T_29 = bits(io.data, 1, 1) @[Mult.scala 513:17]
    node _io_weight_tmp_T_30 = add(_io_weight_tmp_T_28, _io_weight_tmp_T_29) @[Mult.scala 512:28]
    node _io_weight_tmp_T_31 = tail(_io_weight_tmp_T_30, 1) @[Mult.scala 512:28]
    node _io_weight_tmp_T_32 = bits(io.data, 0, 0) @[Mult.scala 513:27]
    node _io_weight_tmp_T_33 = add(_io_weight_tmp_T_31, _io_weight_tmp_T_32) @[Mult.scala 513:21]
    node io_weight_tmp = tail(_io_weight_tmp_T_33, 1) @[Mult.scala 513:21]
    node _io_weight_T = bits(io.data, 8, 8) @[Mult.scala 514:20]
    node _io_weight_T_1 = sub(UInt<9>("h100"), io_weight_tmp) @[Mult.scala 514:31]
    node _io_weight_T_2 = tail(_io_weight_T_1, 1) @[Mult.scala 514:31]
    node _io_weight_T_3 = mux(_io_weight_T, _io_weight_T_2, io_weight_tmp) @[Mult.scala 514:12]
    io.weight <= _io_weight_T_3 @[Mult.scala 523:15]
    node _io_neg_T = bits(io.data, 8, 8) @[Mult.scala 524:29]
    node _io_neg_T_1 = mux(_io_neg_T, UInt<1>("h1"), UInt<1>("h0")) @[Mult.scala 524:21]
    io.neg <= _io_neg_T_1 @[Mult.scala 524:15]

  module BoothEncoder8_4 :
    input clock : Clock
    input reset : Reset
    output io : { flip data : UInt<9>, neg : UInt<1>, weight : UInt<8>}

    node _io_weight_tmp_T = bits(io.data, 8, 8) @[Mult.scala 506:19]
    node _io_weight_tmp_T_1 = shl(_io_weight_tmp_T, 7) @[Mult.scala 506:23]
    node _io_weight_tmp_T_2 = not(_io_weight_tmp_T_1) @[Mult.scala 506:13]
    node _io_weight_tmp_T_3 = add(_io_weight_tmp_T_2, UInt<1>("h1")) @[Mult.scala 506:29]
    node _io_weight_tmp_T_4 = tail(_io_weight_tmp_T_3, 1) @[Mult.scala 506:29]
    node _io_weight_tmp_T_5 = bits(io.data, 7, 7) @[Mult.scala 507:18]
    node _io_weight_tmp_T_6 = shl(_io_weight_tmp_T_5, 6) @[Mult.scala 507:22]
    node _io_weight_tmp_T_7 = add(_io_weight_tmp_T_4, _io_weight_tmp_T_6) @[Mult.scala 506:35]
    node _io_weight_tmp_T_8 = tail(_io_weight_tmp_T_7, 1) @[Mult.scala 506:35]
    node _io_weight_tmp_T_9 = bits(io.data, 6, 6) @[Mult.scala 508:18]
    node _io_weight_tmp_T_10 = shl(_io_weight_tmp_T_9, 5) @[Mult.scala 508:22]
    node _io_weight_tmp_T_11 = add(_io_weight_tmp_T_8, _io_weight_tmp_T_10) @[Mult.scala 507:28]
    node _io_weight_tmp_T_12 = tail(_io_weight_tmp_T_11, 1) @[Mult.scala 507:28]
    node _io_weight_tmp_T_13 = bits(io.data, 5, 5) @[Mult.scala 509:18]
    node _io_weight_tmp_T_14 = shl(_io_weight_tmp_T_13, 4) @[Mult.scala 509:22]
    node _io_weight_tmp_T_15 = add(_io_weight_tmp_T_12, _io_weight_tmp_T_14) @[Mult.scala 508:28]
    node _io_weight_tmp_T_16 = tail(_io_weight_tmp_T_15, 1) @[Mult.scala 508:28]
    node _io_weight_tmp_T_17 = bits(io.data, 4, 4) @[Mult.scala 510:18]
    node _io_weight_tmp_T_18 = shl(_io_weight_tmp_T_17, 3) @[Mult.scala 510:22]
    node _io_weight_tmp_T_19 = add(_io_weight_tmp_T_16, _io_weight_tmp_T_18) @[Mult.scala 509:28]
    node _io_weight_tmp_T_20 = tail(_io_weight_tmp_T_19, 1) @[Mult.scala 509:28]
    node _io_weight_tmp_T_21 = bits(io.data, 3, 3) @[Mult.scala 511:18]
    node _io_weight_tmp_T_22 = shl(_io_weight_tmp_T_21, 2) @[Mult.scala 511:22]
    node _io_weight_tmp_T_23 = add(_io_weight_tmp_T_20, _io_weight_tmp_T_22) @[Mult.scala 510:28]
    node _io_weight_tmp_T_24 = tail(_io_weight_tmp_T_23, 1) @[Mult.scala 510:28]
    node _io_weight_tmp_T_25 = bits(io.data, 2, 2) @[Mult.scala 512:18]
    node _io_weight_tmp_T_26 = shl(_io_weight_tmp_T_25, 1) @[Mult.scala 512:22]
    node _io_weight_tmp_T_27 = add(_io_weight_tmp_T_24, _io_weight_tmp_T_26) @[Mult.scala 511:28]
    node _io_weight_tmp_T_28 = tail(_io_weight_tmp_T_27, 1) @[Mult.scala 511:28]
    node _io_weight_tmp_T_29 = bits(io.data, 1, 1) @[Mult.scala 513:17]
    node _io_weight_tmp_T_30 = add(_io_weight_tmp_T_28, _io_weight_tmp_T_29) @[Mult.scala 512:28]
    node _io_weight_tmp_T_31 = tail(_io_weight_tmp_T_30, 1) @[Mult.scala 512:28]
    node _io_weight_tmp_T_32 = bits(io.data, 0, 0) @[Mult.scala 513:27]
    node _io_weight_tmp_T_33 = add(_io_weight_tmp_T_31, _io_weight_tmp_T_32) @[Mult.scala 513:21]
    node io_weight_tmp = tail(_io_weight_tmp_T_33, 1) @[Mult.scala 513:21]
    node _io_weight_T = bits(io.data, 8, 8) @[Mult.scala 514:20]
    node _io_weight_T_1 = sub(UInt<9>("h100"), io_weight_tmp) @[Mult.scala 514:31]
    node _io_weight_T_2 = tail(_io_weight_T_1, 1) @[Mult.scala 514:31]
    node _io_weight_T_3 = mux(_io_weight_T, _io_weight_T_2, io_weight_tmp) @[Mult.scala 514:12]
    io.weight <= _io_weight_T_3 @[Mult.scala 523:15]
    node _io_neg_T = bits(io.data, 8, 8) @[Mult.scala 524:29]
    node _io_neg_T_1 = mux(_io_neg_T, UInt<1>("h1"), UInt<1>("h0")) @[Mult.scala 524:21]
    io.neg <= _io_neg_T_1 @[Mult.scala 524:15]

  module BoothEncoder8_5 :
    input clock : Clock
    input reset : Reset
    output io : { flip data : UInt<9>, neg : UInt<1>, weight : UInt<8>}

    node _io_weight_tmp_T = bits(io.data, 8, 8) @[Mult.scala 506:19]
    node _io_weight_tmp_T_1 = shl(_io_weight_tmp_T, 7) @[Mult.scala 506:23]
    node _io_weight_tmp_T_2 = not(_io_weight_tmp_T_1) @[Mult.scala 506:13]
    node _io_weight_tmp_T_3 = add(_io_weight_tmp_T_2, UInt<1>("h1")) @[Mult.scala 506:29]
    node _io_weight_tmp_T_4 = tail(_io_weight_tmp_T_3, 1) @[Mult.scala 506:29]
    node _io_weight_tmp_T_5 = bits(io.data, 7, 7) @[Mult.scala 507:18]
    node _io_weight_tmp_T_6 = shl(_io_weight_tmp_T_5, 6) @[Mult.scala 507:22]
    node _io_weight_tmp_T_7 = add(_io_weight_tmp_T_4, _io_weight_tmp_T_6) @[Mult.scala 506:35]
    node _io_weight_tmp_T_8 = tail(_io_weight_tmp_T_7, 1) @[Mult.scala 506:35]
    node _io_weight_tmp_T_9 = bits(io.data, 6, 6) @[Mult.scala 508:18]
    node _io_weight_tmp_T_10 = shl(_io_weight_tmp_T_9, 5) @[Mult.scala 508:22]
    node _io_weight_tmp_T_11 = add(_io_weight_tmp_T_8, _io_weight_tmp_T_10) @[Mult.scala 507:28]
    node _io_weight_tmp_T_12 = tail(_io_weight_tmp_T_11, 1) @[Mult.scala 507:28]
    node _io_weight_tmp_T_13 = bits(io.data, 5, 5) @[Mult.scala 509:18]
    node _io_weight_tmp_T_14 = shl(_io_weight_tmp_T_13, 4) @[Mult.scala 509:22]
    node _io_weight_tmp_T_15 = add(_io_weight_tmp_T_12, _io_weight_tmp_T_14) @[Mult.scala 508:28]
    node _io_weight_tmp_T_16 = tail(_io_weight_tmp_T_15, 1) @[Mult.scala 508:28]
    node _io_weight_tmp_T_17 = bits(io.data, 4, 4) @[Mult.scala 510:18]
    node _io_weight_tmp_T_18 = shl(_io_weight_tmp_T_17, 3) @[Mult.scala 510:22]
    node _io_weight_tmp_T_19 = add(_io_weight_tmp_T_16, _io_weight_tmp_T_18) @[Mult.scala 509:28]
    node _io_weight_tmp_T_20 = tail(_io_weight_tmp_T_19, 1) @[Mult.scala 509:28]
    node _io_weight_tmp_T_21 = bits(io.data, 3, 3) @[Mult.scala 511:18]
    node _io_weight_tmp_T_22 = shl(_io_weight_tmp_T_21, 2) @[Mult.scala 511:22]
    node _io_weight_tmp_T_23 = add(_io_weight_tmp_T_20, _io_weight_tmp_T_22) @[Mult.scala 510:28]
    node _io_weight_tmp_T_24 = tail(_io_weight_tmp_T_23, 1) @[Mult.scala 510:28]
    node _io_weight_tmp_T_25 = bits(io.data, 2, 2) @[Mult.scala 512:18]
    node _io_weight_tmp_T_26 = shl(_io_weight_tmp_T_25, 1) @[Mult.scala 512:22]
    node _io_weight_tmp_T_27 = add(_io_weight_tmp_T_24, _io_weight_tmp_T_26) @[Mult.scala 511:28]
    node _io_weight_tmp_T_28 = tail(_io_weight_tmp_T_27, 1) @[Mult.scala 511:28]
    node _io_weight_tmp_T_29 = bits(io.data, 1, 1) @[Mult.scala 513:17]
    node _io_weight_tmp_T_30 = add(_io_weight_tmp_T_28, _io_weight_tmp_T_29) @[Mult.scala 512:28]
    node _io_weight_tmp_T_31 = tail(_io_weight_tmp_T_30, 1) @[Mult.scala 512:28]
    node _io_weight_tmp_T_32 = bits(io.data, 0, 0) @[Mult.scala 513:27]
    node _io_weight_tmp_T_33 = add(_io_weight_tmp_T_31, _io_weight_tmp_T_32) @[Mult.scala 513:21]
    node io_weight_tmp = tail(_io_weight_tmp_T_33, 1) @[Mult.scala 513:21]
    node _io_weight_T = bits(io.data, 8, 8) @[Mult.scala 514:20]
    node _io_weight_T_1 = sub(UInt<9>("h100"), io_weight_tmp) @[Mult.scala 514:31]
    node _io_weight_T_2 = tail(_io_weight_T_1, 1) @[Mult.scala 514:31]
    node _io_weight_T_3 = mux(_io_weight_T, _io_weight_T_2, io_weight_tmp) @[Mult.scala 514:12]
    io.weight <= _io_weight_T_3 @[Mult.scala 523:15]
    node _io_neg_T = bits(io.data, 8, 8) @[Mult.scala 524:29]
    node _io_neg_T_1 = mux(_io_neg_T, UInt<1>("h1"), UInt<1>("h0")) @[Mult.scala 524:21]
    io.neg <= _io_neg_T_1 @[Mult.scala 524:15]

  module BoothEncoder8_6 :
    input clock : Clock
    input reset : Reset
    output io : { flip data : UInt<9>, neg : UInt<1>, weight : UInt<8>}

    node _io_weight_tmp_T = bits(io.data, 8, 8) @[Mult.scala 506:19]
    node _io_weight_tmp_T_1 = shl(_io_weight_tmp_T, 7) @[Mult.scala 506:23]
    node _io_weight_tmp_T_2 = not(_io_weight_tmp_T_1) @[Mult.scala 506:13]
    node _io_weight_tmp_T_3 = add(_io_weight_tmp_T_2, UInt<1>("h1")) @[Mult.scala 506:29]
    node _io_weight_tmp_T_4 = tail(_io_weight_tmp_T_3, 1) @[Mult.scala 506:29]
    node _io_weight_tmp_T_5 = bits(io.data, 7, 7) @[Mult.scala 507:18]
    node _io_weight_tmp_T_6 = shl(_io_weight_tmp_T_5, 6) @[Mult.scala 507:22]
    node _io_weight_tmp_T_7 = add(_io_weight_tmp_T_4, _io_weight_tmp_T_6) @[Mult.scala 506:35]
    node _io_weight_tmp_T_8 = tail(_io_weight_tmp_T_7, 1) @[Mult.scala 506:35]
    node _io_weight_tmp_T_9 = bits(io.data, 6, 6) @[Mult.scala 508:18]
    node _io_weight_tmp_T_10 = shl(_io_weight_tmp_T_9, 5) @[Mult.scala 508:22]
    node _io_weight_tmp_T_11 = add(_io_weight_tmp_T_8, _io_weight_tmp_T_10) @[Mult.scala 507:28]
    node _io_weight_tmp_T_12 = tail(_io_weight_tmp_T_11, 1) @[Mult.scala 507:28]
    node _io_weight_tmp_T_13 = bits(io.data, 5, 5) @[Mult.scala 509:18]
    node _io_weight_tmp_T_14 = shl(_io_weight_tmp_T_13, 4) @[Mult.scala 509:22]
    node _io_weight_tmp_T_15 = add(_io_weight_tmp_T_12, _io_weight_tmp_T_14) @[Mult.scala 508:28]
    node _io_weight_tmp_T_16 = tail(_io_weight_tmp_T_15, 1) @[Mult.scala 508:28]
    node _io_weight_tmp_T_17 = bits(io.data, 4, 4) @[Mult.scala 510:18]
    node _io_weight_tmp_T_18 = shl(_io_weight_tmp_T_17, 3) @[Mult.scala 510:22]
    node _io_weight_tmp_T_19 = add(_io_weight_tmp_T_16, _io_weight_tmp_T_18) @[Mult.scala 509:28]
    node _io_weight_tmp_T_20 = tail(_io_weight_tmp_T_19, 1) @[Mult.scala 509:28]
    node _io_weight_tmp_T_21 = bits(io.data, 3, 3) @[Mult.scala 511:18]
    node _io_weight_tmp_T_22 = shl(_io_weight_tmp_T_21, 2) @[Mult.scala 511:22]
    node _io_weight_tmp_T_23 = add(_io_weight_tmp_T_20, _io_weight_tmp_T_22) @[Mult.scala 510:28]
    node _io_weight_tmp_T_24 = tail(_io_weight_tmp_T_23, 1) @[Mult.scala 510:28]
    node _io_weight_tmp_T_25 = bits(io.data, 2, 2) @[Mult.scala 512:18]
    node _io_weight_tmp_T_26 = shl(_io_weight_tmp_T_25, 1) @[Mult.scala 512:22]
    node _io_weight_tmp_T_27 = add(_io_weight_tmp_T_24, _io_weight_tmp_T_26) @[Mult.scala 511:28]
    node _io_weight_tmp_T_28 = tail(_io_weight_tmp_T_27, 1) @[Mult.scala 511:28]
    node _io_weight_tmp_T_29 = bits(io.data, 1, 1) @[Mult.scala 513:17]
    node _io_weight_tmp_T_30 = add(_io_weight_tmp_T_28, _io_weight_tmp_T_29) @[Mult.scala 512:28]
    node _io_weight_tmp_T_31 = tail(_io_weight_tmp_T_30, 1) @[Mult.scala 512:28]
    node _io_weight_tmp_T_32 = bits(io.data, 0, 0) @[Mult.scala 513:27]
    node _io_weight_tmp_T_33 = add(_io_weight_tmp_T_31, _io_weight_tmp_T_32) @[Mult.scala 513:21]
    node io_weight_tmp = tail(_io_weight_tmp_T_33, 1) @[Mult.scala 513:21]
    node _io_weight_T = bits(io.data, 8, 8) @[Mult.scala 514:20]
    node _io_weight_T_1 = sub(UInt<9>("h100"), io_weight_tmp) @[Mult.scala 514:31]
    node _io_weight_T_2 = tail(_io_weight_T_1, 1) @[Mult.scala 514:31]
    node _io_weight_T_3 = mux(_io_weight_T, _io_weight_T_2, io_weight_tmp) @[Mult.scala 514:12]
    io.weight <= _io_weight_T_3 @[Mult.scala 523:15]
    node _io_neg_T = bits(io.data, 8, 8) @[Mult.scala 524:29]
    node _io_neg_T_1 = mux(_io_neg_T, UInt<1>("h1"), UInt<1>("h0")) @[Mult.scala 524:21]
    io.neg <= _io_neg_T_1 @[Mult.scala 524:15]

  module BoothEncoder8_7 :
    input clock : Clock
    input reset : Reset
    output io : { flip data : UInt<9>, neg : UInt<1>, weight : UInt<8>}

    node _io_weight_tmp_T = bits(io.data, 8, 8) @[Mult.scala 506:19]
    node _io_weight_tmp_T_1 = shl(_io_weight_tmp_T, 7) @[Mult.scala 506:23]
    node _io_weight_tmp_T_2 = not(_io_weight_tmp_T_1) @[Mult.scala 506:13]
    node _io_weight_tmp_T_3 = add(_io_weight_tmp_T_2, UInt<1>("h1")) @[Mult.scala 506:29]
    node _io_weight_tmp_T_4 = tail(_io_weight_tmp_T_3, 1) @[Mult.scala 506:29]
    node _io_weight_tmp_T_5 = bits(io.data, 7, 7) @[Mult.scala 507:18]
    node _io_weight_tmp_T_6 = shl(_io_weight_tmp_T_5, 6) @[Mult.scala 507:22]
    node _io_weight_tmp_T_7 = add(_io_weight_tmp_T_4, _io_weight_tmp_T_6) @[Mult.scala 506:35]
    node _io_weight_tmp_T_8 = tail(_io_weight_tmp_T_7, 1) @[Mult.scala 506:35]
    node _io_weight_tmp_T_9 = bits(io.data, 6, 6) @[Mult.scala 508:18]
    node _io_weight_tmp_T_10 = shl(_io_weight_tmp_T_9, 5) @[Mult.scala 508:22]
    node _io_weight_tmp_T_11 = add(_io_weight_tmp_T_8, _io_weight_tmp_T_10) @[Mult.scala 507:28]
    node _io_weight_tmp_T_12 = tail(_io_weight_tmp_T_11, 1) @[Mult.scala 507:28]
    node _io_weight_tmp_T_13 = bits(io.data, 5, 5) @[Mult.scala 509:18]
    node _io_weight_tmp_T_14 = shl(_io_weight_tmp_T_13, 4) @[Mult.scala 509:22]
    node _io_weight_tmp_T_15 = add(_io_weight_tmp_T_12, _io_weight_tmp_T_14) @[Mult.scala 508:28]
    node _io_weight_tmp_T_16 = tail(_io_weight_tmp_T_15, 1) @[Mult.scala 508:28]
    node _io_weight_tmp_T_17 = bits(io.data, 4, 4) @[Mult.scala 510:18]
    node _io_weight_tmp_T_18 = shl(_io_weight_tmp_T_17, 3) @[Mult.scala 510:22]
    node _io_weight_tmp_T_19 = add(_io_weight_tmp_T_16, _io_weight_tmp_T_18) @[Mult.scala 509:28]
    node _io_weight_tmp_T_20 = tail(_io_weight_tmp_T_19, 1) @[Mult.scala 509:28]
    node _io_weight_tmp_T_21 = bits(io.data, 3, 3) @[Mult.scala 511:18]
    node _io_weight_tmp_T_22 = shl(_io_weight_tmp_T_21, 2) @[Mult.scala 511:22]
    node _io_weight_tmp_T_23 = add(_io_weight_tmp_T_20, _io_weight_tmp_T_22) @[Mult.scala 510:28]
    node _io_weight_tmp_T_24 = tail(_io_weight_tmp_T_23, 1) @[Mult.scala 510:28]
    node _io_weight_tmp_T_25 = bits(io.data, 2, 2) @[Mult.scala 512:18]
    node _io_weight_tmp_T_26 = shl(_io_weight_tmp_T_25, 1) @[Mult.scala 512:22]
    node _io_weight_tmp_T_27 = add(_io_weight_tmp_T_24, _io_weight_tmp_T_26) @[Mult.scala 511:28]
    node _io_weight_tmp_T_28 = tail(_io_weight_tmp_T_27, 1) @[Mult.scala 511:28]
    node _io_weight_tmp_T_29 = bits(io.data, 1, 1) @[Mult.scala 513:17]
    node _io_weight_tmp_T_30 = add(_io_weight_tmp_T_28, _io_weight_tmp_T_29) @[Mult.scala 512:28]
    node _io_weight_tmp_T_31 = tail(_io_weight_tmp_T_30, 1) @[Mult.scala 512:28]
    node _io_weight_tmp_T_32 = bits(io.data, 0, 0) @[Mult.scala 513:27]
    node _io_weight_tmp_T_33 = add(_io_weight_tmp_T_31, _io_weight_tmp_T_32) @[Mult.scala 513:21]
    node io_weight_tmp = tail(_io_weight_tmp_T_33, 1) @[Mult.scala 513:21]
    node _io_weight_T = bits(io.data, 8, 8) @[Mult.scala 514:20]
    node _io_weight_T_1 = sub(UInt<9>("h100"), io_weight_tmp) @[Mult.scala 514:31]
    node _io_weight_T_2 = tail(_io_weight_T_1, 1) @[Mult.scala 514:31]
    node _io_weight_T_3 = mux(_io_weight_T, _io_weight_T_2, io_weight_tmp) @[Mult.scala 514:12]
    io.weight <= _io_weight_T_3 @[Mult.scala 523:15]
    node _io_neg_T = bits(io.data, 8, 8) @[Mult.scala 524:29]
    node _io_neg_T_1 = mux(_io_neg_T, UInt<1>("h1"), UInt<1>("h0")) @[Mult.scala 524:21]
    io.neg <= _io_neg_T_1 @[Mult.scala 524:15]

  module Csa :
    input clock : Clock
    input reset : Reset
    output io : { flip a : UInt<128>, flip b : UInt<128>, flip c : UInt<128>, carry : UInt<128>, temp_sum : UInt<128>}

    node _io_carry_T = and(io.a, io.b) @[Mult.scala 475:24]
    node _io_carry_T_1 = and(io.a, io.c) @[Mult.scala 475:40]
    node _io_carry_T_2 = or(_io_carry_T, _io_carry_T_1) @[Mult.scala 475:32]
    node _io_carry_T_3 = and(io.b, io.c) @[Mult.scala 475:56]
    node _io_carry_T_4 = or(_io_carry_T_2, _io_carry_T_3) @[Mult.scala 475:48]
    node _io_carry_T_5 = shl(_io_carry_T_4, 1) @[Mult.scala 475:65]
    io.carry <= _io_carry_T_5 @[Mult.scala 475:14]
    node _io_temp_sum_T = xor(io.a, io.b) @[Mult.scala 476:25]
    node _io_temp_sum_T_1 = xor(_io_temp_sum_T, io.c) @[Mult.scala 476:32]
    io.temp_sum <= _io_temp_sum_T_1 @[Mult.scala 476:17]

  module Csa_1 :
    input clock : Clock
    input reset : Reset
    output io : { flip a : UInt<128>, flip b : UInt<128>, flip c : UInt<128>, carry : UInt<128>, temp_sum : UInt<128>}

    node _io_carry_T = and(io.a, io.b) @[Mult.scala 475:24]
    node _io_carry_T_1 = and(io.a, io.c) @[Mult.scala 475:40]
    node _io_carry_T_2 = or(_io_carry_T, _io_carry_T_1) @[Mult.scala 475:32]
    node _io_carry_T_3 = and(io.b, io.c) @[Mult.scala 475:56]
    node _io_carry_T_4 = or(_io_carry_T_2, _io_carry_T_3) @[Mult.scala 475:48]
    node _io_carry_T_5 = shl(_io_carry_T_4, 1) @[Mult.scala 475:65]
    io.carry <= _io_carry_T_5 @[Mult.scala 475:14]
    node _io_temp_sum_T = xor(io.a, io.b) @[Mult.scala 476:25]
    node _io_temp_sum_T_1 = xor(_io_temp_sum_T, io.c) @[Mult.scala 476:32]
    io.temp_sum <= _io_temp_sum_T_1 @[Mult.scala 476:17]

  module Csa_2 :
    input clock : Clock
    input reset : Reset
    output io : { flip a : UInt<128>, flip b : UInt<128>, flip c : UInt<128>, carry : UInt<128>, temp_sum : UInt<128>}

    node _io_carry_T = and(io.a, io.b) @[Mult.scala 475:24]
    node _io_carry_T_1 = and(io.a, io.c) @[Mult.scala 475:40]
    node _io_carry_T_2 = or(_io_carry_T, _io_carry_T_1) @[Mult.scala 475:32]
    node _io_carry_T_3 = and(io.b, io.c) @[Mult.scala 475:56]
    node _io_carry_T_4 = or(_io_carry_T_2, _io_carry_T_3) @[Mult.scala 475:48]
    node _io_carry_T_5 = shl(_io_carry_T_4, 1) @[Mult.scala 475:65]
    io.carry <= _io_carry_T_5 @[Mult.scala 475:14]
    node _io_temp_sum_T = xor(io.a, io.b) @[Mult.scala 476:25]
    node _io_temp_sum_T_1 = xor(_io_temp_sum_T, io.c) @[Mult.scala 476:32]
    io.temp_sum <= _io_temp_sum_T_1 @[Mult.scala 476:17]

  module Csa_3 :
    input clock : Clock
    input reset : Reset
    output io : { flip a : UInt<128>, flip b : UInt<128>, flip c : UInt<128>, carry : UInt<128>, temp_sum : UInt<128>}

    node _io_carry_T = and(io.a, io.b) @[Mult.scala 475:24]
    node _io_carry_T_1 = and(io.a, io.c) @[Mult.scala 475:40]
    node _io_carry_T_2 = or(_io_carry_T, _io_carry_T_1) @[Mult.scala 475:32]
    node _io_carry_T_3 = and(io.b, io.c) @[Mult.scala 475:56]
    node _io_carry_T_4 = or(_io_carry_T_2, _io_carry_T_3) @[Mult.scala 475:48]
    node _io_carry_T_5 = shl(_io_carry_T_4, 1) @[Mult.scala 475:65]
    io.carry <= _io_carry_T_5 @[Mult.scala 475:14]
    node _io_temp_sum_T = xor(io.a, io.b) @[Mult.scala 476:25]
    node _io_temp_sum_T_1 = xor(_io_temp_sum_T, io.c) @[Mult.scala 476:32]
    io.temp_sum <= _io_temp_sum_T_1 @[Mult.scala 476:17]

  module Csa_4 :
    input clock : Clock
    input reset : Reset
    output io : { flip a : UInt<128>, flip b : UInt<128>, flip c : UInt<128>, carry : UInt<128>, temp_sum : UInt<128>}

    node _io_carry_T = and(io.a, io.b) @[Mult.scala 475:24]
    node _io_carry_T_1 = and(io.a, io.c) @[Mult.scala 475:40]
    node _io_carry_T_2 = or(_io_carry_T, _io_carry_T_1) @[Mult.scala 475:32]
    node _io_carry_T_3 = and(io.b, io.c) @[Mult.scala 475:56]
    node _io_carry_T_4 = or(_io_carry_T_2, _io_carry_T_3) @[Mult.scala 475:48]
    node _io_carry_T_5 = shl(_io_carry_T_4, 1) @[Mult.scala 475:65]
    io.carry <= _io_carry_T_5 @[Mult.scala 475:14]
    node _io_temp_sum_T = xor(io.a, io.b) @[Mult.scala 476:25]
    node _io_temp_sum_T_1 = xor(_io_temp_sum_T, io.c) @[Mult.scala 476:32]
    io.temp_sum <= _io_temp_sum_T_1 @[Mult.scala 476:17]

  module Csa_5 :
    input clock : Clock
    input reset : Reset
    output io : { flip a : UInt<128>, flip b : UInt<128>, flip c : UInt<128>, carry : UInt<128>, temp_sum : UInt<128>}

    node _io_carry_T = and(io.a, io.b) @[Mult.scala 475:24]
    node _io_carry_T_1 = and(io.a, io.c) @[Mult.scala 475:40]
    node _io_carry_T_2 = or(_io_carry_T, _io_carry_T_1) @[Mult.scala 475:32]
    node _io_carry_T_3 = and(io.b, io.c) @[Mult.scala 475:56]
    node _io_carry_T_4 = or(_io_carry_T_2, _io_carry_T_3) @[Mult.scala 475:48]
    node _io_carry_T_5 = shl(_io_carry_T_4, 1) @[Mult.scala 475:65]
    io.carry <= _io_carry_T_5 @[Mult.scala 475:14]
    node _io_temp_sum_T = xor(io.a, io.b) @[Mult.scala 476:25]
    node _io_temp_sum_T_1 = xor(_io_temp_sum_T, io.c) @[Mult.scala 476:32]
    io.temp_sum <= _io_temp_sum_T_1 @[Mult.scala 476:17]

  module BoothEncoder2 :
    input clock : Clock
    input reset : Reset
    output io : { flip data : UInt<3>, weight : UInt<2>, neg : UInt<1>}

    node _io_weight_tmp_T = bits(io.data, 2, 2) @[Mult.scala 530:26]
    node _io_weight_tmp_T_1 = mux(_io_weight_tmp_T, UInt<2>("h2"), UInt<1>("h0")) @[Mult.scala 530:21]
    node _io_weight_tmp_T_2 = bits(io.data, 1, 1) @[Mult.scala 530:53]
    node _io_weight_tmp_T_3 = add(_io_weight_tmp_T_1, _io_weight_tmp_T_2) @[Mult.scala 530:47]
    node _io_weight_tmp_T_4 = tail(_io_weight_tmp_T_3, 1) @[Mult.scala 530:47]
    node _io_weight_tmp_T_5 = bits(io.data, 0, 0) @[Mult.scala 530:63]
    node _io_weight_tmp_T_6 = add(_io_weight_tmp_T_4, _io_weight_tmp_T_5) @[Mult.scala 530:57]
    node io_weight_tmp = tail(_io_weight_tmp_T_6, 1) @[Mult.scala 530:57]
    node _io_weight_T = bits(io.data, 2, 2) @[Mult.scala 531:20]
    node _io_weight_T_1 = sub(UInt<3>("h4"), io_weight_tmp) @[Mult.scala 531:29]
    node _io_weight_T_2 = tail(_io_weight_T_1, 1) @[Mult.scala 531:29]
    node _io_weight_T_3 = mux(_io_weight_T, _io_weight_T_2, io_weight_tmp) @[Mult.scala 531:12]
    io.weight <= _io_weight_T_3 @[Mult.scala 538:15]
    node _io_neg_T = bits(io.data, 2, 2) @[Mult.scala 539:25]
    io.neg <= _io_neg_T @[Mult.scala 539:15]

  module BoothEncoder2_1 :
    input clock : Clock
    input reset : Reset
    output io : { flip data : UInt<3>, weight : UInt<2>, neg : UInt<1>}

    node _io_weight_tmp_T = bits(io.data, 2, 2) @[Mult.scala 530:26]
    node _io_weight_tmp_T_1 = mux(_io_weight_tmp_T, UInt<2>("h2"), UInt<1>("h0")) @[Mult.scala 530:21]
    node _io_weight_tmp_T_2 = bits(io.data, 1, 1) @[Mult.scala 530:53]
    node _io_weight_tmp_T_3 = add(_io_weight_tmp_T_1, _io_weight_tmp_T_2) @[Mult.scala 530:47]
    node _io_weight_tmp_T_4 = tail(_io_weight_tmp_T_3, 1) @[Mult.scala 530:47]
    node _io_weight_tmp_T_5 = bits(io.data, 0, 0) @[Mult.scala 530:63]
    node _io_weight_tmp_T_6 = add(_io_weight_tmp_T_4, _io_weight_tmp_T_5) @[Mult.scala 530:57]
    node io_weight_tmp = tail(_io_weight_tmp_T_6, 1) @[Mult.scala 530:57]
    node _io_weight_T = bits(io.data, 2, 2) @[Mult.scala 531:20]
    node _io_weight_T_1 = sub(UInt<3>("h4"), io_weight_tmp) @[Mult.scala 531:29]
    node _io_weight_T_2 = tail(_io_weight_T_1, 1) @[Mult.scala 531:29]
    node _io_weight_T_3 = mux(_io_weight_T, _io_weight_T_2, io_weight_tmp) @[Mult.scala 531:12]
    io.weight <= _io_weight_T_3 @[Mult.scala 538:15]
    node _io_neg_T = bits(io.data, 2, 2) @[Mult.scala 539:25]
    io.neg <= _io_neg_T @[Mult.scala 539:15]

  module BoothEncoder2_2 :
    input clock : Clock
    input reset : Reset
    output io : { flip data : UInt<3>, weight : UInt<2>, neg : UInt<1>}

    node _io_weight_tmp_T = bits(io.data, 2, 2) @[Mult.scala 530:26]
    node _io_weight_tmp_T_1 = mux(_io_weight_tmp_T, UInt<2>("h2"), UInt<1>("h0")) @[Mult.scala 530:21]
    node _io_weight_tmp_T_2 = bits(io.data, 1, 1) @[Mult.scala 530:53]
    node _io_weight_tmp_T_3 = add(_io_weight_tmp_T_1, _io_weight_tmp_T_2) @[Mult.scala 530:47]
    node _io_weight_tmp_T_4 = tail(_io_weight_tmp_T_3, 1) @[Mult.scala 530:47]
    node _io_weight_tmp_T_5 = bits(io.data, 0, 0) @[Mult.scala 530:63]
    node _io_weight_tmp_T_6 = add(_io_weight_tmp_T_4, _io_weight_tmp_T_5) @[Mult.scala 530:57]
    node io_weight_tmp = tail(_io_weight_tmp_T_6, 1) @[Mult.scala 530:57]
    node _io_weight_T = bits(io.data, 2, 2) @[Mult.scala 531:20]
    node _io_weight_T_1 = sub(UInt<3>("h4"), io_weight_tmp) @[Mult.scala 531:29]
    node _io_weight_T_2 = tail(_io_weight_T_1, 1) @[Mult.scala 531:29]
    node _io_weight_T_3 = mux(_io_weight_T, _io_weight_T_2, io_weight_tmp) @[Mult.scala 531:12]
    io.weight <= _io_weight_T_3 @[Mult.scala 538:15]
    node _io_neg_T = bits(io.data, 2, 2) @[Mult.scala 539:25]
    io.neg <= _io_neg_T @[Mult.scala 539:15]

  module BoothEncoder2_3 :
    input clock : Clock
    input reset : Reset
    output io : { flip data : UInt<3>, weight : UInt<2>, neg : UInt<1>}

    node _io_weight_tmp_T = bits(io.data, 2, 2) @[Mult.scala 530:26]
    node _io_weight_tmp_T_1 = mux(_io_weight_tmp_T, UInt<2>("h2"), UInt<1>("h0")) @[Mult.scala 530:21]
    node _io_weight_tmp_T_2 = bits(io.data, 1, 1) @[Mult.scala 530:53]
    node _io_weight_tmp_T_3 = add(_io_weight_tmp_T_1, _io_weight_tmp_T_2) @[Mult.scala 530:47]
    node _io_weight_tmp_T_4 = tail(_io_weight_tmp_T_3, 1) @[Mult.scala 530:47]
    node _io_weight_tmp_T_5 = bits(io.data, 0, 0) @[Mult.scala 530:63]
    node _io_weight_tmp_T_6 = add(_io_weight_tmp_T_4, _io_weight_tmp_T_5) @[Mult.scala 530:57]
    node io_weight_tmp = tail(_io_weight_tmp_T_6, 1) @[Mult.scala 530:57]
    node _io_weight_T = bits(io.data, 2, 2) @[Mult.scala 531:20]
    node _io_weight_T_1 = sub(UInt<3>("h4"), io_weight_tmp) @[Mult.scala 531:29]
    node _io_weight_T_2 = tail(_io_weight_T_1, 1) @[Mult.scala 531:29]
    node _io_weight_T_3 = mux(_io_weight_T, _io_weight_T_2, io_weight_tmp) @[Mult.scala 531:12]
    io.weight <= _io_weight_T_3 @[Mult.scala 538:15]
    node _io_neg_T = bits(io.data, 2, 2) @[Mult.scala 539:25]
    io.neg <= _io_neg_T @[Mult.scala 539:15]

  module Ppg2 :
    input clock : Clock
    input reset : Reset
    output io : { flip weight : UInt<2>, flip neg : UInt<1>, flip data : UInt<128>, output : UInt<128>}

    node _tmp_T = not(io.data) @[Mult.scala 550:29]
    node _tmp_T_1 = add(_tmp_T, UInt<1>("h1")) @[Mult.scala 550:38]
    node _tmp_T_2 = tail(_tmp_T_1, 1) @[Mult.scala 550:38]
    node tmp = mux(io.neg, _tmp_T_2, io.data) @[Mult.scala 550:20]
    node _res_T = cat(tmp, UInt<1>("h0")) @[Cat.scala 31:58]
    node _res_T_1 = eq(UInt<1>("h0"), io.weight) @[Mux.scala 81:61]
    node _res_T_2 = mux(_res_T_1, UInt<1>("h0"), UInt<1>("h0")) @[Mux.scala 81:58]
    node _res_T_3 = eq(UInt<1>("h1"), io.weight) @[Mux.scala 81:61]
    node _res_T_4 = mux(_res_T_3, tmp, _res_T_2) @[Mux.scala 81:58]
    node _res_T_5 = eq(UInt<2>("h2"), io.weight) @[Mux.scala 81:61]
    node res = mux(_res_T_5, _res_T, _res_T_4) @[Mux.scala 81:58]
    io.output <= res @[Mult.scala 556:15]

  module Ppg2_1 :
    input clock : Clock
    input reset : Reset
    output io : { flip weight : UInt<2>, flip neg : UInt<1>, flip data : UInt<128>, output : UInt<128>}

    node _tmp_T = not(io.data) @[Mult.scala 550:29]
    node _tmp_T_1 = add(_tmp_T, UInt<1>("h1")) @[Mult.scala 550:38]
    node _tmp_T_2 = tail(_tmp_T_1, 1) @[Mult.scala 550:38]
    node tmp = mux(io.neg, _tmp_T_2, io.data) @[Mult.scala 550:20]
    node _res_T = cat(tmp, UInt<1>("h0")) @[Cat.scala 31:58]
    node _res_T_1 = eq(UInt<1>("h0"), io.weight) @[Mux.scala 81:61]
    node _res_T_2 = mux(_res_T_1, UInt<1>("h0"), UInt<1>("h0")) @[Mux.scala 81:58]
    node _res_T_3 = eq(UInt<1>("h1"), io.weight) @[Mux.scala 81:61]
    node _res_T_4 = mux(_res_T_3, tmp, _res_T_2) @[Mux.scala 81:58]
    node _res_T_5 = eq(UInt<2>("h2"), io.weight) @[Mux.scala 81:61]
    node res = mux(_res_T_5, _res_T, _res_T_4) @[Mux.scala 81:58]
    io.output <= res @[Mult.scala 556:15]

  module Ppg2_2 :
    input clock : Clock
    input reset : Reset
    output io : { flip weight : UInt<2>, flip neg : UInt<1>, flip data : UInt<128>, output : UInt<128>}

    node _tmp_T = not(io.data) @[Mult.scala 550:29]
    node _tmp_T_1 = add(_tmp_T, UInt<1>("h1")) @[Mult.scala 550:38]
    node _tmp_T_2 = tail(_tmp_T_1, 1) @[Mult.scala 550:38]
    node tmp = mux(io.neg, _tmp_T_2, io.data) @[Mult.scala 550:20]
    node _res_T = cat(tmp, UInt<1>("h0")) @[Cat.scala 31:58]
    node _res_T_1 = eq(UInt<1>("h0"), io.weight) @[Mux.scala 81:61]
    node _res_T_2 = mux(_res_T_1, UInt<1>("h0"), UInt<1>("h0")) @[Mux.scala 81:58]
    node _res_T_3 = eq(UInt<1>("h1"), io.weight) @[Mux.scala 81:61]
    node _res_T_4 = mux(_res_T_3, tmp, _res_T_2) @[Mux.scala 81:58]
    node _res_T_5 = eq(UInt<2>("h2"), io.weight) @[Mux.scala 81:61]
    node res = mux(_res_T_5, _res_T, _res_T_4) @[Mux.scala 81:58]
    io.output <= res @[Mult.scala 556:15]

  module Ppg2_3 :
    input clock : Clock
    input reset : Reset
    output io : { flip weight : UInt<2>, flip neg : UInt<1>, flip data : UInt<128>, output : UInt<128>}

    node _tmp_T = not(io.data) @[Mult.scala 550:29]
    node _tmp_T_1 = add(_tmp_T, UInt<1>("h1")) @[Mult.scala 550:38]
    node _tmp_T_2 = tail(_tmp_T_1, 1) @[Mult.scala 550:38]
    node tmp = mux(io.neg, _tmp_T_2, io.data) @[Mult.scala 550:20]
    node _res_T = cat(tmp, UInt<1>("h0")) @[Cat.scala 31:58]
    node _res_T_1 = eq(UInt<1>("h0"), io.weight) @[Mux.scala 81:61]
    node _res_T_2 = mux(_res_T_1, UInt<1>("h0"), UInt<1>("h0")) @[Mux.scala 81:58]
    node _res_T_3 = eq(UInt<1>("h1"), io.weight) @[Mux.scala 81:61]
    node _res_T_4 = mux(_res_T_3, tmp, _res_T_2) @[Mux.scala 81:58]
    node _res_T_5 = eq(UInt<2>("h2"), io.weight) @[Mux.scala 81:61]
    node res = mux(_res_T_5, _res_T, _res_T_4) @[Mux.scala 81:58]
    io.output <= res @[Mult.scala 556:15]

  module Csa_6 :
    input clock : Clock
    input reset : Reset
    output io : { flip a : UInt<128>, flip b : UInt<128>, flip c : UInt<128>, carry : UInt<128>, temp_sum : UInt<128>}

    node _io_carry_T = and(io.a, io.b) @[Mult.scala 475:24]
    node _io_carry_T_1 = and(io.a, io.c) @[Mult.scala 475:40]
    node _io_carry_T_2 = or(_io_carry_T, _io_carry_T_1) @[Mult.scala 475:32]
    node _io_carry_T_3 = and(io.b, io.c) @[Mult.scala 475:56]
    node _io_carry_T_4 = or(_io_carry_T_2, _io_carry_T_3) @[Mult.scala 475:48]
    node _io_carry_T_5 = shl(_io_carry_T_4, 1) @[Mult.scala 475:65]
    io.carry <= _io_carry_T_5 @[Mult.scala 475:14]
    node _io_temp_sum_T = xor(io.a, io.b) @[Mult.scala 476:25]
    node _io_temp_sum_T_1 = xor(_io_temp_sum_T, io.c) @[Mult.scala 476:32]
    io.temp_sum <= _io_temp_sum_T_1 @[Mult.scala 476:17]

  module Csa_7 :
    input clock : Clock
    input reset : Reset
    output io : { flip a : UInt<128>, flip b : UInt<128>, flip c : UInt<128>, carry : UInt<128>, temp_sum : UInt<128>}

    node _io_carry_T = and(io.a, io.b) @[Mult.scala 475:24]
    node _io_carry_T_1 = and(io.a, io.c) @[Mult.scala 475:40]
    node _io_carry_T_2 = or(_io_carry_T, _io_carry_T_1) @[Mult.scala 475:32]
    node _io_carry_T_3 = and(io.b, io.c) @[Mult.scala 475:56]
    node _io_carry_T_4 = or(_io_carry_T_2, _io_carry_T_3) @[Mult.scala 475:48]
    node _io_carry_T_5 = shl(_io_carry_T_4, 1) @[Mult.scala 475:65]
    io.carry <= _io_carry_T_5 @[Mult.scala 475:14]
    node _io_temp_sum_T = xor(io.a, io.b) @[Mult.scala 476:25]
    node _io_temp_sum_T_1 = xor(_io_temp_sum_T, io.c) @[Mult.scala 476:32]
    io.temp_sum <= _io_temp_sum_T_1 @[Mult.scala 476:17]

  module BoothEncoder2_4 :
    input clock : Clock
    input reset : Reset
    output io : { flip data : UInt<3>, weight : UInt<2>, neg : UInt<1>}

    node _io_weight_tmp_T = bits(io.data, 2, 2) @[Mult.scala 530:26]
    node _io_weight_tmp_T_1 = mux(_io_weight_tmp_T, UInt<2>("h2"), UInt<1>("h0")) @[Mult.scala 530:21]
    node _io_weight_tmp_T_2 = bits(io.data, 1, 1) @[Mult.scala 530:53]
    node _io_weight_tmp_T_3 = add(_io_weight_tmp_T_1, _io_weight_tmp_T_2) @[Mult.scala 530:47]
    node _io_weight_tmp_T_4 = tail(_io_weight_tmp_T_3, 1) @[Mult.scala 530:47]
    node _io_weight_tmp_T_5 = bits(io.data, 0, 0) @[Mult.scala 530:63]
    node _io_weight_tmp_T_6 = add(_io_weight_tmp_T_4, _io_weight_tmp_T_5) @[Mult.scala 530:57]
    node io_weight_tmp = tail(_io_weight_tmp_T_6, 1) @[Mult.scala 530:57]
    node _io_weight_T = bits(io.data, 2, 2) @[Mult.scala 531:20]
    node _io_weight_T_1 = sub(UInt<3>("h4"), io_weight_tmp) @[Mult.scala 531:29]
    node _io_weight_T_2 = tail(_io_weight_T_1, 1) @[Mult.scala 531:29]
    node _io_weight_T_3 = mux(_io_weight_T, _io_weight_T_2, io_weight_tmp) @[Mult.scala 531:12]
    io.weight <= _io_weight_T_3 @[Mult.scala 538:15]
    node _io_neg_T = bits(io.data, 2, 2) @[Mult.scala 539:25]
    io.neg <= _io_neg_T @[Mult.scala 539:15]

  module BoothEncoder2_5 :
    input clock : Clock
    input reset : Reset
    output io : { flip data : UInt<3>, weight : UInt<2>, neg : UInt<1>}

    node _io_weight_tmp_T = bits(io.data, 2, 2) @[Mult.scala 530:26]
    node _io_weight_tmp_T_1 = mux(_io_weight_tmp_T, UInt<2>("h2"), UInt<1>("h0")) @[Mult.scala 530:21]
    node _io_weight_tmp_T_2 = bits(io.data, 1, 1) @[Mult.scala 530:53]
    node _io_weight_tmp_T_3 = add(_io_weight_tmp_T_1, _io_weight_tmp_T_2) @[Mult.scala 530:47]
    node _io_weight_tmp_T_4 = tail(_io_weight_tmp_T_3, 1) @[Mult.scala 530:47]
    node _io_weight_tmp_T_5 = bits(io.data, 0, 0) @[Mult.scala 530:63]
    node _io_weight_tmp_T_6 = add(_io_weight_tmp_T_4, _io_weight_tmp_T_5) @[Mult.scala 530:57]
    node io_weight_tmp = tail(_io_weight_tmp_T_6, 1) @[Mult.scala 530:57]
    node _io_weight_T = bits(io.data, 2, 2) @[Mult.scala 531:20]
    node _io_weight_T_1 = sub(UInt<3>("h4"), io_weight_tmp) @[Mult.scala 531:29]
    node _io_weight_T_2 = tail(_io_weight_T_1, 1) @[Mult.scala 531:29]
    node _io_weight_T_3 = mux(_io_weight_T, _io_weight_T_2, io_weight_tmp) @[Mult.scala 531:12]
    io.weight <= _io_weight_T_3 @[Mult.scala 538:15]
    node _io_neg_T = bits(io.data, 2, 2) @[Mult.scala 539:25]
    io.neg <= _io_neg_T @[Mult.scala 539:15]

  module BoothEncoder2_6 :
    input clock : Clock
    input reset : Reset
    output io : { flip data : UInt<3>, weight : UInt<2>, neg : UInt<1>}

    node _io_weight_tmp_T = bits(io.data, 2, 2) @[Mult.scala 530:26]
    node _io_weight_tmp_T_1 = mux(_io_weight_tmp_T, UInt<2>("h2"), UInt<1>("h0")) @[Mult.scala 530:21]
    node _io_weight_tmp_T_2 = bits(io.data, 1, 1) @[Mult.scala 530:53]
    node _io_weight_tmp_T_3 = add(_io_weight_tmp_T_1, _io_weight_tmp_T_2) @[Mult.scala 530:47]
    node _io_weight_tmp_T_4 = tail(_io_weight_tmp_T_3, 1) @[Mult.scala 530:47]
    node _io_weight_tmp_T_5 = bits(io.data, 0, 0) @[Mult.scala 530:63]
    node _io_weight_tmp_T_6 = add(_io_weight_tmp_T_4, _io_weight_tmp_T_5) @[Mult.scala 530:57]
    node io_weight_tmp = tail(_io_weight_tmp_T_6, 1) @[Mult.scala 530:57]
    node _io_weight_T = bits(io.data, 2, 2) @[Mult.scala 531:20]
    node _io_weight_T_1 = sub(UInt<3>("h4"), io_weight_tmp) @[Mult.scala 531:29]
    node _io_weight_T_2 = tail(_io_weight_T_1, 1) @[Mult.scala 531:29]
    node _io_weight_T_3 = mux(_io_weight_T, _io_weight_T_2, io_weight_tmp) @[Mult.scala 531:12]
    io.weight <= _io_weight_T_3 @[Mult.scala 538:15]
    node _io_neg_T = bits(io.data, 2, 2) @[Mult.scala 539:25]
    io.neg <= _io_neg_T @[Mult.scala 539:15]

  module BoothEncoder2_7 :
    input clock : Clock
    input reset : Reset
    output io : { flip data : UInt<3>, weight : UInt<2>, neg : UInt<1>}

    node _io_weight_tmp_T = bits(io.data, 2, 2) @[Mult.scala 530:26]
    node _io_weight_tmp_T_1 = mux(_io_weight_tmp_T, UInt<2>("h2"), UInt<1>("h0")) @[Mult.scala 530:21]
    node _io_weight_tmp_T_2 = bits(io.data, 1, 1) @[Mult.scala 530:53]
    node _io_weight_tmp_T_3 = add(_io_weight_tmp_T_1, _io_weight_tmp_T_2) @[Mult.scala 530:47]
    node _io_weight_tmp_T_4 = tail(_io_weight_tmp_T_3, 1) @[Mult.scala 530:47]
    node _io_weight_tmp_T_5 = bits(io.data, 0, 0) @[Mult.scala 530:63]
    node _io_weight_tmp_T_6 = add(_io_weight_tmp_T_4, _io_weight_tmp_T_5) @[Mult.scala 530:57]
    node io_weight_tmp = tail(_io_weight_tmp_T_6, 1) @[Mult.scala 530:57]
    node _io_weight_T = bits(io.data, 2, 2) @[Mult.scala 531:20]
    node _io_weight_T_1 = sub(UInt<3>("h4"), io_weight_tmp) @[Mult.scala 531:29]
    node _io_weight_T_2 = tail(_io_weight_T_1, 1) @[Mult.scala 531:29]
    node _io_weight_T_3 = mux(_io_weight_T, _io_weight_T_2, io_weight_tmp) @[Mult.scala 531:12]
    io.weight <= _io_weight_T_3 @[Mult.scala 538:15]
    node _io_neg_T = bits(io.data, 2, 2) @[Mult.scala 539:25]
    io.neg <= _io_neg_T @[Mult.scala 539:15]

  module Ppg2_4 :
    input clock : Clock
    input reset : Reset
    output io : { flip weight : UInt<2>, flip neg : UInt<1>, flip data : UInt<128>, output : UInt<128>}

    node _tmp_T = not(io.data) @[Mult.scala 550:29]
    node _tmp_T_1 = add(_tmp_T, UInt<1>("h1")) @[Mult.scala 550:38]
    node _tmp_T_2 = tail(_tmp_T_1, 1) @[Mult.scala 550:38]
    node tmp = mux(io.neg, _tmp_T_2, io.data) @[Mult.scala 550:20]
    node _res_T = cat(tmp, UInt<1>("h0")) @[Cat.scala 31:58]
    node _res_T_1 = eq(UInt<1>("h0"), io.weight) @[Mux.scala 81:61]
    node _res_T_2 = mux(_res_T_1, UInt<1>("h0"), UInt<1>("h0")) @[Mux.scala 81:58]
    node _res_T_3 = eq(UInt<1>("h1"), io.weight) @[Mux.scala 81:61]
    node _res_T_4 = mux(_res_T_3, tmp, _res_T_2) @[Mux.scala 81:58]
    node _res_T_5 = eq(UInt<2>("h2"), io.weight) @[Mux.scala 81:61]
    node res = mux(_res_T_5, _res_T, _res_T_4) @[Mux.scala 81:58]
    io.output <= res @[Mult.scala 556:15]

  module Ppg2_5 :
    input clock : Clock
    input reset : Reset
    output io : { flip weight : UInt<2>, flip neg : UInt<1>, flip data : UInt<128>, output : UInt<128>}

    node _tmp_T = not(io.data) @[Mult.scala 550:29]
    node _tmp_T_1 = add(_tmp_T, UInt<1>("h1")) @[Mult.scala 550:38]
    node _tmp_T_2 = tail(_tmp_T_1, 1) @[Mult.scala 550:38]
    node tmp = mux(io.neg, _tmp_T_2, io.data) @[Mult.scala 550:20]
    node _res_T = cat(tmp, UInt<1>("h0")) @[Cat.scala 31:58]
    node _res_T_1 = eq(UInt<1>("h0"), io.weight) @[Mux.scala 81:61]
    node _res_T_2 = mux(_res_T_1, UInt<1>("h0"), UInt<1>("h0")) @[Mux.scala 81:58]
    node _res_T_3 = eq(UInt<1>("h1"), io.weight) @[Mux.scala 81:61]
    node _res_T_4 = mux(_res_T_3, tmp, _res_T_2) @[Mux.scala 81:58]
    node _res_T_5 = eq(UInt<2>("h2"), io.weight) @[Mux.scala 81:61]
    node res = mux(_res_T_5, _res_T, _res_T_4) @[Mux.scala 81:58]
    io.output <= res @[Mult.scala 556:15]

  module Ppg2_6 :
    input clock : Clock
    input reset : Reset
    output io : { flip weight : UInt<2>, flip neg : UInt<1>, flip data : UInt<128>, output : UInt<128>}

    node _tmp_T = not(io.data) @[Mult.scala 550:29]
    node _tmp_T_1 = add(_tmp_T, UInt<1>("h1")) @[Mult.scala 550:38]
    node _tmp_T_2 = tail(_tmp_T_1, 1) @[Mult.scala 550:38]
    node tmp = mux(io.neg, _tmp_T_2, io.data) @[Mult.scala 550:20]
    node _res_T = cat(tmp, UInt<1>("h0")) @[Cat.scala 31:58]
    node _res_T_1 = eq(UInt<1>("h0"), io.weight) @[Mux.scala 81:61]
    node _res_T_2 = mux(_res_T_1, UInt<1>("h0"), UInt<1>("h0")) @[Mux.scala 81:58]
    node _res_T_3 = eq(UInt<1>("h1"), io.weight) @[Mux.scala 81:61]
    node _res_T_4 = mux(_res_T_3, tmp, _res_T_2) @[Mux.scala 81:58]
    node _res_T_5 = eq(UInt<2>("h2"), io.weight) @[Mux.scala 81:61]
    node res = mux(_res_T_5, _res_T, _res_T_4) @[Mux.scala 81:58]
    io.output <= res @[Mult.scala 556:15]

  module Ppg2_7 :
    input clock : Clock
    input reset : Reset
    output io : { flip weight : UInt<2>, flip neg : UInt<1>, flip data : UInt<128>, output : UInt<128>}

    node _tmp_T = not(io.data) @[Mult.scala 550:29]
    node _tmp_T_1 = add(_tmp_T, UInt<1>("h1")) @[Mult.scala 550:38]
    node _tmp_T_2 = tail(_tmp_T_1, 1) @[Mult.scala 550:38]
    node tmp = mux(io.neg, _tmp_T_2, io.data) @[Mult.scala 550:20]
    node _res_T = cat(tmp, UInt<1>("h0")) @[Cat.scala 31:58]
    node _res_T_1 = eq(UInt<1>("h0"), io.weight) @[Mux.scala 81:61]
    node _res_T_2 = mux(_res_T_1, UInt<1>("h0"), UInt<1>("h0")) @[Mux.scala 81:58]
    node _res_T_3 = eq(UInt<1>("h1"), io.weight) @[Mux.scala 81:61]
    node _res_T_4 = mux(_res_T_3, tmp, _res_T_2) @[Mux.scala 81:58]
    node _res_T_5 = eq(UInt<2>("h2"), io.weight) @[Mux.scala 81:61]
    node res = mux(_res_T_5, _res_T, _res_T_4) @[Mux.scala 81:58]
    io.output <= res @[Mult.scala 556:15]

  module Csa_8 :
    input clock : Clock
    input reset : Reset
    output io : { flip a : UInt<128>, flip b : UInt<128>, flip c : UInt<128>, carry : UInt<128>, temp_sum : UInt<128>}

    node _io_carry_T = and(io.a, io.b) @[Mult.scala 475:24]
    node _io_carry_T_1 = and(io.a, io.c) @[Mult.scala 475:40]
    node _io_carry_T_2 = or(_io_carry_T, _io_carry_T_1) @[Mult.scala 475:32]
    node _io_carry_T_3 = and(io.b, io.c) @[Mult.scala 475:56]
    node _io_carry_T_4 = or(_io_carry_T_2, _io_carry_T_3) @[Mult.scala 475:48]
    node _io_carry_T_5 = shl(_io_carry_T_4, 1) @[Mult.scala 475:65]
    io.carry <= _io_carry_T_5 @[Mult.scala 475:14]
    node _io_temp_sum_T = xor(io.a, io.b) @[Mult.scala 476:25]
    node _io_temp_sum_T_1 = xor(_io_temp_sum_T, io.c) @[Mult.scala 476:32]
    io.temp_sum <= _io_temp_sum_T_1 @[Mult.scala 476:17]

  module Csa_9 :
    input clock : Clock
    input reset : Reset
    output io : { flip a : UInt<128>, flip b : UInt<128>, flip c : UInt<128>, carry : UInt<128>, temp_sum : UInt<128>}

    node _io_carry_T = and(io.a, io.b) @[Mult.scala 475:24]
    node _io_carry_T_1 = and(io.a, io.c) @[Mult.scala 475:40]
    node _io_carry_T_2 = or(_io_carry_T, _io_carry_T_1) @[Mult.scala 475:32]
    node _io_carry_T_3 = and(io.b, io.c) @[Mult.scala 475:56]
    node _io_carry_T_4 = or(_io_carry_T_2, _io_carry_T_3) @[Mult.scala 475:48]
    node _io_carry_T_5 = shl(_io_carry_T_4, 1) @[Mult.scala 475:65]
    io.carry <= _io_carry_T_5 @[Mult.scala 475:14]
    node _io_temp_sum_T = xor(io.a, io.b) @[Mult.scala 476:25]
    node _io_temp_sum_T_1 = xor(_io_temp_sum_T, io.c) @[Mult.scala 476:32]
    io.temp_sum <= _io_temp_sum_T_1 @[Mult.scala 476:17]

  module BoothEncoder2_8 :
    input clock : Clock
    input reset : Reset
    output io : { flip data : UInt<3>, weight : UInt<2>, neg : UInt<1>}

    node _io_weight_tmp_T = bits(io.data, 2, 2) @[Mult.scala 530:26]
    node _io_weight_tmp_T_1 = mux(_io_weight_tmp_T, UInt<2>("h2"), UInt<1>("h0")) @[Mult.scala 530:21]
    node _io_weight_tmp_T_2 = bits(io.data, 1, 1) @[Mult.scala 530:53]
    node _io_weight_tmp_T_3 = add(_io_weight_tmp_T_1, _io_weight_tmp_T_2) @[Mult.scala 530:47]
    node _io_weight_tmp_T_4 = tail(_io_weight_tmp_T_3, 1) @[Mult.scala 530:47]
    node _io_weight_tmp_T_5 = bits(io.data, 0, 0) @[Mult.scala 530:63]
    node _io_weight_tmp_T_6 = add(_io_weight_tmp_T_4, _io_weight_tmp_T_5) @[Mult.scala 530:57]
    node io_weight_tmp = tail(_io_weight_tmp_T_6, 1) @[Mult.scala 530:57]
    node _io_weight_T = bits(io.data, 2, 2) @[Mult.scala 531:20]
    node _io_weight_T_1 = sub(UInt<3>("h4"), io_weight_tmp) @[Mult.scala 531:29]
    node _io_weight_T_2 = tail(_io_weight_T_1, 1) @[Mult.scala 531:29]
    node _io_weight_T_3 = mux(_io_weight_T, _io_weight_T_2, io_weight_tmp) @[Mult.scala 531:12]
    io.weight <= _io_weight_T_3 @[Mult.scala 538:15]
    node _io_neg_T = bits(io.data, 2, 2) @[Mult.scala 539:25]
    io.neg <= _io_neg_T @[Mult.scala 539:15]

  module BoothEncoder2_9 :
    input clock : Clock
    input reset : Reset
    output io : { flip data : UInt<3>, weight : UInt<2>, neg : UInt<1>}

    node _io_weight_tmp_T = bits(io.data, 2, 2) @[Mult.scala 530:26]
    node _io_weight_tmp_T_1 = mux(_io_weight_tmp_T, UInt<2>("h2"), UInt<1>("h0")) @[Mult.scala 530:21]
    node _io_weight_tmp_T_2 = bits(io.data, 1, 1) @[Mult.scala 530:53]
    node _io_weight_tmp_T_3 = add(_io_weight_tmp_T_1, _io_weight_tmp_T_2) @[Mult.scala 530:47]
    node _io_weight_tmp_T_4 = tail(_io_weight_tmp_T_3, 1) @[Mult.scala 530:47]
    node _io_weight_tmp_T_5 = bits(io.data, 0, 0) @[Mult.scala 530:63]
    node _io_weight_tmp_T_6 = add(_io_weight_tmp_T_4, _io_weight_tmp_T_5) @[Mult.scala 530:57]
    node io_weight_tmp = tail(_io_weight_tmp_T_6, 1) @[Mult.scala 530:57]
    node _io_weight_T = bits(io.data, 2, 2) @[Mult.scala 531:20]
    node _io_weight_T_1 = sub(UInt<3>("h4"), io_weight_tmp) @[Mult.scala 531:29]
    node _io_weight_T_2 = tail(_io_weight_T_1, 1) @[Mult.scala 531:29]
    node _io_weight_T_3 = mux(_io_weight_T, _io_weight_T_2, io_weight_tmp) @[Mult.scala 531:12]
    io.weight <= _io_weight_T_3 @[Mult.scala 538:15]
    node _io_neg_T = bits(io.data, 2, 2) @[Mult.scala 539:25]
    io.neg <= _io_neg_T @[Mult.scala 539:15]

  module BoothEncoder2_10 :
    input clock : Clock
    input reset : Reset
    output io : { flip data : UInt<3>, weight : UInt<2>, neg : UInt<1>}

    node _io_weight_tmp_T = bits(io.data, 2, 2) @[Mult.scala 530:26]
    node _io_weight_tmp_T_1 = mux(_io_weight_tmp_T, UInt<2>("h2"), UInt<1>("h0")) @[Mult.scala 530:21]
    node _io_weight_tmp_T_2 = bits(io.data, 1, 1) @[Mult.scala 530:53]
    node _io_weight_tmp_T_3 = add(_io_weight_tmp_T_1, _io_weight_tmp_T_2) @[Mult.scala 530:47]
    node _io_weight_tmp_T_4 = tail(_io_weight_tmp_T_3, 1) @[Mult.scala 530:47]
    node _io_weight_tmp_T_5 = bits(io.data, 0, 0) @[Mult.scala 530:63]
    node _io_weight_tmp_T_6 = add(_io_weight_tmp_T_4, _io_weight_tmp_T_5) @[Mult.scala 530:57]
    node io_weight_tmp = tail(_io_weight_tmp_T_6, 1) @[Mult.scala 530:57]
    node _io_weight_T = bits(io.data, 2, 2) @[Mult.scala 531:20]
    node _io_weight_T_1 = sub(UInt<3>("h4"), io_weight_tmp) @[Mult.scala 531:29]
    node _io_weight_T_2 = tail(_io_weight_T_1, 1) @[Mult.scala 531:29]
    node _io_weight_T_3 = mux(_io_weight_T, _io_weight_T_2, io_weight_tmp) @[Mult.scala 531:12]
    io.weight <= _io_weight_T_3 @[Mult.scala 538:15]
    node _io_neg_T = bits(io.data, 2, 2) @[Mult.scala 539:25]
    io.neg <= _io_neg_T @[Mult.scala 539:15]

  module BoothEncoder2_11 :
    input clock : Clock
    input reset : Reset
    output io : { flip data : UInt<3>, weight : UInt<2>, neg : UInt<1>}

    node _io_weight_tmp_T = bits(io.data, 2, 2) @[Mult.scala 530:26]
    node _io_weight_tmp_T_1 = mux(_io_weight_tmp_T, UInt<2>("h2"), UInt<1>("h0")) @[Mult.scala 530:21]
    node _io_weight_tmp_T_2 = bits(io.data, 1, 1) @[Mult.scala 530:53]
    node _io_weight_tmp_T_3 = add(_io_weight_tmp_T_1, _io_weight_tmp_T_2) @[Mult.scala 530:47]
    node _io_weight_tmp_T_4 = tail(_io_weight_tmp_T_3, 1) @[Mult.scala 530:47]
    node _io_weight_tmp_T_5 = bits(io.data, 0, 0) @[Mult.scala 530:63]
    node _io_weight_tmp_T_6 = add(_io_weight_tmp_T_4, _io_weight_tmp_T_5) @[Mult.scala 530:57]
    node io_weight_tmp = tail(_io_weight_tmp_T_6, 1) @[Mult.scala 530:57]
    node _io_weight_T = bits(io.data, 2, 2) @[Mult.scala 531:20]
    node _io_weight_T_1 = sub(UInt<3>("h4"), io_weight_tmp) @[Mult.scala 531:29]
    node _io_weight_T_2 = tail(_io_weight_T_1, 1) @[Mult.scala 531:29]
    node _io_weight_T_3 = mux(_io_weight_T, _io_weight_T_2, io_weight_tmp) @[Mult.scala 531:12]
    io.weight <= _io_weight_T_3 @[Mult.scala 538:15]
    node _io_neg_T = bits(io.data, 2, 2) @[Mult.scala 539:25]
    io.neg <= _io_neg_T @[Mult.scala 539:15]

  module Ppg2_8 :
    input clock : Clock
    input reset : Reset
    output io : { flip weight : UInt<2>, flip neg : UInt<1>, flip data : UInt<128>, output : UInt<128>}

    node _tmp_T = not(io.data) @[Mult.scala 550:29]
    node _tmp_T_1 = add(_tmp_T, UInt<1>("h1")) @[Mult.scala 550:38]
    node _tmp_T_2 = tail(_tmp_T_1, 1) @[Mult.scala 550:38]
    node tmp = mux(io.neg, _tmp_T_2, io.data) @[Mult.scala 550:20]
    node _res_T = cat(tmp, UInt<1>("h0")) @[Cat.scala 31:58]
    node _res_T_1 = eq(UInt<1>("h0"), io.weight) @[Mux.scala 81:61]
    node _res_T_2 = mux(_res_T_1, UInt<1>("h0"), UInt<1>("h0")) @[Mux.scala 81:58]
    node _res_T_3 = eq(UInt<1>("h1"), io.weight) @[Mux.scala 81:61]
    node _res_T_4 = mux(_res_T_3, tmp, _res_T_2) @[Mux.scala 81:58]
    node _res_T_5 = eq(UInt<2>("h2"), io.weight) @[Mux.scala 81:61]
    node res = mux(_res_T_5, _res_T, _res_T_4) @[Mux.scala 81:58]
    io.output <= res @[Mult.scala 556:15]

  module Ppg2_9 :
    input clock : Clock
    input reset : Reset
    output io : { flip weight : UInt<2>, flip neg : UInt<1>, flip data : UInt<128>, output : UInt<128>}

    node _tmp_T = not(io.data) @[Mult.scala 550:29]
    node _tmp_T_1 = add(_tmp_T, UInt<1>("h1")) @[Mult.scala 550:38]
    node _tmp_T_2 = tail(_tmp_T_1, 1) @[Mult.scala 550:38]
    node tmp = mux(io.neg, _tmp_T_2, io.data) @[Mult.scala 550:20]
    node _res_T = cat(tmp, UInt<1>("h0")) @[Cat.scala 31:58]
    node _res_T_1 = eq(UInt<1>("h0"), io.weight) @[Mux.scala 81:61]
    node _res_T_2 = mux(_res_T_1, UInt<1>("h0"), UInt<1>("h0")) @[Mux.scala 81:58]
    node _res_T_3 = eq(UInt<1>("h1"), io.weight) @[Mux.scala 81:61]
    node _res_T_4 = mux(_res_T_3, tmp, _res_T_2) @[Mux.scala 81:58]
    node _res_T_5 = eq(UInt<2>("h2"), io.weight) @[Mux.scala 81:61]
    node res = mux(_res_T_5, _res_T, _res_T_4) @[Mux.scala 81:58]
    io.output <= res @[Mult.scala 556:15]

  module Ppg2_10 :
    input clock : Clock
    input reset : Reset
    output io : { flip weight : UInt<2>, flip neg : UInt<1>, flip data : UInt<128>, output : UInt<128>}

    node _tmp_T = not(io.data) @[Mult.scala 550:29]
    node _tmp_T_1 = add(_tmp_T, UInt<1>("h1")) @[Mult.scala 550:38]
    node _tmp_T_2 = tail(_tmp_T_1, 1) @[Mult.scala 550:38]
    node tmp = mux(io.neg, _tmp_T_2, io.data) @[Mult.scala 550:20]
    node _res_T = cat(tmp, UInt<1>("h0")) @[Cat.scala 31:58]
    node _res_T_1 = eq(UInt<1>("h0"), io.weight) @[Mux.scala 81:61]
    node _res_T_2 = mux(_res_T_1, UInt<1>("h0"), UInt<1>("h0")) @[Mux.scala 81:58]
    node _res_T_3 = eq(UInt<1>("h1"), io.weight) @[Mux.scala 81:61]
    node _res_T_4 = mux(_res_T_3, tmp, _res_T_2) @[Mux.scala 81:58]
    node _res_T_5 = eq(UInt<2>("h2"), io.weight) @[Mux.scala 81:61]
    node res = mux(_res_T_5, _res_T, _res_T_4) @[Mux.scala 81:58]
    io.output <= res @[Mult.scala 556:15]

  module Ppg2_11 :
    input clock : Clock
    input reset : Reset
    output io : { flip weight : UInt<2>, flip neg : UInt<1>, flip data : UInt<128>, output : UInt<128>}

    node _tmp_T = not(io.data) @[Mult.scala 550:29]
    node _tmp_T_1 = add(_tmp_T, UInt<1>("h1")) @[Mult.scala 550:38]
    node _tmp_T_2 = tail(_tmp_T_1, 1) @[Mult.scala 550:38]
    node tmp = mux(io.neg, _tmp_T_2, io.data) @[Mult.scala 550:20]
    node _res_T = cat(tmp, UInt<1>("h0")) @[Cat.scala 31:58]
    node _res_T_1 = eq(UInt<1>("h0"), io.weight) @[Mux.scala 81:61]
    node _res_T_2 = mux(_res_T_1, UInt<1>("h0"), UInt<1>("h0")) @[Mux.scala 81:58]
    node _res_T_3 = eq(UInt<1>("h1"), io.weight) @[Mux.scala 81:61]
    node _res_T_4 = mux(_res_T_3, tmp, _res_T_2) @[Mux.scala 81:58]
    node _res_T_5 = eq(UInt<2>("h2"), io.weight) @[Mux.scala 81:61]
    node res = mux(_res_T_5, _res_T, _res_T_4) @[Mux.scala 81:58]
    io.output <= res @[Mult.scala 556:15]

  module Csa_10 :
    input clock : Clock
    input reset : Reset
    output io : { flip a : UInt<128>, flip b : UInt<128>, flip c : UInt<128>, carry : UInt<128>, temp_sum : UInt<128>}

    node _io_carry_T = and(io.a, io.b) @[Mult.scala 475:24]
    node _io_carry_T_1 = and(io.a, io.c) @[Mult.scala 475:40]
    node _io_carry_T_2 = or(_io_carry_T, _io_carry_T_1) @[Mult.scala 475:32]
    node _io_carry_T_3 = and(io.b, io.c) @[Mult.scala 475:56]
    node _io_carry_T_4 = or(_io_carry_T_2, _io_carry_T_3) @[Mult.scala 475:48]
    node _io_carry_T_5 = shl(_io_carry_T_4, 1) @[Mult.scala 475:65]
    io.carry <= _io_carry_T_5 @[Mult.scala 475:14]
    node _io_temp_sum_T = xor(io.a, io.b) @[Mult.scala 476:25]
    node _io_temp_sum_T_1 = xor(_io_temp_sum_T, io.c) @[Mult.scala 476:32]
    io.temp_sum <= _io_temp_sum_T_1 @[Mult.scala 476:17]

  module Csa_11 :
    input clock : Clock
    input reset : Reset
    output io : { flip a : UInt<128>, flip b : UInt<128>, flip c : UInt<128>, carry : UInt<128>, temp_sum : UInt<128>}

    node _io_carry_T = and(io.a, io.b) @[Mult.scala 475:24]
    node _io_carry_T_1 = and(io.a, io.c) @[Mult.scala 475:40]
    node _io_carry_T_2 = or(_io_carry_T, _io_carry_T_1) @[Mult.scala 475:32]
    node _io_carry_T_3 = and(io.b, io.c) @[Mult.scala 475:56]
    node _io_carry_T_4 = or(_io_carry_T_2, _io_carry_T_3) @[Mult.scala 475:48]
    node _io_carry_T_5 = shl(_io_carry_T_4, 1) @[Mult.scala 475:65]
    io.carry <= _io_carry_T_5 @[Mult.scala 475:14]
    node _io_temp_sum_T = xor(io.a, io.b) @[Mult.scala 476:25]
    node _io_temp_sum_T_1 = xor(_io_temp_sum_T, io.c) @[Mult.scala 476:32]
    io.temp_sum <= _io_temp_sum_T_1 @[Mult.scala 476:17]

  module BoothEncoder2_12 :
    input clock : Clock
    input reset : Reset
    output io : { flip data : UInt<3>, weight : UInt<2>, neg : UInt<1>}

    node _io_weight_tmp_T = bits(io.data, 2, 2) @[Mult.scala 530:26]
    node _io_weight_tmp_T_1 = mux(_io_weight_tmp_T, UInt<2>("h2"), UInt<1>("h0")) @[Mult.scala 530:21]
    node _io_weight_tmp_T_2 = bits(io.data, 1, 1) @[Mult.scala 530:53]
    node _io_weight_tmp_T_3 = add(_io_weight_tmp_T_1, _io_weight_tmp_T_2) @[Mult.scala 530:47]
    node _io_weight_tmp_T_4 = tail(_io_weight_tmp_T_3, 1) @[Mult.scala 530:47]
    node _io_weight_tmp_T_5 = bits(io.data, 0, 0) @[Mult.scala 530:63]
    node _io_weight_tmp_T_6 = add(_io_weight_tmp_T_4, _io_weight_tmp_T_5) @[Mult.scala 530:57]
    node io_weight_tmp = tail(_io_weight_tmp_T_6, 1) @[Mult.scala 530:57]
    node _io_weight_T = bits(io.data, 2, 2) @[Mult.scala 531:20]
    node _io_weight_T_1 = sub(UInt<3>("h4"), io_weight_tmp) @[Mult.scala 531:29]
    node _io_weight_T_2 = tail(_io_weight_T_1, 1) @[Mult.scala 531:29]
    node _io_weight_T_3 = mux(_io_weight_T, _io_weight_T_2, io_weight_tmp) @[Mult.scala 531:12]
    io.weight <= _io_weight_T_3 @[Mult.scala 538:15]
    node _io_neg_T = bits(io.data, 2, 2) @[Mult.scala 539:25]
    io.neg <= _io_neg_T @[Mult.scala 539:15]

  module BoothEncoder2_13 :
    input clock : Clock
    input reset : Reset
    output io : { flip data : UInt<3>, weight : UInt<2>, neg : UInt<1>}

    node _io_weight_tmp_T = bits(io.data, 2, 2) @[Mult.scala 530:26]
    node _io_weight_tmp_T_1 = mux(_io_weight_tmp_T, UInt<2>("h2"), UInt<1>("h0")) @[Mult.scala 530:21]
    node _io_weight_tmp_T_2 = bits(io.data, 1, 1) @[Mult.scala 530:53]
    node _io_weight_tmp_T_3 = add(_io_weight_tmp_T_1, _io_weight_tmp_T_2) @[Mult.scala 530:47]
    node _io_weight_tmp_T_4 = tail(_io_weight_tmp_T_3, 1) @[Mult.scala 530:47]
    node _io_weight_tmp_T_5 = bits(io.data, 0, 0) @[Mult.scala 530:63]
    node _io_weight_tmp_T_6 = add(_io_weight_tmp_T_4, _io_weight_tmp_T_5) @[Mult.scala 530:57]
    node io_weight_tmp = tail(_io_weight_tmp_T_6, 1) @[Mult.scala 530:57]
    node _io_weight_T = bits(io.data, 2, 2) @[Mult.scala 531:20]
    node _io_weight_T_1 = sub(UInt<3>("h4"), io_weight_tmp) @[Mult.scala 531:29]
    node _io_weight_T_2 = tail(_io_weight_T_1, 1) @[Mult.scala 531:29]
    node _io_weight_T_3 = mux(_io_weight_T, _io_weight_T_2, io_weight_tmp) @[Mult.scala 531:12]
    io.weight <= _io_weight_T_3 @[Mult.scala 538:15]
    node _io_neg_T = bits(io.data, 2, 2) @[Mult.scala 539:25]
    io.neg <= _io_neg_T @[Mult.scala 539:15]

  module BoothEncoder2_14 :
    input clock : Clock
    input reset : Reset
    output io : { flip data : UInt<3>, weight : UInt<2>, neg : UInt<1>}

    node _io_weight_tmp_T = bits(io.data, 2, 2) @[Mult.scala 530:26]
    node _io_weight_tmp_T_1 = mux(_io_weight_tmp_T, UInt<2>("h2"), UInt<1>("h0")) @[Mult.scala 530:21]
    node _io_weight_tmp_T_2 = bits(io.data, 1, 1) @[Mult.scala 530:53]
    node _io_weight_tmp_T_3 = add(_io_weight_tmp_T_1, _io_weight_tmp_T_2) @[Mult.scala 530:47]
    node _io_weight_tmp_T_4 = tail(_io_weight_tmp_T_3, 1) @[Mult.scala 530:47]
    node _io_weight_tmp_T_5 = bits(io.data, 0, 0) @[Mult.scala 530:63]
    node _io_weight_tmp_T_6 = add(_io_weight_tmp_T_4, _io_weight_tmp_T_5) @[Mult.scala 530:57]
    node io_weight_tmp = tail(_io_weight_tmp_T_6, 1) @[Mult.scala 530:57]
    node _io_weight_T = bits(io.data, 2, 2) @[Mult.scala 531:20]
    node _io_weight_T_1 = sub(UInt<3>("h4"), io_weight_tmp) @[Mult.scala 531:29]
    node _io_weight_T_2 = tail(_io_weight_T_1, 1) @[Mult.scala 531:29]
    node _io_weight_T_3 = mux(_io_weight_T, _io_weight_T_2, io_weight_tmp) @[Mult.scala 531:12]
    io.weight <= _io_weight_T_3 @[Mult.scala 538:15]
    node _io_neg_T = bits(io.data, 2, 2) @[Mult.scala 539:25]
    io.neg <= _io_neg_T @[Mult.scala 539:15]

  module BoothEncoder2_15 :
    input clock : Clock
    input reset : Reset
    output io : { flip data : UInt<3>, weight : UInt<2>, neg : UInt<1>}

    node _io_weight_tmp_T = bits(io.data, 2, 2) @[Mult.scala 530:26]
    node _io_weight_tmp_T_1 = mux(_io_weight_tmp_T, UInt<2>("h2"), UInt<1>("h0")) @[Mult.scala 530:21]
    node _io_weight_tmp_T_2 = bits(io.data, 1, 1) @[Mult.scala 530:53]
    node _io_weight_tmp_T_3 = add(_io_weight_tmp_T_1, _io_weight_tmp_T_2) @[Mult.scala 530:47]
    node _io_weight_tmp_T_4 = tail(_io_weight_tmp_T_3, 1) @[Mult.scala 530:47]
    node _io_weight_tmp_T_5 = bits(io.data, 0, 0) @[Mult.scala 530:63]
    node _io_weight_tmp_T_6 = add(_io_weight_tmp_T_4, _io_weight_tmp_T_5) @[Mult.scala 530:57]
    node io_weight_tmp = tail(_io_weight_tmp_T_6, 1) @[Mult.scala 530:57]
    node _io_weight_T = bits(io.data, 2, 2) @[Mult.scala 531:20]
    node _io_weight_T_1 = sub(UInt<3>("h4"), io_weight_tmp) @[Mult.scala 531:29]
    node _io_weight_T_2 = tail(_io_weight_T_1, 1) @[Mult.scala 531:29]
    node _io_weight_T_3 = mux(_io_weight_T, _io_weight_T_2, io_weight_tmp) @[Mult.scala 531:12]
    io.weight <= _io_weight_T_3 @[Mult.scala 538:15]
    node _io_neg_T = bits(io.data, 2, 2) @[Mult.scala 539:25]
    io.neg <= _io_neg_T @[Mult.scala 539:15]

  module Ppg2_12 :
    input clock : Clock
    input reset : Reset
    output io : { flip weight : UInt<2>, flip neg : UInt<1>, flip data : UInt<128>, output : UInt<128>}

    node _tmp_T = not(io.data) @[Mult.scala 550:29]
    node _tmp_T_1 = add(_tmp_T, UInt<1>("h1")) @[Mult.scala 550:38]
    node _tmp_T_2 = tail(_tmp_T_1, 1) @[Mult.scala 550:38]
    node tmp = mux(io.neg, _tmp_T_2, io.data) @[Mult.scala 550:20]
    node _res_T = cat(tmp, UInt<1>("h0")) @[Cat.scala 31:58]
    node _res_T_1 = eq(UInt<1>("h0"), io.weight) @[Mux.scala 81:61]
    node _res_T_2 = mux(_res_T_1, UInt<1>("h0"), UInt<1>("h0")) @[Mux.scala 81:58]
    node _res_T_3 = eq(UInt<1>("h1"), io.weight) @[Mux.scala 81:61]
    node _res_T_4 = mux(_res_T_3, tmp, _res_T_2) @[Mux.scala 81:58]
    node _res_T_5 = eq(UInt<2>("h2"), io.weight) @[Mux.scala 81:61]
    node res = mux(_res_T_5, _res_T, _res_T_4) @[Mux.scala 81:58]
    io.output <= res @[Mult.scala 556:15]

  module Ppg2_13 :
    input clock : Clock
    input reset : Reset
    output io : { flip weight : UInt<2>, flip neg : UInt<1>, flip data : UInt<128>, output : UInt<128>}

    node _tmp_T = not(io.data) @[Mult.scala 550:29]
    node _tmp_T_1 = add(_tmp_T, UInt<1>("h1")) @[Mult.scala 550:38]
    node _tmp_T_2 = tail(_tmp_T_1, 1) @[Mult.scala 550:38]
    node tmp = mux(io.neg, _tmp_T_2, io.data) @[Mult.scala 550:20]
    node _res_T = cat(tmp, UInt<1>("h0")) @[Cat.scala 31:58]
    node _res_T_1 = eq(UInt<1>("h0"), io.weight) @[Mux.scala 81:61]
    node _res_T_2 = mux(_res_T_1, UInt<1>("h0"), UInt<1>("h0")) @[Mux.scala 81:58]
    node _res_T_3 = eq(UInt<1>("h1"), io.weight) @[Mux.scala 81:61]
    node _res_T_4 = mux(_res_T_3, tmp, _res_T_2) @[Mux.scala 81:58]
    node _res_T_5 = eq(UInt<2>("h2"), io.weight) @[Mux.scala 81:61]
    node res = mux(_res_T_5, _res_T, _res_T_4) @[Mux.scala 81:58]
    io.output <= res @[Mult.scala 556:15]

  module Ppg2_14 :
    input clock : Clock
    input reset : Reset
    output io : { flip weight : UInt<2>, flip neg : UInt<1>, flip data : UInt<128>, output : UInt<128>}

    node _tmp_T = not(io.data) @[Mult.scala 550:29]
    node _tmp_T_1 = add(_tmp_T, UInt<1>("h1")) @[Mult.scala 550:38]
    node _tmp_T_2 = tail(_tmp_T_1, 1) @[Mult.scala 550:38]
    node tmp = mux(io.neg, _tmp_T_2, io.data) @[Mult.scala 550:20]
    node _res_T = cat(tmp, UInt<1>("h0")) @[Cat.scala 31:58]
    node _res_T_1 = eq(UInt<1>("h0"), io.weight) @[Mux.scala 81:61]
    node _res_T_2 = mux(_res_T_1, UInt<1>("h0"), UInt<1>("h0")) @[Mux.scala 81:58]
    node _res_T_3 = eq(UInt<1>("h1"), io.weight) @[Mux.scala 81:61]
    node _res_T_4 = mux(_res_T_3, tmp, _res_T_2) @[Mux.scala 81:58]
    node _res_T_5 = eq(UInt<2>("h2"), io.weight) @[Mux.scala 81:61]
    node res = mux(_res_T_5, _res_T, _res_T_4) @[Mux.scala 81:58]
    io.output <= res @[Mult.scala 556:15]

  module Ppg2_15 :
    input clock : Clock
    input reset : Reset
    output io : { flip weight : UInt<2>, flip neg : UInt<1>, flip data : UInt<128>, output : UInt<128>}

    node _tmp_T = not(io.data) @[Mult.scala 550:29]
    node _tmp_T_1 = add(_tmp_T, UInt<1>("h1")) @[Mult.scala 550:38]
    node _tmp_T_2 = tail(_tmp_T_1, 1) @[Mult.scala 550:38]
    node tmp = mux(io.neg, _tmp_T_2, io.data) @[Mult.scala 550:20]
    node _res_T = cat(tmp, UInt<1>("h0")) @[Cat.scala 31:58]
    node _res_T_1 = eq(UInt<1>("h0"), io.weight) @[Mux.scala 81:61]
    node _res_T_2 = mux(_res_T_1, UInt<1>("h0"), UInt<1>("h0")) @[Mux.scala 81:58]
    node _res_T_3 = eq(UInt<1>("h1"), io.weight) @[Mux.scala 81:61]
    node _res_T_4 = mux(_res_T_3, tmp, _res_T_2) @[Mux.scala 81:58]
    node _res_T_5 = eq(UInt<2>("h2"), io.weight) @[Mux.scala 81:61]
    node res = mux(_res_T_5, _res_T, _res_T_4) @[Mux.scala 81:58]
    io.output <= res @[Mult.scala 556:15]

  module Csa_12 :
    input clock : Clock
    input reset : Reset
    output io : { flip a : UInt<128>, flip b : UInt<128>, flip c : UInt<128>, carry : UInt<128>, temp_sum : UInt<128>}

    node _io_carry_T = and(io.a, io.b) @[Mult.scala 475:24]
    node _io_carry_T_1 = and(io.a, io.c) @[Mult.scala 475:40]
    node _io_carry_T_2 = or(_io_carry_T, _io_carry_T_1) @[Mult.scala 475:32]
    node _io_carry_T_3 = and(io.b, io.c) @[Mult.scala 475:56]
    node _io_carry_T_4 = or(_io_carry_T_2, _io_carry_T_3) @[Mult.scala 475:48]
    node _io_carry_T_5 = shl(_io_carry_T_4, 1) @[Mult.scala 475:65]
    io.carry <= _io_carry_T_5 @[Mult.scala 475:14]
    node _io_temp_sum_T = xor(io.a, io.b) @[Mult.scala 476:25]
    node _io_temp_sum_T_1 = xor(_io_temp_sum_T, io.c) @[Mult.scala 476:32]
    io.temp_sum <= _io_temp_sum_T_1 @[Mult.scala 476:17]

  module Csa_13 :
    input clock : Clock
    input reset : Reset
    output io : { flip a : UInt<128>, flip b : UInt<128>, flip c : UInt<128>, carry : UInt<128>, temp_sum : UInt<128>}

    node _io_carry_T = and(io.a, io.b) @[Mult.scala 475:24]
    node _io_carry_T_1 = and(io.a, io.c) @[Mult.scala 475:40]
    node _io_carry_T_2 = or(_io_carry_T, _io_carry_T_1) @[Mult.scala 475:32]
    node _io_carry_T_3 = and(io.b, io.c) @[Mult.scala 475:56]
    node _io_carry_T_4 = or(_io_carry_T_2, _io_carry_T_3) @[Mult.scala 475:48]
    node _io_carry_T_5 = shl(_io_carry_T_4, 1) @[Mult.scala 475:65]
    io.carry <= _io_carry_T_5 @[Mult.scala 475:14]
    node _io_temp_sum_T = xor(io.a, io.b) @[Mult.scala 476:25]
    node _io_temp_sum_T_1 = xor(_io_temp_sum_T, io.c) @[Mult.scala 476:32]
    io.temp_sum <= _io_temp_sum_T_1 @[Mult.scala 476:17]

  module BoothEncoder2_16 :
    input clock : Clock
    input reset : Reset
    output io : { flip data : UInt<3>, weight : UInt<2>, neg : UInt<1>}

    node _io_weight_tmp_T = bits(io.data, 2, 2) @[Mult.scala 530:26]
    node _io_weight_tmp_T_1 = mux(_io_weight_tmp_T, UInt<2>("h2"), UInt<1>("h0")) @[Mult.scala 530:21]
    node _io_weight_tmp_T_2 = bits(io.data, 1, 1) @[Mult.scala 530:53]
    node _io_weight_tmp_T_3 = add(_io_weight_tmp_T_1, _io_weight_tmp_T_2) @[Mult.scala 530:47]
    node _io_weight_tmp_T_4 = tail(_io_weight_tmp_T_3, 1) @[Mult.scala 530:47]
    node _io_weight_tmp_T_5 = bits(io.data, 0, 0) @[Mult.scala 530:63]
    node _io_weight_tmp_T_6 = add(_io_weight_tmp_T_4, _io_weight_tmp_T_5) @[Mult.scala 530:57]
    node io_weight_tmp = tail(_io_weight_tmp_T_6, 1) @[Mult.scala 530:57]
    node _io_weight_T = bits(io.data, 2, 2) @[Mult.scala 531:20]
    node _io_weight_T_1 = sub(UInt<3>("h4"), io_weight_tmp) @[Mult.scala 531:29]
    node _io_weight_T_2 = tail(_io_weight_T_1, 1) @[Mult.scala 531:29]
    node _io_weight_T_3 = mux(_io_weight_T, _io_weight_T_2, io_weight_tmp) @[Mult.scala 531:12]
    io.weight <= _io_weight_T_3 @[Mult.scala 538:15]
    node _io_neg_T = bits(io.data, 2, 2) @[Mult.scala 539:25]
    io.neg <= _io_neg_T @[Mult.scala 539:15]

  module BoothEncoder2_17 :
    input clock : Clock
    input reset : Reset
    output io : { flip data : UInt<3>, weight : UInt<2>, neg : UInt<1>}

    node _io_weight_tmp_T = bits(io.data, 2, 2) @[Mult.scala 530:26]
    node _io_weight_tmp_T_1 = mux(_io_weight_tmp_T, UInt<2>("h2"), UInt<1>("h0")) @[Mult.scala 530:21]
    node _io_weight_tmp_T_2 = bits(io.data, 1, 1) @[Mult.scala 530:53]
    node _io_weight_tmp_T_3 = add(_io_weight_tmp_T_1, _io_weight_tmp_T_2) @[Mult.scala 530:47]
    node _io_weight_tmp_T_4 = tail(_io_weight_tmp_T_3, 1) @[Mult.scala 530:47]
    node _io_weight_tmp_T_5 = bits(io.data, 0, 0) @[Mult.scala 530:63]
    node _io_weight_tmp_T_6 = add(_io_weight_tmp_T_4, _io_weight_tmp_T_5) @[Mult.scala 530:57]
    node io_weight_tmp = tail(_io_weight_tmp_T_6, 1) @[Mult.scala 530:57]
    node _io_weight_T = bits(io.data, 2, 2) @[Mult.scala 531:20]
    node _io_weight_T_1 = sub(UInt<3>("h4"), io_weight_tmp) @[Mult.scala 531:29]
    node _io_weight_T_2 = tail(_io_weight_T_1, 1) @[Mult.scala 531:29]
    node _io_weight_T_3 = mux(_io_weight_T, _io_weight_T_2, io_weight_tmp) @[Mult.scala 531:12]
    io.weight <= _io_weight_T_3 @[Mult.scala 538:15]
    node _io_neg_T = bits(io.data, 2, 2) @[Mult.scala 539:25]
    io.neg <= _io_neg_T @[Mult.scala 539:15]

  module BoothEncoder2_18 :
    input clock : Clock
    input reset : Reset
    output io : { flip data : UInt<3>, weight : UInt<2>, neg : UInt<1>}

    node _io_weight_tmp_T = bits(io.data, 2, 2) @[Mult.scala 530:26]
    node _io_weight_tmp_T_1 = mux(_io_weight_tmp_T, UInt<2>("h2"), UInt<1>("h0")) @[Mult.scala 530:21]
    node _io_weight_tmp_T_2 = bits(io.data, 1, 1) @[Mult.scala 530:53]
    node _io_weight_tmp_T_3 = add(_io_weight_tmp_T_1, _io_weight_tmp_T_2) @[Mult.scala 530:47]
    node _io_weight_tmp_T_4 = tail(_io_weight_tmp_T_3, 1) @[Mult.scala 530:47]
    node _io_weight_tmp_T_5 = bits(io.data, 0, 0) @[Mult.scala 530:63]
    node _io_weight_tmp_T_6 = add(_io_weight_tmp_T_4, _io_weight_tmp_T_5) @[Mult.scala 530:57]
    node io_weight_tmp = tail(_io_weight_tmp_T_6, 1) @[Mult.scala 530:57]
    node _io_weight_T = bits(io.data, 2, 2) @[Mult.scala 531:20]
    node _io_weight_T_1 = sub(UInt<3>("h4"), io_weight_tmp) @[Mult.scala 531:29]
    node _io_weight_T_2 = tail(_io_weight_T_1, 1) @[Mult.scala 531:29]
    node _io_weight_T_3 = mux(_io_weight_T, _io_weight_T_2, io_weight_tmp) @[Mult.scala 531:12]
    io.weight <= _io_weight_T_3 @[Mult.scala 538:15]
    node _io_neg_T = bits(io.data, 2, 2) @[Mult.scala 539:25]
    io.neg <= _io_neg_T @[Mult.scala 539:15]

  module BoothEncoder2_19 :
    input clock : Clock
    input reset : Reset
    output io : { flip data : UInt<3>, weight : UInt<2>, neg : UInt<1>}

    node _io_weight_tmp_T = bits(io.data, 2, 2) @[Mult.scala 530:26]
    node _io_weight_tmp_T_1 = mux(_io_weight_tmp_T, UInt<2>("h2"), UInt<1>("h0")) @[Mult.scala 530:21]
    node _io_weight_tmp_T_2 = bits(io.data, 1, 1) @[Mult.scala 530:53]
    node _io_weight_tmp_T_3 = add(_io_weight_tmp_T_1, _io_weight_tmp_T_2) @[Mult.scala 530:47]
    node _io_weight_tmp_T_4 = tail(_io_weight_tmp_T_3, 1) @[Mult.scala 530:47]
    node _io_weight_tmp_T_5 = bits(io.data, 0, 0) @[Mult.scala 530:63]
    node _io_weight_tmp_T_6 = add(_io_weight_tmp_T_4, _io_weight_tmp_T_5) @[Mult.scala 530:57]
    node io_weight_tmp = tail(_io_weight_tmp_T_6, 1) @[Mult.scala 530:57]
    node _io_weight_T = bits(io.data, 2, 2) @[Mult.scala 531:20]
    node _io_weight_T_1 = sub(UInt<3>("h4"), io_weight_tmp) @[Mult.scala 531:29]
    node _io_weight_T_2 = tail(_io_weight_T_1, 1) @[Mult.scala 531:29]
    node _io_weight_T_3 = mux(_io_weight_T, _io_weight_T_2, io_weight_tmp) @[Mult.scala 531:12]
    io.weight <= _io_weight_T_3 @[Mult.scala 538:15]
    node _io_neg_T = bits(io.data, 2, 2) @[Mult.scala 539:25]
    io.neg <= _io_neg_T @[Mult.scala 539:15]

  module Ppg2_16 :
    input clock : Clock
    input reset : Reset
    output io : { flip weight : UInt<2>, flip neg : UInt<1>, flip data : UInt<128>, output : UInt<128>}

    node _tmp_T = not(io.data) @[Mult.scala 550:29]
    node _tmp_T_1 = add(_tmp_T, UInt<1>("h1")) @[Mult.scala 550:38]
    node _tmp_T_2 = tail(_tmp_T_1, 1) @[Mult.scala 550:38]
    node tmp = mux(io.neg, _tmp_T_2, io.data) @[Mult.scala 550:20]
    node _res_T = cat(tmp, UInt<1>("h0")) @[Cat.scala 31:58]
    node _res_T_1 = eq(UInt<1>("h0"), io.weight) @[Mux.scala 81:61]
    node _res_T_2 = mux(_res_T_1, UInt<1>("h0"), UInt<1>("h0")) @[Mux.scala 81:58]
    node _res_T_3 = eq(UInt<1>("h1"), io.weight) @[Mux.scala 81:61]
    node _res_T_4 = mux(_res_T_3, tmp, _res_T_2) @[Mux.scala 81:58]
    node _res_T_5 = eq(UInt<2>("h2"), io.weight) @[Mux.scala 81:61]
    node res = mux(_res_T_5, _res_T, _res_T_4) @[Mux.scala 81:58]
    io.output <= res @[Mult.scala 556:15]

  module Ppg2_17 :
    input clock : Clock
    input reset : Reset
    output io : { flip weight : UInt<2>, flip neg : UInt<1>, flip data : UInt<128>, output : UInt<128>}

    node _tmp_T = not(io.data) @[Mult.scala 550:29]
    node _tmp_T_1 = add(_tmp_T, UInt<1>("h1")) @[Mult.scala 550:38]
    node _tmp_T_2 = tail(_tmp_T_1, 1) @[Mult.scala 550:38]
    node tmp = mux(io.neg, _tmp_T_2, io.data) @[Mult.scala 550:20]
    node _res_T = cat(tmp, UInt<1>("h0")) @[Cat.scala 31:58]
    node _res_T_1 = eq(UInt<1>("h0"), io.weight) @[Mux.scala 81:61]
    node _res_T_2 = mux(_res_T_1, UInt<1>("h0"), UInt<1>("h0")) @[Mux.scala 81:58]
    node _res_T_3 = eq(UInt<1>("h1"), io.weight) @[Mux.scala 81:61]
    node _res_T_4 = mux(_res_T_3, tmp, _res_T_2) @[Mux.scala 81:58]
    node _res_T_5 = eq(UInt<2>("h2"), io.weight) @[Mux.scala 81:61]
    node res = mux(_res_T_5, _res_T, _res_T_4) @[Mux.scala 81:58]
    io.output <= res @[Mult.scala 556:15]

  module Ppg2_18 :
    input clock : Clock
    input reset : Reset
    output io : { flip weight : UInt<2>, flip neg : UInt<1>, flip data : UInt<128>, output : UInt<128>}

    node _tmp_T = not(io.data) @[Mult.scala 550:29]
    node _tmp_T_1 = add(_tmp_T, UInt<1>("h1")) @[Mult.scala 550:38]
    node _tmp_T_2 = tail(_tmp_T_1, 1) @[Mult.scala 550:38]
    node tmp = mux(io.neg, _tmp_T_2, io.data) @[Mult.scala 550:20]
    node _res_T = cat(tmp, UInt<1>("h0")) @[Cat.scala 31:58]
    node _res_T_1 = eq(UInt<1>("h0"), io.weight) @[Mux.scala 81:61]
    node _res_T_2 = mux(_res_T_1, UInt<1>("h0"), UInt<1>("h0")) @[Mux.scala 81:58]
    node _res_T_3 = eq(UInt<1>("h1"), io.weight) @[Mux.scala 81:61]
    node _res_T_4 = mux(_res_T_3, tmp, _res_T_2) @[Mux.scala 81:58]
    node _res_T_5 = eq(UInt<2>("h2"), io.weight) @[Mux.scala 81:61]
    node res = mux(_res_T_5, _res_T, _res_T_4) @[Mux.scala 81:58]
    io.output <= res @[Mult.scala 556:15]

  module Ppg2_19 :
    input clock : Clock
    input reset : Reset
    output io : { flip weight : UInt<2>, flip neg : UInt<1>, flip data : UInt<128>, output : UInt<128>}

    node _tmp_T = not(io.data) @[Mult.scala 550:29]
    node _tmp_T_1 = add(_tmp_T, UInt<1>("h1")) @[Mult.scala 550:38]
    node _tmp_T_2 = tail(_tmp_T_1, 1) @[Mult.scala 550:38]
    node tmp = mux(io.neg, _tmp_T_2, io.data) @[Mult.scala 550:20]
    node _res_T = cat(tmp, UInt<1>("h0")) @[Cat.scala 31:58]
    node _res_T_1 = eq(UInt<1>("h0"), io.weight) @[Mux.scala 81:61]
    node _res_T_2 = mux(_res_T_1, UInt<1>("h0"), UInt<1>("h0")) @[Mux.scala 81:58]
    node _res_T_3 = eq(UInt<1>("h1"), io.weight) @[Mux.scala 81:61]
    node _res_T_4 = mux(_res_T_3, tmp, _res_T_2) @[Mux.scala 81:58]
    node _res_T_5 = eq(UInt<2>("h2"), io.weight) @[Mux.scala 81:61]
    node res = mux(_res_T_5, _res_T, _res_T_4) @[Mux.scala 81:58]
    io.output <= res @[Mult.scala 556:15]

  module Csa_14 :
    input clock : Clock
    input reset : Reset
    output io : { flip a : UInt<128>, flip b : UInt<128>, flip c : UInt<128>, carry : UInt<128>, temp_sum : UInt<128>}

    node _io_carry_T = and(io.a, io.b) @[Mult.scala 475:24]
    node _io_carry_T_1 = and(io.a, io.c) @[Mult.scala 475:40]
    node _io_carry_T_2 = or(_io_carry_T, _io_carry_T_1) @[Mult.scala 475:32]
    node _io_carry_T_3 = and(io.b, io.c) @[Mult.scala 475:56]
    node _io_carry_T_4 = or(_io_carry_T_2, _io_carry_T_3) @[Mult.scala 475:48]
    node _io_carry_T_5 = shl(_io_carry_T_4, 1) @[Mult.scala 475:65]
    io.carry <= _io_carry_T_5 @[Mult.scala 475:14]
    node _io_temp_sum_T = xor(io.a, io.b) @[Mult.scala 476:25]
    node _io_temp_sum_T_1 = xor(_io_temp_sum_T, io.c) @[Mult.scala 476:32]
    io.temp_sum <= _io_temp_sum_T_1 @[Mult.scala 476:17]

  module Csa_15 :
    input clock : Clock
    input reset : Reset
    output io : { flip a : UInt<128>, flip b : UInt<128>, flip c : UInt<128>, carry : UInt<128>, temp_sum : UInt<128>}

    node _io_carry_T = and(io.a, io.b) @[Mult.scala 475:24]
    node _io_carry_T_1 = and(io.a, io.c) @[Mult.scala 475:40]
    node _io_carry_T_2 = or(_io_carry_T, _io_carry_T_1) @[Mult.scala 475:32]
    node _io_carry_T_3 = and(io.b, io.c) @[Mult.scala 475:56]
    node _io_carry_T_4 = or(_io_carry_T_2, _io_carry_T_3) @[Mult.scala 475:48]
    node _io_carry_T_5 = shl(_io_carry_T_4, 1) @[Mult.scala 475:65]
    io.carry <= _io_carry_T_5 @[Mult.scala 475:14]
    node _io_temp_sum_T = xor(io.a, io.b) @[Mult.scala 476:25]
    node _io_temp_sum_T_1 = xor(_io_temp_sum_T, io.c) @[Mult.scala 476:32]
    io.temp_sum <= _io_temp_sum_T_1 @[Mult.scala 476:17]

  module BoothEncoder2_20 :
    input clock : Clock
    input reset : Reset
    output io : { flip data : UInt<3>, weight : UInt<2>, neg : UInt<1>}

    node _io_weight_tmp_T = bits(io.data, 2, 2) @[Mult.scala 530:26]
    node _io_weight_tmp_T_1 = mux(_io_weight_tmp_T, UInt<2>("h2"), UInt<1>("h0")) @[Mult.scala 530:21]
    node _io_weight_tmp_T_2 = bits(io.data, 1, 1) @[Mult.scala 530:53]
    node _io_weight_tmp_T_3 = add(_io_weight_tmp_T_1, _io_weight_tmp_T_2) @[Mult.scala 530:47]
    node _io_weight_tmp_T_4 = tail(_io_weight_tmp_T_3, 1) @[Mult.scala 530:47]
    node _io_weight_tmp_T_5 = bits(io.data, 0, 0) @[Mult.scala 530:63]
    node _io_weight_tmp_T_6 = add(_io_weight_tmp_T_4, _io_weight_tmp_T_5) @[Mult.scala 530:57]
    node io_weight_tmp = tail(_io_weight_tmp_T_6, 1) @[Mult.scala 530:57]
    node _io_weight_T = bits(io.data, 2, 2) @[Mult.scala 531:20]
    node _io_weight_T_1 = sub(UInt<3>("h4"), io_weight_tmp) @[Mult.scala 531:29]
    node _io_weight_T_2 = tail(_io_weight_T_1, 1) @[Mult.scala 531:29]
    node _io_weight_T_3 = mux(_io_weight_T, _io_weight_T_2, io_weight_tmp) @[Mult.scala 531:12]
    io.weight <= _io_weight_T_3 @[Mult.scala 538:15]
    node _io_neg_T = bits(io.data, 2, 2) @[Mult.scala 539:25]
    io.neg <= _io_neg_T @[Mult.scala 539:15]

  module BoothEncoder2_21 :
    input clock : Clock
    input reset : Reset
    output io : { flip data : UInt<3>, weight : UInt<2>, neg : UInt<1>}

    node _io_weight_tmp_T = bits(io.data, 2, 2) @[Mult.scala 530:26]
    node _io_weight_tmp_T_1 = mux(_io_weight_tmp_T, UInt<2>("h2"), UInt<1>("h0")) @[Mult.scala 530:21]
    node _io_weight_tmp_T_2 = bits(io.data, 1, 1) @[Mult.scala 530:53]
    node _io_weight_tmp_T_3 = add(_io_weight_tmp_T_1, _io_weight_tmp_T_2) @[Mult.scala 530:47]
    node _io_weight_tmp_T_4 = tail(_io_weight_tmp_T_3, 1) @[Mult.scala 530:47]
    node _io_weight_tmp_T_5 = bits(io.data, 0, 0) @[Mult.scala 530:63]
    node _io_weight_tmp_T_6 = add(_io_weight_tmp_T_4, _io_weight_tmp_T_5) @[Mult.scala 530:57]
    node io_weight_tmp = tail(_io_weight_tmp_T_6, 1) @[Mult.scala 530:57]
    node _io_weight_T = bits(io.data, 2, 2) @[Mult.scala 531:20]
    node _io_weight_T_1 = sub(UInt<3>("h4"), io_weight_tmp) @[Mult.scala 531:29]
    node _io_weight_T_2 = tail(_io_weight_T_1, 1) @[Mult.scala 531:29]
    node _io_weight_T_3 = mux(_io_weight_T, _io_weight_T_2, io_weight_tmp) @[Mult.scala 531:12]
    io.weight <= _io_weight_T_3 @[Mult.scala 538:15]
    node _io_neg_T = bits(io.data, 2, 2) @[Mult.scala 539:25]
    io.neg <= _io_neg_T @[Mult.scala 539:15]

  module BoothEncoder2_22 :
    input clock : Clock
    input reset : Reset
    output io : { flip data : UInt<3>, weight : UInt<2>, neg : UInt<1>}

    node _io_weight_tmp_T = bits(io.data, 2, 2) @[Mult.scala 530:26]
    node _io_weight_tmp_T_1 = mux(_io_weight_tmp_T, UInt<2>("h2"), UInt<1>("h0")) @[Mult.scala 530:21]
    node _io_weight_tmp_T_2 = bits(io.data, 1, 1) @[Mult.scala 530:53]
    node _io_weight_tmp_T_3 = add(_io_weight_tmp_T_1, _io_weight_tmp_T_2) @[Mult.scala 530:47]
    node _io_weight_tmp_T_4 = tail(_io_weight_tmp_T_3, 1) @[Mult.scala 530:47]
    node _io_weight_tmp_T_5 = bits(io.data, 0, 0) @[Mult.scala 530:63]
    node _io_weight_tmp_T_6 = add(_io_weight_tmp_T_4, _io_weight_tmp_T_5) @[Mult.scala 530:57]
    node io_weight_tmp = tail(_io_weight_tmp_T_6, 1) @[Mult.scala 530:57]
    node _io_weight_T = bits(io.data, 2, 2) @[Mult.scala 531:20]
    node _io_weight_T_1 = sub(UInt<3>("h4"), io_weight_tmp) @[Mult.scala 531:29]
    node _io_weight_T_2 = tail(_io_weight_T_1, 1) @[Mult.scala 531:29]
    node _io_weight_T_3 = mux(_io_weight_T, _io_weight_T_2, io_weight_tmp) @[Mult.scala 531:12]
    io.weight <= _io_weight_T_3 @[Mult.scala 538:15]
    node _io_neg_T = bits(io.data, 2, 2) @[Mult.scala 539:25]
    io.neg <= _io_neg_T @[Mult.scala 539:15]

  module BoothEncoder2_23 :
    input clock : Clock
    input reset : Reset
    output io : { flip data : UInt<3>, weight : UInt<2>, neg : UInt<1>}

    node _io_weight_tmp_T = bits(io.data, 2, 2) @[Mult.scala 530:26]
    node _io_weight_tmp_T_1 = mux(_io_weight_tmp_T, UInt<2>("h2"), UInt<1>("h0")) @[Mult.scala 530:21]
    node _io_weight_tmp_T_2 = bits(io.data, 1, 1) @[Mult.scala 530:53]
    node _io_weight_tmp_T_3 = add(_io_weight_tmp_T_1, _io_weight_tmp_T_2) @[Mult.scala 530:47]
    node _io_weight_tmp_T_4 = tail(_io_weight_tmp_T_3, 1) @[Mult.scala 530:47]
    node _io_weight_tmp_T_5 = bits(io.data, 0, 0) @[Mult.scala 530:63]
    node _io_weight_tmp_T_6 = add(_io_weight_tmp_T_4, _io_weight_tmp_T_5) @[Mult.scala 530:57]
    node io_weight_tmp = tail(_io_weight_tmp_T_6, 1) @[Mult.scala 530:57]
    node _io_weight_T = bits(io.data, 2, 2) @[Mult.scala 531:20]
    node _io_weight_T_1 = sub(UInt<3>("h4"), io_weight_tmp) @[Mult.scala 531:29]
    node _io_weight_T_2 = tail(_io_weight_T_1, 1) @[Mult.scala 531:29]
    node _io_weight_T_3 = mux(_io_weight_T, _io_weight_T_2, io_weight_tmp) @[Mult.scala 531:12]
    io.weight <= _io_weight_T_3 @[Mult.scala 538:15]
    node _io_neg_T = bits(io.data, 2, 2) @[Mult.scala 539:25]
    io.neg <= _io_neg_T @[Mult.scala 539:15]

  module Ppg2_20 :
    input clock : Clock
    input reset : Reset
    output io : { flip weight : UInt<2>, flip neg : UInt<1>, flip data : UInt<128>, output : UInt<128>}

    node _tmp_T = not(io.data) @[Mult.scala 550:29]
    node _tmp_T_1 = add(_tmp_T, UInt<1>("h1")) @[Mult.scala 550:38]
    node _tmp_T_2 = tail(_tmp_T_1, 1) @[Mult.scala 550:38]
    node tmp = mux(io.neg, _tmp_T_2, io.data) @[Mult.scala 550:20]
    node _res_T = cat(tmp, UInt<1>("h0")) @[Cat.scala 31:58]
    node _res_T_1 = eq(UInt<1>("h0"), io.weight) @[Mux.scala 81:61]
    node _res_T_2 = mux(_res_T_1, UInt<1>("h0"), UInt<1>("h0")) @[Mux.scala 81:58]
    node _res_T_3 = eq(UInt<1>("h1"), io.weight) @[Mux.scala 81:61]
    node _res_T_4 = mux(_res_T_3, tmp, _res_T_2) @[Mux.scala 81:58]
    node _res_T_5 = eq(UInt<2>("h2"), io.weight) @[Mux.scala 81:61]
    node res = mux(_res_T_5, _res_T, _res_T_4) @[Mux.scala 81:58]
    io.output <= res @[Mult.scala 556:15]

  module Ppg2_21 :
    input clock : Clock
    input reset : Reset
    output io : { flip weight : UInt<2>, flip neg : UInt<1>, flip data : UInt<128>, output : UInt<128>}

    node _tmp_T = not(io.data) @[Mult.scala 550:29]
    node _tmp_T_1 = add(_tmp_T, UInt<1>("h1")) @[Mult.scala 550:38]
    node _tmp_T_2 = tail(_tmp_T_1, 1) @[Mult.scala 550:38]
    node tmp = mux(io.neg, _tmp_T_2, io.data) @[Mult.scala 550:20]
    node _res_T = cat(tmp, UInt<1>("h0")) @[Cat.scala 31:58]
    node _res_T_1 = eq(UInt<1>("h0"), io.weight) @[Mux.scala 81:61]
    node _res_T_2 = mux(_res_T_1, UInt<1>("h0"), UInt<1>("h0")) @[Mux.scala 81:58]
    node _res_T_3 = eq(UInt<1>("h1"), io.weight) @[Mux.scala 81:61]
    node _res_T_4 = mux(_res_T_3, tmp, _res_T_2) @[Mux.scala 81:58]
    node _res_T_5 = eq(UInt<2>("h2"), io.weight) @[Mux.scala 81:61]
    node res = mux(_res_T_5, _res_T, _res_T_4) @[Mux.scala 81:58]
    io.output <= res @[Mult.scala 556:15]

  module Ppg2_22 :
    input clock : Clock
    input reset : Reset
    output io : { flip weight : UInt<2>, flip neg : UInt<1>, flip data : UInt<128>, output : UInt<128>}

    node _tmp_T = not(io.data) @[Mult.scala 550:29]
    node _tmp_T_1 = add(_tmp_T, UInt<1>("h1")) @[Mult.scala 550:38]
    node _tmp_T_2 = tail(_tmp_T_1, 1) @[Mult.scala 550:38]
    node tmp = mux(io.neg, _tmp_T_2, io.data) @[Mult.scala 550:20]
    node _res_T = cat(tmp, UInt<1>("h0")) @[Cat.scala 31:58]
    node _res_T_1 = eq(UInt<1>("h0"), io.weight) @[Mux.scala 81:61]
    node _res_T_2 = mux(_res_T_1, UInt<1>("h0"), UInt<1>("h0")) @[Mux.scala 81:58]
    node _res_T_3 = eq(UInt<1>("h1"), io.weight) @[Mux.scala 81:61]
    node _res_T_4 = mux(_res_T_3, tmp, _res_T_2) @[Mux.scala 81:58]
    node _res_T_5 = eq(UInt<2>("h2"), io.weight) @[Mux.scala 81:61]
    node res = mux(_res_T_5, _res_T, _res_T_4) @[Mux.scala 81:58]
    io.output <= res @[Mult.scala 556:15]

  module Ppg2_23 :
    input clock : Clock
    input reset : Reset
    output io : { flip weight : UInt<2>, flip neg : UInt<1>, flip data : UInt<128>, output : UInt<128>}

    node _tmp_T = not(io.data) @[Mult.scala 550:29]
    node _tmp_T_1 = add(_tmp_T, UInt<1>("h1")) @[Mult.scala 550:38]
    node _tmp_T_2 = tail(_tmp_T_1, 1) @[Mult.scala 550:38]
    node tmp = mux(io.neg, _tmp_T_2, io.data) @[Mult.scala 550:20]
    node _res_T = cat(tmp, UInt<1>("h0")) @[Cat.scala 31:58]
    node _res_T_1 = eq(UInt<1>("h0"), io.weight) @[Mux.scala 81:61]
    node _res_T_2 = mux(_res_T_1, UInt<1>("h0"), UInt<1>("h0")) @[Mux.scala 81:58]
    node _res_T_3 = eq(UInt<1>("h1"), io.weight) @[Mux.scala 81:61]
    node _res_T_4 = mux(_res_T_3, tmp, _res_T_2) @[Mux.scala 81:58]
    node _res_T_5 = eq(UInt<2>("h2"), io.weight) @[Mux.scala 81:61]
    node res = mux(_res_T_5, _res_T, _res_T_4) @[Mux.scala 81:58]
    io.output <= res @[Mult.scala 556:15]

  module Csa_16 :
    input clock : Clock
    input reset : Reset
    output io : { flip a : UInt<128>, flip b : UInt<128>, flip c : UInt<128>, carry : UInt<128>, temp_sum : UInt<128>}

    node _io_carry_T = and(io.a, io.b) @[Mult.scala 475:24]
    node _io_carry_T_1 = and(io.a, io.c) @[Mult.scala 475:40]
    node _io_carry_T_2 = or(_io_carry_T, _io_carry_T_1) @[Mult.scala 475:32]
    node _io_carry_T_3 = and(io.b, io.c) @[Mult.scala 475:56]
    node _io_carry_T_4 = or(_io_carry_T_2, _io_carry_T_3) @[Mult.scala 475:48]
    node _io_carry_T_5 = shl(_io_carry_T_4, 1) @[Mult.scala 475:65]
    io.carry <= _io_carry_T_5 @[Mult.scala 475:14]
    node _io_temp_sum_T = xor(io.a, io.b) @[Mult.scala 476:25]
    node _io_temp_sum_T_1 = xor(_io_temp_sum_T, io.c) @[Mult.scala 476:32]
    io.temp_sum <= _io_temp_sum_T_1 @[Mult.scala 476:17]

  module Csa_17 :
    input clock : Clock
    input reset : Reset
    output io : { flip a : UInt<128>, flip b : UInt<128>, flip c : UInt<128>, carry : UInt<128>, temp_sum : UInt<128>}

    node _io_carry_T = and(io.a, io.b) @[Mult.scala 475:24]
    node _io_carry_T_1 = and(io.a, io.c) @[Mult.scala 475:40]
    node _io_carry_T_2 = or(_io_carry_T, _io_carry_T_1) @[Mult.scala 475:32]
    node _io_carry_T_3 = and(io.b, io.c) @[Mult.scala 475:56]
    node _io_carry_T_4 = or(_io_carry_T_2, _io_carry_T_3) @[Mult.scala 475:48]
    node _io_carry_T_5 = shl(_io_carry_T_4, 1) @[Mult.scala 475:65]
    io.carry <= _io_carry_T_5 @[Mult.scala 475:14]
    node _io_temp_sum_T = xor(io.a, io.b) @[Mult.scala 476:25]
    node _io_temp_sum_T_1 = xor(_io_temp_sum_T, io.c) @[Mult.scala 476:32]
    io.temp_sum <= _io_temp_sum_T_1 @[Mult.scala 476:17]

  module BoothEncoder2_24 :
    input clock : Clock
    input reset : Reset
    output io : { flip data : UInt<3>, weight : UInt<2>, neg : UInt<1>}

    node _io_weight_tmp_T = bits(io.data, 2, 2) @[Mult.scala 530:26]
    node _io_weight_tmp_T_1 = mux(_io_weight_tmp_T, UInt<2>("h2"), UInt<1>("h0")) @[Mult.scala 530:21]
    node _io_weight_tmp_T_2 = bits(io.data, 1, 1) @[Mult.scala 530:53]
    node _io_weight_tmp_T_3 = add(_io_weight_tmp_T_1, _io_weight_tmp_T_2) @[Mult.scala 530:47]
    node _io_weight_tmp_T_4 = tail(_io_weight_tmp_T_3, 1) @[Mult.scala 530:47]
    node _io_weight_tmp_T_5 = bits(io.data, 0, 0) @[Mult.scala 530:63]
    node _io_weight_tmp_T_6 = add(_io_weight_tmp_T_4, _io_weight_tmp_T_5) @[Mult.scala 530:57]
    node io_weight_tmp = tail(_io_weight_tmp_T_6, 1) @[Mult.scala 530:57]
    node _io_weight_T = bits(io.data, 2, 2) @[Mult.scala 531:20]
    node _io_weight_T_1 = sub(UInt<3>("h4"), io_weight_tmp) @[Mult.scala 531:29]
    node _io_weight_T_2 = tail(_io_weight_T_1, 1) @[Mult.scala 531:29]
    node _io_weight_T_3 = mux(_io_weight_T, _io_weight_T_2, io_weight_tmp) @[Mult.scala 531:12]
    io.weight <= _io_weight_T_3 @[Mult.scala 538:15]
    node _io_neg_T = bits(io.data, 2, 2) @[Mult.scala 539:25]
    io.neg <= _io_neg_T @[Mult.scala 539:15]

  module BoothEncoder2_25 :
    input clock : Clock
    input reset : Reset
    output io : { flip data : UInt<3>, weight : UInt<2>, neg : UInt<1>}

    node _io_weight_tmp_T = bits(io.data, 2, 2) @[Mult.scala 530:26]
    node _io_weight_tmp_T_1 = mux(_io_weight_tmp_T, UInt<2>("h2"), UInt<1>("h0")) @[Mult.scala 530:21]
    node _io_weight_tmp_T_2 = bits(io.data, 1, 1) @[Mult.scala 530:53]
    node _io_weight_tmp_T_3 = add(_io_weight_tmp_T_1, _io_weight_tmp_T_2) @[Mult.scala 530:47]
    node _io_weight_tmp_T_4 = tail(_io_weight_tmp_T_3, 1) @[Mult.scala 530:47]
    node _io_weight_tmp_T_5 = bits(io.data, 0, 0) @[Mult.scala 530:63]
    node _io_weight_tmp_T_6 = add(_io_weight_tmp_T_4, _io_weight_tmp_T_5) @[Mult.scala 530:57]
    node io_weight_tmp = tail(_io_weight_tmp_T_6, 1) @[Mult.scala 530:57]
    node _io_weight_T = bits(io.data, 2, 2) @[Mult.scala 531:20]
    node _io_weight_T_1 = sub(UInt<3>("h4"), io_weight_tmp) @[Mult.scala 531:29]
    node _io_weight_T_2 = tail(_io_weight_T_1, 1) @[Mult.scala 531:29]
    node _io_weight_T_3 = mux(_io_weight_T, _io_weight_T_2, io_weight_tmp) @[Mult.scala 531:12]
    io.weight <= _io_weight_T_3 @[Mult.scala 538:15]
    node _io_neg_T = bits(io.data, 2, 2) @[Mult.scala 539:25]
    io.neg <= _io_neg_T @[Mult.scala 539:15]

  module BoothEncoder2_26 :
    input clock : Clock
    input reset : Reset
    output io : { flip data : UInt<3>, weight : UInt<2>, neg : UInt<1>}

    node _io_weight_tmp_T = bits(io.data, 2, 2) @[Mult.scala 530:26]
    node _io_weight_tmp_T_1 = mux(_io_weight_tmp_T, UInt<2>("h2"), UInt<1>("h0")) @[Mult.scala 530:21]
    node _io_weight_tmp_T_2 = bits(io.data, 1, 1) @[Mult.scala 530:53]
    node _io_weight_tmp_T_3 = add(_io_weight_tmp_T_1, _io_weight_tmp_T_2) @[Mult.scala 530:47]
    node _io_weight_tmp_T_4 = tail(_io_weight_tmp_T_3, 1) @[Mult.scala 530:47]
    node _io_weight_tmp_T_5 = bits(io.data, 0, 0) @[Mult.scala 530:63]
    node _io_weight_tmp_T_6 = add(_io_weight_tmp_T_4, _io_weight_tmp_T_5) @[Mult.scala 530:57]
    node io_weight_tmp = tail(_io_weight_tmp_T_6, 1) @[Mult.scala 530:57]
    node _io_weight_T = bits(io.data, 2, 2) @[Mult.scala 531:20]
    node _io_weight_T_1 = sub(UInt<3>("h4"), io_weight_tmp) @[Mult.scala 531:29]
    node _io_weight_T_2 = tail(_io_weight_T_1, 1) @[Mult.scala 531:29]
    node _io_weight_T_3 = mux(_io_weight_T, _io_weight_T_2, io_weight_tmp) @[Mult.scala 531:12]
    io.weight <= _io_weight_T_3 @[Mult.scala 538:15]
    node _io_neg_T = bits(io.data, 2, 2) @[Mult.scala 539:25]
    io.neg <= _io_neg_T @[Mult.scala 539:15]

  module BoothEncoder2_27 :
    input clock : Clock
    input reset : Reset
    output io : { flip data : UInt<3>, weight : UInt<2>, neg : UInt<1>}

    node _io_weight_tmp_T = bits(io.data, 2, 2) @[Mult.scala 530:26]
    node _io_weight_tmp_T_1 = mux(_io_weight_tmp_T, UInt<2>("h2"), UInt<1>("h0")) @[Mult.scala 530:21]
    node _io_weight_tmp_T_2 = bits(io.data, 1, 1) @[Mult.scala 530:53]
    node _io_weight_tmp_T_3 = add(_io_weight_tmp_T_1, _io_weight_tmp_T_2) @[Mult.scala 530:47]
    node _io_weight_tmp_T_4 = tail(_io_weight_tmp_T_3, 1) @[Mult.scala 530:47]
    node _io_weight_tmp_T_5 = bits(io.data, 0, 0) @[Mult.scala 530:63]
    node _io_weight_tmp_T_6 = add(_io_weight_tmp_T_4, _io_weight_tmp_T_5) @[Mult.scala 530:57]
    node io_weight_tmp = tail(_io_weight_tmp_T_6, 1) @[Mult.scala 530:57]
    node _io_weight_T = bits(io.data, 2, 2) @[Mult.scala 531:20]
    node _io_weight_T_1 = sub(UInt<3>("h4"), io_weight_tmp) @[Mult.scala 531:29]
    node _io_weight_T_2 = tail(_io_weight_T_1, 1) @[Mult.scala 531:29]
    node _io_weight_T_3 = mux(_io_weight_T, _io_weight_T_2, io_weight_tmp) @[Mult.scala 531:12]
    io.weight <= _io_weight_T_3 @[Mult.scala 538:15]
    node _io_neg_T = bits(io.data, 2, 2) @[Mult.scala 539:25]
    io.neg <= _io_neg_T @[Mult.scala 539:15]

  module Ppg2_24 :
    input clock : Clock
    input reset : Reset
    output io : { flip weight : UInt<2>, flip neg : UInt<1>, flip data : UInt<128>, output : UInt<128>}

    node _tmp_T = not(io.data) @[Mult.scala 550:29]
    node _tmp_T_1 = add(_tmp_T, UInt<1>("h1")) @[Mult.scala 550:38]
    node _tmp_T_2 = tail(_tmp_T_1, 1) @[Mult.scala 550:38]
    node tmp = mux(io.neg, _tmp_T_2, io.data) @[Mult.scala 550:20]
    node _res_T = cat(tmp, UInt<1>("h0")) @[Cat.scala 31:58]
    node _res_T_1 = eq(UInt<1>("h0"), io.weight) @[Mux.scala 81:61]
    node _res_T_2 = mux(_res_T_1, UInt<1>("h0"), UInt<1>("h0")) @[Mux.scala 81:58]
    node _res_T_3 = eq(UInt<1>("h1"), io.weight) @[Mux.scala 81:61]
    node _res_T_4 = mux(_res_T_3, tmp, _res_T_2) @[Mux.scala 81:58]
    node _res_T_5 = eq(UInt<2>("h2"), io.weight) @[Mux.scala 81:61]
    node res = mux(_res_T_5, _res_T, _res_T_4) @[Mux.scala 81:58]
    io.output <= res @[Mult.scala 556:15]

  module Ppg2_25 :
    input clock : Clock
    input reset : Reset
    output io : { flip weight : UInt<2>, flip neg : UInt<1>, flip data : UInt<128>, output : UInt<128>}

    node _tmp_T = not(io.data) @[Mult.scala 550:29]
    node _tmp_T_1 = add(_tmp_T, UInt<1>("h1")) @[Mult.scala 550:38]
    node _tmp_T_2 = tail(_tmp_T_1, 1) @[Mult.scala 550:38]
    node tmp = mux(io.neg, _tmp_T_2, io.data) @[Mult.scala 550:20]
    node _res_T = cat(tmp, UInt<1>("h0")) @[Cat.scala 31:58]
    node _res_T_1 = eq(UInt<1>("h0"), io.weight) @[Mux.scala 81:61]
    node _res_T_2 = mux(_res_T_1, UInt<1>("h0"), UInt<1>("h0")) @[Mux.scala 81:58]
    node _res_T_3 = eq(UInt<1>("h1"), io.weight) @[Mux.scala 81:61]
    node _res_T_4 = mux(_res_T_3, tmp, _res_T_2) @[Mux.scala 81:58]
    node _res_T_5 = eq(UInt<2>("h2"), io.weight) @[Mux.scala 81:61]
    node res = mux(_res_T_5, _res_T, _res_T_4) @[Mux.scala 81:58]
    io.output <= res @[Mult.scala 556:15]

  module Ppg2_26 :
    input clock : Clock
    input reset : Reset
    output io : { flip weight : UInt<2>, flip neg : UInt<1>, flip data : UInt<128>, output : UInt<128>}

    node _tmp_T = not(io.data) @[Mult.scala 550:29]
    node _tmp_T_1 = add(_tmp_T, UInt<1>("h1")) @[Mult.scala 550:38]
    node _tmp_T_2 = tail(_tmp_T_1, 1) @[Mult.scala 550:38]
    node tmp = mux(io.neg, _tmp_T_2, io.data) @[Mult.scala 550:20]
    node _res_T = cat(tmp, UInt<1>("h0")) @[Cat.scala 31:58]
    node _res_T_1 = eq(UInt<1>("h0"), io.weight) @[Mux.scala 81:61]
    node _res_T_2 = mux(_res_T_1, UInt<1>("h0"), UInt<1>("h0")) @[Mux.scala 81:58]
    node _res_T_3 = eq(UInt<1>("h1"), io.weight) @[Mux.scala 81:61]
    node _res_T_4 = mux(_res_T_3, tmp, _res_T_2) @[Mux.scala 81:58]
    node _res_T_5 = eq(UInt<2>("h2"), io.weight) @[Mux.scala 81:61]
    node res = mux(_res_T_5, _res_T, _res_T_4) @[Mux.scala 81:58]
    io.output <= res @[Mult.scala 556:15]

  module Ppg2_27 :
    input clock : Clock
    input reset : Reset
    output io : { flip weight : UInt<2>, flip neg : UInt<1>, flip data : UInt<128>, output : UInt<128>}

    node _tmp_T = not(io.data) @[Mult.scala 550:29]
    node _tmp_T_1 = add(_tmp_T, UInt<1>("h1")) @[Mult.scala 550:38]
    node _tmp_T_2 = tail(_tmp_T_1, 1) @[Mult.scala 550:38]
    node tmp = mux(io.neg, _tmp_T_2, io.data) @[Mult.scala 550:20]
    node _res_T = cat(tmp, UInt<1>("h0")) @[Cat.scala 31:58]
    node _res_T_1 = eq(UInt<1>("h0"), io.weight) @[Mux.scala 81:61]
    node _res_T_2 = mux(_res_T_1, UInt<1>("h0"), UInt<1>("h0")) @[Mux.scala 81:58]
    node _res_T_3 = eq(UInt<1>("h1"), io.weight) @[Mux.scala 81:61]
    node _res_T_4 = mux(_res_T_3, tmp, _res_T_2) @[Mux.scala 81:58]
    node _res_T_5 = eq(UInt<2>("h2"), io.weight) @[Mux.scala 81:61]
    node res = mux(_res_T_5, _res_T, _res_T_4) @[Mux.scala 81:58]
    io.output <= res @[Mult.scala 556:15]

  module Csa_18 :
    input clock : Clock
    input reset : Reset
    output io : { flip a : UInt<128>, flip b : UInt<128>, flip c : UInt<128>, carry : UInt<128>, temp_sum : UInt<128>}

    node _io_carry_T = and(io.a, io.b) @[Mult.scala 475:24]
    node _io_carry_T_1 = and(io.a, io.c) @[Mult.scala 475:40]
    node _io_carry_T_2 = or(_io_carry_T, _io_carry_T_1) @[Mult.scala 475:32]
    node _io_carry_T_3 = and(io.b, io.c) @[Mult.scala 475:56]
    node _io_carry_T_4 = or(_io_carry_T_2, _io_carry_T_3) @[Mult.scala 475:48]
    node _io_carry_T_5 = shl(_io_carry_T_4, 1) @[Mult.scala 475:65]
    io.carry <= _io_carry_T_5 @[Mult.scala 475:14]
    node _io_temp_sum_T = xor(io.a, io.b) @[Mult.scala 476:25]
    node _io_temp_sum_T_1 = xor(_io_temp_sum_T, io.c) @[Mult.scala 476:32]
    io.temp_sum <= _io_temp_sum_T_1 @[Mult.scala 476:17]

  module Csa_19 :
    input clock : Clock
    input reset : Reset
    output io : { flip a : UInt<128>, flip b : UInt<128>, flip c : UInt<128>, carry : UInt<128>, temp_sum : UInt<128>}

    node _io_carry_T = and(io.a, io.b) @[Mult.scala 475:24]
    node _io_carry_T_1 = and(io.a, io.c) @[Mult.scala 475:40]
    node _io_carry_T_2 = or(_io_carry_T, _io_carry_T_1) @[Mult.scala 475:32]
    node _io_carry_T_3 = and(io.b, io.c) @[Mult.scala 475:56]
    node _io_carry_T_4 = or(_io_carry_T_2, _io_carry_T_3) @[Mult.scala 475:48]
    node _io_carry_T_5 = shl(_io_carry_T_4, 1) @[Mult.scala 475:65]
    io.carry <= _io_carry_T_5 @[Mult.scala 475:14]
    node _io_temp_sum_T = xor(io.a, io.b) @[Mult.scala 476:25]
    node _io_temp_sum_T_1 = xor(_io_temp_sum_T, io.c) @[Mult.scala 476:32]
    io.temp_sum <= _io_temp_sum_T_1 @[Mult.scala 476:17]

  module BoothEncoder2_28 :
    input clock : Clock
    input reset : Reset
    output io : { flip data : UInt<3>, weight : UInt<2>, neg : UInt<1>}

    node _io_weight_tmp_T = bits(io.data, 2, 2) @[Mult.scala 530:26]
    node _io_weight_tmp_T_1 = mux(_io_weight_tmp_T, UInt<2>("h2"), UInt<1>("h0")) @[Mult.scala 530:21]
    node _io_weight_tmp_T_2 = bits(io.data, 1, 1) @[Mult.scala 530:53]
    node _io_weight_tmp_T_3 = add(_io_weight_tmp_T_1, _io_weight_tmp_T_2) @[Mult.scala 530:47]
    node _io_weight_tmp_T_4 = tail(_io_weight_tmp_T_3, 1) @[Mult.scala 530:47]
    node _io_weight_tmp_T_5 = bits(io.data, 0, 0) @[Mult.scala 530:63]
    node _io_weight_tmp_T_6 = add(_io_weight_tmp_T_4, _io_weight_tmp_T_5) @[Mult.scala 530:57]
    node io_weight_tmp = tail(_io_weight_tmp_T_6, 1) @[Mult.scala 530:57]
    node _io_weight_T = bits(io.data, 2, 2) @[Mult.scala 531:20]
    node _io_weight_T_1 = sub(UInt<3>("h4"), io_weight_tmp) @[Mult.scala 531:29]
    node _io_weight_T_2 = tail(_io_weight_T_1, 1) @[Mult.scala 531:29]
    node _io_weight_T_3 = mux(_io_weight_T, _io_weight_T_2, io_weight_tmp) @[Mult.scala 531:12]
    io.weight <= _io_weight_T_3 @[Mult.scala 538:15]
    node _io_neg_T = bits(io.data, 2, 2) @[Mult.scala 539:25]
    io.neg <= _io_neg_T @[Mult.scala 539:15]

  module BoothEncoder2_29 :
    input clock : Clock
    input reset : Reset
    output io : { flip data : UInt<3>, weight : UInt<2>, neg : UInt<1>}

    node _io_weight_tmp_T = bits(io.data, 2, 2) @[Mult.scala 530:26]
    node _io_weight_tmp_T_1 = mux(_io_weight_tmp_T, UInt<2>("h2"), UInt<1>("h0")) @[Mult.scala 530:21]
    node _io_weight_tmp_T_2 = bits(io.data, 1, 1) @[Mult.scala 530:53]
    node _io_weight_tmp_T_3 = add(_io_weight_tmp_T_1, _io_weight_tmp_T_2) @[Mult.scala 530:47]
    node _io_weight_tmp_T_4 = tail(_io_weight_tmp_T_3, 1) @[Mult.scala 530:47]
    node _io_weight_tmp_T_5 = bits(io.data, 0, 0) @[Mult.scala 530:63]
    node _io_weight_tmp_T_6 = add(_io_weight_tmp_T_4, _io_weight_tmp_T_5) @[Mult.scala 530:57]
    node io_weight_tmp = tail(_io_weight_tmp_T_6, 1) @[Mult.scala 530:57]
    node _io_weight_T = bits(io.data, 2, 2) @[Mult.scala 531:20]
    node _io_weight_T_1 = sub(UInt<3>("h4"), io_weight_tmp) @[Mult.scala 531:29]
    node _io_weight_T_2 = tail(_io_weight_T_1, 1) @[Mult.scala 531:29]
    node _io_weight_T_3 = mux(_io_weight_T, _io_weight_T_2, io_weight_tmp) @[Mult.scala 531:12]
    io.weight <= _io_weight_T_3 @[Mult.scala 538:15]
    node _io_neg_T = bits(io.data, 2, 2) @[Mult.scala 539:25]
    io.neg <= _io_neg_T @[Mult.scala 539:15]

  module BoothEncoder2_30 :
    input clock : Clock
    input reset : Reset
    output io : { flip data : UInt<3>, weight : UInt<2>, neg : UInt<1>}

    node _io_weight_tmp_T = bits(io.data, 2, 2) @[Mult.scala 530:26]
    node _io_weight_tmp_T_1 = mux(_io_weight_tmp_T, UInt<2>("h2"), UInt<1>("h0")) @[Mult.scala 530:21]
    node _io_weight_tmp_T_2 = bits(io.data, 1, 1) @[Mult.scala 530:53]
    node _io_weight_tmp_T_3 = add(_io_weight_tmp_T_1, _io_weight_tmp_T_2) @[Mult.scala 530:47]
    node _io_weight_tmp_T_4 = tail(_io_weight_tmp_T_3, 1) @[Mult.scala 530:47]
    node _io_weight_tmp_T_5 = bits(io.data, 0, 0) @[Mult.scala 530:63]
    node _io_weight_tmp_T_6 = add(_io_weight_tmp_T_4, _io_weight_tmp_T_5) @[Mult.scala 530:57]
    node io_weight_tmp = tail(_io_weight_tmp_T_6, 1) @[Mult.scala 530:57]
    node _io_weight_T = bits(io.data, 2, 2) @[Mult.scala 531:20]
    node _io_weight_T_1 = sub(UInt<3>("h4"), io_weight_tmp) @[Mult.scala 531:29]
    node _io_weight_T_2 = tail(_io_weight_T_1, 1) @[Mult.scala 531:29]
    node _io_weight_T_3 = mux(_io_weight_T, _io_weight_T_2, io_weight_tmp) @[Mult.scala 531:12]
    io.weight <= _io_weight_T_3 @[Mult.scala 538:15]
    node _io_neg_T = bits(io.data, 2, 2) @[Mult.scala 539:25]
    io.neg <= _io_neg_T @[Mult.scala 539:15]

  module BoothEncoder2_31 :
    input clock : Clock
    input reset : Reset
    output io : { flip data : UInt<3>, weight : UInt<2>, neg : UInt<1>}

    node _io_weight_tmp_T = bits(io.data, 2, 2) @[Mult.scala 530:26]
    node _io_weight_tmp_T_1 = mux(_io_weight_tmp_T, UInt<2>("h2"), UInt<1>("h0")) @[Mult.scala 530:21]
    node _io_weight_tmp_T_2 = bits(io.data, 1, 1) @[Mult.scala 530:53]
    node _io_weight_tmp_T_3 = add(_io_weight_tmp_T_1, _io_weight_tmp_T_2) @[Mult.scala 530:47]
    node _io_weight_tmp_T_4 = tail(_io_weight_tmp_T_3, 1) @[Mult.scala 530:47]
    node _io_weight_tmp_T_5 = bits(io.data, 0, 0) @[Mult.scala 530:63]
    node _io_weight_tmp_T_6 = add(_io_weight_tmp_T_4, _io_weight_tmp_T_5) @[Mult.scala 530:57]
    node io_weight_tmp = tail(_io_weight_tmp_T_6, 1) @[Mult.scala 530:57]
    node _io_weight_T = bits(io.data, 2, 2) @[Mult.scala 531:20]
    node _io_weight_T_1 = sub(UInt<3>("h4"), io_weight_tmp) @[Mult.scala 531:29]
    node _io_weight_T_2 = tail(_io_weight_T_1, 1) @[Mult.scala 531:29]
    node _io_weight_T_3 = mux(_io_weight_T, _io_weight_T_2, io_weight_tmp) @[Mult.scala 531:12]
    io.weight <= _io_weight_T_3 @[Mult.scala 538:15]
    node _io_neg_T = bits(io.data, 2, 2) @[Mult.scala 539:25]
    io.neg <= _io_neg_T @[Mult.scala 539:15]

  module Ppg2_28 :
    input clock : Clock
    input reset : Reset
    output io : { flip weight : UInt<2>, flip neg : UInt<1>, flip data : UInt<128>, output : UInt<128>}

    node _tmp_T = not(io.data) @[Mult.scala 550:29]
    node _tmp_T_1 = add(_tmp_T, UInt<1>("h1")) @[Mult.scala 550:38]
    node _tmp_T_2 = tail(_tmp_T_1, 1) @[Mult.scala 550:38]
    node tmp = mux(io.neg, _tmp_T_2, io.data) @[Mult.scala 550:20]
    node _res_T = cat(tmp, UInt<1>("h0")) @[Cat.scala 31:58]
    node _res_T_1 = eq(UInt<1>("h0"), io.weight) @[Mux.scala 81:61]
    node _res_T_2 = mux(_res_T_1, UInt<1>("h0"), UInt<1>("h0")) @[Mux.scala 81:58]
    node _res_T_3 = eq(UInt<1>("h1"), io.weight) @[Mux.scala 81:61]
    node _res_T_4 = mux(_res_T_3, tmp, _res_T_2) @[Mux.scala 81:58]
    node _res_T_5 = eq(UInt<2>("h2"), io.weight) @[Mux.scala 81:61]
    node res = mux(_res_T_5, _res_T, _res_T_4) @[Mux.scala 81:58]
    io.output <= res @[Mult.scala 556:15]

  module Ppg2_29 :
    input clock : Clock
    input reset : Reset
    output io : { flip weight : UInt<2>, flip neg : UInt<1>, flip data : UInt<128>, output : UInt<128>}

    node _tmp_T = not(io.data) @[Mult.scala 550:29]
    node _tmp_T_1 = add(_tmp_T, UInt<1>("h1")) @[Mult.scala 550:38]
    node _tmp_T_2 = tail(_tmp_T_1, 1) @[Mult.scala 550:38]
    node tmp = mux(io.neg, _tmp_T_2, io.data) @[Mult.scala 550:20]
    node _res_T = cat(tmp, UInt<1>("h0")) @[Cat.scala 31:58]
    node _res_T_1 = eq(UInt<1>("h0"), io.weight) @[Mux.scala 81:61]
    node _res_T_2 = mux(_res_T_1, UInt<1>("h0"), UInt<1>("h0")) @[Mux.scala 81:58]
    node _res_T_3 = eq(UInt<1>("h1"), io.weight) @[Mux.scala 81:61]
    node _res_T_4 = mux(_res_T_3, tmp, _res_T_2) @[Mux.scala 81:58]
    node _res_T_5 = eq(UInt<2>("h2"), io.weight) @[Mux.scala 81:61]
    node res = mux(_res_T_5, _res_T, _res_T_4) @[Mux.scala 81:58]
    io.output <= res @[Mult.scala 556:15]

  module Ppg2_30 :
    input clock : Clock
    input reset : Reset
    output io : { flip weight : UInt<2>, flip neg : UInt<1>, flip data : UInt<128>, output : UInt<128>}

    node _tmp_T = not(io.data) @[Mult.scala 550:29]
    node _tmp_T_1 = add(_tmp_T, UInt<1>("h1")) @[Mult.scala 550:38]
    node _tmp_T_2 = tail(_tmp_T_1, 1) @[Mult.scala 550:38]
    node tmp = mux(io.neg, _tmp_T_2, io.data) @[Mult.scala 550:20]
    node _res_T = cat(tmp, UInt<1>("h0")) @[Cat.scala 31:58]
    node _res_T_1 = eq(UInt<1>("h0"), io.weight) @[Mux.scala 81:61]
    node _res_T_2 = mux(_res_T_1, UInt<1>("h0"), UInt<1>("h0")) @[Mux.scala 81:58]
    node _res_T_3 = eq(UInt<1>("h1"), io.weight) @[Mux.scala 81:61]
    node _res_T_4 = mux(_res_T_3, tmp, _res_T_2) @[Mux.scala 81:58]
    node _res_T_5 = eq(UInt<2>("h2"), io.weight) @[Mux.scala 81:61]
    node res = mux(_res_T_5, _res_T, _res_T_4) @[Mux.scala 81:58]
    io.output <= res @[Mult.scala 556:15]

  module Ppg2_31 :
    input clock : Clock
    input reset : Reset
    output io : { flip weight : UInt<2>, flip neg : UInt<1>, flip data : UInt<128>, output : UInt<128>}

    node _tmp_T = not(io.data) @[Mult.scala 550:29]
    node _tmp_T_1 = add(_tmp_T, UInt<1>("h1")) @[Mult.scala 550:38]
    node _tmp_T_2 = tail(_tmp_T_1, 1) @[Mult.scala 550:38]
    node tmp = mux(io.neg, _tmp_T_2, io.data) @[Mult.scala 550:20]
    node _res_T = cat(tmp, UInt<1>("h0")) @[Cat.scala 31:58]
    node _res_T_1 = eq(UInt<1>("h0"), io.weight) @[Mux.scala 81:61]
    node _res_T_2 = mux(_res_T_1, UInt<1>("h0"), UInt<1>("h0")) @[Mux.scala 81:58]
    node _res_T_3 = eq(UInt<1>("h1"), io.weight) @[Mux.scala 81:61]
    node _res_T_4 = mux(_res_T_3, tmp, _res_T_2) @[Mux.scala 81:58]
    node _res_T_5 = eq(UInt<2>("h2"), io.weight) @[Mux.scala 81:61]
    node res = mux(_res_T_5, _res_T, _res_T_4) @[Mux.scala 81:58]
    io.output <= res @[Mult.scala 556:15]

  module Csa_20 :
    input clock : Clock
    input reset : Reset
    output io : { flip a : UInt<128>, flip b : UInt<128>, flip c : UInt<128>, carry : UInt<128>, temp_sum : UInt<128>}

    node _io_carry_T = and(io.a, io.b) @[Mult.scala 475:24]
    node _io_carry_T_1 = and(io.a, io.c) @[Mult.scala 475:40]
    node _io_carry_T_2 = or(_io_carry_T, _io_carry_T_1) @[Mult.scala 475:32]
    node _io_carry_T_3 = and(io.b, io.c) @[Mult.scala 475:56]
    node _io_carry_T_4 = or(_io_carry_T_2, _io_carry_T_3) @[Mult.scala 475:48]
    node _io_carry_T_5 = shl(_io_carry_T_4, 1) @[Mult.scala 475:65]
    io.carry <= _io_carry_T_5 @[Mult.scala 475:14]
    node _io_temp_sum_T = xor(io.a, io.b) @[Mult.scala 476:25]
    node _io_temp_sum_T_1 = xor(_io_temp_sum_T, io.c) @[Mult.scala 476:32]
    io.temp_sum <= _io_temp_sum_T_1 @[Mult.scala 476:17]

  module Csa_21 :
    input clock : Clock
    input reset : Reset
    output io : { flip a : UInt<128>, flip b : UInt<128>, flip c : UInt<128>, carry : UInt<128>, temp_sum : UInt<128>}

    node _io_carry_T = and(io.a, io.b) @[Mult.scala 475:24]
    node _io_carry_T_1 = and(io.a, io.c) @[Mult.scala 475:40]
    node _io_carry_T_2 = or(_io_carry_T, _io_carry_T_1) @[Mult.scala 475:32]
    node _io_carry_T_3 = and(io.b, io.c) @[Mult.scala 475:56]
    node _io_carry_T_4 = or(_io_carry_T_2, _io_carry_T_3) @[Mult.scala 475:48]
    node _io_carry_T_5 = shl(_io_carry_T_4, 1) @[Mult.scala 475:65]
    io.carry <= _io_carry_T_5 @[Mult.scala 475:14]
    node _io_temp_sum_T = xor(io.a, io.b) @[Mult.scala 476:25]
    node _io_temp_sum_T_1 = xor(_io_temp_sum_T, io.c) @[Mult.scala 476:32]
    io.temp_sum <= _io_temp_sum_T_1 @[Mult.scala 476:17]

  module Mult :
    input clock : Clock
    input reset : UInt<1>
    output io : { flip a : UInt<64>, flip b : UInt<64>, flip sign : UInt<1>, result : UInt<128>, unsigned : UInt<128>, signed : SInt<128>}

    node _io_unsigned_T = mul(io.a, io.b) @[Mult.scala 25:27]
    io.unsigned <= _io_unsigned_T @[Mult.scala 25:19]
    node _io_signed_T = asSInt(io.a) @[Mult.scala 26:27]
    node _io_signed_T_1 = asSInt(io.b) @[Mult.scala 26:41]
    node _io_signed_T_2 = mul(_io_signed_T, _io_signed_T_1) @[Mult.scala 26:34]
    io.signed <= _io_signed_T_2 @[Mult.scala 26:19]
    inst be8_0 of BoothEncoder8 @[Mult.scala 30:23]
    be8_0.clock <= clock
    be8_0.reset <= reset
    inst be8_1 of BoothEncoder8_1 @[Mult.scala 31:23]
    be8_1.clock <= clock
    be8_1.reset <= reset
    inst be8_2 of BoothEncoder8_2 @[Mult.scala 32:23]
    be8_2.clock <= clock
    be8_2.reset <= reset
    inst be8_3 of BoothEncoder8_3 @[Mult.scala 33:23]
    be8_3.clock <= clock
    be8_3.reset <= reset
    inst be8_4 of BoothEncoder8_4 @[Mult.scala 34:23]
    be8_4.clock <= clock
    be8_4.reset <= reset
    inst be8_5 of BoothEncoder8_5 @[Mult.scala 35:23]
    be8_5.clock <= clock
    be8_5.reset <= reset
    inst be8_6 of BoothEncoder8_6 @[Mult.scala 36:23]
    be8_6.clock <= clock
    be8_6.reset <= reset
    inst be8_7 of BoothEncoder8_7 @[Mult.scala 37:23]
    be8_7.clock <= clock
    be8_7.reset <= reset
    inst csa0 of Csa @[Mult.scala 39:22]
    csa0.clock <= clock
    csa0.reset <= reset
    inst csa1 of Csa_1 @[Mult.scala 40:22]
    csa1.clock <= clock
    csa1.reset <= reset
    inst csa2 of Csa_2 @[Mult.scala 41:22]
    csa2.clock <= clock
    csa2.reset <= reset
    inst csa3 of Csa_3 @[Mult.scala 42:22]
    csa3.clock <= clock
    csa3.reset <= reset
    inst csa4 of Csa_4 @[Mult.scala 43:22]
    csa4.clock <= clock
    csa4.reset <= reset
    inst csa5 of Csa_5 @[Mult.scala 44:22]
    csa5.clock <= clock
    csa5.reset <= reset
    node shift1 = shl(io.b, 8) @[Mult.scala 46:56]
    node shift2 = shl(shift1, 8) @[Mult.scala 46:86]
    node shift3 = shl(shift2, 8) @[Mult.scala 47:26]
    node shift4 = shl(shift3, 8) @[Mult.scala 47:56]
    node shift5 = shl(shift4, 8) @[Mult.scala 47:86]
    node shift6 = shl(shift5, 8) @[Mult.scala 48:26]
    node shift7 = shl(shift6, 8) @[Mult.scala 48:56]
    node _data0_T = not(io.b) @[Mult.scala 52:37]
    node _data0_T_1 = add(_data0_T, UInt<1>("h1")) @[Mult.scala 52:45]
    node _data0_T_2 = tail(_data0_T_1, 1) @[Mult.scala 52:45]
    node b64 = mux(be8_0.io.neg, _data0_T_2, io.b) @[Mult.scala 52:22]
    node _data1_T = not(shift1) @[Mult.scala 53:37]
    node _data1_T_1 = add(_data1_T, UInt<1>("h1")) @[Mult.scala 53:45]
    node _data1_T_2 = tail(_data1_T_1, 1) @[Mult.scala 53:45]
    node b72 = mux(be8_1.io.neg, _data1_T_2, shift1) @[Mult.scala 53:22]
    node _data2_T = not(shift2) @[Mult.scala 54:37]
    node _data2_T_1 = add(_data2_T, UInt<1>("h1")) @[Mult.scala 54:45]
    node _data2_T_2 = tail(_data2_T_1, 1) @[Mult.scala 54:45]
    node b80 = mux(be8_2.io.neg, _data2_T_2, shift2) @[Mult.scala 54:22]
    node _data3_T = not(shift3) @[Mult.scala 55:37]
    node _data3_T_1 = add(_data3_T, UInt<1>("h1")) @[Mult.scala 55:45]
    node _data3_T_2 = tail(_data3_T_1, 1) @[Mult.scala 55:45]
    node b88 = mux(be8_3.io.neg, _data3_T_2, shift3) @[Mult.scala 55:22]
    node _data4_T = not(shift4) @[Mult.scala 56:37]
    node _data4_T_1 = add(_data4_T, UInt<1>("h1")) @[Mult.scala 56:45]
    node _data4_T_2 = tail(_data4_T_1, 1) @[Mult.scala 56:45]
    node b96 = mux(be8_4.io.neg, _data4_T_2, shift4) @[Mult.scala 56:22]
    node _data5_T = not(shift5) @[Mult.scala 57:37]
    node _data5_T_1 = add(_data5_T, UInt<1>("h1")) @[Mult.scala 57:45]
    node _data5_T_2 = tail(_data5_T_1, 1) @[Mult.scala 57:45]
    node b104 = mux(be8_5.io.neg, _data5_T_2, shift5) @[Mult.scala 57:22]
    node _data6_T = not(shift6) @[Mult.scala 58:37]
    node _data6_T_1 = add(_data6_T, UInt<1>("h1")) @[Mult.scala 58:45]
    node _data6_T_2 = tail(_data6_T_1, 1) @[Mult.scala 58:45]
    node b112 = mux(be8_6.io.neg, _data6_T_2, shift6) @[Mult.scala 58:22]
    node _data7_T = not(shift7) @[Mult.scala 59:37]
    node _data7_T_1 = add(_data7_T, UInt<1>("h1")) @[Mult.scala 59:45]
    node _data7_T_2 = tail(_data7_T_1, 1) @[Mult.scala 59:45]
    node b120 = mux(be8_7.io.neg, _data7_T_2, shift7) @[Mult.scala 59:22]
    node b66 = shl(b64, 2) @[Mult.scala 61:39]
    node b68 = shl(b66, 2) @[Mult.scala 61:61]
    node b70 = shl(b68, 2) @[Mult.scala 61:83]
    node b74 = shl(b72, 2) @[Mult.scala 62:39]
    node b76 = shl(b74, 2) @[Mult.scala 62:61]
    node b78 = shl(b76, 2) @[Mult.scala 62:83]
    node b82 = shl(b80, 2) @[Mult.scala 63:39]
    node b84 = shl(b82, 2) @[Mult.scala 63:61]
    node b86 = shl(b84, 2) @[Mult.scala 63:83]
    node b90 = shl(b88, 2) @[Mult.scala 64:39]
    node b92 = shl(b90, 2) @[Mult.scala 64:61]
    node b94 = shl(b90, 2) @[Mult.scala 64:83]
    node b98 = shl(b96, 2) @[Mult.scala 65:39]
    node b100 = shl(b98, 2) @[Mult.scala 65:61]
    node b102 = shl(b100, 2) @[Mult.scala 65:83]
    node b106 = shl(b104, 2) @[Mult.scala 66:39]
    node b108 = shl(b106, 2) @[Mult.scala 66:61]
    node b110 = shl(b108, 2) @[Mult.scala 66:83]
    node b114 = shl(b112, 2) @[Mult.scala 67:39]
    node b116 = shl(b114, 2) @[Mult.scala 67:61]
    node b118 = shl(b116, 2) @[Mult.scala 67:83]
    node b122 = shl(b120, 2) @[Mult.scala 68:39]
    node b124 = shl(b122, 2) @[Mult.scala 68:61]
    node b126 = shl(b124, 2) @[Mult.scala 68:83]
    inst be2_0_0 of BoothEncoder2 @[Mult.scala 73:25]
    be2_0_0.clock <= clock
    be2_0_0.reset <= reset
    inst be2_0_1 of BoothEncoder2_1 @[Mult.scala 74:25]
    be2_0_1.clock <= clock
    be2_0_1.reset <= reset
    inst be2_0_2 of BoothEncoder2_2 @[Mult.scala 75:25]
    be2_0_2.clock <= clock
    be2_0_2.reset <= reset
    inst be2_0_3 of BoothEncoder2_3 @[Mult.scala 76:25]
    be2_0_3.clock <= clock
    be2_0_3.reset <= reset
    inst ppg2_0_0 of Ppg2 @[Mult.scala 77:27]
    ppg2_0_0.clock <= clock
    ppg2_0_0.reset <= reset
    inst ppg2_0_1 of Ppg2_1 @[Mult.scala 78:27]
    ppg2_0_1.clock <= clock
    ppg2_0_1.reset <= reset
    inst ppg2_0_2 of Ppg2_2 @[Mult.scala 79:27]
    ppg2_0_2.clock <= clock
    ppg2_0_2.reset <= reset
    inst ppg2_0_3 of Ppg2_3 @[Mult.scala 80:27]
    ppg2_0_3.clock <= clock
    ppg2_0_3.reset <= reset
    inst csa0_0 of Csa_6 @[Mult.scala 81:27]
    csa0_0.clock <= clock
    csa0_0.reset <= reset
    inst csa0_1 of Csa_7 @[Mult.scala 82:27]
    csa0_1.clock <= clock
    csa0_1.reset <= reset
    inst be2_1_0 of BoothEncoder2_4 @[Mult.scala 84:25]
    be2_1_0.clock <= clock
    be2_1_0.reset <= reset
    inst be2_1_1 of BoothEncoder2_5 @[Mult.scala 85:25]
    be2_1_1.clock <= clock
    be2_1_1.reset <= reset
    inst be2_1_2 of BoothEncoder2_6 @[Mult.scala 86:25]
    be2_1_2.clock <= clock
    be2_1_2.reset <= reset
    inst be2_1_3 of BoothEncoder2_7 @[Mult.scala 87:25]
    be2_1_3.clock <= clock
    be2_1_3.reset <= reset
    inst ppg2_1_0 of Ppg2_4 @[Mult.scala 88:27]
    ppg2_1_0.clock <= clock
    ppg2_1_0.reset <= reset
    inst ppg2_1_1 of Ppg2_5 @[Mult.scala 89:27]
    ppg2_1_1.clock <= clock
    ppg2_1_1.reset <= reset
    inst ppg2_1_2 of Ppg2_6 @[Mult.scala 90:27]
    ppg2_1_2.clock <= clock
    ppg2_1_2.reset <= reset
    inst ppg2_1_3 of Ppg2_7 @[Mult.scala 91:27]
    ppg2_1_3.clock <= clock
    ppg2_1_3.reset <= reset
    inst csa1_0 of Csa_8 @[Mult.scala 92:27]
    csa1_0.clock <= clock
    csa1_0.reset <= reset
    inst csa1_1 of Csa_9 @[Mult.scala 93:27]
    csa1_1.clock <= clock
    csa1_1.reset <= reset
    inst be2_2_0 of BoothEncoder2_8 @[Mult.scala 95:25]
    be2_2_0.clock <= clock
    be2_2_0.reset <= reset
    inst be2_2_1 of BoothEncoder2_9 @[Mult.scala 96:25]
    be2_2_1.clock <= clock
    be2_2_1.reset <= reset
    inst be2_2_2 of BoothEncoder2_10 @[Mult.scala 97:25]
    be2_2_2.clock <= clock
    be2_2_2.reset <= reset
    inst be2_2_3 of BoothEncoder2_11 @[Mult.scala 98:25]
    be2_2_3.clock <= clock
    be2_2_3.reset <= reset
    inst ppg2_2_0 of Ppg2_8 @[Mult.scala 99:27]
    ppg2_2_0.clock <= clock
    ppg2_2_0.reset <= reset
    inst ppg2_2_1 of Ppg2_9 @[Mult.scala 100:27]
    ppg2_2_1.clock <= clock
    ppg2_2_1.reset <= reset
    inst ppg2_2_2 of Ppg2_10 @[Mult.scala 101:27]
    ppg2_2_2.clock <= clock
    ppg2_2_2.reset <= reset
    inst ppg2_2_3 of Ppg2_11 @[Mult.scala 102:27]
    ppg2_2_3.clock <= clock
    ppg2_2_3.reset <= reset
    inst csa2_0 of Csa_10 @[Mult.scala 103:27]
    csa2_0.clock <= clock
    csa2_0.reset <= reset
    inst csa2_1 of Csa_11 @[Mult.scala 104:27]
    csa2_1.clock <= clock
    csa2_1.reset <= reset
    inst be2_3_0 of BoothEncoder2_12 @[Mult.scala 106:25]
    be2_3_0.clock <= clock
    be2_3_0.reset <= reset
    inst be2_3_1 of BoothEncoder2_13 @[Mult.scala 107:25]
    be2_3_1.clock <= clock
    be2_3_1.reset <= reset
    inst be2_3_2 of BoothEncoder2_14 @[Mult.scala 108:25]
    be2_3_2.clock <= clock
    be2_3_2.reset <= reset
    inst be2_3_3 of BoothEncoder2_15 @[Mult.scala 109:25]
    be2_3_3.clock <= clock
    be2_3_3.reset <= reset
    inst ppg2_3_0 of Ppg2_12 @[Mult.scala 110:27]
    ppg2_3_0.clock <= clock
    ppg2_3_0.reset <= reset
    inst ppg2_3_1 of Ppg2_13 @[Mult.scala 111:27]
    ppg2_3_1.clock <= clock
    ppg2_3_1.reset <= reset
    inst ppg2_3_2 of Ppg2_14 @[Mult.scala 112:27]
    ppg2_3_2.clock <= clock
    ppg2_3_2.reset <= reset
    inst ppg2_3_3 of Ppg2_15 @[Mult.scala 113:27]
    ppg2_3_3.clock <= clock
    ppg2_3_3.reset <= reset
    inst csa3_0 of Csa_12 @[Mult.scala 114:27]
    csa3_0.clock <= clock
    csa3_0.reset <= reset
    inst csa3_1 of Csa_13 @[Mult.scala 115:27]
    csa3_1.clock <= clock
    csa3_1.reset <= reset
    inst be2_4_0 of BoothEncoder2_16 @[Mult.scala 117:25]
    be2_4_0.clock <= clock
    be2_4_0.reset <= reset
    inst be2_4_1 of BoothEncoder2_17 @[Mult.scala 118:25]
    be2_4_1.clock <= clock
    be2_4_1.reset <= reset
    inst be2_4_2 of BoothEncoder2_18 @[Mult.scala 119:25]
    be2_4_2.clock <= clock
    be2_4_2.reset <= reset
    inst be2_4_3 of BoothEncoder2_19 @[Mult.scala 120:25]
    be2_4_3.clock <= clock
    be2_4_3.reset <= reset
    inst ppg2_4_0 of Ppg2_16 @[Mult.scala 121:27]
    ppg2_4_0.clock <= clock
    ppg2_4_0.reset <= reset
    inst ppg2_4_1 of Ppg2_17 @[Mult.scala 122:27]
    ppg2_4_1.clock <= clock
    ppg2_4_1.reset <= reset
    inst ppg2_4_2 of Ppg2_18 @[Mult.scala 123:27]
    ppg2_4_2.clock <= clock
    ppg2_4_2.reset <= reset
    inst ppg2_4_3 of Ppg2_19 @[Mult.scala 124:27]
    ppg2_4_3.clock <= clock
    ppg2_4_3.reset <= reset
    inst csa4_0 of Csa_14 @[Mult.scala 125:27]
    csa4_0.clock <= clock
    csa4_0.reset <= reset
    inst csa4_1 of Csa_15 @[Mult.scala 126:27]
    csa4_1.clock <= clock
    csa4_1.reset <= reset
    inst be2_5_0 of BoothEncoder2_20 @[Mult.scala 128:25]
    be2_5_0.clock <= clock
    be2_5_0.reset <= reset
    inst be2_5_1 of BoothEncoder2_21 @[Mult.scala 129:25]
    be2_5_1.clock <= clock
    be2_5_1.reset <= reset
    inst be2_5_2 of BoothEncoder2_22 @[Mult.scala 130:25]
    be2_5_2.clock <= clock
    be2_5_2.reset <= reset
    inst be2_5_3 of BoothEncoder2_23 @[Mult.scala 131:25]
    be2_5_3.clock <= clock
    be2_5_3.reset <= reset
    inst ppg2_5_0 of Ppg2_20 @[Mult.scala 132:27]
    ppg2_5_0.clock <= clock
    ppg2_5_0.reset <= reset
    inst ppg2_5_1 of Ppg2_21 @[Mult.scala 133:27]
    ppg2_5_1.clock <= clock
    ppg2_5_1.reset <= reset
    inst ppg2_5_2 of Ppg2_22 @[Mult.scala 134:27]
    ppg2_5_2.clock <= clock
    ppg2_5_2.reset <= reset
    inst ppg2_5_3 of Ppg2_23 @[Mult.scala 135:27]
    ppg2_5_3.clock <= clock
    ppg2_5_3.reset <= reset
    inst csa5_0 of Csa_16 @[Mult.scala 136:27]
    csa5_0.clock <= clock
    csa5_0.reset <= reset
    inst csa5_1 of Csa_17 @[Mult.scala 137:27]
    csa5_1.clock <= clock
    csa5_1.reset <= reset
    inst be2_6_0 of BoothEncoder2_24 @[Mult.scala 139:25]
    be2_6_0.clock <= clock
    be2_6_0.reset <= reset
    inst be2_6_1 of BoothEncoder2_25 @[Mult.scala 140:25]
    be2_6_1.clock <= clock
    be2_6_1.reset <= reset
    inst be2_6_2 of BoothEncoder2_26 @[Mult.scala 141:25]
    be2_6_2.clock <= clock
    be2_6_2.reset <= reset
    inst be2_6_3 of BoothEncoder2_27 @[Mult.scala 142:25]
    be2_6_3.clock <= clock
    be2_6_3.reset <= reset
    inst ppg2_6_0 of Ppg2_24 @[Mult.scala 143:27]
    ppg2_6_0.clock <= clock
    ppg2_6_0.reset <= reset
    inst ppg2_6_1 of Ppg2_25 @[Mult.scala 144:27]
    ppg2_6_1.clock <= clock
    ppg2_6_1.reset <= reset
    inst ppg2_6_2 of Ppg2_26 @[Mult.scala 145:27]
    ppg2_6_2.clock <= clock
    ppg2_6_2.reset <= reset
    inst ppg2_6_3 of Ppg2_27 @[Mult.scala 146:27]
    ppg2_6_3.clock <= clock
    ppg2_6_3.reset <= reset
    inst csa6_0 of Csa_18 @[Mult.scala 147:27]
    csa6_0.clock <= clock
    csa6_0.reset <= reset
    inst csa6_1 of Csa_19 @[Mult.scala 148:27]
    csa6_1.clock <= clock
    csa6_1.reset <= reset
    inst be2_7_0 of BoothEncoder2_28 @[Mult.scala 150:25]
    be2_7_0.clock <= clock
    be2_7_0.reset <= reset
    inst be2_7_1 of BoothEncoder2_29 @[Mult.scala 151:25]
    be2_7_1.clock <= clock
    be2_7_1.reset <= reset
    inst be2_7_2 of BoothEncoder2_30 @[Mult.scala 152:25]
    be2_7_2.clock <= clock
    be2_7_2.reset <= reset
    inst be2_7_3 of BoothEncoder2_31 @[Mult.scala 153:25]
    be2_7_3.clock <= clock
    be2_7_3.reset <= reset
    inst ppg2_7_0 of Ppg2_28 @[Mult.scala 154:27]
    ppg2_7_0.clock <= clock
    ppg2_7_0.reset <= reset
    inst ppg2_7_1 of Ppg2_29 @[Mult.scala 155:27]
    ppg2_7_1.clock <= clock
    ppg2_7_1.reset <= reset
    inst ppg2_7_2 of Ppg2_30 @[Mult.scala 156:27]
    ppg2_7_2.clock <= clock
    ppg2_7_2.reset <= reset
    inst ppg2_7_3 of Ppg2_31 @[Mult.scala 157:27]
    ppg2_7_3.clock <= clock
    ppg2_7_3.reset <= reset
    inst csa7_0 of Csa_20 @[Mult.scala 158:27]
    csa7_0.clock <= clock
    csa7_0.reset <= reset
    inst csa7_1 of Csa_21 @[Mult.scala 159:27]
    csa7_1.clock <= clock
    csa7_1.reset <= reset
    node _be2_0_0_io_data_T = bits(be8_0.io.weight, 1, 0) @[Mult.scala 162:44]
    node _be2_0_0_io_data_T_1 = cat(_be2_0_0_io_data_T, UInt<1>("h0")) @[Cat.scala 31:58]
    be2_0_0.io.data <= _be2_0_0_io_data_T_1 @[Mult.scala 162:22]
    node _be2_0_1_io_data_T = bits(be8_0.io.weight, 3, 1) @[Mult.scala 163:40]
    be2_0_1.io.data <= _be2_0_1_io_data_T @[Mult.scala 163:22]
    node _be2_0_2_io_data_T = bits(be8_0.io.weight, 5, 3) @[Mult.scala 164:40]
    be2_0_2.io.data <= _be2_0_2_io_data_T @[Mult.scala 164:22]
    node _be2_0_3_io_data_T = bits(be8_0.io.weight, 7, 5) @[Mult.scala 165:40]
    be2_0_3.io.data <= _be2_0_3_io_data_T @[Mult.scala 165:22]
    ppg2_0_0.io.weight <= be2_0_0.io.weight @[Mult.scala 167:25]
    ppg2_0_0.io.neg <= be2_0_0.io.neg @[Mult.scala 168:25]
    ppg2_0_0.io.data <= b64 @[Mult.scala 169:25]
    ppg2_0_1.io.weight <= be2_0_1.io.weight @[Mult.scala 171:25]
    ppg2_0_1.io.neg <= be2_0_1.io.neg @[Mult.scala 172:25]
    ppg2_0_1.io.data <= b66 @[Mult.scala 173:25]
    ppg2_0_2.io.weight <= be2_0_2.io.weight @[Mult.scala 175:25]
    ppg2_0_2.io.neg <= be2_0_2.io.neg @[Mult.scala 176:25]
    ppg2_0_2.io.data <= b68 @[Mult.scala 177:25]
    ppg2_0_3.io.weight <= be2_0_3.io.weight @[Mult.scala 179:25]
    ppg2_0_3.io.neg <= be2_0_3.io.neg @[Mult.scala 180:25]
    ppg2_0_3.io.data <= b70 @[Mult.scala 181:25]
    csa0_0.io.a <= ppg2_0_0.io.output @[Mult.scala 183:25]
    csa0_0.io.b <= ppg2_0_1.io.output @[Mult.scala 184:25]
    csa0_0.io.c <= ppg2_0_2.io.output @[Mult.scala 185:25]
    csa0_1.io.a <= csa0_0.io.carry @[Mult.scala 187:25]
    csa0_1.io.b <= csa0_0.io.temp_sum @[Mult.scala 188:25]
    csa0_1.io.c <= ppg2_0_3.io.output @[Mult.scala 189:25]
    node _p0_T = add(csa0_1.io.temp_sum, csa0_1.io.carry) @[Mult.scala 191:33]
    node p0 = tail(_p0_T, 1) @[Mult.scala 191:33]
    node _be2_1_0_io_data_T = bits(be8_1.io.weight, 1, 0) @[Mult.scala 194:43]
    node _be2_1_0_io_data_T_1 = cat(_be2_1_0_io_data_T, UInt<1>("h0")) @[Cat.scala 31:58]
    be2_1_0.io.data <= _be2_1_0_io_data_T_1 @[Mult.scala 194:21]
    node _be2_1_1_io_data_T = bits(be8_1.io.weight, 3, 1) @[Mult.scala 195:40]
    be2_1_1.io.data <= _be2_1_1_io_data_T @[Mult.scala 195:22]
    node _be2_1_2_io_data_T = bits(be8_1.io.weight, 5, 3) @[Mult.scala 196:40]
    be2_1_2.io.data <= _be2_1_2_io_data_T @[Mult.scala 196:22]
    node _be2_1_3_io_data_T = bits(be8_1.io.weight, 7, 5) @[Mult.scala 197:40]
    be2_1_3.io.data <= _be2_1_3_io_data_T @[Mult.scala 197:22]
    ppg2_1_0.io.weight <= be2_1_0.io.weight @[Mult.scala 199:25]
    ppg2_1_0.io.neg <= be2_1_0.io.neg @[Mult.scala 200:25]
    ppg2_1_0.io.data <= b72 @[Mult.scala 201:25]
    ppg2_1_1.io.weight <= be2_1_1.io.weight @[Mult.scala 203:25]
    ppg2_1_1.io.neg <= be2_1_1.io.neg @[Mult.scala 204:25]
    ppg2_1_1.io.data <= b74 @[Mult.scala 205:25]
    ppg2_1_2.io.weight <= be2_1_2.io.weight @[Mult.scala 207:25]
    ppg2_1_2.io.neg <= be2_1_2.io.neg @[Mult.scala 208:25]
    ppg2_1_2.io.data <= b76 @[Mult.scala 209:25]
    ppg2_1_3.io.weight <= be2_1_3.io.weight @[Mult.scala 211:25]
    ppg2_1_3.io.neg <= be2_1_3.io.neg @[Mult.scala 212:25]
    ppg2_1_3.io.data <= b78 @[Mult.scala 213:25]
    csa1_0.io.a <= ppg2_1_0.io.output @[Mult.scala 215:25]
    csa1_0.io.b <= ppg2_1_1.io.output @[Mult.scala 216:25]
    csa1_0.io.c <= ppg2_1_2.io.output @[Mult.scala 217:25]
    csa1_1.io.a <= csa1_0.io.carry @[Mult.scala 219:25]
    csa1_1.io.b <= csa1_0.io.temp_sum @[Mult.scala 220:25]
    csa1_1.io.c <= ppg2_1_3.io.output @[Mult.scala 221:25]
    node _p1_T = add(csa1_1.io.temp_sum, csa1_1.io.carry) @[Mult.scala 223:33]
    node p1 = tail(_p1_T, 1) @[Mult.scala 223:33]
    node _be2_2_0_io_data_T = bits(be8_2.io.weight, 1, 0) @[Mult.scala 226:43]
    node _be2_2_0_io_data_T_1 = cat(_be2_2_0_io_data_T, UInt<1>("h0")) @[Cat.scala 31:58]
    be2_2_0.io.data <= _be2_2_0_io_data_T_1 @[Mult.scala 226:21]
    node _be2_2_1_io_data_T = bits(be8_2.io.weight, 3, 1) @[Mult.scala 227:40]
    be2_2_1.io.data <= _be2_2_1_io_data_T @[Mult.scala 227:22]
    node _be2_2_2_io_data_T = bits(be8_2.io.weight, 5, 3) @[Mult.scala 228:40]
    be2_2_2.io.data <= _be2_2_2_io_data_T @[Mult.scala 228:22]
    node _be2_2_3_io_data_T = bits(be8_2.io.weight, 7, 5) @[Mult.scala 229:40]
    be2_2_3.io.data <= _be2_2_3_io_data_T @[Mult.scala 229:22]
    ppg2_2_0.io.weight <= be2_2_0.io.weight @[Mult.scala 231:25]
    ppg2_2_0.io.neg <= be2_2_0.io.neg @[Mult.scala 232:25]
    ppg2_2_0.io.data <= b80 @[Mult.scala 233:25]
    ppg2_2_1.io.weight <= be2_2_1.io.weight @[Mult.scala 235:25]
    ppg2_2_1.io.neg <= be2_2_1.io.neg @[Mult.scala 236:25]
    ppg2_2_1.io.data <= b82 @[Mult.scala 237:25]
    ppg2_2_2.io.weight <= be2_2_2.io.weight @[Mult.scala 239:25]
    ppg2_2_2.io.neg <= be2_2_2.io.neg @[Mult.scala 240:25]
    ppg2_2_2.io.data <= b84 @[Mult.scala 241:25]
    ppg2_2_3.io.weight <= be2_2_3.io.weight @[Mult.scala 243:25]
    ppg2_2_3.io.neg <= be2_2_3.io.neg @[Mult.scala 244:25]
    ppg2_2_3.io.data <= b86 @[Mult.scala 245:25]
    csa2_0.io.a <= ppg2_2_0.io.output @[Mult.scala 247:25]
    csa2_0.io.b <= ppg2_2_1.io.output @[Mult.scala 248:25]
    csa2_0.io.c <= ppg2_2_2.io.output @[Mult.scala 249:25]
    csa2_1.io.a <= csa2_0.io.carry @[Mult.scala 251:25]
    csa2_1.io.b <= csa2_0.io.temp_sum @[Mult.scala 252:25]
    csa2_1.io.c <= ppg2_2_3.io.output @[Mult.scala 253:25]
    node _p2_T = add(csa2_1.io.temp_sum, csa2_1.io.carry) @[Mult.scala 255:33]
    node p2 = tail(_p2_T, 1) @[Mult.scala 255:33]
    node _be2_3_0_io_data_T = bits(be8_3.io.weight, 1, 0) @[Mult.scala 258:43]
    node _be2_3_0_io_data_T_1 = cat(_be2_3_0_io_data_T, UInt<1>("h0")) @[Cat.scala 31:58]
    be2_3_0.io.data <= _be2_3_0_io_data_T_1 @[Mult.scala 258:21]
    node _be2_3_1_io_data_T = bits(be8_3.io.weight, 3, 1) @[Mult.scala 259:40]
    be2_3_1.io.data <= _be2_3_1_io_data_T @[Mult.scala 259:22]
    node _be2_3_2_io_data_T = bits(be8_3.io.weight, 5, 3) @[Mult.scala 260:40]
    be2_3_2.io.data <= _be2_3_2_io_data_T @[Mult.scala 260:22]
    node _be2_3_3_io_data_T = bits(be8_3.io.weight, 7, 5) @[Mult.scala 261:40]
    be2_3_3.io.data <= _be2_3_3_io_data_T @[Mult.scala 261:22]
    ppg2_3_0.io.weight <= be2_3_0.io.weight @[Mult.scala 263:25]
    ppg2_3_0.io.neg <= be2_3_0.io.neg @[Mult.scala 264:25]
    ppg2_3_0.io.data <= b88 @[Mult.scala 265:25]
    ppg2_3_1.io.weight <= be2_3_1.io.weight @[Mult.scala 267:25]
    ppg2_3_1.io.neg <= be2_3_1.io.neg @[Mult.scala 268:25]
    ppg2_3_1.io.data <= b90 @[Mult.scala 269:25]
    ppg2_3_2.io.weight <= be2_3_2.io.weight @[Mult.scala 271:25]
    ppg2_3_2.io.neg <= be2_3_2.io.neg @[Mult.scala 272:25]
    ppg2_3_2.io.data <= b92 @[Mult.scala 273:25]
    ppg2_3_3.io.weight <= be2_3_3.io.weight @[Mult.scala 275:25]
    ppg2_3_3.io.neg <= be2_3_3.io.neg @[Mult.scala 276:25]
    ppg2_3_3.io.data <= b94 @[Mult.scala 277:25]
    csa3_0.io.a <= ppg2_3_0.io.output @[Mult.scala 279:25]
    csa3_0.io.b <= ppg2_3_1.io.output @[Mult.scala 280:25]
    csa3_0.io.c <= ppg2_3_2.io.output @[Mult.scala 281:25]
    csa3_1.io.a <= csa3_0.io.carry @[Mult.scala 283:25]
    csa3_1.io.b <= csa3_0.io.temp_sum @[Mult.scala 284:25]
    csa3_1.io.c <= ppg2_3_3.io.output @[Mult.scala 285:25]
    node _p3_T = add(csa3_1.io.temp_sum, csa3_1.io.carry) @[Mult.scala 287:33]
    node p3 = tail(_p3_T, 1) @[Mult.scala 287:33]
    node _be2_4_0_io_data_T = bits(be8_4.io.weight, 1, 0) @[Mult.scala 290:43]
    node _be2_4_0_io_data_T_1 = cat(_be2_4_0_io_data_T, UInt<1>("h0")) @[Cat.scala 31:58]
    be2_4_0.io.data <= _be2_4_0_io_data_T_1 @[Mult.scala 290:21]
    node _be2_4_1_io_data_T = bits(be8_4.io.weight, 3, 1) @[Mult.scala 291:40]
    be2_4_1.io.data <= _be2_4_1_io_data_T @[Mult.scala 291:22]
    node _be2_4_2_io_data_T = bits(be8_4.io.weight, 5, 3) @[Mult.scala 292:40]
    be2_4_2.io.data <= _be2_4_2_io_data_T @[Mult.scala 292:22]
    node _be2_4_3_io_data_T = bits(be8_4.io.weight, 7, 5) @[Mult.scala 293:40]
    be2_4_3.io.data <= _be2_4_3_io_data_T @[Mult.scala 293:22]
    ppg2_4_0.io.weight <= be2_4_0.io.weight @[Mult.scala 295:25]
    ppg2_4_0.io.neg <= be2_4_0.io.neg @[Mult.scala 296:25]
    ppg2_4_0.io.data <= b96 @[Mult.scala 297:25]
    ppg2_4_1.io.weight <= be2_4_1.io.weight @[Mult.scala 299:25]
    ppg2_4_1.io.neg <= be2_4_1.io.neg @[Mult.scala 300:25]
    ppg2_4_1.io.data <= b98 @[Mult.scala 301:25]
    ppg2_4_2.io.weight <= be2_4_2.io.weight @[Mult.scala 303:25]
    ppg2_4_2.io.neg <= be2_4_2.io.neg @[Mult.scala 304:25]
    ppg2_4_2.io.data <= b100 @[Mult.scala 305:25]
    ppg2_4_3.io.weight <= be2_4_3.io.weight @[Mult.scala 307:25]
    ppg2_4_3.io.neg <= be2_4_3.io.neg @[Mult.scala 308:25]
    ppg2_4_3.io.data <= b102 @[Mult.scala 309:25]
    csa4_0.io.a <= ppg2_4_0.io.output @[Mult.scala 311:25]
    csa4_0.io.b <= ppg2_4_1.io.output @[Mult.scala 312:25]
    csa4_0.io.c <= ppg2_4_2.io.output @[Mult.scala 313:25]
    csa4_1.io.a <= csa4_0.io.carry @[Mult.scala 315:25]
    csa4_1.io.b <= csa4_0.io.temp_sum @[Mult.scala 316:25]
    csa4_1.io.c <= ppg2_4_3.io.output @[Mult.scala 317:25]
    node _p4_T = add(csa4_1.io.temp_sum, csa4_1.io.carry) @[Mult.scala 319:33]
    node p4 = tail(_p4_T, 1) @[Mult.scala 319:33]
    node _be2_5_0_io_data_T = bits(be8_5.io.weight, 1, 0) @[Mult.scala 322:44]
    node _be2_5_0_io_data_T_1 = cat(_be2_5_0_io_data_T, UInt<1>("h0")) @[Cat.scala 31:58]
    be2_5_0.io.data <= _be2_5_0_io_data_T_1 @[Mult.scala 322:22]
    node _be2_5_1_io_data_T = bits(be8_5.io.weight, 3, 1) @[Mult.scala 323:40]
    be2_5_1.io.data <= _be2_5_1_io_data_T @[Mult.scala 323:22]
    node _be2_5_2_io_data_T = bits(be8_5.io.weight, 5, 3) @[Mult.scala 324:40]
    be2_5_2.io.data <= _be2_5_2_io_data_T @[Mult.scala 324:22]
    node _be2_5_3_io_data_T = bits(be8_5.io.weight, 7, 5) @[Mult.scala 325:40]
    be2_5_3.io.data <= _be2_5_3_io_data_T @[Mult.scala 325:22]
    ppg2_5_0.io.weight <= be2_5_0.io.weight @[Mult.scala 327:25]
    ppg2_5_0.io.neg <= be2_5_0.io.neg @[Mult.scala 328:25]
    ppg2_5_0.io.data <= b104 @[Mult.scala 329:25]
    ppg2_5_1.io.weight <= be2_5_1.io.weight @[Mult.scala 331:25]
    ppg2_5_1.io.neg <= be2_5_1.io.neg @[Mult.scala 332:25]
    ppg2_5_1.io.data <= b106 @[Mult.scala 333:25]
    ppg2_5_2.io.weight <= be2_5_2.io.weight @[Mult.scala 335:25]
    ppg2_5_2.io.neg <= be2_5_2.io.neg @[Mult.scala 336:25]
    ppg2_5_2.io.data <= b108 @[Mult.scala 337:25]
    ppg2_5_3.io.weight <= be2_5_3.io.weight @[Mult.scala 339:25]
    ppg2_5_3.io.neg <= be2_5_3.io.neg @[Mult.scala 340:25]
    ppg2_5_3.io.data <= b110 @[Mult.scala 341:25]
    csa5_0.io.a <= ppg2_5_0.io.output @[Mult.scala 343:25]
    csa5_0.io.b <= ppg2_5_1.io.output @[Mult.scala 344:25]
    csa5_0.io.c <= ppg2_5_2.io.output @[Mult.scala 345:25]
    csa5_1.io.a <= csa5_0.io.carry @[Mult.scala 347:25]
    csa5_1.io.b <= csa5_0.io.temp_sum @[Mult.scala 348:25]
    csa5_1.io.c <= ppg2_5_3.io.output @[Mult.scala 349:25]
    node _p5_T = add(csa5_1.io.temp_sum, csa5_1.io.carry) @[Mult.scala 351:33]
    node p5 = tail(_p5_T, 1) @[Mult.scala 351:33]
    node _be2_6_0_io_data_T = bits(be8_6.io.weight, 1, 0) @[Mult.scala 354:43]
    node _be2_6_0_io_data_T_1 = cat(_be2_6_0_io_data_T, UInt<1>("h0")) @[Cat.scala 31:58]
    be2_6_0.io.data <= _be2_6_0_io_data_T_1 @[Mult.scala 354:21]
    node _be2_6_1_io_data_T = bits(be8_6.io.weight, 3, 1) @[Mult.scala 355:40]
    be2_6_1.io.data <= _be2_6_1_io_data_T @[Mult.scala 355:22]
    node _be2_6_2_io_data_T = bits(be8_6.io.weight, 5, 3) @[Mult.scala 356:40]
    be2_6_2.io.data <= _be2_6_2_io_data_T @[Mult.scala 356:22]
    node _be2_6_3_io_data_T = bits(be8_6.io.weight, 7, 5) @[Mult.scala 357:40]
    be2_6_3.io.data <= _be2_6_3_io_data_T @[Mult.scala 357:22]
    ppg2_6_0.io.weight <= be2_6_0.io.weight @[Mult.scala 359:25]
    ppg2_6_0.io.neg <= be2_6_0.io.neg @[Mult.scala 360:25]
    ppg2_6_0.io.data <= b112 @[Mult.scala 361:25]
    ppg2_6_1.io.weight <= be2_6_1.io.weight @[Mult.scala 363:25]
    ppg2_6_1.io.neg <= be2_6_1.io.neg @[Mult.scala 364:25]
    ppg2_6_1.io.data <= b114 @[Mult.scala 365:25]
    ppg2_6_2.io.weight <= be2_6_2.io.weight @[Mult.scala 367:25]
    ppg2_6_2.io.neg <= be2_6_2.io.neg @[Mult.scala 368:25]
    ppg2_6_2.io.data <= b116 @[Mult.scala 369:25]
    ppg2_6_3.io.weight <= be2_6_3.io.weight @[Mult.scala 371:25]
    ppg2_6_3.io.neg <= be2_6_3.io.neg @[Mult.scala 372:25]
    ppg2_6_3.io.data <= b118 @[Mult.scala 373:25]
    csa6_0.io.a <= ppg2_6_0.io.output @[Mult.scala 375:25]
    csa6_0.io.b <= ppg2_6_1.io.output @[Mult.scala 376:25]
    csa6_0.io.c <= ppg2_6_2.io.output @[Mult.scala 377:25]
    csa6_1.io.a <= csa6_0.io.carry @[Mult.scala 379:25]
    csa6_1.io.b <= csa6_0.io.temp_sum @[Mult.scala 380:25]
    csa6_1.io.c <= ppg2_6_3.io.output @[Mult.scala 381:25]
    node _p6_T = add(csa6_1.io.temp_sum, csa6_1.io.carry) @[Mult.scala 383:33]
    node p6 = tail(_p6_T, 1) @[Mult.scala 383:33]
    node _be2_7_0_io_data_T = bits(be8_7.io.weight, 1, 0) @[Mult.scala 386:43]
    node _be2_7_0_io_data_T_1 = cat(_be2_7_0_io_data_T, UInt<1>("h0")) @[Cat.scala 31:58]
    be2_7_0.io.data <= _be2_7_0_io_data_T_1 @[Mult.scala 386:21]
    node _be2_7_1_io_data_T = bits(be8_7.io.weight, 3, 1) @[Mult.scala 387:40]
    be2_7_1.io.data <= _be2_7_1_io_data_T @[Mult.scala 387:22]
    node _be2_7_2_io_data_T = bits(be8_7.io.weight, 5, 3) @[Mult.scala 388:40]
    be2_7_2.io.data <= _be2_7_2_io_data_T @[Mult.scala 388:22]
    node _be2_7_3_io_data_T = bits(be8_7.io.weight, 7, 5) @[Mult.scala 389:40]
    be2_7_3.io.data <= _be2_7_3_io_data_T @[Mult.scala 389:22]
    ppg2_7_0.io.weight <= be2_7_0.io.weight @[Mult.scala 391:25]
    ppg2_7_0.io.neg <= be2_7_0.io.neg @[Mult.scala 392:25]
    ppg2_7_0.io.data <= b120 @[Mult.scala 393:25]
    ppg2_7_1.io.weight <= be2_7_1.io.weight @[Mult.scala 395:25]
    ppg2_7_1.io.neg <= be2_7_1.io.neg @[Mult.scala 396:25]
    ppg2_7_1.io.data <= b122 @[Mult.scala 397:25]
    ppg2_7_2.io.weight <= be2_7_2.io.weight @[Mult.scala 399:25]
    ppg2_7_2.io.neg <= be2_7_2.io.neg @[Mult.scala 400:25]
    ppg2_7_2.io.data <= b124 @[Mult.scala 401:25]
    ppg2_7_3.io.weight <= be2_7_3.io.weight @[Mult.scala 403:25]
    ppg2_7_3.io.neg <= be2_7_3.io.neg @[Mult.scala 404:25]
    ppg2_7_3.io.data <= b126 @[Mult.scala 405:25]
    csa7_0.io.a <= ppg2_7_0.io.output @[Mult.scala 407:25]
    csa7_0.io.b <= ppg2_7_1.io.output @[Mult.scala 408:25]
    csa7_0.io.c <= ppg2_7_2.io.output @[Mult.scala 409:25]
    csa7_1.io.a <= csa7_0.io.carry @[Mult.scala 411:25]
    csa7_1.io.b <= csa7_0.io.temp_sum @[Mult.scala 412:25]
    csa7_1.io.c <= ppg2_7_3.io.output @[Mult.scala 413:25]
    node _p7_T = add(csa7_1.io.temp_sum, csa7_1.io.carry) @[Mult.scala 415:33]
    node p7 = tail(_p7_T, 1) @[Mult.scala 415:33]
    node _be8_0_io_data_T = bits(io.a, 7, 0) @[Mult.scala 420:33]
    node _be8_0_io_data_T_1 = cat(_be8_0_io_data_T, UInt<1>("h0")) @[Cat.scala 31:58]
    be8_0.io.data <= _be8_0_io_data_T_1 @[Mult.scala 420:21]
    node _be8_1_io_data_T = bits(io.a, 15, 7) @[Mult.scala 421:29]
    be8_1.io.data <= _be8_1_io_data_T @[Mult.scala 421:21]
    node _be8_2_io_data_T = bits(io.a, 23, 15) @[Mult.scala 422:29]
    be8_2.io.data <= _be8_2_io_data_T @[Mult.scala 422:21]
    node _be8_3_io_data_T = bits(io.a, 31, 23) @[Mult.scala 423:29]
    be8_3.io.data <= _be8_3_io_data_T @[Mult.scala 423:21]
    node _be8_4_io_data_T = bits(io.a, 39, 31) @[Mult.scala 424:29]
    be8_4.io.data <= _be8_4_io_data_T @[Mult.scala 424:21]
    node _be8_5_io_data_T = bits(io.a, 47, 39) @[Mult.scala 425:29]
    be8_5.io.data <= _be8_5_io_data_T @[Mult.scala 425:21]
    node _be8_6_io_data_T = bits(io.a, 55, 47) @[Mult.scala 426:29]
    be8_6.io.data <= _be8_6_io_data_T @[Mult.scala 426:21]
    node _be8_7_io_data_T = bits(io.a, 63, 55) @[Mult.scala 427:29]
    be8_7.io.data <= _be8_7_io_data_T @[Mult.scala 427:21]
    csa0.io.a <= p0 @[Mult.scala 431:17]
    csa0.io.b <= p1 @[Mult.scala 432:17]
    csa0.io.c <= p2 @[Mult.scala 433:17]
    csa1.io.a <= p5 @[Mult.scala 435:17]
    csa1.io.b <= p4 @[Mult.scala 436:17]
    csa1.io.c <= p3 @[Mult.scala 437:17]
    csa2.io.a <= p6 @[Mult.scala 439:17]
    csa2.io.b <= csa1.io.carry @[Mult.scala 440:17]
    csa2.io.c <= csa1.io.temp_sum @[Mult.scala 441:17]
    csa3.io.a <= csa2.io.carry @[Mult.scala 443:17]
    csa3.io.b <= csa0.io.temp_sum @[Mult.scala 444:17]
    csa3.io.c <= csa0.io.carry @[Mult.scala 445:17]
    csa4.io.a <= csa2.io.temp_sum @[Mult.scala 447:17]
    csa4.io.b <= csa3.io.temp_sum @[Mult.scala 448:17]
    csa4.io.c <= csa3.io.carry @[Mult.scala 449:17]
    csa5.io.a <= p7 @[Mult.scala 451:17]
    csa5.io.b <= csa4.io.temp_sum @[Mult.scala 452:17]
    csa5.io.c <= csa4.io.carry @[Mult.scala 453:17]
    node _io_result_T = add(csa5.io.temp_sum, csa5.io.carry) @[Mult.scala 456:37]
    node _io_result_T_1 = tail(_io_result_T, 1) @[Mult.scala 456:37]
    io.result <= _io_result_T_1 @[Mult.scala 456:17]

