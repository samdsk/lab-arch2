#Si scriva una procedura assembly, chiamata Elaboratore, che esegue la somma,
#differenza, moltiplicazione e divisione tra due numeri interi.

#vengono chiesti all’utente operandi e operatore;
#il risultato dell’operazione è mostrato a terminale.

.data
divi: .ascii "/" 
.align 2
risultato: .asciiz "\nRisultato: "
.align 2
resto: .asciiz " Resto: "

.text
.globl main

main:
	#primo operando
	li $v0 5	
	syscall	
	move $t0 $v0
	
	#secondo operando
	li $v0 5	
	syscall	
	move $a1 $v0
	
	#operatore
	li $v0 12	
	syscall	
	add $a2 $a2 $v0
	
	move $a0 $t0
	
	#function call
	jal Elaboratore
	
	move $t0 $v0
	
	#print
	li $v0 4
	la $a0 risultato
	syscall
	
	move $a0 $t0
	li $v0 1
	syscall
	
	lw $t0 divi
	bne $a2 $t0 exit
	
	li $v0 4
	la $a0 resto
	syscall
	
	move $a0 $v1
	li $v0 1
	syscall
	
exit:	
	#Exit
	li $v0 10
	syscall
	
	
