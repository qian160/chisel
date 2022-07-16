compile:
	riscv64-linux-gnu-as test.s -o test.o
	riscv64-linux-gnu-objdump -d test.o  > asm.txt
	./as
	./as > ../Inst_Rom.data
clean:
	rm asm.txt
	rm test.o

