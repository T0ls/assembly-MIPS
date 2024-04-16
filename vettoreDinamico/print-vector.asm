# parameters
# 	- a0 = address of first element of array
# 	- a1 = length of array
# 	- a2 = capacity of array
# returned values
# 	- none

.data
openBracket: .asciiz "["
divider: .asciiz ", "
closeBracket: .asciiz "]"
len: .asciiz "\nlength = "
cap: .asciiz "\ncapacity = "
addr: .asciiz "\naddress = "

.globl printVector

.text 
printVector:
	li $t0 1					# t0 = index
	move $t1 $a0				# t1 = addr
	
	la $a0 openBracket			# print "["
	li $v0 4
	syscall		
	
	move $t3 $t1				#t3 = addr of current element
	
print:
	bgt $t0 $a1 end
	lw $t2 ($t3)				# t2 = array[t0] (at address t1)
	
	move $a0 $t2
	li $v0 1
	syscall						# print array[t0]
	
	beq $t0 $a1 increment		# print divider if not in last element
	la $a0 divider
	li $v0 4
	syscall					
	
increment:
	addiu $t0 $t0 1
	addiu $t3 $t3 4
	
	j print
	
end:	
	la $a0 closeBracket			# print "]"
	li $v0 4
	syscall		
	
	la $a0 len					# print length
	li $v0 4
	syscall	
	move $a0 $a1
	li $v0 1
	syscall	
	
	la $a0 cap					# print capacity
	li $v0 4
	syscall	
	move $a0 $a2
	li $v0 1
	syscall		
	
	la $a0 addr					# print address
	li $v0 4
	syscall	
	move $a0 $t1
	li $v0 1
	syscall		
	
	jr $ra
