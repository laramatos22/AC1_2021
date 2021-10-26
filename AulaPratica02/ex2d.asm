	.data
	.text
	.globl main
main: 	li $t0,4	 	# instrução virtual (decomposta
				# em duas instruções nativas)
	srl $t1,$t0,1		# shift right logical -> bin >> 1
	xor $t1, $t0 ,$t1	# gray = bin ^ (bin >> 1);
	jr $ra 			# fim do programa