.data
fine: .asciiz ""
.text
.globl palindroma


palindroma:
	move $t0 $a0 #salvo indirizzo della stringa
	
	lb $t1 fine
	addi $t2 $0 0 #f posizione fine
	addi $t3 $0 0 #i posizione iniziale
	li $v0 0
	lb $t4 0($t0) #primo carattere
	
loop_size:
	beq $t4 $t1 end_size
	addi $a0 $a0 1	
	lb $t4 0($a0)
	addi $t2 $t2 1

	j loop_size
end_size:
	li $t5 2
	div $t2 $t5 
	mfhi $t5
	mflo $t6
	
	addi $t6 $t6 1
	
	
	lb $t4 0($t0) #primo carattere
	
	move $a0 $t0
	addi $t2 $t2 -1	
	add $a0 $a0 $t2 #ultimo carattere
	
	lb $t5 0($a0) #ultimo carattere
	
loop:	bne $t4 $t5 exit		
	bgt $t3 $t6 end	
	addi $t3 $t3 1
	
	addi $t0 $t0 1
	addi $a0 $a0 -1
	
	lb $t4 0($t0)
	lb $t5 0($a0)
	
	j loop
							

end:	li $v0 1									

exit:	jr $ra