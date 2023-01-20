# typedef struct
# {
#  char a1[10];
#  double g;
#  int a2[2];
#  char v;
#  float k;
# } uvw; 

	.eqv print_float, 2
	
	.eqv offset_a1, 0
	.eqv offset_g, 16
	.eqv offset_a2, 24
	.eqv offset_v, 32
	.eqv offset_k, 36
	
	.data
	.align 2
s2:
	.asciiz "St1"
	.space 6
	.double 3.141592653589
	.word 291, 756
	.byte  'X'
	.float 1.983
	
	.text
	.globl func2
	
func2:
	la $t0, s2		# $t0 = s2
	
	l.d $f12, offset_g($t0)	# (double)s2.g
	
	lw $t2, 28($t0)		# s2.a2[1] -> para ter acesso ao 2º elemento do array a2
	mtc1 $f2, $f6		# manda para o coprocessador para ser convertido (para adquirir um registo $fx)
	cvt.d.w $f6, $f6	# (int)a2[1] => (double)a2[1]
	
	l.s $f8, offset_k($t0)	# (float)k -> k já tem um registo $fx, por isso nao precisa de ir para o coprocessador para ser convertido
	cvt.d.s $f8, $f8	# (float)k => (double)k
	
	mul.d $f12, $f12, $f4	# s2.g * (double)s2.a2[1]
	div.d $f12, $f12, $f8	# s2.g * (double)s2.a2[1] / (double)k
	cvt.s.d $f12, $f12	# (double)$f12 => (float)$f12
	
	li $v0, print_float
	syscall			# print_float
	
	jr $ra
	