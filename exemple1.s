#Somar numero digitado com 10

.data
msg1: .asciiz "\nEnter a number: "
msg2: .asciiz "\nSum: "

.text
main:

	li $t1, 10				#Atribuir 10 to t1 

	li $v0, 4				#Escrever msg1
	la $a0, msg1
	syscall

	li $v0, 5	 				#Ler inteiro
	syscall
	add $t0, $v0, $zero

	add $t0, $t0, $t1 	#Adicionar 10
	
	li $v0, 4 				#Escrever msg2
	la $a0, msg2
	syscall
	
	li $v0, 1
	add $a0, $t0, $zero
	syscall