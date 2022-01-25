#typedef struct
#{
#	char a1[10];
#	double g;
#	int a2[2];
#	char v;
#	float k;
#} uvw;
#
#float f2(void)
#{
#	static uvw s2 = {"St1", 3.141592653589, 291, 756, 'X', 1.983};
#	return (s2.g * s2.a2[1] / k);
#}

	.eqv offset_a1,0
	.eqv offset_g,16
	.eqv offset_a2,24
	.eqv offset_v,32
	.eqv offset_k,36
	
	.eqv print_double,3
	
	.data
	
s2:
	.asciiz "St1"
	.space 6	# 10 - 4
	.align 3
	.double 3.141592653589
	.word 291,756
	.byte 'X'
	.float 1.983
	
	
	.text
	.globl main

main:
	la $t0,s2
	
	l.d $f12,offset_g($t0)	# s2.g
	lw $t2,28($t0)		# s2.a2[1]
	mtc1 $t2,$f6
	cvt.d.w $f4,$f6
	l.s $f8,offset_k($t0)	# k
	cvt.d.s $f8,$f8
	
	mul.d $f12,$f12,$f4	# s2.g * s2.a2[1]
	div.d $f12,$f12,$f8	# s2.g * s2.a2[1] / k
	
	li $v0,print_double
	syscall	
	
	
	jr $ra
	
