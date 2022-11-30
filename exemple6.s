.data
  msg1: .asciiz "Ola Mundo\n"

.text 
main:

	li $v0, 4
	la $a0, msg1
	syscall