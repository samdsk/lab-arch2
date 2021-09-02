#not the best option checkout the sommaSelettiva.asm for the best solution
.data
.align 2
arr: .space 20  
.align 2
msg_num: .asciiz "Inserisci un numero: "
result: .asciiz "Risultato: "
.text
.globl main

main:
	la $s1 arr
	addi $t0 $0 5 #array dim n	
	
loop:	beq $t0 0 end
	
	li $v0 4
	la $a0 msg_num
	syscall
	
	li $v0 5
	syscall
	
	sw $v0 0($s1)
	addi $s1 $s1 4
	addi $t0 $t0 -1
	j loop
	
end:	
	addi $s0 $0 1 # $s1 <- k
	
	move $a0 $s0
	move $a1 $s1
	jal somma
	
	move $t0 $v0
	li $v0 4
	la $a0 result
	syscall
	
exit:	
	move $a0 $t0
	
	li $v0 1
	syscall	

	li $v0 10 
	syscall