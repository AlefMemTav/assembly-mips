.data 
.text 
main:
    addi $v0, $zero, 5 
    syscall
    add $a0, $v0, $zero

    addi $v0, $zero, 5 
    syscall
    add $a1, $v0, $zero
    jal multfac

    li $v0, 10
	syscall

	multfac: 
        li $t4, 0 # contador de numeros negativos

    # verificar sinal do multiplicando
    first_sign:
        slt $t5, $a0, $zero # se multiplicando menor que zero, t5 vale 1
        beq $t5, $zero, second_sign # se positivo, pula para second_sign
        addi $t4, $t4, 1 # incrementa contador de negativos
        addi $sp, $sp, -4 # abrir espaco na pilha para ra
        sw $ra, 0($sp) # armazenar ra na pilha
        jal convert_number # pular para convert_number 
        lw $ra, 0($sp) # recuperar ra
        addi $sp, $sp, 4 # remover espaco da pilha 

    # verificar sinal do multiplicador
    second_sign: 
        slt $t5, $a1, $zero # se multiplicador menor que zero, t5 vale 1
        beq $t5, $zero, start # se positivo, pula para start
        addi $t4, $t4, 1 # incrementa contador de negativos
        addi $sp, $sp, -4 # abrir espaco na pilha para ra
        sw $ra, 0($sp) # armazenar ra na pilha
        add $s0, $a0, $zero # armazenar multiplicando em s0
        add $a0, $a1, $zero # armazenar multiplicador em a0
        jal convert_number # pular para convert_number
        add $a1, $a0, $zero # armazenar multiplicador positivo em a1
        add $a0, $s0, $zero # armazenar multiplicando em a0
        lw $ra, 0($sp) # recuperar ra
        addi $sp, $sp, 4 # remover espaco da pilha  

    start:
        # inicializa o produto 
        add $s1, $a1, $zero # coloca o valor do multiplicador em s1
        add $s0, $zero, $zero # inicializa s0 em 0

        # inicializa contador e máscaras
        addi $t0, $zero, 0 # contador do loop da multiplicacao
        addi $t1, $zero, 1 # t1 recebe numero 1 de 32 bits 00...01
        sll $t2, $t1, 31 # deslocamento de 32 bits em t1 10...00 

    loop: 
        # Se bit menos significativo do produto for 1, adiciona multiplicando a s0
        and $t3, $t1, $s1 # armazenar bit menos significativo em t3
        beq $t3, $zero, shift_right # se bit menos significativo for 0, pula para shift_right
        add $s0, $s0, $a0 # somar multiplicando ao bit mais significativo 

    shift_right:
        and $t3, $s0, $t1 # t3 = HI[0]
        srl $s0, $s0, 1  # deslocar hi uma posicao para a direita
        srl $s1, $s1, 1 # deslocar lo uma posicao para a direita
        beq $t3, $zero, increment # se bit menos significativo de hi for 0, pula para increment
        addu $s1, $s1, $t2 # adiciona 2^31 a bit menos significativos

    increment:    
        slti $t3, $t0, 31  # verificar se o contador é menor que 31
        beq $t3, $zero, fix_sign # Se o contador for maior ou igual a 31, vai para fix_signal 
        addi $t0, $t0, 1 # incrementa contador
        j loop

    fix_sign:
        bne $t1, $t4, exit # se o contador de números negativos for igual a 1, o resultado será negativo
        nor $s0, $s0, $s0 # calcular complemento de 2
        nor $s1, $s1, $s1 
        addi $s1, $s1, 1

    exit:
        mthi $s0
        mtlo $s1 

        jr $ra     

    convert_number:
        addi $a0, $a0, -1 # negativiza 
        nor $a0, $a0, $a0 # nega todos bits
        jr $ra 