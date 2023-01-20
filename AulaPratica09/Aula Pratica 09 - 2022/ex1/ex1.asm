# Mapa de registos:	
# res: $f12
# val: $t0 -> $f0 (depois vai passar a float)
	
	.data
	.eqv read_int, 5
	.eqv print_float, 2
	
k1:	.float 2.59375
k2:	.float 0.0

	.text
	.globl main
	
main:

do:
	li $v0, read_int
	syscall			# read_int()
	move $t0, $v0		# val = read_int()
	
	l.s $f2, k1		# $f2 = 2.59375
	
	mtc1 $t0, $f0		# $f0 = val
	cvt.s.w $f0, $f0	# $f0 = (float)val
	
	mul.s $f2, $f2, $f0	# $f2 = (float)val * 2.59375
	mov.s $f12 $f2
	li $v0, print_float
	syscall			# print_float( res )

while:
	l.s $f4, k2		# $f4 = 0.0
	c.eq.s $f12, $f4	# while(res != 0.0)
	bc1t do
	
end:
	li $v0, 0		# return 0;
	jr $ra
	
	
	
	