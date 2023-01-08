.data
.text
	main:
		li $t0, 0 # Contador em zero
		li $t1, 5 # Valor máximo de repetição

	while: 
		beq $t0, $t1, fim # Se $t0 for igual a $t1 vai para fim
			
			add $a0, $t0, $zero # Armazenar $t0 em $a0
			li $v0, 1 # Chamar print_int
			syscall # Imprimir
			
			addi $t0, $t0, 1 # Incrementa contador em 1

		j while # Continua repeticao
	fim:

	li $v0, 10 # Chamar exit
	syscall # Encerrar