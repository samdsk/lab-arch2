# procedura che converte in maiuscolo una stringa di byte (assumiamo solo caratteri minuscoli)
# conversione inplace -> sovrascrive il vettore in argomento
# $a0 <- indirizzo del vettore

.data

.text
.globl upper_case_word

upper_case_word:

	#preambolo
	move $t0 $fp #copio fp addr attuale
	addi $fp $sp -4 #inizializzo il mio stack frame
	sw $t0 0($fp) #salvo vecchio frame addr nello stack
	sw $s0 -4($fp) #salvo $s0 e $s1
	sw $s1 -8($fp)
	sw $ra -12($fp) #salvo return addr
	addi $sp $fp -12 #aggiorno la posizione del stack pointer
	
	
	#codice
	move $s0 $a0 #in $s0 ho l'indirizzo dell'elemento corrente del vettore
	
	

	# "abc" -> abc\0	
loop: 
	lb $s1 0($s0) #in $s1 il valore dell'elemento corrent del vettore
	beq $s1 $0 end
	
	move $a0 $s1
	jal upper_case_letter
	sb $v0 0($s0)
	addiu $s0 $s0 1
	j loop
	
end:
	
	#epilogo
	lw $t0 0($fp) #salvo temp fram addr iniziale
	lw $s0 -4($fp) #ripristino registri $s0...
	lw $s1 -8($fp)
	lw $ra -12($fp) #ripristino return addr
	move $fp $t0 #setto frame addr iniziale
	jr $ra
