.text
.globl S

S:	#init: $s0 saved
	move $t0 $fp
	addi $fp $sp -4
	sw $t0 0($fp)
	sw $sp -4($fp)
	sw $ra -8($fp)
	sw $s0 -12($fp)
	sw $s1 -16($fp)
	addi $sp $fp -20
	
	#codice
	#$a0 arr addr, $a1 numero di elementi
	
	move $t0 $a0 #arr
	move $t1 $a1 #size
	
	beq  $t1 0 end
	
	addi $t1 $a1 -1
	mul $t3 $t1 4
	add $t0 $t0 $t3
	lw $s1 0($t0)	
	
	addi $a1 $a1 -1
	jal S
	
	add $s0 $v0 $s1	
	
	move $v0 $s0
	j exit
	
	
	
end:	move $v0 $zero
	
exit:	#exit
	lw $t0 0($fp)
	lw $sp -4($fp)
	lw $ra -8($fp)
	lw $s0 -12($fp)
	lw $s1 -16($fp)
	move $fp $t0
	
	jr $ra