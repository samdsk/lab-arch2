.data
	vector: .word 1 0 0 #vettore iniziale
	op_str: .asciiz "\nOperation:\n1 - Push\n2 - Print\n3 - Exit\n"
	in_str:.asciiz "n: "

.text
.globl main

main:	
	
	la $s0 vector	
loop:	li $v0 4
	la $a0 op_str
	syscall
	
	li $v0 5
	syscall
		
	beq $v0 1 op_push
	beq $v0 2 op_print
	beq $v0 3 op_exit
	
	j loop
	
op_push:	
	li $v0 4
	la $a0 in_str
	syscall
	
	li $v0 5
	syscall
	
	move $a0 $s0
	move $a1 $v0
	
	jal push_back
	move $s0 $v0
	
	j loop

op_print:
	move $a0 $s0	
	jal print_all
	
	j loop
	

op_exit:	
	li $v0 10
	syscall