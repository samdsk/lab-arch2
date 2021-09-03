# n! 
# caso base: n == 1 -> 1
# caso ricorsivo: n*(n-1)!
.text
.globl fattoriale



fattoriale:
	
	#preambolo
	move $t0 $fp
	addi $fp $sp -4
	sw $t0 0($fp)
	sw $sp -4($fp)
	sw $s0 -8($fp)
	sw $ra -12($fp)
	addi $sp $fp -12
	
	#codice
	
	#$a0 == input
	move $s0 $a0
	beq $a0 1 base
	
	addi $a0 $a0 -1
	jal fattoriale
	
	mul $v0 $s0 $v0 # n = n*(n-1)
	j end
base:	li $v0 1
end:
	#epilogo		
	lw $t0 0($fp)
	lw $sp -4($fp)
	lw $s0 -8($fp)
	lw $ra -12($fp)
	move $fp $t0
	
	 jr $ra 
	