# $t0 <= n + 1
# stringSize inicializado com 0
# stringInput inicializado com 0
# stringInputDois inicializado com 0
# $t1 <= stringInput
# $t2 <= stringInputDois

.data
	stringInput: .space 80
	stringInputDois: .space 80
	stringSize: .word 0 
.text

	main:
		# Ler tamanho n dado pelo usuario
		li $v0, 5 # Chamar read_int
		syscall # Ler
		
		add $t0, $v0, 1 # Armazenar tamanho lido somado a 1 em $t0
		
		sw $t0, stringSize($zero) # Armazenar $t0 em stringSize

    # Ler string gabarito 
		li $v0, 8 # Chamar read_str
		la $a0, stringInput # Carregar endereco da string em $a0
    lw $a1, stringSize # Carregar tamanho em $a1
		add $t1, $a0, $zero
		syscall # Ler str

		# Ver stringInput
    li $v0, 4
    la $a0, stringInput
    syscall

	#Chamar exit
	li $v0, 10		
	#Encerrar
	syscall	