.data
array: 12 4 31 3
strMin: .asciiz "min = "
strMax: .asciiz "\nmax = "

.globl main

.text
main:
	la $a0 array			
	la $a1 4				# a1 = lunghezza array
	jal trovaMin
	move $s0 $v0 			# s0 = min
	
	la $a0 array			
	la $a1 4				# a1 = lunghezza array
	jal trovaMax
	move $s1 $v0 			# s1 = max
	
	la $a0 strMin
	move $a1 $s0		
	jal stampa
	
	la $a0 strMax
	move $a1 $s1		
	jal stampa
	
	li $v0 10
	syscall
	
