	.data
um:	.float 1.0
	.text
	.globl xtoy
	
xtoy:
	addiu $sp, $sp, -8
	sw $ra, 0($sp)
	sw $s0, 4($sp)
		
	li $t0, 0		# int i = 0;
	l.s $f0, um		# float result = 1.0;
	
	move $s0, $a0		# salvaguarda do valor do y
	jal absoluto		# abs(y)
	move $t1, $v0		# $t1 = abs(y)
	
for:
	bge $t0, $t1, endfor	# for(...; i < abs(y); ...)
	
if:
	ble $s0, $0, else	# if(y > 0) 
	
	mul.s $f0, $f0, $f12	# result *= x; 
	j end
	
else:
	div.s $f0, $f0, $f12	# result /= x;
	
end:
	addi $t0, $t0, 1	# i++
	j for
	
endfor:
	lw $ra, 0($sp)
	lw $s0, 4($sp)
	addiu $sp, $sp, 8
	
	jr $ra

