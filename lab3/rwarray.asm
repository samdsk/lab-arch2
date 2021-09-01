.data
arr: .space 13
msg_a: .asciiz "Inserisci A: "
msg_b: .asciiz "Inserisci B: "
msg_c: .asciiz "Inserisci C: "
.text
.globl main





main:	
	#A
	li $v0 4
	la $a0 msg_a
	syscall
	
	li $v0 5
	syscall
	
	add $s0 $zero $v0
	
	#B
	li $v0 4
	la $a0 msg_b
	syscall
	
	li $v0 5
	syscall
	
	add $s1 $zero $v0
	
	#C
	li $v0 4
	la $a0 msg_c
	syscall
	
	li $v0 5
	syscall
	
	add $s2 $zero $v0
	
	



	#exit
	li $v0 10
	syscall