.data
A: 1 2 3 4
aStr: .asciiz "\nA = "
bStr: .asciiz "\nB = "

.globl main

.text
main:
	li $s0 4			# s0 = length of array
	
	sll $a0 $s0 2		# n of bytes for empty array in heap
	li $v0 9
	syscall
	move $s1 $v0		# s1 = address of reversed array (B)

	la $a0 A			# inverse A into B
	move $a1 $s1	
	move $a2 $s0
	jal inverse
	
	la $a0 aStr			# print A
	li $v0 4
	syscall	
	la $a0 A
	move $a1 $s0
	jal printVector	
	
	la $a0 bStr			# print B
	li $v0 4
	syscall	
	move $a0 $s1
	move $a1 $s0
	jal printVector	
		
	li $v0 10
	syscall
