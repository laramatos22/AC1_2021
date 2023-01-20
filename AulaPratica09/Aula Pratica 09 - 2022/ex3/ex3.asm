# Mapa de registos:
# $t0: i
# $t1: a
	
	.data
	
	.eqv SIZE, 10
	.eqv read_int, 5
	.eqv print_double, 3
	
a:	.space 80		# SIZE * 8 -> array de doubles
	
	.text
	.globl main
	
main:
	addiu $sp, $sp, -4
	sw $ra, 0($sp)
	
	li $t0, 0		# int i = 0;
	
for:
	bge $t0, SIZE, endfor	# for(i = 0; i < SIZE; ...) 
	
	la $t1, a
	sll $t2, $t0, 3		# i * 8
	add $t3, $t1, $t2	# $t3 = a + (i * 8) = &(a[i])
	
	li $v0, read_int
	syscall			# read_int()
	mtc1 $v0, $f2		# mandar para o coprocessador
	cvt.d.w $f2, $f2	# (int)$f2 = (double)$f2
	s.d $f2, 0($t3)		# a[i] = (double)read_int();
	
	addi $t0, $t0, 1	# i++
	j for
	
endfor:
	la $a0, a
	li $a1, SIZE
	jal average		# average(a, SIZE) 
	mov.d $f12, $f0
	li $v0, print_double
	syscall			# print_double( average(a, SIZE) );
	
	lw $ra, 0($sp)
	addiu $sp, $sp, 4
	li $v0, 0		# return 0;
	jr $ra
