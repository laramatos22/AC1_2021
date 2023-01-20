	.data
	.eqv read_double, 7
	.eqv print_double, 3
	.eqv print_string, 4
	
str1:	.asciiz "Introduzir um Valor em Fahrenheit: "
str2:	.asciiz "\nTemperatura em Celsius: "

	.text
	.globl main
	
main:
	addiu $sp, $sp, -4
	sw $ra, 0($sp)
	
	la $a0, str1
	li $v0, print_string
	syscall			# print_string("Introduzir um Valor em Fahrenheit: ");
	
	li $v0, read_double
	syscall			# f = read_double()
	
	la $a0, str2
	li $v0, print_string
	syscall			# print_string("\nTemperatura em Celsius: ");
	
	mov.d $f12, $f0
	jal f2c			# f2c(f)
	mov.d $f12, $f0
	li $v0, print_double
	syscall			# print_double(f2c(f));
	
	lw $ra, 0($sp)
	addiu $sp, $sp, 4
	
	li $v0, 0		# return 0;
	jr $ra