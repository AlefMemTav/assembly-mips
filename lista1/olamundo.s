.data
  str: .asciiz "Ola Mundo\n"
.text 
	main:
		#Atribuir endereço de str a $a0
		la $a0, str
		#Chamar print_str
		li $v0, 4
		#Imprimir
		syscall				
		
		#Chamar exit
		li $v0, 10		
		#Encerrar
		syscall		