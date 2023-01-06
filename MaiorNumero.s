.data
	msg1: .asciiz "\nDigite um numero: "
	msg2: .asciiz "\nO maior valor: "

.text
	main:
		
		#Escrever msg1
		li $v0, 4
		la $a0, msg1
		syscall

		li $v0, 5
		syscall
		add $t0, $v0, $zero

		li $v0, 4
		la $a0, msg1
		syscall

		li $v0, 5
		syscall
		add $t1, $v0, $zero

		li $v0, 4
		la $a0, msg2
		syscall

		bge $t0, $t1, se
		j senao


		se:
		li $v0, 1
		add $a0, $t0, $zero
		syscall
		j fimse
		
		senao:
		li $v0, 1
		add $a0, $t1, $zero
		syscall
		
		fimse:
	

