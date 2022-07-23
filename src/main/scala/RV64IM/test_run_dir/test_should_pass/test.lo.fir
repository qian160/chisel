circuit test :
  module test :
    input clock : Clock
    input reset : UInt<1>
    input io_addr : UInt<4>
    output io_data : UInt<4>

    mem m : @[Tester.scala 32:24]
      data-type => UInt<4>
      depth => 100
      read-latency => 1
      write-latency => 1
      reader => io_data_MPORT
      writer => MPORT
      writer => MPORT_1
      writer => MPORT_2
      writer => MPORT_3
      writer => MPORT_4
      writer => MPORT_5
      writer => MPORT_6
      writer => MPORT_7
      read-under-write => undefined
    io_data <= m.io_data_MPORT.data @[Tester.scala 35:13]
    m.io_data_MPORT.addr <= pad(io_addr, 7) @[Tester.scala 35:17]
    m.io_data_MPORT.en <= UInt<1>("h1") @[Tester.scala 35:17]
    m.io_data_MPORT.clk <= clock @[Tester.scala 35:17]
    m.MPORT.addr <= UInt<7>("h0") @[Tester.scala 33:6]
    m.MPORT.en <= UInt<1>("h1") @[Tester.scala 33:6]
    m.MPORT.clk <= clock @[Tester.scala 33:6]
    m.MPORT.data <= UInt<4>("h1") @[Tester.scala 33:10]
    m.MPORT.mask <= UInt<1>("h1") @[Tester.scala 33:10]
    m.MPORT_1.addr <= UInt<7>("h1") @[Tester.scala 33:19]
    m.MPORT_1.en <= UInt<1>("h1") @[Tester.scala 33:19]
    m.MPORT_1.clk <= clock @[Tester.scala 33:19]
    m.MPORT_1.data <= UInt<4>("h2") @[Tester.scala 33:23]
    m.MPORT_1.mask <= UInt<1>("h1") @[Tester.scala 33:23]
    m.MPORT_2.addr <= UInt<7>("h2") @[Tester.scala 33:32]
    m.MPORT_2.en <= UInt<1>("h1") @[Tester.scala 33:32]
    m.MPORT_2.clk <= clock @[Tester.scala 33:32]
    m.MPORT_2.data <= UInt<4>("h3") @[Tester.scala 33:36]
    m.MPORT_2.mask <= UInt<1>("h1") @[Tester.scala 33:36]
    m.MPORT_3.addr <= UInt<7>("h3") @[Tester.scala 33:45]
    m.MPORT_3.en <= UInt<1>("h1") @[Tester.scala 33:45]
    m.MPORT_3.clk <= clock @[Tester.scala 33:45]
    m.MPORT_3.data <= UInt<4>("h4") @[Tester.scala 33:49]
    m.MPORT_3.mask <= UInt<1>("h1") @[Tester.scala 33:49]
    m.MPORT_4.addr <= UInt<7>("h4") @[Tester.scala 34:6]
    m.MPORT_4.en <= UInt<1>("h1") @[Tester.scala 34:6]
    m.MPORT_4.clk <= clock @[Tester.scala 34:6]
    m.MPORT_4.data <= UInt<4>("h5") @[Tester.scala 34:10]
    m.MPORT_4.mask <= UInt<1>("h1") @[Tester.scala 34:10]
    m.MPORT_5.addr <= UInt<7>("h5") @[Tester.scala 34:19]
    m.MPORT_5.en <= UInt<1>("h1") @[Tester.scala 34:19]
    m.MPORT_5.clk <= clock @[Tester.scala 34:19]
    m.MPORT_5.data <= UInt<4>("h6") @[Tester.scala 34:23]
    m.MPORT_5.mask <= UInt<1>("h1") @[Tester.scala 34:23]
    m.MPORT_6.addr <= UInt<7>("h6") @[Tester.scala 34:32]
    m.MPORT_6.en <= UInt<1>("h1") @[Tester.scala 34:32]
    m.MPORT_6.clk <= clock @[Tester.scala 34:32]
    m.MPORT_6.data <= UInt<4>("h7") @[Tester.scala 34:36]
    m.MPORT_6.mask <= UInt<1>("h1") @[Tester.scala 34:36]
    m.MPORT_7.addr <= UInt<7>("h7") @[Tester.scala 34:45]
    m.MPORT_7.en <= UInt<1>("h1") @[Tester.scala 34:45]
    m.MPORT_7.clk <= clock @[Tester.scala 34:45]
    m.MPORT_7.data <= UInt<4>("h8") @[Tester.scala 34:49]
    m.MPORT_7.mask <= UInt<1>("h1") @[Tester.scala 34:49]
