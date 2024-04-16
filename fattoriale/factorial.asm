# properties:
#	- a0: number to make factorial
# results:
# 	- v0: factorial of a0

.globl factorial

.text
factorial:
	move $t0 $fp
	addiu $fp $sp -4
	sw $s0 0($fp)
	sw $sp -4($fp)
	sw $t0 -8($fp)
	sw $ra -12($fp)
	addiu $sp $fp -12
	
	move $s0 $a0
	bleu $s0 1 baseCase	
	
	addiu $a0 $s0 -1
	jal factorial
	
	mul $v0 $s0 $v0		# v0 = a0 * factorial(a0 -1)
	j return

baseCase:
	li $v0 1			# 0! = 1! = 1

return:
	lw $s0 0($fp)
	lw $sp -4($fp)
	lw $t0 -8($fp)
	lw $ra -12($fp)
	move $fp $t0
	
	jr $ra