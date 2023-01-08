.data
	msg1: .asciiz "\nDigite um numero: "
	msg2: .asciiz "\nO maior valor: "

.text
	main:
		#Atribuir endereço de msg1 a $a0
		la $a0, msg1
		#Chamar print_str
		li $v0, 4
		#Imprimir
		syscall

		#Chamar read_int
		li $v0, 5
		#Ler
		syscall
		#Armazenar inteiro em $t0
		add $t0, $v0, $zero

		#Atribuir endereço de msg1 a $a0
		la $a0, msg1
		#Chamar print_str
		li $v0, 4
		#Imprimir
		syscall

		#Chamar read_int
		li $v0, 5
		#Ler
		syscall
		add $t1, $v0, $zero

		#Atribuir endereço de msg2 a $a0
		la $a0, msg2
		#Chamar print_str
		li $v0, 4
		#Imprimir
		syscall

		#Ramificar quando maior ou igual
		bge $t0, $t1, se
		j senao

		se:
			#Armazenar $t0 em $a0 
			add $a0, $t0, $zero
			#Chamar print_int
			li $v0, 1
			#Imprimir
			syscall
		#Pular para fimse
		j fimse
		
		senao:
			#Armazenar $t1 em $a0 
			add $a0, $t1, $zero
			#Chamar print_int
			li $v0, 1
			#Imprimir
			syscall
		#Encerrar o se
		fimse:
		
		#Chamar exit
		li $v0, 10
		#Encerrar
		syscall