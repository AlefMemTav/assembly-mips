# $t0 <= i 
# $t1 <= n 
# $t2 <= nn
# $t3 <= M
# $t4 <= 0-1

.data
.text

	# Armazenar o valor das n repeticoes
	main:
		li $t0, 0 # Contador em zero
		li $t3, 0 # Inicializar maior numero em zero
		
		li $v0, 5 # Chamar read_int
		syscall # Ler
		add $t1, $v0, $zero # Armazenar n em $t1	

	while:
	beq $t0, $t1, fim # Se contador igual a n encerra 
		li $v0, 5 # Chamar read_int
		syscall # Ler
		add $t2, $v0, $zero # Armazenar novo numero (nn) em $t2	

		# Armazenar primeiro numero como o maior numero
		beq $t0, $zero, maiorNumero # Se contador for igual a zero
			
		# Armazenar maior numero encontrado
		slt $t4, $t3, $t2 # $t4 = ($t3 < $t2) ? 1 : 0
		beq $t4, 1, maiorNumero # Se nn for maior que M

		j contador

		# Armazer maior dos numeros
		maiorNumero:

			add $t3, $t2, $zero # Armazenar valor em $t3

			j contador
			
		contador:
			addi $t0, $t0, 1 # Incrementar $t1 em 1
		j while # Continua repeticao
	fim:
		
	# Imprimir maior dos numeros
	add $a0, $t3, $zero # Armazenar o maior numero em $a0
	li $v0, 1 # Chamar print_int
	syscall # Imprimir

	li $v0, 10 # Chamar exit
	syscall # Encerrar