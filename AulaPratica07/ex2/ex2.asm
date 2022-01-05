#int main(void)
#{
#	static char str[]="ITED - orievA ed edadisrevinU";
#	print_string( strrev(str) );
#	return 0;
#}	
	
	.data
	.eqv print_string, 4
str:	.asciiz "ITED - orievA ed edadisrevinU"
	.text
	.globl main

main:
	addiu $sp, $sp, -16		# reserva espaço
	
	sw $ra, 0($sp)
	sw $s0, 4($sp)
	sw $s1, 8($sp)
	sw $s2, 12($sp)
	
	la $a0, str			# $a0 = str
	jal strrev 			# strrev(str)
	
	move $a0, $v0
	li $v0, print_string
	syscall				# print_string(strrev(str));
	
	lw $ra, 0($sp)
	lw $s0, 4($sp)
	lw $s1, 8($sp)
	lw $s2, 12($sp)
	
	addiu $sp, $sp, 16		# liberta o espaço reservado
	
	jr $ra				# termina o programa
	