#A fun��o seguinte converte para um inteiro de 32 bits a quantidade representada por uma
#string num�rica em que cada carater representa o c�digo ASCII de um d�gito decimal
#(i.e., 0 - 9). A convers�o termina quando � encontrado um carater n�o num�rico.
#
#unsigned int atoi(char *s)
#{
#	unsigned int digit, res = 0;
#	while( (*s >= '0') && (*s <= '9') )
#	{
#		digit = *s++ - '0';
#		res = 10 * res + digit;
#	}
#	return res;
#}

	.data
	.globl atoi
	
atoi:
	li $v0,0		# res = 0
	
while:
	lb $t0,0($a0)		# *s = s[0]
	
	blt $t0,'0',endwhile	# while( *s >= '0' && ...
	bgt $t0,'9',endwhile	# ... && *s <= '9')
	
	addi $t1,$t0,-0x30	# 	digit = *s++ - '0';
	addiu $a0,$a0,1		#	s++
	mul $v0,$v0,10		#	res = 10 * res
	add $v0,$v0,$t1		# 	res = res + digit
	
	j while
	
endwhile:
	jr $ra

