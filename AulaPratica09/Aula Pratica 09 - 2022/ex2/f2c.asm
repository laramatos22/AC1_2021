# Mapa de registos
# c: $f0
# f: $f12

	.data
	
k1:	.double 5.0
k2: 	.double 9.0
k3:	.double 32.0

	.text
	.globl f2c
	
f2c:
	l.d $f2, k1
	l.d $f4, k2
	l.d $f6, k3
	
	div.d $f2,$f2,$f4	# 5.0 / 9.0
	sub.d $f12,$f12,$f6	# ft - 32.0
	mul.d $f0,$f2,$f12	# (5.0 / 9.0 * (ft – 32.0))
				# return (5.0 / 9.0 * (ft – 32.0));
	
	#sub.d $f8, $f12, $f6	# (ft – 32.0)
	#mul.d $f8, $f8, $f4	# 9.0 * (ft – 32.0)
	#div.d $f0, $f2, $f8	# return (5.0 / 9.0 * (ft – 32.0));
	
	jr $ra			# termina o programa
	
	
	
	