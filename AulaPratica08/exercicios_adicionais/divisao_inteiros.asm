#A função seguinte implementa o algoritmo de divisão de inteiros apresentado nas aulas
#teóricas (versão otimizada), para operandos de 16 bits.
#
#unsigned int div(unsigned int dividendo, unsigned int divisor)
#{
#	int i, bit, quociente, resto;
#
#	divisor = divisor << 16;
#	dividendo = (dividendo & 0xFFFF) << 1;
#
#	for(i=0; i < 16; i++)
#	{
#		bit = 0;
#		if(dividendo >= divisor)
#		{
#			dividendo = dividendo - divisor;
#			bit = 1;
#		}
#		dividendo = (dividendo << 1) | bit;
#	}
#	resto = (dividendo >> 1) & 0xFFFF0000;
#	quociente = dividendo & 0xFFFF;
#
#	return (resto | quociente);
#}

	.globl divisao_inteiros
	
divisao_inteiros:	
	sll $t1,$a1,16			# divisor = divisor << 16
	andi $t0,$a0, 0xFFFF		# dividendo = dividendo & 0xFFFF
	sll $t0,$t0, 1			# dividendo << 1
	li $t2, 0			# i = 0
	
div_for:	
	bge $t2, 16, d_endf		# for (i < 16)
	li $t3, 0			# bit = 0
	
div_if:	
	blt $t0,$t1, d_endi		# if(dividendo >= divisor)
	sub $t0,$t0,$t1			# dividendo = dividendo - divisor
	li $t3, 1			# bit = 1
	
div_endi:	
	sll $t0,$t0, 1			# dividendo << 1
	or $t0, $t0, $t3		# dividendo | bit 
	j d_for

div_endf:	
	addi $t2,$t2,1			# i++
	srl $t4, $t0, 1			# resto = dividendo >> 1
	andi $t4, $t4, 0xFFFF0000	# resto and resto
	andi $t5, $t1, 0xFFFF		# quociente = dividendo & 0xFFFF
	or $v0, $t5,$t4			# return (resto | quociente)
	jr $ra

