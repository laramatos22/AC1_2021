# funcao median

# Mapa de registos:
# $t0 - &array
# $t1 - nval
# $t2 - houveTroca
# $t3 - i
# $t4 - nval-1
# $t5 - &(array[i])

	.data
	.eqv TRUE, 1
	.eqv FALSE, 0
	.text
	.globl median

median:
	move $t0, $a0		# $t0 = &(array[0])
	move $t1, $a1		# $t1 = nval
	
do:				# do {
	li $t2, FALSE		# 	houveTroca = FALSE;
	
	li $t3, 0		# 	int i = 0;
	
	addi $t3, $t1, -1	# 	$t4 = nval - 1
	sll $t4, $t4, 3		#	$t4 = (nval - 1)*8
	
for:
	bge $t3, $t4, endfor	# 	for(... ; i < nval-1; ... ) 
	
if:
	addu $t5, $t0, $t3	#	$t5 = &(array[i])
	l.d $f2, 0($t5)		#	$f2 = array[i]
	l.d $f4, 8($t5)		# 	$f4 = array[i+1]
	
	c.le.d $f2, $f4		# 		if( array[i] > array[i+1] ) 
	bc1t endif
	
	mov.d $f6, $f2		#			aux = array[i];
	s.d $f4, 0($t5)		#			array[i] = array[i+1]; 
	s.d $f6, 8($t5)		# 			array[i+1] = aux; 
	li $t2, TRUE		# 			houveTroca = TRUE;
	
endif:
	addi $t3, $t3, 8	#	i++
	j for
	
endfor:

while:
	beq $t2, TRUE, do	# while( houveTroca == TRUE ); 
	
	rem $t6, $t1, 2		# nval % 2
	
end:
	sll $t1, $t1, 3		# nval = nval * 8
	srl $t1, $t1, 1		# nval / 2
	addu $t5, $0, $t1	# $t5 = &(array[nval/2])
	l.d $f0, 0($t5)		# return array[nval/2]
	
	jr $ra			# termina o programa
	
	