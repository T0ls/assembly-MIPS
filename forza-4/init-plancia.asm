# (Re-)setta la plancia con i valori di inizio partita (bordi compresi!)
# input: none
# output: none

.globl initPlancia

.text
initPlancia:
	la $t0 plancia		# address
	li $t1 0			# index
loop:
	beq $t1 63 return
	
	bgt $t1 54 border	# last line
	
	li $t2 9			# left border
	div $t1 $t2		
	mfhi $t3
	seq $t4 $t3 $zero
	seq $t5 $t3 8		# right border
	
	or $t6 $t4 $t5		# divisible by either 8 o 9 (left or right border)
	beqz $t6 notBorder
	
border:
	li $t7 '#'
	j writeAndContinue
	
notBorder:
	li $t7 '.'
	
writeAndContinue:
	sb $t7 ($t0)
	addiu $t0 $t0 1
	addiu $t1 $t1 1
	j loop
	
return:
	jr $ra