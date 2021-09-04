.data
	str: .asciiz "Elementi: "
	.align 2
	space: .asciiz " "
	.align 2
	nl: .asciiz "\n"
.text
.globl print_all


print_all:
	#preambolo
	move $t0 $fp
	addi $fp $sp -4
	sw $t0 0($fp)
	sw $sp -4($fp)
	sw $s0 -8($fp)
	sw $ra -12($fp)
	sw $s1 -16($fp)
	addi $sp $fp -16
	

	#input $a0 vector base addr
	move $s0 $a0 #salvo base addr
	lw $t1 4($s0) #numero di elementi
	li $t0 0 #count

	addi $t2 $s0 4 #posizione del primo elemento
	
	li $v0 4
	la $a0 str
	syscall
loop:	
	beq $t0 $t1 end
	
	#calcolo posizione del prossimo elemento
	
	addi $t2 $t2 4 #siamo in posizione coda 
	lw $s1 0($t2) #aggiungo nuovo elemento
	
	addi $t0 $t0 1 #aumento numero di elementi
	
	li $v0 1
	move $a0 $s1
	syscall
	
	li $v0 4
	la $a0 space
	syscall

	j loop
end:
	
	li $v0 4
	la $a0 nl
	syscall

	#epilogo
	lw $t0 0($fp)
	lw $sp -4($fp)
	lw $s0 -8($fp)
	lw $ra -12($fp)
	lw $s1 -16($fp)
	move $fp $t0
	
	jr $ra