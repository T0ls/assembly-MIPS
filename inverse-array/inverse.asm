# parameters
# 	- a0: addres of array to inverse
#	- a1: address of output array (inverse array)
# 	- a2: length of array

.globl inverse

.text
inverse:
	li $t0 0			# t0 = i
	sll $t1 $a2 2
	addiu $t1 $t1 -4	# to point at last index
	addu $t1 $t1 $a0	# t1 = addr el input array
	
loop:
	bge $t0 $a2 return
	
	lw $t3 ($t1)
	sw $t3 ($a1)
	
	addiu $t0 $t0 1
	addiu $t1 $t1 -4
	addiu $a1 $a1 4
	
	j loop
	
return:
	jr $ra
