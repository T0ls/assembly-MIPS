# La mossa è invalida se la colonna giocata è piena, o indice colonna invalido. Altrimenti, aggiorna la plancia.
# input: 
#	- a0 = column (number 1-7)
#	- a1 = player (0 or 1)
# output:
#	- v0 = valid move (0 or 1)

.globl playMove

.text
playMove:
	bge $a0 8 invalidMove
	ble $a0 0 invalidMove

	la $t0 plancia	
	li $t1 0			# index
	addu $t0 $t0 $a0   # select column
	addiu $t0 $t0 45    # address of last non-border cell
	
loop:
	bgt $t1 6 invalidMove	# 6 columns
	
	lb $t2 ($t0)		# t2 = read character
	beq $t2 '.' validMove
			
	addi $t1 $t1 1
	addiu $t0 $t0 -9
	j loop
	
validMove:
	bnez $a1 player2
	li $t7 'X'
	j write
player2:
	li $t7 'O'	
write: 
	sb $t7 ($t0)
	li $v0 1
	j return
	
invalidMove:
	li $v0 0
	
return:
	jr $ra