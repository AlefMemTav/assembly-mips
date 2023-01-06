.data
	msg1: .asciiz"\nDigite um numero: "
	msg2: .asciiz"\n"

.text
	main:
		li $t5, 0	#Zerar contador
		
		la $a0, msg1 #Atribuir endereço de msg1 a $a0
		li $v0, 4 #Chamar print_str
		syscall #Imprimir

		li $v0, 5 #Chamar read_int
		syscall #Ler
		add $t0, $v0, $zero #Armazenar inteiro lido em $t0

		enquanto:
			mul $t1, $t0, $t5 #Multiplicar inteiro lido pelo contador

			add $a0, $t1, $zero #Armazenar resultado $t1 em $a0
			li $v0, 1	#Chamar print_int
			syscall #Imprimir

			la $a0, msg2 #Atribuir endereço de msg2 a $a0
			li $v0, 4	#Chamar print_str
			syscall #Imprimir

			add $t5, $t5, 1 #Incrementar contador em 1

		ble $t5, 10, enquanto #Ramificar quando menor ou igual a 10
		
		#Quando maior que 10 sai 
		
		#Chamar exit
		li $v0, 10
		#Encerrar
		syscall