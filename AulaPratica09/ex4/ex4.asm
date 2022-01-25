	.data
	.eqv print_string,4
	.eqv print_double,3
	.eqv read_double,7
	.eqv SIZE,10
	
array:	.space 80
str1:	.asciiz "Introduzir um número: "
str2:	.asciiz "\nValor máximo: "

	.text 
	.globl main
	
# Mapa de registos:
# $t0: i
# $t1: &array
# $t2: &(array[n])
# $t3: n = i*8

main:
	addiu $sp,$sp,-4
	sw $ra,0($sp)
	
	li $t0,0		# i = 0
	la $t1,array		# $t1 = array
	
for:
	bge $t0,SIZE,endfor	# while(i < SIZE)
	la $a0,str1
	li $v0,print_string
	syscall			# print_string("Introduzir um número: ")
	
	li $v0,read_double
	syscall			# read_double()
	
	sll $t3,$t0,3		# n = i*8
	addu $t2,$t1,$t3	# $t2 = &(array[n])
	s.d $f0,0($t2)		# array[n] = read_double()
	addi $t0,$t0,1		# i++
	
	j for
	
endfor:
	move $a0,$t1
	li $a1,SIZE
	jal max			# max(array,SIZE)
	
	la $a0,str2
	li $v0,print_string
	syscall			# print_string("\nValor máximo: ")
	
	mov.d $f12,$f0		# move (double) de $f0 para $f12 (registo que guarda um resultado)
	li $v0,print_double
	syscall			# print_double(resultado)
	
	lw $ra,0($sp)
	addiu $sp,$sp,4
	
	li $v0,0		# return 0
	
	jr $ra
	
	