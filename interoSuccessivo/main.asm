.data
msg1: .asciiz "Inserisci un numero intero: "
sn: .asciiz "\n"
voti: .word 0

.text
la $a0 msg1	# Print msg1
li $v0 4	#
syscall 	#
li $v0 5 	  # Input intero
syscall   	  #
move $s0 $v0	# sposto il dato in s0
la $s1 voti	  # inizializzo addr array
sw $s0 4($s1)	# inserisco numero input in array
add $t1 $v0 1	  #aggiungo 1 a numero input
sw $t1 8($s1)	# store numero input + 1
li $s3 1	  # inizializzo contatore ciclo
la $s1 voti	# inizializzo contatore indirizzi array
addi $s1 $s1 4	#
ciclo:
bge $s3 3 End	# condizione uscita ciclo
li $v0 1	  # stampo array pos [x]
lw $s2 ($s1) 	  #
move $a0 $s2	  # 
syscall		  #
la $a0 sn	# stampa a capo
li $v0 4	#
syscall		#
addi $s1 $s1 4 # aggiorno contatore indirizzi arr
addi $s3 $s3 1 # aggiorno contore ciclo
j ciclo

End:
li $v0 10	#Termina programma
syscall

