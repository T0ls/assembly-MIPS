# a0 = string
# a1 = value

.globl stampa

.text
stampa:
	li $v0 4
	syscall
	
	move $a0 $a1
	li $v0 1
	syscall
	
	jr $ra