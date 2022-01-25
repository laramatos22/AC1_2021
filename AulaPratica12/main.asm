#As estruturas podem, à semelhança dos tipos nativos da linguagem, ser organizados num
#array. O programa seguinte declara um array de 4 estruturas do tipo student e chama uma
#função para a inicialização dos dados dos 4 elementos desse array. O array é depois
#percorrido pela função "max()" para determinar o valor máximo e a média das notas.
#
#
#typedef struct
#{
#	unsigned int id_number;
#	char first_name[18];
#	char last_name[15];
#	float grade;
#} student;
#
#
#define MAX_STUDENTS 4
#
#int main(void)
#{
#	static student st_array[MAX_STUDENTS];
#	static float media;
#	student *pmax;
#
#	read_data( st_array, MAX_STUDENTS );
#	pmax = max( st_array, MAX_STUDENTS, &media );
#	print_string("\nMedia: ");
#	print_float( media );
#	print_student( pmax );
#	return 0;
#}


	.data
	
	.eqv print_string,4
	.eqv print_float,2
	
	.eqv offset_id_number,0
	.eqv offset_first_name,4
	.eqv offset_last_name,22
	.eqv offset_grade,40
	
	.eqv MAX_STUDENTS,4

st_array:	.space 176 		# ver explicação nos apontamentos - pdf

str1:	.asciiz "\nMedia: "
str2:	.asciiz "\n"

	.align 2
media:	.space 4
	
	.text
	.globl main
	
main:
	addiu $sp,$sp,-8		# colcoar espaço na stack
	sw $ra,0($sp)			# salvaguardar o valor de $ra	
	sw $s0,4($sp)			# salvaguardar o valor de $s0 -> media (é necessário depois da chamada à funcao max por isso
					# é necessário o salvaguardar) -> $s0 = pmax
	
	la $a0,st_array			# $a0 = st_array
	li $a1,MAX_STUDENTS		# $a1 = MAX_STUDENTS
	jal read_data			# read_data( st_array, MAX_STUDENTS );
	
	la $a0,st_array			# $a0 = st_array
	li $a1,MAX_STUDENTS		# $a1 = MAX_STUDENTS
	la $a2,media			# $a2 = &media
	jal max				# max( st_array, MAX_STUDENTS, &media );
	move $s0,$v0			# pmax = max( st_array, MAX_STUDENTS, &media );
	
	la $a0,str1
	li $v0,print_string
	syscall				# print_string("\nMedia: ");
	
	la $t0,media			# $t0 = &media
	l.s $f12,0($t0)			# $f12 = media (valor em float/single)
	li $v0,print_float
	syscall				# print_float( media );
	
	la $a0,str2
	li $v0,print_string
	syscall				# print_string("\n")
	
	move $a0,$a0			# $a0 = pmax
	jal print_student		# print_student( pmax );
	
	li $v0,0			# return 0;
	
	jr $ra
	



