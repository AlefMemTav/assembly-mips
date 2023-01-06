.data
  str: .asciiz "Ola Mundo\n"
.text 
	main:
		li $v0, 4			#Chamar print_str
		la $a0, str		#Atribuir endereço de str a $a0
		syscall				#Imprimir

		li $v0, 10		#Chamar exit
		syscall				#Encerrar