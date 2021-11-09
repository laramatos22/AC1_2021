# Mapa de Registos:
# $t0: res
# $t1: i
# $t2: mdor
# $t3: mdo
# $t4: variavel temporaria temp

	.data
str1:	.asciiz "Introduza dois numeros: "
str2:	.asciiz "Resultado: "
	.eqv print_string,4
	.eqv read_int,5
	.eqv print_int10,1
	.text
	.globl main

main: 
	or $t0, $0, $0			# unsigned int res = 0	
	or $t1, $0, $0			# unsigned int i = 0
	
	la $a0, str1
	li $v0, print_string
	syscall				# print_string ("Introduza dois numeros: ");
	
	ori $v0, $0, read_int
	syscall				# read_int() do 1º valor
	andi $t2, $v0, 0x0F		# mdor = read_int() & 0x0F;
	
	ori $v0, $0, read_int	
	syscall				# read_int() do 2º valor
	andi $t3, $v0, 0x0F		# mdo = read_int() & 0x0F;
	
while:
	beqz $t2, endWhile		# while ((mdor != 0) && ...
	bge $t1, 4, endWhile		# ... (i++ < 4))
	andi $t1, $t1, 1		# i++
	
if: 	
	andi $t4, $t2, 0x00000001	#	temp = mdor & 0x00000001
	beqz $t4, endIf			#	if ( (mdor & 0x00000001) != 0)
	add $t0, $t0, $t3		#		res = res + mdo;
	
endIf:
	sll $t3, $t3, 1			#	mdo = mdo << 1;
	srl $t2, $t2, 1			# 	mdor = mdor >> 1;
	j while
	
endWhile:
	la $a0, str2
	li $v0, print_string
	syscall				# print_string("Resultado: ");
	
	move $a0, $t0
	li $v0, print_int10
	syscall				# print_int10(res);
	
	jr $ra
