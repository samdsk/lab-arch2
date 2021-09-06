.text
.globl conta_multipli
	
conta_multipli:
	move $t0 $fp
	addi $fp $sp -4
	sw $t0 0($fp)
	sw $sp -4($fp)
	sw $ra -8($fp)
	sw $s0 -12($fp)
	add $sp $fp -12
	
	move $s1 $a0
	move $s2 $a1
	move $t2 $a2 # N
	li $s0 0
	#ultima pos del array
	addi $a2 $a2 -1
	mul $t3 $a2 4 #4x5
	add $s1 $s1 $t3
	add $s2 $s2 $t3
	
loop:	blt $a2 $0 exit
	lw $a0 0($s1)
	lw $a1 0($s2)
	
	addi $s1 $s1 -4
	addi $s2 $s2 -4
	
	jal multiplo	
	add $s0 $s0 $v0
	
	addi $a2 $a2 -1
	j loop
	
exit:	
	move $v0 $s0

	lw $t0 0($fp)
	lw $sp -4($fp)
	lw $ra -8($fp)
	lw $s0 -12($fp)
	move $fp $t0
	
	jr $ra