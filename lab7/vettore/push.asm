.data
.text
.globl push_back


push_back:
	#if v[0]>v[1] se spazio > numero di elementi inserisco in coda
	#$a0 base addr vector
	#$a1 nuovo elemnto
	
	#preambolo
	move $t0 $fp
	addi $fp $sp -4
	sw $t0 0($fp)
	sw $sp -4($fp)
	sw $s0 -8($fp)
	sw $ra -12($fp)
	sw $s1 -16($fp)
	addi $sp $fp -16
	
	#codice
	
	move $s0 $a0
	move $s1 $a1
	lw $t0 0($s0) #dimensione
	lw $t1 4($s0) #numero di elementi
	
	bgt $t0 $t1 insert
	jal espansione
	
	move $s0 $v0
	lw $t1 4($s0) #numero di elementi
	
insert:
	
	addi $t2 $s0 8 #posizione del primo elemento
	
	#calcolo posizione del prossimo elemento
	mul $t3 $t1 4 #calcolo posizione della coda 4*numero di elementi
	add $t2 $t2 $t3 #siamo in posizione coda 
	sw $s1 0($t2) #aggiungo nuovo elemento
	addi $t1 $t1 1 #aumento numero di elementi
	sw $t1 4($s0)
	move $v0 $s0

exit:	
	#epilogo
	lw $t0 0($fp)
	lw $sp -4($fp)
	lw $s0 -8($fp)
	lw $ra -12($fp)
	lw $s1 -16($fp)
	move $fp $t0
	
	jr $ra
	
	