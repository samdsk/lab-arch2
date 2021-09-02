#Input: tre valori interi, due indirizzi del segmento testo
#Output: nessuno

.data
.text
.globl main

main:	
	addi $a0 $0 1
	addi $a1 $0 2
	addi $a2 $0 3	
	
	la $s0 label_2
	
	la $a3 label_1
	
	sw $s0 0($sp)
	addi $sp $sp -4
	
	jal branch3equal
	beq $a3 $v0 label_1
	beq $s0 $v0 label_2
	j exit
label_1:
	add $t0 $0 $v0
	j exit
label_2:
	add $t1 $0 $v0

exit:
	li $v0 10
	syscall
	