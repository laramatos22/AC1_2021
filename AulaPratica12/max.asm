#A função "max()" determina a média das notas e devolve um ponteiro para a estrutura
#que contém os dados do aluno com a nota mais elevada. Traduza-a para Assembly do
#MIPS.
#
#
#student *max(student *st, int ns, float *media)
#{
#	student *p;
#	student *pmax;
#	float max_grade = -20.0;
#	float sum = 0.0;
#
#	for(p = st; p < (st + ns); p++)
#	{
#		sum += p->grade;
#		if(p->grade > max_grade)
#		{
#			max_grade = p->grade;
#			pmax = p;
#		}
#	}
#	*media = sum / (float)ns;
#	return pmax;
#}

	.data
	
	.eqv offset_id_number,0
	.eqv offset_first_name,4
	.eqv offset_last_name,22
	.eqv offset_grade,40
	
max_grade: .float -20.0
sum:	.float 0.0

	.text
	.globl max
	
max:					# student *max(student *st, int ns, float *media)
	
	la $t0,sum			#	$t0 = &sum
	l.s $f4,0($t0)			#	sum = 0.0
	
	la $t0,max_grade		# 	$t0 = &max_grade
	l.s $f6,0($t0)			#	max_grade = -20.0
	
	move $t0,$a0			#	$t0 = &st = *p -> p = st
	move $t2,$a2			# 	$t2 = &media
	
	move $t4,$a1			# 	$t4 = ns
	mul $a1,$a1,44			#	$t4 = ns = ns + 44
	addu $t1,$t0,$a1		#	$t1 = &(st[ns])
	
	li $t3,0			# 	pmax = 0
	
for:					#	for(p = st; p < (st + ns); p++)
	bge $t0,$t1,endfor
	
	l.s $f8,offset_grade($t0) 	#		$f8 = p->grade
	add.s $f4,$f4,$f8		#		sum += p->grade;
	
if:					#		if(p->grade > max_grade)
	c.le.s $f8,$f6			#		p->grade > max_grade
	bc1t endif
	
	mov.s $f6,$f8			#			max_grade = p->grade;
	move $t3,$t0			#			pmax = p;
	
endif:
	addi $t0,$t0,44			#		p++
	j for
	
endfor:
	mtc1 $t4,$f10
	cvt.s.w	$f10, $f10		#
	div.s	$f10, $f4, $f10		#	$f10 = sum/(float)ns;
	s.s	$f10, 0($t2)		#	*media = sum/(float)ns;
	move	$v0, $t3		#	return pmax;
	jr	$ra
	
	
	
	
	
	







