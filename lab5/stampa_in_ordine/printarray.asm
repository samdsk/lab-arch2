.text
.globl printarray

printarray:
	
	move $t0 $fp
	addi $fp $sp -4
	sw $t0 0($fp)
	sw $sp -4($fp)
	sw $ra -8($fp)
	sw $s0 -12($fp)
	sw $s1 -16($fp)
	
	addi $sp $fp -16
	
	#code
	
	
	#addi $a2 $a2 -1 #adesso n = indice dell'array
	move $s0 $a1 
	
	blt $a2 1 print 
	
	jal trovamax
	move $t0 $v0
	mul $t0 $v0 4
	add $a1 $a1 $t0
	
	li $v0 1
	lw $a0 0($a1)
	syscall
	
	move $a1 $s0
	subi $a2 $a2 1
	jal printarray	
	
	mul $a1 $s0 $v0
print:
	li $v0 1
	lw $a0 0($a1)
	syscall
	
	#end
	lw $t0 0($fp)
	lw $sp -4($fp)
	lw $ra -8($fp)
	lw $s0 -12($fp)
	lw $s1 -16($fp)
	move $fp $t0
	
	jr $ra
