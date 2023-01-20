# Mapa de registos:
# $a0 -> $t0:	p
# $a1 -> $t1:	n
# $t2:	u
# $f2:	*p (double)
# $f0:	max


	.data
	.text
	.globl max
	
max:
	move $t0, $a0
	move $t1, $a1
	
	addi $t1, $t1, -1	# n-1
	sll $t1, $t1, 3		# (n-1) * 8
	addu $t2, $t0, $t1	# *u = p+n–1; 
	
	l.d $f0, 0($t0)		# max = *p
	addiu $t0, $t0, 8	# p++
	
for:
	bgt $t0, $t2, endfor	# for(; p <= u; ...)
	
	l.d $f2, 0($t0)		# *p
if:	
	c.le.d $f2, $f0		# if(*p > max)
	bc1t endif
	
	mov.d $f0, $f2		# max = *p; 
	
endif:
	addiu $t0, $t0, 1	# p++
	j for
	
endfor:
	jr $ra	
	