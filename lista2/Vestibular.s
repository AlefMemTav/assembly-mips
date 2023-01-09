# $t0 <= n + 2
# $t1 <= stringInput
# $t2 <= stringInputDois
# $t3 <= i
# $t4 <= char string1
# $t5 <= char string2
# $t6 <= acertos

# stringSize <= n + 2

.data
	stringInput: .space 80
	stringInputDois: .space 80
	stringSize: .word 0 
.text

	main:
		li $t3, 0 # Contador while
		li $t6, 0 # Contador de acertos

		li $v0, 5 # Chamar read_int
		syscall # Ler
		
		add $t0, $v0, 2 # Armazenar em $t0 o tamanho lido + 2 bytes 

		sw $t0, stringSize($zero) # Armazenar $t0 em stringSize
	
		# GABARITO
  
		# Ler gabarito 
	
		li $v0, 8 # Chamar read_str
		la $a0, stringInput # Carregar stringInput em $a0
    lw $a1, stringSize # Carregar stringSize em $a1
		syscall # Ler str
	
		# Salvar gabarito

		add $t1, $a0, $zero # Salvar string1 em $t1

		# PROVA

		# Ler prova

		li $v0, 8 # Chamar read_str
		la $a0, stringInputDois # Carregar stringInputDois em $a0
    lw $a1, stringSize # Carregar stringSize em $a1
		syscall # Ler str

		# Salvar prova

		add $t2, $a0, $zero # Salvar string2 em $t2
		
		sub $t0, $t0, 2 # 

		while:
		beq $t3, $t0, fim
			addi $t3, $t3, 1 # i++

			lb $a0, 0($t1) # Ler byte da string1
			add $t4, $a0, $zero

			lb $a0, 0($t2) # Ler byte da string2
			add $t5, $a0, $zero

			addi $t1, 1 # Avancar byte da string1
			addi $t2, 1 # Avancar byte da string2
			
			beq $t4, $t5, acerto
			j while
			
			acerto:
				add $t6, $t6, 1
			
			j while
		fim:

		add $a0, $t6, $zero # Armazenar acertos em $a0
		li $v0, 1 # Chamar print_int
		syscall # Imprimir

	#Chamar exit
	li $v0, 10	
	#Encerrar
	syscall