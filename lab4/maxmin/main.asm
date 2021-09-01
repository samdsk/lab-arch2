.data
ins_n: .asciiz "Inserisci dim array: "
ins : .asciiz "Inserisci un numero (array): " 
out_min: .asciiz "\nMin: "
out_max: .asciiz " Max: "
.text
.globl main

main:
	li $v0 4
	la $a0 ins_n
	syscall
	
	li $v0 5
	syscall
	
	#array size $s0
	move $s0 $v0
	
	#loop n
	add $t1 $0 $s0
	
	la $a0 ins
loop:
	beqz $t1 end
	
	#print ins
	li $v0 4	
	syscall
	
	#read
	li $v0 5
	syscall
	
	sw $v0 0($sp)
	addi $sp $sp -4
	addi $t1 $t1 -1
	j loop
	
end:
	add $t2 $sp $0
	#args $a0 array size, $a1 array addr
	add $a0 $0 $s0
	la  $a1 0($sp)
	
	jal max
	move $s1 $v0
	add $a0 $0 $s0
	
	#reset stack pointer to last element of stack
	add $sp $0 $t2
	jal min
	move $s2 $v0
	
	#print out_min
	li $v0 4
	la $a0 out_min	
	syscall
	
	#print min
	li $v0 1
	move $a0 $s2	
	syscall
	
	#print out_max
	li $v0 4
	la $a0 out_max	
	syscall
	
	#print max
	li $v0 1
	move $a0 $s1	
	syscall
	
exit:
	li $v0 10
	syscall