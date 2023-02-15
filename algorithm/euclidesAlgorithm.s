.data
.text
  main:
    li $a0, 2 # carrega valor em a0
    li $a1, 20 # carrega valor em a1
    li $t3, -1
    li $t4, 0 # bandeira troca de sinal
    li $t5, 0 # bandeira sinal negativo

    jal divfac

    li $v0, 10
	  syscall

  divfac:
    add $s0, $a0, $zero # dividendo em s0
    add $s1, $a1, $zero # divisor em s1
    li $s2, 0 # contador do quociente em zero
    beq $s1, $zero, end # se o divisor é zero, pula para end

    # sinal do dividendo
    less_than_zero:
      slt $t0, $s0, $zero # verificar se dividendo é menor que zero
      slt $t1, $s1, $zero # verificar se divisor é menor que zero
      beq $t0, $zero, verify_sign # se dividendo maior que zero, pula para verify_sign
      addi $t5, $t5, 1 # bandeira de dividendo menor que zero

    # verificar sinais iguais
    verify_sign:
      beq $t0, $t1, same_sign # se dividendo e divisor tem o mesmo sinal, pula para same_sign
      j different_sign

    # sinais iguais, verificar se positivos
    same_sign:
      beq $t5, $zero, while # se sinais positivos, pula para while
      j negative_sign # trocar sinal negativo do dividendo e divisor

    # sinais iguais e negativos
    negative_sign:
      mul $s0, $s0, $t3
      mul $s1, $s1, $t3
      addi $t4, $t4, 1 # bandeira de troca de sinal
      j while

    # sinais diferentes
    different_sign:
      beq $t5, $zero, change_divider_sign # se dividendo for positivo, trocar sinal negativo do divisor
      j change_dividend_sign # trocar sinal negativo do dividendo

    change_dividend_sign:
      mul $s0, $s0, $t3
      addi $t4, $t4, 2 # bandeira de troca de sinal
      j while

    change_divider_sign:
      mul $s1, $s1, $t3
      addi $t4, $t4, 3 # bandeira de troca de sinal
      j while

    while:
      slt $t2, $s0, $s1
      beq $t2, $zero, if # se dividendo maior que divisor, pula para if
      j else
      if:
        addi $s2, $s2, 1 # incrementa o contador para o quociente
        sub $s0, $s0, $s1 # decrementa o resto
        beq $s0, $zero, else # se resto igual a zero, pula para else
        j while
      else:
        beq $t4, 1, restore_sign_1 # trocar sinal do resto
        beq $t4, 2, restore_sign_2 # trocar sinal do resto e quociente
        beq $t4, 3, restore_sign_3 # trocar sinal do quociente
        j end

    restore_sign_1: 
      mul $s0, $s0, $t3
      j end

    restore_sign_2:
      mul $s0, $s0, $t3
      mul $s2, $s2, $t3
      j end

    restore_sign_3:
      mul $s2, $s2, $t3
      j end

    end:
      mthi $s0 # salva o resto em hi
      mtlo $s2 # salva o quociente em lo

      mflo $a0 # imprimir quociente
      li $v0, 1
      syscall

      mfhi $a0 # imprimir resto
      li $v0, 1
      syscall

      jr $ra  