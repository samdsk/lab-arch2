.data
.text
.globl espansione


espansione:
	#preambolo
	move $t0 $fp
	addi $fp $sp -4
	sw $t0 0($fp)
	sw $sp -4($fp)
	sw $s0 -8($fp)
	sw $ra -12($fp)
	addi $sp $fp -12
	
	#codice
	#$a0 vector addr base
	
	move $s0 $a0
	
	lw $t1 4($s0) #numero di elementi_old
	
	#inizio loop stack
	
	addi $t3 $s0 8 #old vector 1st
	li $t0 0
	#calcolo posizione del prossimo elemento	
	
loop_stack:	
	beq $t0 $t1 exp #while(count < numero di elementi)

	#mul $t5 $t0 4 #old calcolo posizione della coda 4*numero di elementi
	
	
	lw $a1 0($t3) #prelevo da old vector
	addi $t3 $t3 4 #old siamo in posizione coda 	
	addi $sp $sp -4
	sw $a1 0($sp) #aggiungo nuovo elemento nel new vector
	
	addi $t0 $t0 1 #aumento numero di elementi
	
	j loop_stack
exp:
	
	lw $t0 0($s0) #size_old
	#nuova dimensione del vettore
	mul $t2 $t0 2 #new size
		
	#aggiungo altri due elementi per size e numero di elementi
	addi $t3 $t2 2 
	mul $t4 $t2 4 #numero di byte	
	
	li $v0 9
	move $a0 $t4
	syscall
	
	sw $t2 0($v0) #scrivo nuovo size
	sw $t1 4($v0) #riscrivo vecchio numero di elementi
	
	#ri-popolo
	li $t0 0 #contatore = 0
	
	
	addi $t4 $v0 4 #new vector 1st
	#calcolo posizione del prossimo elemento	
	
loop:	beq $t0 $t1 end #while(count < numero di elementi)	
	
	
	lw $a1 0($sp) #prelevo da old vector
	addi $t4 $t4 4 #new siamo in posizione coda 
	addi $sp $sp 4
	
	sw $a1 0($t4) #aggiungo nuovo elemento nel new vector
	addi $t0 $t0 1 #aumento numero di elementi
	
	j loop
	
end:	
	
exit:	
	#epilogo
	lw $t0 0($fp)
	lw $sp -4($fp)
	lw $s0 -8($fp)
	lw $ra -12($fp)
	move $fp $t0
	
	jr $ra