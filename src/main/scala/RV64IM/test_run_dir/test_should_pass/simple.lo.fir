circuit simple :
  module simple :
    input clock : Clock
    input reset : UInt<1>
    input io_i : UInt<1>
    input io_d : UInt<4>
    output io_o : UInt<4>

    mem mem : @[Tester.scala 34:18]
      data-type => UInt<4>
      depth => 10
      read-latency => 0
      write-latency => 1
      reader => io_o_MPORT
      writer => MPORT
      writer => MPORT_1
      writer => MPORT_2
      writer => MPORT_3
      writer => MPORT_4
      writer => MPORT_5
      writer => MPORT_6
      writer => MPORT_7
      writer => MPORT_8
      writer => MPORT_9
      read-under-write => undefined
    node _GEN_0 = validif(io_i, UInt<1>("h0")) @[Tester.scala 35:15 37:16]
    node _GEN_1 = validif(io_i, clock) @[Tester.scala 35:15 37:16]
    node _GEN_2 = mux(io_i, UInt<1>("h1"), UInt<1>("h0")) @[Tester.scala 35:15 37:16 34:18]
    node _GEN_3 = validif(io_i, UInt<1>("h1")) @[Tester.scala 35:15 37:21]
    node _GEN_4 = validif(io_i, io_d) @[Tester.scala 35:15 37:21]
    node _GEN_5 = validif(io_i, UInt<2>("h2")) @[Tester.scala 35:15 37:16]
    node _GEN_6 = validif(io_i, UInt<2>("h3")) @[Tester.scala 35:15 37:16]
    node _GEN_7 = validif(io_i, UInt<3>("h4")) @[Tester.scala 35:15 37:16]
    node _GEN_8 = validif(io_i, UInt<3>("h5")) @[Tester.scala 35:15 37:16]
    node _GEN_9 = validif(io_i, UInt<3>("h6")) @[Tester.scala 35:15 37:16]
    node _GEN_10 = validif(io_i, UInt<3>("h7")) @[Tester.scala 35:15 37:16]
    node _GEN_11 = validif(io_i, UInt<4>("h8")) @[Tester.scala 35:15 37:16]
    node _GEN_12 = validif(io_i, UInt<4>("h9")) @[Tester.scala 35:15 37:16]
    io_o <= mem.io_o_MPORT.data @[Tester.scala 40:10]
    mem.io_o_MPORT.addr <= UInt<4>("h0") @[Tester.scala 40:16]
    mem.io_o_MPORT.en <= UInt<1>("h1") @[Tester.scala 40:16]
    mem.io_o_MPORT.clk <= clock @[Tester.scala 40:16]
    mem.MPORT.addr <= pad(_GEN_0, 4)
    mem.MPORT.en <= _GEN_2
    mem.MPORT.clk <= _GEN_1
    mem.MPORT.data <= _GEN_4
    mem.MPORT.mask <= _GEN_3
    mem.MPORT_1.addr <= pad(_GEN_3, 4)
    mem.MPORT_1.en <= _GEN_2
    mem.MPORT_1.clk <= _GEN_1
    mem.MPORT_1.data <= _GEN_4
    mem.MPORT_1.mask <= _GEN_3
    mem.MPORT_2.addr <= pad(_GEN_5, 4)
    mem.MPORT_2.en <= _GEN_2
    mem.MPORT_2.clk <= _GEN_1
    mem.MPORT_2.data <= _GEN_4
    mem.MPORT_2.mask <= _GEN_3
    mem.MPORT_3.addr <= pad(_GEN_6, 4)
    mem.MPORT_3.en <= _GEN_2
    mem.MPORT_3.clk <= _GEN_1
    mem.MPORT_3.data <= _GEN_4
    mem.MPORT_3.mask <= _GEN_3
    mem.MPORT_4.addr <= pad(_GEN_7, 4)
    mem.MPORT_4.en <= _GEN_2
    mem.MPORT_4.clk <= _GEN_1
    mem.MPORT_4.data <= _GEN_4
    mem.MPORT_4.mask <= _GEN_3
    mem.MPORT_5.addr <= pad(_GEN_8, 4)
    mem.MPORT_5.en <= _GEN_2
    mem.MPORT_5.clk <= _GEN_1
    mem.MPORT_5.data <= _GEN_4
    mem.MPORT_5.mask <= _GEN_3
    mem.MPORT_6.addr <= pad(_GEN_9, 4)
    mem.MPORT_6.en <= _GEN_2
    mem.MPORT_6.clk <= _GEN_1
    mem.MPORT_6.data <= _GEN_4
    mem.MPORT_6.mask <= _GEN_3
    mem.MPORT_7.addr <= pad(_GEN_10, 4)
    mem.MPORT_7.en <= _GEN_2
    mem.MPORT_7.clk <= _GEN_1
    mem.MPORT_7.data <= _GEN_4
    mem.MPORT_7.mask <= _GEN_3
    mem.MPORT_8.addr <= _GEN_11
    mem.MPORT_8.en <= _GEN_2
    mem.MPORT_8.clk <= _GEN_1
    mem.MPORT_8.data <= _GEN_4
    mem.MPORT_8.mask <= _GEN_3
    mem.MPORT_9.addr <= _GEN_12
    mem.MPORT_9.en <= _GEN_2
    mem.MPORT_9.clk <= _GEN_1
    mem.MPORT_9.data <= _GEN_4
    mem.MPORT_9.mask <= _GEN_3
