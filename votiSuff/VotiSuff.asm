# Programma: preni un'array di 10 elementi contenete i voti di studenti e conta quanti di questi sono passati >=18
# var a [10] = int { 11 17 14 27 30 22 17 18 32 25 }
# soma := 0
# for i:=0; i<9; i++ { somma += a[i] }
# Println(somma)

.data

voti: 11 17 14 27 30 22 17 18 32 25 0 #voti

.text

la $t0 voti # a[i]
li $t8 0 #somma

ciclo:
# select a[i]
lw $t0 ($t8)
beqz $t1 fine_ciclo # hceck fine ciclo

bge $t1 18 than
#addi

than:
add $t8 $t8 1
#addi

fine_ciclo:
li $v0 1
move $a0 $t0
syscall