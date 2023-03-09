.data
    c5: .float 5.0
    c9: .float 9.0
    c32: .float 32.0
    c273: .float 273.15
    str: .asciiz "\n"
.text
    main:

    # inicializa as constantes

    l.s $f1, c5
    l.s $f2, c9
    l.s $f3, c32
    l.s $f4, c273

    # ler os caracteres das duas escalas

    li $v0, 12 # read_character
    syscall # ler
    add $s0, $v0, $zero # caractere lido em s0

    li $v0, 12 # ignorar espaco
    syscall 

    li $v0, 12 # read_character
    syscall # ler
    add $s1, $v0, $zero # caractere lido em s1

    li $v0, 12 # ignorar espaco
    syscall

    # ler o valor da temperatura

    li $v0, 6 # read_float
    syscall # float em $f0
 
    # calcular a diferenca entre os caracteres

    sub $t0, $s0, $s1 # primeiro char - segundo char

    # pular para calculo

    li $t1, -8
    beq $t0, $t1, celsiusToKelvin

    li $t1, -3
    beq $t0, $t1, celsiusToFarh

    li $t1, -5
    beq $t0, $t1, FarhToKelvin

    li $t1, 3 
    beq $t0, $t1, FarhToCelsius

    li $t1, 5 
    beq $t0, $t1, KelvinToFarh

    li $t1, 8 
    beq $t0, $t1, KelvinToCelsius

    exit: 
    li $v0, 2 # print_float
    syscall # imprimir

    li $v0, 4 # print_string
    la $a0, str # carregar str
    syscall # imprimir

    li $v0, 10
    syscall

    celsiusToKelvin:  
        add.s $f12, $f0, $f4
        j exit

    celsiusToFarh:
        mul.s $f12, $f0, $f2
        div.s $f12, $f12, $f1
        add.s $f12, $f12, $f3
        j exit

    FarhToKelvin:
        sub.s $f12, $f0, $f3
        mul.s $f12, $f12, $f1
        div.s $f12, $f12, $f2
        add.s $f12, $f12, $f4
        j exit

    FarhToCelsius:
        sub.s $f12, $f0, $f3
        mul.s $f12, $f12, $f1
        div.s $f12, $f12, $f2
        j exit

    KelvinToFarh:
        sub.s $f12. $f0, $f4
        mul.s $f12, $f12, $f2
        div.s $f12, $f12, $f1
        add.s $f12, $f12, $f3
        j exit

    KelvinToCelsius:
        sub.s $f12. $f0, $f4
        j exit