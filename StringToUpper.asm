.include "StringToUpper.asm"
.globl main

.data
Ib: .space 256
msg0: .ascii "Inserisci la stringa da convertire: "
msg1: .ascii "Stringa originale: "
msg2: .ascii "Stringa mauiscolo: " 

.text
li $v0 4
la $a0 msg0
syscall # Msg 0
li $v0 8
la $a0 Ib
li $a1 256
syscall # Input stringa
jal StringToUpper





