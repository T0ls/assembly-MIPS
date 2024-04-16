# input: none
# otuput:
#	- v0 = -1 if nobody won, otherwise the player who won (0 or 1)

# TODO

.globl checkWin

.text
checkWin:

return:
	li $v0 -1
	jr $ra
