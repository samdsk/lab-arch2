# convertire una stringa di sole lettere minuscole in maiuscolo
# invocando la funzione upper_case_word
.data

nome: .asciiz "sam ciao M .-!?"
cognome: .asciiz "k"

.text
.globl main

main:
	la $a0 nome
	jal upper_case_word

	li $v0 4
	la $a0 nome
	syscall
	
	li $v0 10
	syscall
