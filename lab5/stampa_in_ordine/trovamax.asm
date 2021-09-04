.text
.globl trovamax

trovamax:
	move $t0 $fp
	addi $fp $sp -4
	sw $t0 0($fp)
	sw $sp -4($fp)
	sw $ra -8($fp)
	sw $s0 -12($fp)
	sw $s1 -16($fp)
	
	addi $sp $fp -16
	
	#code
	
	#$a1 arr addr, $a2 n = 6 arriva come n-1 quindi 5
	
	move $t0 $a1 #salvo arr addr
	
	move $t1 $a2 #salvo n 
	mul $t4 $t1 4
	add $t0 $t0 $t4
	
	lw $t2 0($t0) #max iniziale
	move $v0 $a2 #pos max
loop:	
	blt $t1 1 end 
	sub $t0 $t0 4 #pos del next element
	lw $t3 0($t0) #next element
	
	
	addi $t1 $t1 -1 #n--1
	
	bgt $t2 $t3 loop # if max>next salto
	move $v0 $t1 # aggiorno pos max prima volta rimane ancora = $a2
	move $t2 $t3 # update max : max = next
	move $v0 $t1 # update pos max = next pos
	
	j loop	
		
end:
	beq $v0 $a2 exit # se max è nella pos ultima salto
			#altrimenti gli scambio
	
	mul $t3 $a1 $v0 #pos max
	lw $t0 ($t3) # salvo max	
	
	mul $a1 $a1 $a2  #ultima posizione
	
	lw $t1 ($a1) #salvo elemento della ultima pos
	sw $t1 ($t3) #scambio max_pos = ultimo
	sw $t0 ($a1) #ultimo_pos = max
		
exit:	#exit
	lw $t0 0($fp)
	lw $sp -4($fp)
	lw $ra -8($fp)
	lw $s0 -12($fp)
	lw $s1 -16($fp)
	move $fp $t0
	
	jr $ra
