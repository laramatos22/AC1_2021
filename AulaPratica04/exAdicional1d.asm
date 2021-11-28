# Conversao de letras maiusculas em minusculas

# Mapa de registos:
# $t0: p
# $t1: *p

	.data
str:	.space 21			# static char str[SIZE+1];
str1:	.asciiz "Introduza uma string: "
	.eqv SIZE,20
	.eqv print_string,4
	.eqv read_string,8
	.text
	.globl main
	
main:
	la $a0,str1
	li $v0,print_string
	syscall				# print_string("Introduza uma string: ");
	
	la $a0,str
	li $a0,SIZE
	li $v0,read_string
	syscall				# read_string(str, SIZE);
	
	la $t0,str			# p = str;
	
while:
	lb $t1,0($t0)			
	beq $t1,0,endw			#  while (*p != '\0') {
	
	blt $t1, 0x41, else		# 
 	bgt $t1, 0x5a, else		# vericar se letra é minuscula
 	
 	addi $t1, $t1, 0x20		# *p = *p - ('a' - 'A') => 0x20
 	sb $t1,0($t0)			# guarda na str
 	
else: 	addiu $t0,$t0,1			# p++;
 	j while				# }
 	
endw: 	la $a0, str 	
	li $v0, print_string
	syscall				# print_string(str);
	
 	jr $ra 				# termina o programa 

