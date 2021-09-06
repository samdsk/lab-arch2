.data
str: .asciiz "5kayyak5"
.text
.globl main


main:	la $a0 str

	jal palindroma
	
	move $s0 $v0
	
	li $v0 10
	syscall