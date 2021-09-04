.data
arr: .byte 1 2 3
.text
.globl main


main:

	la $a0 arr
	lb $v0 0($a0)