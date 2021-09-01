.data
.text
.globl prodotto_s somma

prodotto_s:
#	temp = a
#	output = 0
#	while temp>0
#		somma(sum, b)
#		temp--
#	return output
	
	# $a0 <- a, $a1 <- b
	
	add $t1 $0 $0 #t1 somma
	add $t0 $0 $a0 #to = counter = a	
	
	#saving jump addr of main in stack
	sw $ra 0($sp)
	addi $sp $sp -4
	
loop:	
	beqz $t0 end
	add $a0 $0 $t1
	jal somma
	add $t1 $0 $v0
	addi $t0 $t0 -1
	j loop

end:	move $v0 $t1
	#replaceing jump addr of main from stack
	addi $sp $sp 4
	lw $ra 0($sp)
	
	jr $ra
	
somma: 
	add $v0 $a0 $a1
	jr $ra
	
