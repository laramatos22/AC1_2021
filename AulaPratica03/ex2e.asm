# Mapa de registos:
# $t0 – value
# $t1 – bit
# $t2 - i
# $t3 - flag
	.data
str1: 	.asciiz "Introduza um numero: "
str2: 	.asciiz "O valor em bina'rio e': "
	.eqv print_string,4
	.eqv read_int,5
	.eqv print_char,11
	.text
	.globl main
main: 
	la $a0,str1
	li $v0,print_string 		# (instrução virtual)
	syscall 			# print_string("Introduza um numero: ");
	
	li $v0,read_int			# value=read_int();
	syscall
	or $t0,$0,$v0			# guarda o valor em $t0
	
	la $a0,str2 			# print_string("O valor em bina'rio e': ");
	li $v0,print_string
	syscall
	
	li $t2,0 			# i = 0
	li $t3,0			# flag = 0
	
for: 
	bge $t2,32,endfor 		# while(i < 32) {
	srl $t1,$t0,31			# bit = value >> 31;

if0:
	seq $t4,$t3,1			# flag == 1
	sne $t5,$t1,0			# bit != 0
	or $t6,$t4,$t5			# flag == 1 || bit != 0
	bne $t6,1,endif			# se nao for 1
	ori $t3,$t3,1			# flag = 1;
		
if_espaco:
	rem $t7,$t2,4			# rem Rdst, Rsrc, Src
	bne $t7,$0,end_espco
	li $a0,' '
	li $v0,print_char
	syscall
	
end_espco:			
	addi $t1,$t1,0x30		# 0x30 + bit
	move $a0,$t1
	li $v0,print_char		# print_char(0x30 + bit);
	syscall
	
endif:
	sll $t0,$t0,1			# value = value << 1;
	addi $t2,$t2,1			# i++;
	j for 	
					# }
endfor: 				#
	jr $ra 				# fim do programa
	
	