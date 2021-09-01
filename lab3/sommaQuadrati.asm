	.data
	msg_in: .asciiz "Inserisci un numero: "
	msg_brk: .asciiz "Break"
	.text
	.globl main

main: 
	# V
	la $a0 msg_in
	li $v0 4
	syscall
	
	li $v0 5
	syscall
	
	add $s0 $zero $v0
	
	# N
	la $a0 msg_in
	li $v0 4
	syscall
	
	li $v0 5
	syscall
	
	add $s1 $zero $v0
	
	# i=0
	addi $s2 $zero 1
	# sum
	add $a3 $zero $s0
	
LOOP:	
	# for i < N
	slt $t0 $s2 $s1 #n<i
	beq $t0 $zero print_sum
	
	#if (i*i)%V==0
	mul $t0 $s2 $s2
	div $t1 $t0 $s0
	mfhi $t1 
	bne $t1 0 calculate
	la $a0 msg_brk
	li $v0 4
	syscall
	j print_sum
calculate:
	# sum+=i*i
	add $a3 $a3 $t0
	
	# i++
	addi $s2 $s2 1
	j LOOP
		
print_sum: 
	add $a0 $zero $a3
	li $v0 1
	syscall 
		
	#Exit
	li $v0 10
	syscall
