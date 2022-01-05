# int strlen(char *s);
# int main(void)
# {
#	static char str[]="Arquitetura de Computadores I";
#	print_int10(strlen(str));
#	return 0;
# }
#
# Mapa de registos:
# $a0: argumentos
# $v0: resultado
#

	.data
	.eqv print_int10,1
	
str:	.asciiz "Arquitetura de Computadores I"	# static char str[]="Arquitetura de Computadores I";
	
	.text
	.globl main
	
main:
	addiu $sp,$sp,-4		# reserva espaço da stack
	sw $ra,0($sp)			# guarda o valor de $a0
	
	la $a0,str			# $a0 = str
	jal strlen			# strlen(str)
	
	move $a0,$v0
	li $v0,print_int10
	syscall				# print_int10(strlen(str));
	
	lw $ra,0($sp)			# atualiza o valor de $a0
	addiu $sp,$sp,4			# liberta o espaço reservado
	
	li $v0,0			# return 0;
	
	jr $ra				# termina o programa

