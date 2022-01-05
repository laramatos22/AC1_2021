#A função print_array() imprime os valores de um array "a" de
#"n" elementos inteiros.
#
#void print_array(int *a, int n)
#{
#	int *p = a + n;
#	for(; a < p; a++)
#	{
#		print_int10( *a );
#		print_string(", ");
#	}
#}
	
	.data 
	.text
	.globl print_array
str:	.asciiz ", "
	.eqv print_int10,1
	.eqv print_string,4
	
print_array:
	move $t0,$a0
	move $t1,$a1
	
	sll $t1,$t1,2		# n*4
	
	addu $t2,$t0,$t1	# int *p = a + n;
	
for:
	bge $t0,$t2,endfor	# for(; a < p; a++)
	
	lw $a0,0($t0)
	li $v0,print_int10
	syscall			# print_int10( *a );
	
	la $a0,str
	li $v0,print_string
	syscall			# print_string(", ");
	
	addiu $t0,$t0,4		# a++
	
endfor:
	jr $ra
	
	



