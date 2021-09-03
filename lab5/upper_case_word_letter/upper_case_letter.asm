# procedura che converte in maiuscolo una stringa di byte (assumiamo solo caratteri minuscoli)
# conversione inplace -> sovrascrive il vettore in argomento
# $a0 <- indirizzo del vettore
.data 
a: .ascii "a"
z: .ascii "z"
.text
.globl upper_case_letter

upper_case_letter:
	#preambolo
	move $t0 $fp
	addi $fp $sp -4
	sw $t0 0($fp)
	sw $s0 -4($fp)
	sw $s1 -8($fp)
	sw $ra -12($fp)
	addi $sp $fp -12
	
	#codice
	move $s0 $a0 #in $s0 ho l'indirizzo dell'elemento corrente del vettore
	
	

	# "abc" -> abc\0
	lb $t0 a
	lb $t1 z
			
	move $s0 $a0
	
	#if a[0] >= a && a[0]<=z then -32 else return
	bgt $s0 $t1 end
	blt $s0 $t0 end
	
	addi $s0 $s0 -32
	
end:
	move $v0 $s0	
	
	#epilogo	
	
	lw $t0 0($fp)
	lw $s0 -4($fp)
	lw $s1 -8($fp)
	lw $ra -12($fp)
	
	move $fp $t0	
	jr $ra
