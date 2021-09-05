.data
arr: .word 1 2 3 4 5 6
n: .word 6
.text
.globl main

main:	la $a0 arr
	lw $a1 n 
	
	jal S
	
	move $a0 $v0
	li $v0 1
	syscall

	li $v0 10
	syscall