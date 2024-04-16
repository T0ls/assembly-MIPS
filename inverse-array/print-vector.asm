# parameters
# 	- a0 = address of first element of array
# 	- a1 = length of array

.data
openBracket: .asciiz "["
divider: .asciiz ", "
closeBracket: .asciiz "]"

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
	
	jr $ra
