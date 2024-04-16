# Disegna la plancia (per es, in Ascii Art).
# input: none
# output: none

.data
newLine: .asciiz "\n"

.globl drawPlancia

.text
drawPlancia:
	la $t0 plancia		# address
	li $t1 0			# index
loop:
	beq $t1 63 return
	
	li $t2 9			# print new line at end of row
	div $t1 $t2		
	mfhi $t3
	bne $t3 $zero printChar
	la $a0 newLine		
	li $v0 4
	syscall
	
printChar:	
	lb $a0 ($t0)		# a0 = byte of char to print
	li $v0 11
	syscall
	
	li $a0 ' '			# print space between chars
	li $v0 11
	syscall
		
	addiu $t0 $t0 1
	addiu $t1 $t1 1
	j loop
	
return:
	la $a0 newLine		
	li $v0 4
	syscall
	jr $ra
