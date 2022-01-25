# A função max() calcula o valor máximo de um array de "n" elementos em formato vírgula
# flutuante, precisão dupla.
#
#double max(double *p, unsigned int n)
#{
#	double max;
#	double *u = p+n–1;
#	max = *p++;
#	for(; p <= u; p++)
#	{
#		if(*p > max)
#			max = *p;
#	}
#	return max;
#}

	.data
	.text
	.globl max
	
# Mapa de registos:
# $t0: &(p)
# $t1: n


max:				# double max(double *p, unsigned int n)
	move $t0,$a0		# &(p)
	move $t1,$a1		# n
	addi $t1,$t1,-1		# n = n-1
	
	sll $t1,$t1,3		# 
	addu $t2,$t0,$t1	# double *u = p+n–1;
	l.d $f0,0($t0)		# max = *p
	addiu $t0,$t0,8		# p++
	
maxFor:
	bgt $t0,$t2,maxEndFor	# p <= u
	l.s $f2,0($t0)		# $f2 = *p
	
maxIf:
	c.le.d $f2,$f0		# *p <= max
	bc1t maxEndif		# if(*p > max)
	mov.d $f0,$f2		# 	max = *p;
	
maxEndif:
	addiu $t0,$t0,8		# p++
	
	j maxFor
	
maxEndFor:
	jr $ra			# termina a sub rotina


