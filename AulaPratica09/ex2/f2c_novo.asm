# A função seguinte converte um valor de temperatura em graus Fahrenheit para graus
# Celsius.
#
#double f2c(double ft)
#{
#	return (5.0 / 9.0 * (ft – 32.0));
#}
		
	.data
cinco:	.double 5.0
nove:	.double 9.0
trintad:.double 32.0
	.text
	.globl f2c_novo
	
f2c_novo:
	la $t0,cinco
	l.d $f2,0($t0)		# $f2 = 5.0
	
	la $t0,nove
	l.d $f4,0($t0)		# $f4 =9.0
	
	la $t0,trintad
	l.d $f6,0($t0)		# $f6 = 32.0
	
	div.d $f2,$f2,$f4	# 5.0 / 9.0
	sub.d $f12,$f12,$f6	# ft - 32.0
	mul.d $f0,$f2,$f12	# (5.0 / 9.0 * (ft – 32.0))
				# return (5.0 / 9.0 * (ft – 32.0));
				
	jr $ra


