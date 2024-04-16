.globl main

.data
IB: .space 256
Str: .space 256
msg0: .asciiz "Inserisci una stringa da convertire: "
msg1: .asciiz "Stringa originale: "
msg2: .asciiz "Stringa convertita: "

.text
main:
li $v0 4
la $a0 msg0
syscall # stampa mgs0
li $v0 8
la $a0 IB
li $a1 256 # input stringa
syscall

la $a3 Str # carico indirizzo stringa finale
li $a1 0 # indice stringa
la $a0 IB  # carico indirizzo stringa
loop:
# Prendo lettera
add $a0 $a0 $a1 # add indice a indrizzo per ottenere indirizzo destinato
lb $t0 ($a0) # prendo la singola lettera
beq $t0 32 qui # controllo x spazio " "
bge $t0 123 fine # controllo lettera < z
blt $t0 96 fine # controllo lettera > a
addi $sp $sp -4 # PUSH a0
sw $a0 ($sp)
move $a0 $t0 # metto in a0 la lettera
# Procedura call
jal StringToUpper # salto alla procedura
# Salvo lettera convertita
lw $a0 ($sp) # POP a0
addi $sp $sp 4
move $s3 $v0
sb $s3 ($a3) # salvo in memoria il byte
addi $a3 $a3 1  # incremento indirizzo stringa finale
li $a1 1 # aggiorno indice stringa
j loop

qui:
li $s3 32
sb $s3 ($a3) # spazio
addi $a3 $a3 1  # incremento indirizzo stringa finale
li $a1 1 # aggiorno indice stringa
j loop
fine:
li $v0 4
la $a0 msg1
syscall # stampa msg1
li $v0 4
la $a0 IB
syscall # stampa stringa originale
li $v0 4
la $a0 msg2
syscall # stampa msg2
li $v0 4
la $a0 Str
syscall # stampa stringa convertita


li $v0 10
syscall
