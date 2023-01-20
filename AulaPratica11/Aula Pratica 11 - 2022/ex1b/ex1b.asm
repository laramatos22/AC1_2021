# typedef struct 
# { 
# unsigned int id_number; 
# char first_name[18]; 
# char last_name[15]; 
# float grade; 
# } student;

	.eqv print_string, 4
	.eqv print_intu10, 36
	.eqv print_char, 11
	.eqv print_float, 2
	
	.eqv read_int, 5
	.eqv read_string, 8
	.eqv read_float, 6
	
	.eqv offset_id_number, 0
	.eqv offset_first_name, 4
	.eqv offset_last_name, 22
	.eqv offset_grade, 40

	.data
	.align 2
stg:	.space 44
	
str1:	.asciiz "\nN. Mec: "
str2:	.asciiz "\nPrimeiro nome: "
str3:	.asciiz "\nUltimo nome: "
str4:	.asciiz "\nNota: "
	
	.text
	.globl main
	
main:
	la $t0, stg			# $t0 = stg
	
	la $a0, str1
	li $v0, print_string
	syscall				# print_string("\nN. Mec: ");
	li $v0, read_int
	syscall
	
	# ----------------------------
	la $a0, str2
	li $v0, print_string
	syscall				# print_string("\nPrimeiro nome: ");
	addiu $a0, $t0, offset_first_name
	li $a1, 17
	li $v0, read_string
	syscall				# read_string(stg.first_name, 17);

	# ---------------------------- 
	la $a0, str3
	li $v0, print_string
	syscall				# print_string("\nUltimo nome: ");
	addiu $a0, $t0, offset_last_name
	li $a1, 14
	li $v0, read_string
	syscall				# read_string(stg.last_name, 14);
	
	# ----------------------------
	la $a0, str4
	li $v0, print_string
	syscall				# print_string("\nNota: ");
	li $v0, read_float
	syscall				# stg.grade = read_float();
	
	li $v0, 0			# return 0;
	jr $ra
	
