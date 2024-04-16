# parameters
# 	- a0 = length of array
# returned values
# 	- v0 = new length of array

.globl pop

.text
pop:
	bgtz $a0 decrease
	li $a0 1
decrease:
	addiu $v0 $a0 -1
	jr $ra
	
