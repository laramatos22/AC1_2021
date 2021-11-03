# Mapa de registos:
# $t0 � value
# $t1 � bit
# $t2 - i
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
	li $v0,print_string 		# (instru��o virtual)
	syscall 			# print_string("Introduza um numero: ");
	
	li $v0,read_int			# value=read_int();
	syscall
	or $t0,$0,$v0			# guarda o valor em $t0
	
	la $a0,str2 			# print_string("O valor em bina'rio e': ");
	li $v0,print_string
	syscall
	
	li $t2,0 			# i = 0
	
for: 
	bge $t2,32,endfor 		# while(i < 32) {
	rem $t3,$t2,4			# rem Rdst, Rsrc, Src
		
if_espaco:
	bne $t3,$0,end_espco
	li $a0,' '
	li $v0,print_char
	syscall
	
end_espco:		
	andi $t1,$t0,0x80000000 	# (instru��o virtual)
	beq $t1,$0,else 		# if(bit != 0)
	
	li $a0,'1'			# print_char('1');
	li $v0,print_char
	syscall
	
	j endif
	
else: 					# else
	li $a0,'0' 			# print_char('0');
	li $v0,print_char
	syscall
	
endif:
	sll $t0,$t0,1			# value = value << 1;
	addi $t2,$t2,1			# i++;
	j for 	
				# }
endfor: 				#
	jr $ra 				# fim do programa
	
	