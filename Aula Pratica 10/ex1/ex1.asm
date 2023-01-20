	.data
	
	.eqv print_string, 4
	.eqv read_float, 6
	.eqv read_int, 5
	.eqv print_float, 2
	
str1:	.asciiz "Introduza a base (float): "
str2: 	.asciiz "\nIntroduza o exponente (int): "
str3:	.asciiz "\nResultado: "

	.text
	.globl main
	
main:
	addiu $sp, $sp, -4
	sw $ra, 0($sp)
	
	la $a0, str1
	li $v0, print_string
	syscall			# print_string("Introduza a base (float): ");
	
	li $v0, read_float
	syscall
	mov.s $f12, $f0		# x = read_float();
	
	la $a0, str2
	li $v0, print_string
	syscall 		# print_string("\nIntroduza o exponente (int): ");
	
	li $v0, read_int
	syscall
	move $t2, $v0		# y = read_int();
	
	la $a0, str3
	li $v0, print_string
	syscall 		# print_string("\nResultado: ");
	
	move $a0, $t2
	jal xtoy		# xtoy(x, y)
	
	mov.s $f12, $f0
	li $v0, print_float
	syscall			# print_float(xtoy(x, y));
	
	lw $ra, 0($sp)
	addiu $sp, $sp, 4
	
	li $v0, 0		# return 0;
	
	jr $ra
	
