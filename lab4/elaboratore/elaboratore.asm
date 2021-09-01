#Si scriva una procedura assembly, chiamata Elaboratore, che esegue la somma,
#differenza, moltiplicazione e divisione tra due numeri interi.
#Input: i due operandi e un terzo parametro per la selezione dell’operazione.
#Output: risultato (nel caso della divisione restituisce anche il resto).
.data
	.align 2
	somma: .ascii "+"
	.align 2
	diff: .ascii "-"
	.align 2
	divi: .ascii "/"
	.align 2
	multi: .ascii "*"
.text
.globl Elaboratore

#$a0 <- op1, $a1 <- op2, $a2 <- operator
Elaboratore:
	lw $t0 somma
	bne $a2 $t0 differenza #non somma salto alla prossima
	add $v0 $a0 $a1
	j fine
differenza:
	lw $t0 diff
	bne $a2 $t0 divisione #non diff salto alla prossima
	sub $v0 $a0 $a1
	j fine
divisione:
	lw $t0 divi
	bne $a2 $t0 multiplicazione #non divi salto alla prossima
	div $a0 $a1 
	mflo $v0 #quoziente
	mfhi $v1 #resto
	j fine
multiplicazione:
	lw $t0 divi
	mul $v0 $a0 $a1
	mfhi $v1
fine:
	jr $ra