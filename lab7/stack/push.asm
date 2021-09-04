.data
.text
.globl push

# push -> inserisce un elemento in cima alla pila
#input: a0 x, a1 y, a2 a
#output: void

push:	
	move $t0 $a0
	move $t1 $a1
	move $t2 $a2
	
	#allochiamo una area di memoria per il nuovo elemento
	
	li $v0 9 #segment break sbrk
	li $a0 16 #4 parole
	syscall
	
	#adesso abbiamo indirizzo base della pila
	
	sw $t0 0($v0) #x
	sw $t1 4($v0) #y
	sw $t2 8($v0) #a
	
	la $t3 stack
	lw $t4 0($t3)	
	sw $t4 12($v0) #next = stack
	
	sw $v0 0($t3) #stack = testa della pila
	
	la $t5 stack_size #incremento il contatore degli elementi
	lw $t6 0($t5)
	addi $t6 $t6 1
	sw $t6 0($t5)
	
	jr $ra