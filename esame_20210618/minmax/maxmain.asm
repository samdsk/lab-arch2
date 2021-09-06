.text
.globl minmax


minmax:	move $t0 $a0 #salvo array indirizzo
	move $t1 $a1 #salvo dim del array
	
	lw $t2 0($a0) #min
	lw $t3 0($a0) #max
	
	addi $t1 $t1 -1 
	
loop:	beq $t1 $0 end
	
	lw $t4 4($t0)
	
	bgt $t4 $t3 max
	blt $t4 $t2 min
	
	addi $t0 $t0 4
	addi $t1 $t1 -1
	j loop
	
max:	move $t3 $t4
	j loop
min:	move $t2 $t4
	j loop
	
end:	move $v0 $t2
	move $v1 $t3
	
	 jr $ra 