.data

.text
  main:
  	#Chamar read_int
    li $v0, 5
    #Ler
    syscall
    #Armazenar inteiro lido em $t0
    add $t0, $v0, $zero
    
    #Chamar read_int
    li $v0, 5
    #Ler
    syscall
    #Armazenar inteiro lido em $t1
    add $t1, $v0, $zero

    #Subtrair inteiros
    sub $t3, $t0, $t1
    
    #Armazenar subtracao em $a0
    add $a0, $t3, $zero
    #Chamar print_int
    li $v0, 1
    #Imprimir
    syscall

    #Chamar exit
		li $v0, 10
		#Encerrar
		syscall