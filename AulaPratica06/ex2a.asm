# Mapa de registos: 
# p : $t1
# pultimo: $t2

	.data
	.eqv print_str,4
	.eqv print_char,11
	.eqv SIZE,3			# define SIZE 3
str1:	.asciiz "Array"
str2:	.asciiz "de"
str3:	.asciiz "ponteiros"
array:	.word str1,str2,str3
	.text
	.globl main
	
main:					# void main(void) {
	la $t1,array 			# 	$t1 = p = &array[0] = array
	li $t0,SIZE 			#
	sll $t0,$t0,2 			#	SIZE * 4
	addu $t2,$t1,$t0		# 	$t2 = pultimo = array + SIZE
for: 
	bge $t1,$t2,endfor		#	while( p < pultimo ) {
	
	lw $a0,0($t1)			# 	*p 
	li $v0,print_str
	syscall				#	print_str(*p);
	
	li $a0,'\n'
	li $v0,print_char
	syscall				# 	print_char('\n');
	
	addi $t1,$t1,4			#	p++
	
	j for				#	}
	
endfor:
	jr $ra				# }