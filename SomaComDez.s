.data
	str1: .asciiz "Enter a number:\n"
	str2: .asciiz "Sum:\n"

.text
	main:
		li $t1, 10					#Atribuir 10 em $t1

		li $v0, 4						#Chamar print_str
		la $a0, str1				#Atribuir endereço de str1 a $a0
		syscall							#Imprimir

		li $v0, 5						#Chamar read_int
		syscall							#Ler
		add $t0, $v0, $zero	#Armazenar inteiro lido em $t0

		add $t0, $t0, $t1		#Somar inteiro lido com 10
		
		li $v0, 4						#Chamar print_str
		la $a0, str2				#Atribuir endereço de str2 a $a0
		syscall							#Imprimir
		
		li $v0, 1						#Chamar print_int						
		add $a0, $t0, $zero	#Armazenar soma em $a0
		syscall							#Imprimir soma

		li $v0, 10					#Chamar exit
		syscall							#Encerrar