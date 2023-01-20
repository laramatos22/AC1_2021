# typedef struct 
# { 
#  char a1[14]; 
#  int i; 
#  char a2[17]; 
#  double g; 
# } xyz; 

	.eqv print_float, 2

	.eqv offset_a1, 0
	.eqv offset_i, 16
	.eqv offset_a2, 20
	.eqv offset_g, 40
	
	.data
	.align 2
s1:	
	.asciiz "Str_1"
	.space 8
	.word 2021
	.asciiz "Str_2"
	.space 11
	.double  2.718281828459045

	.text
	.globl func1
	
func1:

	la $t0, s1		# $t0 = s1
	
	l.s $v0, offset_g($t0)
	li $v0, print_float
	syscall			# print_float(2.718281828459045);
	
	jr $ra
	
