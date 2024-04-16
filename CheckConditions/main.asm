.data
a: 2
b: 4
c: 1
# s0 a, s1 b, s2 c
# if((a>=b) && (c!=0)) {z = c*(a+b), print z} else { Print <<ERRORE>> }
.text
lw $s0 a
lw $s1 b
lw $s2 c


li $v0 10
syscall
