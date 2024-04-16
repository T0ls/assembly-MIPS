.data
inputStr: .asciiz "insert a number "
outputStr: .asciiz "fibonacci = "

.globl main

.text
main:
	la $a0 inputStr
	li $v0 4
	syscall
	
	li $v0 5
	syscall
	move $a0 $v0
	
	jal fibonacci
	move $s0 $v0			# s0 = fibonacci
	
	la $a0 outputStr
	li $v0 4
	syscall
	
	move $a0 $s0 
	li $v0 1
	syscall
	
	li $v0 10
	syscall