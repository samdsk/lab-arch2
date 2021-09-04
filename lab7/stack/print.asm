#input: nessuno
.data
x_str: .asciiz "x: "
y_str: .asciiz " y: "
a_str: .asciiz " a: "
e_str: .asciiz "Stack vuoto\n"
.text
.globl print

print:	
	la $t0 stack
	lw $t1 0($t0)
	
	beq $t1 0 print_empty 

loop:	beq $t1 $0 end
	
	li $v0 4
	la $a0 x_str
	syscall
	
	li $v0 1
	lw $a0 0($t1)
	syscall
	
	li $v0 4
	la $a0 y_str
	syscall
	
	li $v0 1
	lw $a0 4($t1)
	syscall
	
	li $v0 4
	la $a0 a_str
	syscall
	
	li $v0 1
	lw $a0 8($t1)
	syscall
	
	lw $t2 12($t1)
	move $t1 $t2
	j loop
	
	
print_empty:

	li $v0 4
	la $a0 e_str 
	syscall
	

end:
	jr $ra