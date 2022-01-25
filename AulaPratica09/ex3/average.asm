# A função average() calcula o valor médio de um array de reais codificados em formato
# vírgula flutuante, precisão dupla.
#
#double average(double *array, int n)
#{
#	int i = n;
#	double sum = 0.0;
#	for(; i > 0; i--)
#	{
#		sum += array[i-1];
#	}
#	return sum / (double)n;
#}

	.data
zero:	.double 0.0
	.text
	.globl average

average:
	la $t0,zero		# $t0 = 0.0
	l.d $f0,0($t0)		# precisão dupla
	move $t0,$a0		# $t0 = array
	move $t1,$a1		# $t1 = n
	
avgFor:
	ble $t1,$0,avgEnd
	
	addi $t3,$t1,-1		# [i-1]
	sll $t3,$t3,3		# [i-1]*8
	addu $t2,$t0,$t3	# $t2 = &(array[i-1])
	l.d $f2,0($t2)		# $f2 = (double)array[i-1]
	add.d $f0,$f0,$f2	# sum += array[i-1]
	addi $t1,$t1,-1		# i--
	j avgFor
	
avgEnd:
	mtc1 $a1,$f4		# mandar para o coprocessador
	cvt.d.w $f4,$f4		# conversao de word para double
	div.d $f12,$f0,$f4	# return sum / (double)n;
	
	jr $ra			# fim da subrotina

