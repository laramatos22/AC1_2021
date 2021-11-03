# Mapa de registos:
# $t0: gray
# $t1: bin
# $t2: mask
	
	.data
str1:	.ascii "Introduza um numero: "
str2:	.ascii "\nValor em codigo Gray: "
str3:	.ascii "\nValor em binario: "
	.eqv print_string,4
	.eqv read_int,5
	.eqv print_int16,34
	.text
	.globl main
	
main:
	la $a0,str1			# print_string("Introduza um numero: ");
	li $v0,print_string
	syscall
	
	li $v0,read_int
	syscall
	or $t0,$0,$v0			# gray = read_int();
	
	srl $t2,$t0,1			# mask = gray >> 1;
	or $t1,$0,$t0			# bin = gray;
	
	j while 
	
while:
	beq $t2,$0,endWhile		# while(mask != 0) {
	
	xor $t1,$t1,$t2			# 	bin = bin ^ mask;
	srl $t2,$t2,1			# 	mask = mask >> 1;
	j while
					# }
endWhile:
	la $a0,str2			# print_string("\nValor em c�digo Gray: ");
	li $v0,print_string
	syscall
	
	move $a0,$t0			# print_int16(gray)
	li $v0,print_int16
	syscall
	
	la $a0,str3			# print_string("\nValor em binario: ");
	li $v0,print_string
	syscall
	
	move $a0,$t1			# print_int16(bin)
	li $v0,print_int16
	syscall
	
	jr $ra
