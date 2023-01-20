# Mapa de registos:
# array: $a0
# n: $a1
# i: $t0
# sum: $f0
	
	.data
	
k1:	.double 0.0

	.text
	.globl average
	
average:
	move $t0, $a1		# int i = n;
	l.d $f0, k1		# double sum = 0.0;
	
for:
	ble $t0, $0, endfor	# for(; i > 0; ...)
	
	addi $t1, $t0, -1	# i-1
	sll $t1, $t1, 3		# (i-1) * 8
	add $t2, $t0, $t1	# array + (i-1) = &(array[i-1])
	l.d $f2, 0($t2)		# $f2 = (double)array[i-1]
	add.d $f0, $f0, $f2	# sum += array[i-1];
	addi $t1, $t1, -1	# i--;
	j for
	
endfor:	
	mtc1 $a1, $f4		# mandar para o coprocessador
	cvt.d.w $f4, $f4	# conversao : (int)$f4 = (double)$f4
	div.d $f0, $f0, $f4	# return sum / (double)n; 
	
	jr $ra


