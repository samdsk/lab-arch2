.data
str: .asciiz "Ciao 0 zero?"
.text
.globl main

main:
	la $a0 str
	
	jal conta_parole
	
	move $s0 $v0
	
	li $v0 10
	syscall
