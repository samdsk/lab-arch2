.data
arr_1: .word 1 9 5 9 5
arr_2: .word 4 3 3 8 15
.text
.globl main


main:	
	la $a0 arr_1
	la $a1 arr_2
	li $a2 5
	
	jal conta_multipli
	
	move $s0 $v0 

	li $v0 10 
	syscall