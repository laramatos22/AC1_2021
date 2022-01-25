# Mapa de registos:
# $a0: argumentos
# $v0: resultados
	
	.data
	.eqv print_double,3
	.eqv read_double,7
	.text
	.globl main
	
main:
	addiu $sp,$sp,-4		# reserva espaço na stack
	sw $ra,0($sp)			# guarda o valor de $ra
	
	li $v0,read_double
	syscall				# ft = read_double();
	
	mov.d $f12,$f0
	jal f2c_novo			# f2c(ft)
	
	mov.d $f12,$f0			# Mover o resultado de $v0 para $a0
	li $v0,print_double
	syscall				# print_double ( f2c(double ft) );
	
	lw $ra,0($sp)
	addiu $sp,$sp,4
	
	li $v0,0
	
	jr $ra
