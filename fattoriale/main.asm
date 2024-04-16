.data
inputStr: .asciiz "insert a number "
outputStr: .asciiz "! = "

.globl main

.text
main:
	la $a0 inputStr
	li $v0 4
	syscall

	li $v0 5
	syscall
	move $s0 $v0		# s0 = number to make factorial
						
	move $a0 $s0
	jal factorial
	move $s1 $v0		# s1 = factorial of s0
	
	li $v0 1
	move $a0 $s0
	syscall

	la $a0 outputStr
	li $v0 4
	syscall
	
	li $v0 1
	move $a0 $s1
	syscall

	li $v0 10
	syscall
		