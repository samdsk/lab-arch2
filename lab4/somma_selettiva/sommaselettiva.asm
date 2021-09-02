.data
.text
.globl somma


somma:
	# $a0 k, $a1 arr addr
	addi $t0 $0 5 # dim array n
	addi $t1 $0 2 # divisore
	addi $v0 $0 0 #somma
	beq $a0 1 pari 
	
	
dispari:
	beq $t0 0 end
	
	div $t0 $t1  
	mfhi $t2
	
	addi $t0 $t0 -1
	addi $a1 $a1 -4
	beq $t2 0 dispari
	
	
	lw $t3 0($a1)
	add $v0 $v0 $t3
	
	j dispari
	
pari:
	beq $t0 0 end
	
	div $t0 $t1 
	mfhi $t2
	
	addi $t0 $t0 -1
	addi $a1 $a1 -4
	beq $t2 1 pari
	
	
	lw $t3 0($a1)
	add $v0 $v0 $t3
	
	j pari
	
end:
	jr $ra