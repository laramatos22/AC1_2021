# Mapa de registos:
# i : $t0
# j: $t1
# array[i][j]: $t3

	.data
	.eqv print_str,4
	.eqv print_char,11
	.eqv print_int10,1
	.eqv SIZE,3		# define SIZE 3
str1:	.asciiz "Array"
str2:	.asciiz "de"
str3:	.asciiz "ponteiros"
array:	.word str1,str2,str3
str:	.asciiz "\nString #"
str0:	.asciiz ": "
	.align 2
	.text
	.globl main

main:				# void main (void) {
	li $t0,0		#	i=0

for:
	bge $t0,SIZE,endfor	# 	while( i < SIZE ) {
	
	la $a0,str
	li $v0,print_str
	syscall			#		print_str( "\nString #" );
	
	move $a0,$t0
	li $v0,print_int10
	syscall			# 		print_int10( i );
	
	la $a0,str0
	li $v0,print_str
	syscall			#		print_str( ": " );
	
	li $t1,0		#		j = 0;
	
while:
	la $t3,array 		# 		$t3 = &array[0]
	sll $t2,$t0,2 		#		$t2 = i*4
	addu $t3,$t3,$t2 	# 		$t3 = &array[i]
	lw $t3,0($t3) 		# 		$t3 = array[i] = &array[i][0]
	addu $t3,$t3,$t1 	# 		$t3 = &array[i][j]
	lb $t3,0($t3) 		# 		$t3 = array[i][j]

	beq $t3,'\0',endw	#		while(array[i][j] != '\0') {
	
	move $a0,$t3
	li $v0,print_char
	syscall			#			print_char(array[i][j]);
	
	li $a0,'-'
	li $v0,print_char
	syscall			#			print_char('-');
	
	addi $t1,$t1,1		#			j++
	
	j while			#		}
	
endw:
	addi $t0,$t0,1		#		i++
	
	j for			#	}
	
endfor:
	jr $ra			# }
