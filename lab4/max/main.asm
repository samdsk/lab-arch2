.text
.globl main

main:
	li $a0 1
	li $a1 2
	
	#call max
	jal max
	move $t0 $v0
	
	
	#print max
	li $v0 1
	move $a0 $t0
	syscall
	
	#exit
	li $v0 10
	syscall