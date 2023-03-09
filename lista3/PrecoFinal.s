.data 
  c100: .double 100.0
.text
main:
  # custo

  li $v0, 7 # read_double
  syscall 
  mov.d $f2, $f0

  # percentual de lucro

  syscall 
  mov.d $f4, $f0
  
  # percentual de impostos mais percentual de lucro

  syscall
  add.d $f4, $f4, $f0

  l.d $f6, c100

  div.d $f4, $f4, $f6
  mul.d $f4, $f4, $f2
  add.d $f12, $f2, $f4

  li $v0, 3 # print_double
  syscall 

  li $v0, 10 # exit
  syscall 