# a0 = indice primo elemento array
# a1 = lunghezza array

.globl trovaMin

.text
trovaMin:
	move $t3 $a0			# t3 = address of current element
	lw $t0 ($t3)			# t0 = current element
	move $t1 $t0			# t1 = min
	li $t2 0				# t2 = index
	j fineIf
	
ciclo:
	bge $t2 $a1 fineCiclo
	lw $t0 ($t3)
	bge $t0 $t1 fineIf
	move $t1 $t0
fineIf:	
	addi $t2 $t2 1
	addi $t3 $t3 4
	j ciclo

fineCiclo:
	move $v0 $t1
	jr $ra