.data
arr: 1 2 3 4 7 3
str: .asciiz "\n\nInsert 0 to print, 1 to push, 2 to pop, -1 to end: "

.globl main

.text
main:
	la $s0 arr				# s0 = address of array
	li $s1 6				# s1 = len(arr)
	li $s2 6				# s2 = capacity(arr)

loop:
	move $a0 $s0			# print vector
	move $a1 $s1
	move $a2 $s2
	jal printVector
	
	la $a0 str				# read operation
	li $v0 4
	syscall	
	li $v0 5
	syscall					# v0 = op code
	
	beq $v0 -1 end
	beqz $v0 loop
	beq $v0 1 handlePush
	beq $v0 2 handlePop

handlePush:
	move $a0 $s0
	move $a1 $s1
	move $a2 $s2
	jal push
	move $s0 $v0
	addiu $s1 $s1 1
	move $s2 $v1
	j loop

handlePop:
	move $a0 $s1
	jal pop
	move $s1 $v0
	j loop
	
end:
	li $v0 10
	syscall