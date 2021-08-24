	.data
	msg_in: .asciiz "Inserisci un numero: "
	
	.text
	.globl main

main: 
	la $a0 msg_in
	li $v0 4
	syscall
	
	li $v0 5
	syscall
	
	#divisore
	li $a2 2
	
	div $v0 $a2
	#resto
	mfhi $a3
	
	bne $a3 $zero dispari
	addi $a0 $v0 2
	j fine
dispari: 
	addi $a0 $v0 1
fine: 
	li $v0 1
	syscall
	
	#Exit
	li $v0 10
	syscall
