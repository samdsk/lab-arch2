# procedura che converte in maiuscolo una stringa di byte (assumiamo solo caratteri minuscoli)
# conversione inplace -> sovrascrive il vettore in argomento
# $a0 <- indirizzo del vettore

.data

.text
.globl upper_case_word

upper_case_word:
	#preambolo
	addi $sp $sp -8
	sw $s0 4($sp)
	sw $s1 0($sp)
	
	
	#codice
	move $s0 $a0 #in $s0 ho l'indirizzo dell'elemento corrente del vettore
	
	

	# "abc" -> abc\0	
loop: 
	lb $s1 0($s0) #in $s1 il valore dell'elemento corrent del vettore
	beq $s1 $0 end
	subi $s1 $s1 32
	sb $s1 0($s0)
	addi $s0 $s0 1
	j loop
	
end:
	
	
	
	#epilogo	
	lw $s0 4($sp)
	lw $s1 0($sp)
	addi $sp $sp 8	
	jr $ra
