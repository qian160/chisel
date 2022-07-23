.section .text
_start:

	li x1,0x11
	li x2,0x22
	bge x2,x1,t1
	beqz x0,t2
	li x2,0
	li x3,0
t1:
	li x1,0
	nop
	nop
	nop
loop:	
	beqz x0,loop

t2:
	li x2,0
loop2:	beqz x0,loops
