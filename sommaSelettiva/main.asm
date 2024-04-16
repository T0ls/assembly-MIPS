.globl main

.data
arr: .space 4 # arr 32 bit = 8 pos
msg1: .asciiz "Inserisci un  numero: "

.text
main:
li $v0 4
la $a0 msg1
syscall
li $t0 0
la $t1 arr
ciclo:
bge $t0 8 finCiclo
li $v0 5
syscall
move $s1 $v0 # sposto input in s1
sw $s1 ($t1)
move $a0 $t1
move $a1 $t0
jal P
addi $t1 $t1 4
addi $t0 $t0 1
j ciclo
move $s2 $v0 # s2 contiene somma parziale
add $s4 $s4 $s2 # s4 contiene somma totale
finCiclo:
li $v0 1
move $a0 $s4
syscall

li $v0 10
syscall
