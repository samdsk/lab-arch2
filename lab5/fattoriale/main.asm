.text
.globl main


main:
	li $a0 4
	jal fattoriale
	move $a0 $v0
	
	
	li $v0 1
	syscall
	
exit:
	li $v0 10
	syscall