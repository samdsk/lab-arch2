.text
.globl fibonacci



fibonacci:


	#preambolo
	move $t0 $fp
	addi $fp $sp -4
	sw $t0 0($fp)
	sw $sp -4($fp)
	sw $s0 -8($fp)
	sw $s1 -12($fp)
	sw $ra -16($fp)
	addi $sp $fp -16
	
	
	
	#codice
	# F(n) = F(n-2) + F(n-1), se n > 1 ;
	# F(n) =1, se n=1 ;
	# F(n) =0, se n=0.
	
	move $s1 $a0		
	
	beq $a0 0 zero	
	beq $a0 1 uno
	
	addi $a0 $s1 -2
	jal fibonacci
	
	move $s0 $v0
	#add $s0 $s0 $v0
	
	addi $a0 $s1 -1
	jal fibonacci
	
	add $v0 $s0 $v0	


	j end
	
uno:	li $v0 1
	j end
	
zero:	li $v0 0		
	
end:	
	#epilogo	
	lw $t0 0($fp)
	lw $sp -4($fp)
	lw $s0 -8($fp)
	lw $s1 -12($fp)
	lw $ra -16($fp)
	move $fp $t0
	
	jr $ra
	
	
	
	