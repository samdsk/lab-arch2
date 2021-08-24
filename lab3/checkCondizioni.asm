.data
msg_in: .asciiz "Inserisci un numero: "
msg_err: .asciiz "Errore"
.text
.globl main

main:	
	#A
	la $a0 msg_in
	li $v0 4
	syscall
	
	li $v0 5
	syscall

	add $s0 $zero $v0
	
	#B
	la $a0 msg_in
	li $v0 4
	syscall
	
	li $v0 5
	syscall

	add $s1 $zero $v0
	
	#C
	la $a0 msg_in
	li $v0 4
	syscall
	
	li $v0 5
	syscall

	add $s2 $zero $v0
	
	#If ( (a>=b) && (c!=0) )
	
	bne $s0 $s1 A_B
	j A_B_eq
A_B:  	slt $t0 $s1 $s0
	bne $t0 1 ELSE
	
A_B_eq:	beqz $s2 ELSE
	add $a0 $s0 $s1
	mul $a0 $a0 $s2
	
	li $v0 1
	syscall
	j exit
	
ELSE: 
	la $a0 msg_err
	li $v0 4
	syscall
	
exit:	#EXIT
	li $v0 10
	syscall