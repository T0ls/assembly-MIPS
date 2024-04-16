.data
arr: .word -1 13 23 30 25 121 84 621 84 75 98 23 21 5
msg1: .asciiz "Inserisci 3 numeri interi: "
msg2: .asciiz "Comando non riconosciuto"
# s1 a, s2 b, s3 c
# s0 pos arr
# s4 arr[a], s5 arr[b]
.text
la $a0 msg1	# print msg1
li $v0 4	#
syscall 	#
li $v0 5	  # input a
syscall		  #
move $s1 $v0	  # move a in s1
li $v0 5	# input b
syscall		#
move $s2 $v0	# move a in s2
li $v0 5	  # input c
syscall	  	  #
move $s3 $v0	  # move c in s3

la $s0 arr	# inizializzo pos arr
mul $t1 $s1 4	  # pos arr[a]
add $t1 $s0 $t1	  #
lw $s4 ($t1)	  # s4 arr[a]
mul $t2 $s2 4	# pos arr[b]  
add $t2 $s0 $t2	#
lw $s5 ($t2)	# s5 arr[a]
beqz $s3 Sab	  # c == 0
beq $s3 1 Wab	  # c == 1
beq $s3 -1 Wba	  # c == -1
li $v0 4	# stampa msg2
la $a0 msg2
syscall
j fine
Sab:
move $t3 $s4	  # appoggio arr[a] in t3
move $s4 $s5	# scambio b con a
move $s5 $t3	  #scambio a con b
j fine
Wba:
sw $s5 ($t1)
j fine
Wab:
sw $s4 ($t2)

fine:

li $v0 10
syscall