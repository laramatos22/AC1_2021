# A função strcpy() (string copy) copia uma string residente numa zona de memória para
# outra zona de memória. A função aceita como argumentos um ponteiro para a string de
# origem (src) e um ponteiro para a zona de memória destino (dst). A função devolve ainda
# o ponteiro dst com o mesmo valor que foi passado como argumento.

# char *strcpy(char *dst, char *src)
# {
#	int i=0;
#	do
#	{
#		dst[i] = src[i];
#	} while(src[i++] != '\0');
#	return dst;
# }
#
# Mapa de registos:
# $a0 -> $s0: dst
# $a1 -> $s1: src
# $t0: i

	.globl strcpy
	
strcpy:
	addiu $sp,$sp,-8	# reservar espaço na stack
	sw $s0,0($sp)		# guardar valor no registo $s0
	sw $s1,4($sp)		# guardar valor no registo $s1

	li $t0,0		# i = 0;
	move $s0,$a0		# $s0 = dst
	move $s1,$a1		# $s1 = src
	
do:
	addu $t1,$s0,$t0	# $t1 = dst + i
	addu $t2,$s1,$t0	# $t2 = src + i
	
	# --- dst[i] = src[i]; ---
	lb $t3,0($t2)		# $t3 = src[i]
	sb $t3,0($t1)		# $t3 = dts[i]

	addi $t0,$t0,1		# i++;
	
	bne $t3,'\0',do		# while(src[i++] != '\0');
	
	move $v0,$s0		# return dst;
	
	lw $s0,0($sp)
	lw $s1,4($sp)
	
	addiu $sp,$sp,8		# liberta o espaço da stack
	
	jr $ra
	

