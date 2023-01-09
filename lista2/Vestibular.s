# $t0 <= n + 2
# $t1 <= stringInput
# $t2 <= stringInputDois
# $t4 <= i

# stringSize <= n + 2

.data
	stringInput: .space 80
	stringInputDois: .space 80
	stringSize: .word 0 
	str: .asciiz"\n"
.text

	main:
		li $t4, 0 # Contador
		
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

		# Ver gabarito

		la $a0, stringInput
    li $v0, 4
    syscall

		# PROVA

		# Ler prova

		li $v0, 8 # Chamar read_str
		la $a0, stringInputDois # Carregar stringInputDois em $a0
    lw $a1, stringSize # Carregar stringSize em $a1
		syscall # Ler str

		# Salvar prova

		add $t2, $a0, $zero # Salvar string2 em $t2

		# Ver prova

		la $a0, stringInputDois
    li $v0, 4
    syscall

		while:
		beq $t0, $t4, fim  
			lb $a0, 0($t1) # Ler byte da string
			li $v0, 11 # Chamar print_char
			syscall # Imprimir
			
			addi $t1, 1 # Avancar byte da string
			addi $t4, $t4, 1 # i++

			# Imprimir quebra de linha
			la $a0, str	# Atribuir quebra de linha em $a0	
			li $v0, 4 #Chamar print_str
			syscall #Imprimir

			j while
		fim:

	#Chamar exit
	li $v0, 10	
	#Encerrar
	syscall