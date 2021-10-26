# Mapa de registos:
# $t0: gray
# $t1: num
# $t2: bin
# $t3: var temporaria

	.data
	.text
	.globl main
main: 	li $t0,15	 	# instrução virtual (decomposta
				# em duas instruções nativas)
	move $t1, $t0 		#num = gray;
	
	srl $t3, $t1, 4		
	xor $t1, $t1, $t3	#num = num ^ (num >> 4);
	srl $t3, $t1, 2
	xor $t1, $t1, $t3	#num = num ^ (num >> 2);
	srl $t3, $t1, 1
	xor $t1, $t1, $t3	#num = num ^ (num >> 1);
	
	move $t2, $t1		#bin = num;
	
	jr $ra 			# fim do programa