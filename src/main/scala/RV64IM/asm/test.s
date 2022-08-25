#mtime: 0x320,		mtimecmp: 0x321
#mvendorid: 0xf11, 	marchid: 0xf12
#PC_INIT = 0X400
.section .text
.global _start
.org 0x0
trap_M:
	csrr x1,mcause
	csrr x2,mstatus
	csrr x3,mepc
	li x1,0x11
	mret
	nop
	nop
	nop
	nop
.org 0x100
trap_S:
	csrr x1,scause
	csrr x2,sstatus
	csrr x3,sepc
	li x1,0x22
	beqz x0,trap_S
	nop
	sret
.org 0x200
trap_U:
	csrr x1,ucause
	csrr x2,ustatus
	csrr x3,uepc
	li x1,0x33
	beqz x0,trap_U
	nop
	uret
	
.org 0x400
_start:
	nop			#important
#insert an illegal instruction
	csrrc x1,0x114,x1
#	beqz x0, good
#	beqz x0, bad
	li x1,1
	li x2,2
	li x3,3
	li x4,4

.org 0x500
bad:
	li x1,0
	li x2,0
	li x3,0
	li x4,0
	beqz x0,bad
	nop

.org 0x600
good:
	li x1, 0x88
	beqz x0, good
	nop

.org 0x700
loop:
	beqz x0,loop
	nop
