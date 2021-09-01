#function calcola max tra due numeri
# int max(a,b)
#	if a<b return b
#	else return a



.text
.globl max

max:
	#input $a0 <- a, $a1 <- b, output $v0 <- max value
	#prologo
	addi $sp $sp -8
	sw $s0 4($sp)
	sw $s1 0($sp)
	
	#corpo
	move $s0 $a0
	move $s1 $a1
	
	#if a<b $v0 <- b
	slt $t0 $s0 $s1
	beqz $t0 a_Max_b #a>b
	#a<b
	move $v0 $s1
	j finish
	a_Max_b:
	move $v0 $s0
	
	finish:
	#epilogo		
	lw $s0 4($sp)
	lw $s1 0($sp)
	addi $sp $sp 8
	jr $ra 