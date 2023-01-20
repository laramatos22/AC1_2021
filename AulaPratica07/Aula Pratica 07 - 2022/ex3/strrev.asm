# Mapa de registos:
# str: $a0 -> $s0 (argumento � passado em $a0)
# p1: $s1 (registo callee-saved)
# p2: $s2 (registo callee-saved)

	.globl strrev
	
strrev:	
	addiu $sp, $sp, -16	# reserva espa�o na stack
	sw $ra, 0($sp)		# guarda endere�o de retorno
	sw $s0, 4($sp)		# guarda valor dos registos
	sw $s1, 8($sp)		# $s0, $s1, $s2
	sw $s2, 12($sp)
	
	move $s0, $a0		# registo "callee-saved"7
	move $s1, $a0		# p1 = str
	move $s2, $a0		# p2 = str
	
while1:
	lb $t2, 0($s2)		# *p2
	beqz $t2, endw1		# while(*p2 != '\0') 
	
	addiu $s2, $s2, 1	# p2++;
	
	j while1
	
endw1:
	addiu $s2, $s2, -1	# p2--;

while2:
	bge $s1, $s2, endw2	# while( p1 < p2 ) 
	
	move $a0, $s1
	move $a1, $s2
	jal exchange		# exchange(p1, p2);
	
	addiu $s1, $s1, 1	# p1++;	
	addiu $s2, $s2, -1	# p2--;
	
	j while2

endw2:
	move $v0, $s0		# return str;
	
	lw $ra, 0($sp)		# rep�e endere�o de retorno
	lw $s0, 4($sp)		# rep�e valor dos registos
	lw $s1, 8($sp)		# $s0, $s1, $s2
	lw $s2, 12($sp)
	addiu $sp, $sp, 16	# rep�e espa�o na stack
	
	jr $ra			# termina a sub-rotina
	
	