#typedef struct
#{
#	unsigned int id_number;
#	char first_name[18];
#	char last_name[15];
#	float grade;
#} student;
#
#int main(void)
#{
#	// define e inicializa a estrutura "stg" no segmento de dados
#	static student stg;
#
#	print_str("\nN. Mec: ");
#	stg.id_number = read_int();
#	print_intu10(stg.id_number);
#
#	print_str("\nNome: ");
#	read_str(stg.last_name, 15);
#	print_str(stg.last_name);
#	print_char(',');
#	read_str(stg.first_name, 18);
#	print_str(stg.first_name);
#
#	print_str("\nNota: ");
#	read_float(stg.grade)
#	print_float(stg.grade);
#	return 0;
#}


	.data
	.eqv print_string,4
	.eqv print_intu10,36
	.eqv print_char,11
	.eqv print_float,2
	
	.eqv read_int,5
	.eqv read_string,8
	.eqv read_float,6
	
	.eqv offset_id_number,0
	.eqv offset_first_name,4
	.eqv offset_last_name,22
	.eqv offset_grade,40
	
str_nmec:	.asciiz "\nN. Mec: "
str_nome:	.asciiz "\nNome: "
str_nota:	.asciiz "\nNota: "

stg:	.space 44
	
	.text
	.globl main


main:
	la $t0,stg		# $t0 = stg
	
	la $a0,str_nmec
	li $v0,print_string
	syscall			# print_string("\nN. Mec: ");
	li $v0,read_int
	syscall			
	sw $v0,offset_id_number($t0)	# stg.id_number = read_int();
	li $v0,print_intu10
	syscall			# print_intu10(stg.id_number);
	
	
	la $a0,str_nome
	li $v0,print_string
	syscall			# print_string("\nNome: ");
	addiu $a0,$t0,offset_last_name
	li $v0,print_string
	syscall			# print_string(stg.last_name);
	li $a0,','
	li $v0,print_char
	syscall			# print_char(',');
	addiu $a0,$t0,offset_first_name
	li $v0,print_string
	syscall			# print_string(stg.first_name);
	
	la $a0,str_nota
	li $v0,print_string
	syscall			# print_string("\nNota: ");
	l.s $f12,offset_grade($t0)
	li $v0,print_float
	syscall			# print_float(stg.grade);
	
	li $v0,0		# return 0;
	
	jr $ra
