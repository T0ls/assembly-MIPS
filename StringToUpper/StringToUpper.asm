.globl StringToUpper

.text
StringToUpper:
move $t1 $a0
addi $t1 $t1 -32
move $v0 $t1
skip:
jr $ra