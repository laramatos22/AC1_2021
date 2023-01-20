	.text
	.globl absoluto
	
absoluto:

if:
	bge $a0, 0, endif
	sub $a0, $0, $a0
	
endif:
	move $v0, $a0
	jr $ra
	
	