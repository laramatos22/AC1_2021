# A fun��o strcat() (string concatenate) permite concatenar duas strings � a string origem
# � concatenada no fim (isto �, na posi��o do terminador) da string destino. Tal como na
# fun��o strcpy(), os argumentos de entrada s�o os ponteiros para a string origem (src) e
# para a string destino (dst). A fun��o devolve ainda o ponteiro dst com o mesmo valor que
# foi passado como argumento. Compete ao programa chamador reservar espa�o em mem�ria
# com dimens�o suficiente para armazenar a string resultante.
#
# char *strcat(char *dst, char *src)
# {
#	char *p = dst;
#	while(*p != '\0')
#		p++;
#	strcpy(p, src);
#	return dst;
# }

	.globl strcat

strcat:
	addiu $sp,$sp,-16
	sw $ra,0($sp)
	sw $s0,4($sp)
	sw $s1,8($sp)
	sw $s2,12($sp)
	
	move $s0,$a0


