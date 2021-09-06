.data
space: .ascii " "
fine: .asciiz ""
.text
.globl conta_parole


conta_parole:
	move $t0 $a0 #salvo indirizzo dell'array
	
	lb $t1 space #32
	lb $t3 fine #carattere fine stringa	
	lb $t2 0($t0) #primo carattere, cursore
	
	addi $v0 $0 1 #contatore
	
	#beq $t2 $t3 end #se	
	#addi $v0 $0 1
	
loop:	beq $t2 $t3 end
	
	addi $t0 $t0 1	
	lb $t2 0($t0)
	
	beq $t2 $t1 spazio
	j loop
spazio: addi $v0 $v0 1
	j loop
	
end:	
	jr $ra