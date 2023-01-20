# Mapa de registos:
# $f12:	val
# $t0:	i
# $f4:	xn
# $f2:	aux

	.data
zero:	.double 0.0
um:	.double 1.0
cinco:	.double 0.5

	.text
	.globl sqrt
	
sqrt:
	la $t0, um
	l.d $f4, 0($t0)		# double xn = 1.0;
	
	la $t0, cinco
	l.d $f6, 0($t0)		# $f6 = 0.5;
	
	la $t0, zero
	l.d $f8, 0($t0)		# $f8  = 0.0;
	
	li $t0, 0		# int i = 0;
	
if:
	c.le.d $f12, $f8	# if(val > 0.0) 
	bc1t else
	
do:
	mov.d $f2, $f4		# aux = xn;
	
	div.d $f4, $f12, $f2	# xn = val/xn
	add.d $f4, $f4, $f2	# xn = (xn + val/xn)
	mul.d $f4, $f6, $f4	# xn = 0.5 * (xn + val/xn);
	
while:
	c.eq.d $f2, $f4		# while((aux != xn) ...
	bc1t endif
and_sqrt:
	addi $t0, $t0, 1	# ++i
	blt $t0, 25, do		# ... && (++i < 25));
	j endif
	
else:
	mov.d $f4, $f8		# xn = 0.0;
	
endif:
	mov.d $f0, $f4		# return xn;
	jr $ra
	
	
	
	


