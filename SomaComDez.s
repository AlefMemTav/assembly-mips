.data
	str1: .asciiz "Enter a number:\n"
	str2: .asciiz "Sum: "
	str3: .asciiz "\n"

.text
	main:
		#Atribuir 10 em $t1
		li $t1, 10

		#Atribuir endereço de str1 a $a0
		la $a0, str1		
		#Chamar print_str
		li $v0, 4
		#Imprimir mensagem
		syscall

		#Chamar read_int
		li $v0, 5
		#Ler
		syscall
		#Armazenar inteiro lido em $t0
		add $t0, $v0, $zero

		#Somar inteiro lido com 10
		add $t0, $t0, $t1
		
		#Atribuir endereço de str2 a $a0
		la $a0, str2
		#Chamar print_str
		li $v0, 4
		#Imprimir mensagem
		syscall
		
		#Armazenar soma em $a0	
		add $a0, $t0, $zero
		#Chamar print_int
		li $v0, 1	
		#Imprimir soma
		syscall

		#Atribuir endereço de str3 a $a0
		la $a0, str3
		#Chamar print_str
		li $v0, 4
		#Imprimir
		syscall

		#Chamar exit
		li $v0, 10
		#Encerrar
		syscall