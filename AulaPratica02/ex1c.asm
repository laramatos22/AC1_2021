	.data
	.text
	.globl main
main: 
	ori $t0,$0,0xE543 	# substituir val_1 e val_2 pelos
	ori $t1,$0,0	 	# valores de entrada desejados
	nor $t1,$t0,$t1		# nor -> $t2 = ~($t0 | $t1) (nor bit a bit)
	jr $ra 			# fim do programa
