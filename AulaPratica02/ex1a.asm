	.data
	.text
	.globl main
main: 
	ori $t0,$0,0x5C1B 	# substituir val_1 e val_2 pelos
	ori $t1,$0,0xA3E4 	# valores de entrada desejados
	and $t2,$t0,$t1 	# and -> $t2 = $t0 & $t1 (and bit a bit)
	or  $t3,$t0,$t1		# or -> $t3 = $t0 | $t1 (or bit a bit)
	nor $t4,$t0,$t1		# nor -> $t4 = ~($t0 | $t1) (nor bit a bit)
	xor $t5,$t0,$t1		# xor -> $t5 = $t0 ^ $t1 (xor bit a bit)
	jr $ra 			# fim do programa