# $t0 <= n + 1
# stringSize inicializado com 0
# stringInput inicializado com 0
# $t1 <= stringInput
# $t2 i contador do while
# $t3 j contador de acertos

.data
	stringInput: .space 80
	stringInputDois: .space 80
	stringSize: .word 0 
.text

	main:
		# Ler tamanho n dado pelo usuario
		li $v0, 5 # Chamar read_int
		syscall # Ler
		
		add $t0, $v0, 2 # Armazenar tamanho lido + 2 bytes em $t0
		
		sw $t0, stringSize($zero) # Armazenar $t0 em stringSize

    # Ler string gabarito 
		li $v0, 8 # Chamar read_str
		la $a0, stringInput # Carregar endereco de stringInput em $a0
    lw $a1, stringSize # Carregar tamanho em $a1
		syscall # Ler str

		add $t1, $a0, $zero # Salvar endereço da string em $t1

		# Ver stringInput
		la $a0, stringInput
    li $v0, 4
    syscall

		# Ler string prova 
		li $v0, 8 # Chamar read_str
		la $a0, stringInputDois # Carregar endereco de stringInput em $a0
    lw $a1, stringSize # Carregar tamanho em $a1
		syscall # Ler str

		add $t2, $a0, $zero # Salvar endereço da string em $t2

		# Ver stringInputDois
		la $a0, stringInputDois
    li $v0, 4
    syscall


	#Chamar exit
	li $v0, 10		
	#Encerrar
	syscall	