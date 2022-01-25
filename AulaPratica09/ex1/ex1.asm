#int main(void)
#{
#	float res;
#	int val;
#	do
#	{
#		val = read_int();
#		res = (float)val * 2.59375;
#		print_float( res );
#	} while(res != 0.0);
#	return 0;
#	}
#
# Mapa de registos:
# $f2: res
# $t0 -> $f0: val

	.data
	.eqv read_int,5
	.eqv print_float,2
	.eqv print_string,4
k1:	.float 2.59375
k2:	.float 0.0
space:	.asciiz "\n"
	.text
	.globl main
	
main:
	
do:
	li $v0,read_int
	syscall
	move $t0,$v0		# $t0 = val
	l.s $f2,k1		# load single precision
	mtc1 $t0,$f0		# $f0 = val
	
	cvt.s.w $f0,$f0		# cvt.s.w FPdst,FPsrc #Convert Integer to Float
	mul.s $f2,$f2,$f0   	# $f2 = val * 2.59375
	
	mov.s $f12,$f2
	li $v0,print_float
	syscall			# print_float( res );
	
	la $a0,space
	li $v0,print_string
	syscall
	
	l.s $f2,k2
	c.eq.s $f0,$f2
	bc1t fim		# bc1f label # branch if true
	j do
	
fim:
	jr $ra
	
