.data
plancia: .space 63			# 6 x 7 board with border l,r,b
.align 2
title: .asciiz "Welcome to \"FORZA 4\""
player1Turn: .asciiz "\nplayer1: 'X' to play"
player2Turn: .asciiz "\nplayer2: 'O' to play"
playColumn: .asciiz "\ntype a column 1-7 to play or f to quit: "
playMoveAgain: .asciiz "\n*INVALID INPUT*\n"
player1Win: .asciiz "\n*PLAYER 1: 'X' WON*\n"
player2Win: .asciiz "\n*PLAYER 2: 'O' WON*\n"

.globl plancia
.globl main

.text
main:
restartGame: 
	la $a0 title
	li $v0 4
	syscall
	
	jal initPlancia
	jal drawPlancia
	
	li $s0 0			# player turn - 0 or 1
	
game:
	bnez $s0 player2	# print indications
	la $a0 player1Turn
	j printBoard
player2:
	la $a0 player2Turn
printBoard:
	li $v0 4
	syscall	
	la $a0 playColumn
	li $v0 4
	syscall
	
	li $v0 5			# ask for move
	syscall
	
	beq $v0 'f' end		# handle quit game char
	
	move $a0 $v0		# handle move
	move $a1 $s0
	jal playMove
	beqz $v0 playAgainMove
	
	jal drawPlancia		# draw updated board
	
	jal checkWin		# handle win
	bne $v0 -1 handleWin
	
continueGame:	
	seq $s0 $s0 0		# change player
	j game

playAgainMove:
	la $a0 playMoveAgain
	li $v0 4
	syscall
	j game	
	
handleWin:
	bnez $s0 winPlayer2
	la $a0 player1Win
	j printWin
winPlayer2:
	la $a0 player2Win
printWin:
	li $v0 4
	syscall	

end:
	li $v0 10
	syscall