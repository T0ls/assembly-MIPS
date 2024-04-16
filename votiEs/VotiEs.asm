.data
voti: .word 30 28 27 18 -1
msg: .ascii "La media dei voti e\': "
.text
la $s1 voti
move $s0 $zero # s0 = la somma (parziale) dei voti
move $s2 $zero # s2 = counter voti
move $s3 $zero # s3 = 0
loop: 
lw $t0 ($s1) # t0 = il prossimo voto
bltz $t0 fine
addi $s1 $s1 4 # ora s1 punta al prossimo voto
addi $s2 $s2 1 # aggiorno counter voti
add $s0 $s0 $t0
j loop
fine:
beqz $s2 end
div  $s3 $s0 $s2
end:
la $a0 msg
li $v0 4 
syscall

move $a0 $s3
li $v0 1
syscall

li $v0 10
syscall
