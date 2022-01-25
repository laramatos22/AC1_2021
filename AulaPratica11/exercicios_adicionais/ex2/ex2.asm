#typedef struct
#{
#	char a1[14];
#	int i;
#	char a2[17];
#	double g;
#} xyz;
#
#double f1(void) -> main
#{
#	static xyz s1 = {"Str_1", 2021, "Str_2", 2.718281828459045};
#	return s1.g;
#}

	.eqv print_string,4
	.eqv print_intu10,36
	.eqv print_float,2
	
	.eqv offset_a1,0
	.eqv offset_i,16
	.eqv offset_a2,20
	.eqv offset_g,40
	
	.data
	
s1:	.asciiz "Str_1"
	.space 9
	.align 2
	.word 2021
	.asciiz "Str_2"
	.space 12
	.align 3
	.double 2.718281828459045
	
str0:	.asciiz "a1: "
str1:	.asciiz "\ni: "
str2:	.asciiz "\na2: "
str3:	.asciiz "\ng: "

	.text
	.globl main
	
main:	
	la $t0,s1
	
	la $a0,str0
	li $v0,print_string
	syscall				# print_string("a1: ")
	
	addiu $a0,$t0,offset_a1
	move $a0, $t0
	li $v0,print_string
	syscall				# print_string("Str_1")
	
	la $a0,str1
	li $v0,print_string
	syscall				# print_string("\ni: ");
	
	lw $a0,offset_i($t0)
	li $v0,print_intu10
	syscall				# print_intu10(2021);
	
	la $a0,str2
	li $v0,print_string
	syscall				# print_string("a2: ")
	
	addiu $a0,$t0,offset_a2
	li $v0,print_string
	syscall				# print_string("Str_2")
	
	la $a0,str3
	li $v0,print_string
	syscall				# print_string("\ng: ");
	
	l.s $f12,offset_g($t0)
	li $v0,print_float
	syscall				# print_float(2.718281828459045);
	
	jr $ra
