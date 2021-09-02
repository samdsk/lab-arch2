#Input: tre valori interi, due indirizzi del segmento testo
#Output: nessuno

#$a0, $a1, $a2 <- 3 interi
#$s3 primo addr stack secondo addr

.data
.text
.globl branch3equal

branch3equal:
	
		add $t0 $0 $0
		add $v0 $0 $0
		
		bne $a0 $a1 second
		addi $t0 $t0 1
		
second: 	bne $a0 $a2 third
		addi $t0 $t0 1

third:		bne $a1 $a2 exit_2
		addi $t0 $t0 1
		
		bne $t0 3 end
		move $v0 $a3
		j end
		
exit_2:		addi $sp $sp 4
		lw $v0 0($sp)
						
	
end:		jr $ra
