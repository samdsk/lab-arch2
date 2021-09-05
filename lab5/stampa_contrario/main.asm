.data
arr: .word  1 2 3 4 5 6
.text
.globl main


main:
	la $a0 arr
	li $a1 6
	
	jal stampa_contrario
	
	li $v0 10
	syscall