.globl P

.text
P:
move $t4 $a0 # t4 address array
move $t5 $a1 # t5 contatore for
andi $t8 $t5 1
beqz $t8 pari
move $v0 $t4
j end
pari:
li $s7 2
move $v0 $s7 
end: 
jr $ra