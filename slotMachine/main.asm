.data
msg1: .asciiz "Inserisci un numero intero: "
msg2: .asciiz "RESULT: "

# s0 input
# s1 numero generato random
.text
la $a0 msg1	# Print msg1
li $v0 51	#
syscall 	#
move $s0 $a0	# sposto il dato in s0
li $a0 1	  # creazione seed
li $v0 40	  #
syscall		  #
add $t5 $t5 $s0
add $t5 $t5 $s0
move $a0 $t5	# generazione numero casuale
move $a1 $t5	#
li $v0 42 	#
syscall 	#
move $s1 $a0	  # sposto numero in s1
addi $s1 $s1 1
sub $s1 $s1 $t5
add $s2 $s0 $s1	# sommo r + n
li $v0 56
la $a0 msg2
move $a1 $s2
syscall

li $v0 10
syscall