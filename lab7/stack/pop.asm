#input: nessuno
#output: indirizzo dell' elemento tolto, se vuoto -> zero

.data
.text
.globl pop

pop:	
	la $t0 stack_size
	lw $t1 0($t0) #t1 numero di elementi nella pila
	
	bne $t1 0 exec_pop
	move $v0 $zero
	j exit
	
exec_pop:
	la $t2 stack #carico la testa della pila
	lw $t3 0($t2)
	
	move $v0 $t3 #setto output
	
	lw $t4 12($t3)
	sw $t4 0($t3)
	
	addi $t1 $t1 -1
	sw $t1 0($t0)

exit:
	jr $ra