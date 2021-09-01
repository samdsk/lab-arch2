.data
.text
.globl main

main:

	addi $a0 $0 4
	addi $a1 $0 0
	
	
	jal prodotto_s
	move $a0 $v0
	
	li $v0 1	
	syscall
	
	li $v0 10
	syscall