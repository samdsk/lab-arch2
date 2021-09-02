	.data
	A: .space 200
	msginsert_N: .asciiz "Quanti numeri nell'array? (N): "
	msginsert_INT: .asciiz "Inserire intero: "
	msginsert_K: .asciiz "Inserire k: "
	msg_RESULT: .asciiz "Somma: "

	.text
	.globl main

main:	
	# leggo N ($t0)
	li $v0, 4		# print_string
	la $a0, msginsert_N		
	syscall

	li $v0, 5		# read_int
	syscall
	add $t0, $v0, $zero
	
	# Se N==0 ho finito (Exit)
	beq $t0, $zero, Exit
	# altrimenti N è il secondo parametro per la funzione P
	add $a1, $t0, $zero

	# Inserisco gli N interi nell'array ($t1)	
	la $t1, A

main_read_A_loop:

	# leggo prossimo int
	li $v0, 4	# print_string
	la $a0, msginsert_INT		
	syscall
	li $v0, 5	# read_int
	syscall

	# memorizzo int nell'array
	sw $v0, 0($t1)
	addi $t1, $t1, 4

	# controllo se ho finito
	addi $t0, $t0, -1
	bgt $t0, $zero, main_read_A_loop

	# leggo k
	li $v0, 4	# print_string
	la $a0, msginsert_K		
	syscall
	li $v0, 5	# read_int
	syscall

	# $v0 (k) è  il primo parametro
	add $a2, $v0, $zero
	# array A è il terzo parametro
	la $a0, A

	jal P



	# stampo il risultato
	add $t0, $v0, $zero
	li $v0, 4	# print_string
	la $a0, msg_RESULT
	syscall
	li $v0, 1	# print_int
	add $a0,$zero,$t0
	syscall


Exit:
	li $v0, 10	# exit
	syscall


# -------------------------------------------
# Procedura P
# $a0 base address dell'array
# $a1 numero di elementi nell'array
# $a2 è k

P:
	# calcolo offset su indici ($t0 = 1-k)
	mul $a2, $a2, -1
	addi $t0, $a2, 1
	add $t1, $t0, $zero	# $t1 = i = (1-k)
	mul $t0, $t0, 4		# $t0 = $t0*4
	add $a0, $a0, $t0	# $a0 = $a0 + (1-k)*4 è lo shift iniziale sugli indici

	li $t0, 0		# inizializzo la somma a 0 ($t0)

P_loop:
	bgt $t1, $a1, P_end	# se i > N ho finito (P_end)
	lw $t2, 0($a0)		# altrimenti carico il prossimo elemento da sommare
	add $t0, $t0, $t2	# aggiorno la somma
	addi $a0, $a0, 8	# indirizzo del prossimo elemento
	addi $t1, $t1, 2	# indice del prossimo elemento

	j P_loop

P_end:
	add $v0, $t0, $zero	# carico risultato in $v0
	jr $ra
# -------------------------------------------
