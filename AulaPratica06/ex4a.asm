# Mapa de registos:
# $0: i
# $a0: argc
# $a1: *argv[] = &(argv[0])

	.data
	.eqv print_str,4
	.eqv print_int10,1
	.eqv SIZE,3		# define SIZE 3
str1:	.asciiz "Nr. de parametros: "
str2:	.asciiz ": "
str3:	.asciiz "\nP"
	.align 2
	.text
	.globl main
	
main:				# void main (void) {
	li $t0,0		#	i=0
	move $t1,$a0		#	$t1 = argc
	move $t2,$a1		#	$t2 = &(argv[0])
	
	la $a0,str1
	li $v0,print_str
	syscall			#	print_str("Nr. de parametros: ");
	
	move $a0,$t1
	li $v0,print_int10
	syscall			#	print_int10(argc);
	
for:
	bge $t0,$t1,endfor	#	while( i < argc ) {
	
	la $a0,str3
	li $v0,print_str
	syscall			#		print_str("\nP");
	
	move $a0,$t0
	li $v0,print_int10
	syscall			#		print_int(i);
	
	la $a0,str2
	li $v0,print_str
	syscall			#		print_str(": ");
	
	sll $t3,$t0,2 		#		$t3 = temp = i*4
	addu $t3,$t2,$t3 	# 		$t3 = temp = &argv[i]
	
	lw $a0,0($t3) 		# 		$a0 = argv[i]
	li $v0,print_str
	syscall			#		print_str(argv[i]);
	
	addiu $t0,$t0,1		#		i++
	
	j for			#	}
	
endfor:
	li $v0,0		# 	return 0;
	
	jr $ra			# }
	