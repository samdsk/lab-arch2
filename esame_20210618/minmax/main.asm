.data
arr: .word 1 -1 3 10 5 6
size: .word 6
.text
.globl main

main:
	la $a0 arr #indirizzo dell'array
	lw $a1 size #dimensione dell'array
	
	jal minmax
	
	move $s0 $v0
	move $s1 $v1
	
	li $v0 10
	syscall