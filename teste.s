.data
$soma: .asciiz  "soma: \n" #declara variavel soma como 'soma: \n'
$subtracao: .asciiz "\nsubtracao: \n" #declara variavel subtracao como 'subtracao: \n'
$multiplicacao: .asciiz "\nmultiplicacao: \n" #declara variavel multiplicacao como 'multiplicacao: \n'
$divisao: .asciiz "\ndivisao: \n" #declara variavel divisao como 'divisao: \n'

.text
main:
	li $s0, 10 #insere o valor 10 no registrador $s0
	li $s1, 2 #insere o valor 2 no registrador $s1
	
	add $s2, $s0, $s1 #soma os valores dos registradores $s0 e $s1 e insere o resultado no registrador $s2
	sub $s3, $s0, $s1 #subtrai os valores dos registradores $s0 e $s1 e insere o resultado no registrador $s2
	mul $s4, $s0, $s1 #multiplica os valores dos registradores $s0 e $s1 e insere o resultado no registrador $s2
	div $s5, $s0, $s1 #divide os valores dos registradores $s0 e $s1 e insere o resultado no registrador $s2
	
	li $v0,4 #comando de impressão de string na tela
	la $a0, $soma #coloca o texto soma para ser impresso
	syscall # efetua a chamada ao sistema
	
	li $v0,1 #comando de impressão de inteiro na tela
	la $a0, ($s2) #coloca o registrador $s2 para ser impresso
	syscall # efetua a chamada ao sistema
	
	li $v0,4 #comando de impressão de string na tela
	la $a0, $subtracao #coloca o texto subtração para ser impresso
	syscall # efetua a chamada ao sistema
	
	li $v0,1 #comando de impressão de inteiro na tela
	la $a0, ($s3) #coloca o registrador $s3 para ser impresso
	syscall # efetua a chamada ao sistema
	
	li $v0,4 #comando de impressão de string na tela
	la $a0, $multiplicacao #coloca o texto multiplicacao para ser impresso
	syscall # efetua a chamada ao sistema

	li $v0,1 #comando de impressão de inteiro na tela		
	la $a0, ($s4) #coloca o registrador $s4 para ser impresso
	syscall # efetua a chamada ao sistema
	
	li $v0,4 #comando de impressão de string na tela
	la $a0, $divisao #coloca o texto divisao para ser impresso
	syscall # efetua a chamada ao sistema

	li $v0,1 #comando de impressão de inteiro na tela		
	la $a0, ($s5) #coloca o registrador $s5 para ser impresso
	syscall # efetua a chamada ao sistema

	li $v0, 10 # comando de exit
	syscall # efetua a chamada ao sistema