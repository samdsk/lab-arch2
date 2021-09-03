.text
.globl main

main:
	li $a0 6
	li $s0 0
	jal fibonacci
	move $a0 $v0 
	
	
	li $v0 1
	syscall
	
	
exit:
	li $v0 10
	syscall