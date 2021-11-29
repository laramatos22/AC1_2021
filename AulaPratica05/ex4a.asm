# Mapa de registos
# $t0: *p
# $t1: *(p+1)
# $t2: aux
# $t3: i
# $t4: houve_troca
# $t5: p
# $t6: pUltimo

	.data
str1: 	.asciiz "\nIntroduzir um numero: "
str2:	.asciiz "Conteudo do array: "
str3:	.asciiz "; "
	.align 2
lista:	.space 40
	.eqv FALSE,0
	.eqv TRUE,1
	.eqv SIZE,10
	.eqv read_int,5
	.eqv print_string,4
	.eqv print_int10,1
	.text
	.globl main
	
main: 	
	li $t3,0			# int i=0
					#
while:					#
	bge $t3,SIZE,endw		# while (i < SIZE) {
					#
	la $a0,str1			#
	li $v0,print_string		#
	syscall				#	print_string("\nIntroduzir um numero: ")
					#
	li $v0,read_int			#	
	syscall				#	$v0 = read_int()
					#
	sll $t2,$t3,2			#	int aux = i*4
	la $t0,lista			#	int *p = &(lista[0])
	addu $t0,$t0,$t2		#	*p = *p + aux
	sw $v0,0($t0)			# 	lista[i] = read_int()
					#
	addi $t3,$t3,1			# 	i++;
	j while				# }
	
endw:
	la $t5,lista
	li $t6,SIZE
	subu $t6,$t6,1
	sll $t6,$t6,2
	addu $t6,$t6,$t5
	
do:
	la $t5,lista
	li $t4,FALSE
	
while2:
	bge $t5,$t6,endw2
	
	lw $t0,0($t5)
	lw $t1,4($t5)
	
if:
	ble $t0,$t1,endif
	
	sw $t1,0($t5)
	sw $t1,4($t5)
	
	li $t3,TRUE
	
endif:
	addiu $t5,$t5,4
	j while2
	
endw2:
	beq $t4,TRUE,do
	
enddo:
	li $t3,0
	
while3:	
	bge $t3,SIZE,endw3
	
	la $t0,lista
	sll $t2,$t3,2
	addu $t2,$t0,$t2
	
	lw $a0,0($t2)
	li $v0,print_int10
	syscall
	
	la $a0,str3
	li $v0,print_string
	syscall
	
	addi $t3,$t3,1
	
	j while3
	
endw3:
	jr $ra
	
	
	
	
	
	
	
	
	
	
	
	