.data
	msg1: .asciiz"\nDigite um numero: "
	msg2: .asciiz"\n"
	msg3: .asciiz"\nValor de numero invalido"

.text
main:
	li $t5, 0									#Contador zerado
	
	li $v0, 4									#Escrever msg1
	la $a0, msg1
	syscall

	li $v0, 5    							#Ler inteiro
	syscall
	add $t0, $v0, $zero				#Adicionar valor lido em t0

	bgt $t0, 0 primeirose
	j primeirosenao

	primeirose:
	ble $t0, 10, segundose
	j segundosenao
	
	segundose:
	enquanto:

	mul $t1, $t0, $t5

	li $v0, 1									#Escrever valor
	add $a0, $t1, $zero
	syscall

	li $v0, 4									#Escrever msg2
	la $a0, msg2
	syscall

	add $t5, $t5, 1 					#Incrementa contador

	ble $t5, 10, enquanto  		#Se t5 for menor ou igual a 10
	j fimsegundose

	primeirosenao:
	li $v0, 4
	la $a0, msg3
	syscall
	j fimprimeirose

	segundosenao:
	li $v0,4
	la $a0, msg3
	syscall

	fimsegundose:
	fimprimeirose: