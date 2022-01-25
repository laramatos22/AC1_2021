#A função "print_student()" imprime (sem grandes cuidados de
#formatação) os dados de uma instância da estrutura student referenciada pelo ponteiro
#"p". 
#
#void print_student(student *p)
#{
#	print_intu10(p->id_number);
#	print_string(p->first_name);
#	print_string(p->last_name);
#	print_float(p->grade);
#}

	.data
	
	.eqv offset_id_number,0
	.eqv offset_first_name,4
	.eqv offset_last_name,22
	.eqv offset_grade,40
	
	.eqv print_intu10,36
	.eqv print_string,4
	.eqv print_float,2
	
	.text
	.globl print_student
	
print_student:				# void print_student(student *p)
	move $t0,$a0	
	
	lw $a0,offset_id_number($t0)
	li $v0,print_intu10
	syscall				#	print_intu10(p->id_number);
	
	addiu $a0,$t0,offset_first_name
	li $v0,print_string
	syscall				#	print_string(p->first_name);
	
	addiu $a0,$t0,offset_last_name
	li $v0,print_string
	syscall				#	print_string(p->last_name);
	
	l.s $f12,offset_grade($t0)
	li $v0,print_float
	syscall				#	print_float(p->grade);
	
	jr $ra

