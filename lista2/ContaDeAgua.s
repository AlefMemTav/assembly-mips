# $t0 <= n
# $t1 <= 0-1
# $t2 preco da faixa
# $t3 valor a ser multiplicado

.data
.text

	main:
	
		li $v0, 5 # Chamar read_int
		syscall # Ler
		add $t0, $v0, $zero # Armazenar valor em $t0	

		# Verificar faixa de consumo

		slt $t1, $t0, 11 # ($t0 < 11) ? 1 : 0
		beq $t1, 1, consumoAteDez
		
		slt $t1, $t0, 31 # ($t0 < 31) ? 1 : 0
		beq $t1, 1, consumoAteTrinta

		slt $t1, $t0, 101 # ($t0 < 101) ? 1 : 0
		beq $t1, 1, consumoAteCem
		
		# Acima de cem
		li $t2, 167
		sub $t3, $t0, 100
    mul $t0, $t3, 5
    add $t2, $t2, $t0
		j fim

	consumoAteDez:
		li $t2, 7
    j fim

	consumoAteTrinta:
		li $t2, 7
		sub $t3, $t0, 10
    mul $t0, $t3, 1
    add $t2, $t2, $t0
		j fim

	consumoAteCem:
		li $t2, 27
		sub $t3, $t0, 30
    mul $t0, $t3, 2
    add $t2, $t2, $t0
		j fim

	fim:
	  add $a0, $t2, $zero
		li $v0, 1
		syscall
	
	li $v0, 10
	syscall