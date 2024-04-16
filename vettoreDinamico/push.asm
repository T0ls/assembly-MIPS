# parameters
# 	- a0 = address of first element of array
# 	- a1 = length of array
# 	- a2 = capacity of array
# returned values
# 	- v0 = new address of array
# 	- v1 = new capacity of array
# 	- v2 = new length of array (implicit, always equal to old length + 1)

.data
str: .asciiz "number to add: "
abc: .asciiz "add in line"

.globl push

.text
push:
	move $t0 $a0				# t0 = addr
	move $t1 $a1				# t1 = len
	move $t2 $a2				# t2 = cap (words)

	la $a0 str
	li $v0 4
	syscall
	li $v0 5
	syscall
	move $t3 $v0				# t3 = number to add	
	
	addiu $t1 $t1 1
	bgt $t1 $t2 allocAndAdd

addInLine:	
	sll $t4 $t1 2				# t4 = addr of new element
	addu $t4 $t4 $t0
	sw $t3 ($t4)
	j return

allocAndAdd:
	sll $t2 $t2 1				# new capacity = old-capacity * 2
	sll $a0 $t2 2				# allocate new space
	li $v0 9
	syscall
	li $t5 0					# t5 = index of current element
	move $t6 $t0				# t6 = address of current element
	addiu $t8 $t1 -1			# t8 = old length
copyLoop:						# copy all elements
	bge $t5 $t8 endOfLoop
	
	lw $t7 ($t0)				# t7 = old-array[i]
	sw $t7 ($t6)				# new-array[i] = t7
	
	addiu $t5 $t5 1
	addiu $t6 $t6 4	
	addiu $t0 $t0 4	
	
	j copyLoop
	
endOfLoop:
	move $t0 $v0				# t0 = new address
	addiu $a1 $a1 1
	j return
	
return:
	move $v0 $t0
	move $v1 $t2
	jr $ra