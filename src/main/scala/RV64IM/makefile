include $(NVBOARD_HOME)/scripts/nvboard.mk
LDFLAGS += -lSDL2 -lSDL2_image
ARCHIVE=/home/s081/Downloads/ysyx-workbench/nvboard/build/nvboard.a

BIND=$(shell pwd)/bind.nxdc
AUTO_BIND_SRC=bind.cpp
CSRC=test.cpp
VSRC=top.v

args= 	--target-dir ./Verilog --tr-write-vcd --no-dce --no-check-comb-loops
	

VERILATOR = verilator  $(VSRC) $(CSRC) $(AUTO_BIND_SRC) $(ARCHIVE) \
                --trace  --exe --cc --build \
		$(addprefix -LDFLAGS , $(LDFLAGS)) 

test:
	sbt "testOnly RV64.TesterSpec"
	@echo success

run:
	sbt "runMain RV64.TesterGen --target-dir Verilog"
	@echo success

all:
	python3 $(NVBOARD_HOME)/scripts/auto_pin_bind.py $(BIND) $(AUTO_BIND_SRC)
	$(VERILATOR)
