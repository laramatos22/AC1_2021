#define SIZE 10
#int main(void)
#{
#	static double a[SIZE];
#	int i;
#	for(i = 0; i < SIZE; i++)
#	{
#		a[i] = (double)read_int();
#	}
#	print_double( average(a, SIZE) );
#	return 0;
#}

	.data
	.eqv SIZE,10
a:	.space 80		# 10 * 8 (double -> 8 bytes)
	.eqv read_int,5
	.eqv print_double,3
	.text
	.globl main
	
main:
	addiu $sp,$sp,-4
	sw $ra,0($sp)
	la $t1,a		# $t1 = &a
	li $t0,0		# i = 0;
	
for:
	bge $t0,SIZE,endfor	# for(i = 0; i < SIZE; i++)
	
	sll $t2,$t0,3		#	aux = i*8;
	addu $t3,$t1,$t2	#	$t3 = &(a[i]);
	
	li $v0,read_int
	syscall
	mtc1 $v0,$f2
	cvt.d.w $f2,$f2
	s.d $f2,0($t3)		#	a[i] = (double)read_int();
	
	addi $t0,$t0,1		#	i++;
	
	j for			# }
	
endfor:
	la $a0,a		# $a0 = a
	li $a1,SIZE		# $a1 = SIZE
	jal average		# average(a, SIZE);
	li $v0,print_double
	syscall			# print_double( average(a, SIZE) );
	
	lw $ra,0($sp)
	addiu $sp,$sp,20
	
	li $v0,0		# return 0
	
	jr $ra			# termina o programa


