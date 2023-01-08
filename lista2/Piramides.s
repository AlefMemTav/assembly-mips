# $t0 <= n
# $t1 <= i
# $t2 <= j
# $t3 <= 0-1 

.data
	str1: .asciiz" "
	str2: .asciiz"\n"
.text

	main:
		li $t1, 0 # Contador i em zero
		li $t2, 0 # Contador j em zero
		
		li $v0, 5 #Chamar read_int
		syscall #Ler
		add $t0, $v0, $zero #Armazenar inteiro lido em $t0
	
	# Primeira piramide

	whileUm: 
	beq $t1, $t0, fimUm # Se i == n encerra
		
		# Incrementar primeira repeticao
		addi $t1, $t1, 1 # i++

		whileDois:
		beq $t2, $t1, fimDois # Se j == i encerra
			
			# Incrementar segunda repeticao
			addi $t2, $t2, 1 # j++
			
			slt $t3, $t1, 10 # ($t1 < 10) ? 1 : 0
			beq $t3, 1, imprimirZeroPiramideUm # Se for maior que 10
			beq $t3, 0, naoImprimirZeroPiramideUm # Se for maior ou igual a 10
			
			imprimirZeroPiramideUm:
				li $a0, 0
				li $v0, 1 # Chamar print_int
				syscall # Imprimir
			
			naoImprimirZeroPiramideUm:
			
			# Imprimir numero
			add $a0, $t1, $zero # Armazenar valor em $a0
			li $v0, 1 # Chamar print_int
			syscall # Imprimir

			# Imprimir espaco
			la $a0, str1	# Atribuir str1 em $a0	
			li $v0, 4 #Chamar print_str
			syscall #Imprimir

		j whileDois
		fimDois:
			
			# Zerar contador j
			li $t2, 0 # Contador j em zero

			# Imprimir quebra de linha
			la $a0, str2	# Atribuir str2 em $a0	
			li $v0, 4 #Chamar print_str
			syscall #Imprimir
			
			j whileUm # Continua repeticao
	fimUm:

	# Imprimir quebra de linha
	la $a0, str2	# Atribuir str2 em $a0	
	li $v0, 4 #Chamar print_str
	syscall #Imprimir

	# Segunda piramide
		li $t1, 0 # Contador i em zero
		li $t2, 0 # Contador j em zero
	
	whileTres: 
	beq $t1, $t0, fimTres # Se i == n encerra
		
		# Incrementar primeira repeticao
		addi $t1, $t1, 1 # i++
		
		whileQuatro:
		beq $t2, $t1, fimQuatro # Se j == i encerra
			
			# Incrementar segunda repeticao
			addi $t2, $t2, 1 # j++

			slt $t3, $t2, 10 # ($t2 < 10) ? 1 : 0
			beq $t3, 1, imprimirZero # Se for maior que 10
			beq $t3, 0, naoImprimirZero # Se for maior que 10
			
			imprimirZero:
				li $a0, 0
				li $v0, 1 # Chamar print_int
				syscall # Imprimir
			
			naoImprimirZero:

			# Imprimir numero
			add $a0, $t2, $zero # Armazenar valor do contador em $a0
			li $v0, 1 # Chamar print_int
			syscall # Imprimir

			# Imprimir espaco
			la $a0, str1	# Atribuir str1 em $a0	
			li $v0, 4 #Chamar print_str
			syscall #Imprimir

		j whileQuatro
		fimQuatro:
			# Zerar contador j
			li $t2, 0 # Contador j em zero
			
			# Imprimir quebra de linha
			la $a0, str2	# Atribuir str2 em $a0	
			li $v0, 4 #Chamar print_str
			syscall #Imprimir
			
			j whileTres # Continua repeticao
	fimTres:

	li $v0, 10 # Chamar exit
	syscall # Encerrar