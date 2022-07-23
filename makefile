VerilogPath=./generated		//holds the verilog code
VerilatorFlag=--build --cc --exe --trace 
VSrc=$(VerilogPath)/$(dut).v
CPPSrc=$(VerilogPath)/tb.cpp

package=Adder
dut=TesterSimple

runMain:
	sbt "test:runMain $(package).$(dut)"

verilator:
	verilator $(VSrc) $(CPPSrc) $(VerilatorFlag)

wave:
	gtkwave wave.vcd

test:
	sbt "testOnly $(package).$(dut)"

dependencies:
	sbt evicted

clean:
	ls | grep .v | xargs rm
