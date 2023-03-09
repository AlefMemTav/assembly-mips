.data
  c0: .float 0.0
  nl: .asciiz "\n"

.text
  main:

  li $t1, 0 # contador de repeticoes
  l.s $f1, c0 # soma em 0
  l.s $f2, c0 # pesos em 0

  li $v0, 5 # read_int
  syscall # ler
  add $t0, $v0, $zero # quantidade maxima do contador

  loop:

		# ler peso

		li $v0, 6 # read_float
		syscall # ler
		mov.s $f3, $f0

		# ler valor

    li $v0, 6 # read_float
    syscall # ler

    add.s $f2, $f2, $f3 # pesos + peso
    mul.s $f3, $f0, $f3 # valor vezes peso
    add.s $f1, $f1, $f3 # soma
    
    addi $t1, $t1, 1 # incrementa contador de repeticoes
    slt $t2, $t1, $t0 # t1 < t0 ? 1 : 0
    bne $t2, $zero, loop 

    div.s $f12, $f1, $f2
    
		li $v0, 2 # print_float
    syscall # imprimir

    li $v0, 10 # exit
		syscall