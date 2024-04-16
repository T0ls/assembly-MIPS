# a0 = number
# v0 = fibonacci of that number

.globl fibonacci

.text
fibonacci:
	move $t0 $fp
	addiu $fp $sp -4
	sw $ra 0($fp)
	sw $t0 -4($fp)
	sw $sp -8($fp)
	sw $s0 -12($fp)
	sw $s1 -16($fp)
	sw $s2 -20($fp)
	addiu $sp $sp -20
	
	move $s0 $a0			# s0 = current number
	bleu $s0 1 baseCase		# fib(0) = 0, fib(1) = 1
	
	addiu $a0 $s0 -1
	jal fibonacci
	move $s1 $v0			# s1 = fibonacci(s0-1)	
	
	addiu $a0 $s0 -2
	jal fibonacci
	move $s2 $v0			# s2 = fibonacci(s0-2)	
	
	addu $v0 $s1 $s2
	j return

baseCase:
	move $v0 $a0

return:
	lw $ra 0($fp)
	lw $t0 -4($fp)
	lw $sp -8($fp)
	lw $s0 -12($fp)
	lw $s1 -16($fp)
	lw $s2 -20($fp)
	move $fp $t0
		
	jr $ra