.data

.text
  main:
    li $v0, 5   #Chamar read_int
    syscall     #Ler

    add $t1, $v0, $zero

    li $v0, 5
    syscall

    add $t2, $v0, $zero

    add $t0, $t1, $t2

    li $v0, 1
    add $a0, $t0, $zero
    syscall