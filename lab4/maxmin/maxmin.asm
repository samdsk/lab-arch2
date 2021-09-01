.data
.text
.globl min max
#$a0 arr size, $a1 array head
	

min:	
#	m = a[n--]
#	while n>0
#		if a[n]<min
#			m = a[n]
#		n--

	addi $sp $sp 4
	addi $a0 $a0 -1
	lw $t0 0($sp)
	add $t1 $0 $t0 #min = t1, t0 a[i]	
loop_min:	 	
	beqz $a0 end_min_loop
	addi $sp $sp 4
	lw $t0 0($sp)
	
	addi $a0 $a0 -1
	bgt $t0 $t1 loop_min
	add $t1 $t0 $0
	j loop_min
	
end_min_loop:
	move $v0 $t1
	jr $ra
	
max:
#	M = a[n--]
#	while n>0
#		if a[n]>min
#			M = a[n]
#

	addi $sp $sp 4
	addi $a0 $a0 -1
	lw $t0 0($sp)
	add $t1 $0 $t0 #max = t1, t0 a[i]
		
loop_max:	 	
	beqz $a0 end_max_loop
	addi $sp $sp 4
	lw $t0 0($sp)
	
	addi $a0 $a0 -1
	blt $t0 $t1 loop_max
	add $t1 $t0 $0
	j loop_max
	
end_max_loop:
	move $v0 $t1
	jr $ra
