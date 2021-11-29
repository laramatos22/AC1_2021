# char *p[]={"AC1", "LABS"}; 	// Array de ponteiros para caracter
# OU
# char *p[2]={"AC1", "LABS"}; 	// Array de ponteiros para caracter

# Mapa de registos:					
# $t0: i
# $t1: SIZE
# $t2: array
# $t3: array temporario temp

	.eqv SIZE,3
	.data
array:	.word str1,str2,str3
str1: 	.asciiz "Array"
str2: 	.asciiz "de"
str3: 	.asciiz "ponteiros"
	.eqv print_str,4
	.eqv print_char,11
	.text
	.globl main
	
main:					# void main(void) {
	li $t0,0			# 	$t0=i=0
	li $t1,SIZE			#	$t1 = SIZE
	la $t2,array			#	$t2 = &(array[0])
	
for: 	
	bge $t0,SIZE,endfor		#	while(i < SIZE) {
	
	sll $t3,$t0,2 			#		$t3 = temp = i*4
	addu $t2,$t2,$t3 		# 		$t3 = temp = &array[i]
	
	lw $a0,0($t3) 			# 		$a0 = array[i]
	li $v0,print_str
	syscall				#		print_str(array[i]);
	
	li $a0,'\n'
	li $v0,print_char	
	syscall				#		print_char('\n');
	
	addi $t0,$t0,1			#		i++;
	
	j for

endfor:
	jr $ra
	
