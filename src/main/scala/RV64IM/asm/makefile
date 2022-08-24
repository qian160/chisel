INST_ROM = ../Inst_Rom.data
ASM  = test
#ASM  = t
ARCH = rv64im
generate:  
	@riscv64-linux-gnu-as $(ASM).s -o $(ASM).o -march=$(ARCH) 
	@riscv64-linux-gnu-objdump -d $(ASM).o  > asm.txt #-M no-aliases
	@echo 
print:generate
	@./as
	@rm $(ASM).o

update:generate
	@./as > $(INST_ROM)
	@rm $(ASM).o
	@echo success!

vim:generate
	@./as
	@rm $(ASM).o
	@vim asm.txt
clean:
	rm asm.txt
