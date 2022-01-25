#A função "read_data()", apresentada na página seguinte, lê da consola os dados de
#cada aluno e preenche a respectiva estrutura. As estruturas estão organizadas num array
#e, no código apresentado de seguida, utiliza-se acesso indexado. Traduza a função para
#Assembly do MIPS (relembre que sizeof(student)=44).
#
#void read_data(student *st, int ns)
#{
#	int i;
#
#	for(i=0; i < ns; i++)
#	{
#		print_string("N. Mec: ");
#		st[i].id_number = read_int();
#		print_string("Primeiro Nome: ");
#		read_string(st[i].first_name, 18);
#		print_string("Ultimo Nome: ");
#		read_string(st[i].last_name, 15);
#		print_string("Nota: ");
#		st[i].grade = read_float();
#	}
#}

	.data
	
	.eqv offset_id_number,0
	.eqv offset_first_name,4
	.eqv offset_last_name,22
	.eqv offset_grade,40
	
	.eqv print_string,4
	.eqv read_int,5
	.eqv read_float,6
	.eqv read_string,8
	
str1:	.asciiz "N. Mec: "
str2:	.asciiz "Primeiro Nome: "
str3: 	.asciiz "Ultimo Nome: "
str4:	.asciiz "Nota: "

	.text
	.globl read_data
	
read_data:				#void read_data(student *st, int ns)
	li $t0,0			# 	int i = 0;
	
	move $t1,$a0			# 	$a0 = $t1 = st
	move $t4,$a1			#  	$a1 = $t4 = ns
	
for:					#	for(i=0; i < ns; i++)
	bge $t0,$t4,endfor
	
	la $a0,str1
	li $v0,print_string
	syscall				#		print_string("N. Mec: ");
	li $v0,read_int
	syscall				#		read_int();
	mul $t2,$t0,44			#		$t2 )= i*44
	addu $t2,$t1,$t2		#		$t2 = &st[i] = st + i
	sw $v0,offset_id_number($t2)	#		st[i].id_number = read_int();
	
	la $a0,str2
	li $v0,print_string
	syscall				#		print_string("Primeiro Nome: ");
	addiu $a0,$t2,offset_first_name #		$a0 = st[i].first_name
	li $a1,18			#		$a1 = 18
	li $v0,read_string
	syscall				#		read_string(st[i].first_name, 18);
	
	la $a0,str3
	li $v0,print_string
	syscall				#		print_string("Ultimo Nome: ");
	addiu $a0,$t2,offset_last_name  #		$a0 = st[i].last_name
	li $a1,15			#		$a1 = 18
	li $v0,read_string
	syscall				#		read_string(st[i].last_name, 15);
	
	la $a0,str4
	li $v0,print_string
	syscall				#		print_string("Nota: ");
	li $v0,read_float
	syscall				#		read_float();
	addiu $t2,$t2,offset_grade	#		$t2 = st[i].grade
	s.s $f0,0($t2)			#		st[i].grade = read_float();
	
	addi $t0,$t0,1			# 		i ++;
	
	j for
	
endfor:
	jr $ra
	
	
	
	
	
	



