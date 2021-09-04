.data
.globl stack
.globl stack_size

op_str: .asciiz "\nOperation:\n1 - Push\n2 - Pop\n3 - Print\n4 - Exit\n"

#x,y,a

x_str:.asciiz "x? "
y_str:.asciiz "y? "
a_str:.asciiz "a? "

stack: .word 0 #Puntatore all'ultimo elemento della pila
stack_size: .word 0 #numero di elementi nella pila


.text
.globl main

main:


loop:	li $v0 4
	la $a0 op_str
	syscall
	
	li $v0 5
	syscall
	
	beq $v0 1 op_push
	beq $v0 2 op_pop
	beq $v0 3 op_print
	beq $v0 4 op_exit
	
	j loop
	
#$a0 = x, $a1 = y, $a2 = a	
op_push:
	li $a0 10
	li $a1 -3
	li $a2 5

	jal push
	j loop
op_pop:
	jal pop
	j loop	
op_print:
	jal print
	j loop
	
op_exit:
	
	li $v0 10
	syscall
	

