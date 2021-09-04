.data

arr: .word 6 5 4 3 2 1
.align 2
.text
.globl main


main:
	la $a1 arr
	li $a2 5
	
	jal printarray
	

exit:
	li $v0 10
	syscall
