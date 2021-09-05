.data
 space: .asciiz " "
.text
.globl stampa_contrario


stampa_contrario:
	#init
	move $t0 $fp
	addi $fp $sp -4
	sw $t0 0($fp)
	sw $sp -4($fp)
	sw $ra -8($fp)
	sw $s0 -12($fp)
	sw $s1 -16($fp)
	addi $sp $fp -20
	
	move $s0 $a0
	move $s1 $a1
	
	beq $s1 1 end
	
	#ricorsione
	
	addi $t0 $s1 -1 #indice dell'elemento in ultima posizione
	mul $t1 $t0 4
	add $t2 $s0 $t1 #indirizzo dell'ultimo elemento
	
	lw $a0 0($t2)
	li $v0 1
	syscall
	
	li $v0 4
	la $a0 space
	syscall
	
	move $a0 $s0
	addi $a1 $s1 -1
	jal stampa_contrario
	
	j exit
	
end:	lw $a0 0($s0)
	li $v0 1
	syscall
	
	li $v0 4
	la $a0 space
	syscall
exit:	
	#exit
	lw $t0 0($fp)
	lw $sp -4($fp)
	lw $ra -8($fp)
	lw $s0 -12($fp)
	lw $s1 -16($fp)
	move $fp $t0
	
	jr $ra