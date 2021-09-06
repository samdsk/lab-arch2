.text
.globl multiplo


multiplo:
	move $t0 $fp
	addi $fp $sp -4
	sw $t0 0($fp)
	sw $sp -4($fp)
	sw $ra -8($fp)
	sw $s0 -12($fp)
	add $sp $fp -12
	
	li $v0 0
	
	blt $a0 $a1 gt
	j job

gt:	move $t7 $a0
	move $a0 $a1
	move $a1 $t7
	
job:		
	div $a0 $a1 
	mfhi $s0
	bne $s0 $0 exit
	li $v0 1
	
exit:	lw $t0 0($fp)
	lw $sp -4($fp)
	lw $ra -8($fp)
	lw $s0 -12($fp)
	move $fp $t0
	
	jr $ra