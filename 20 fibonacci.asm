.data
espacio: .asciiz "\n"

.text
.globl main
main:
  li $t0, 0
  li $t1, 1
  li $v0, 1
  move $a0, $t0
  syscall

  li $v0, 4
  la $a0, espacio
  syscall

  li $v0, 1
  move $a0, $t1
  syscall

  li $v0, 4
  la $a0, espacio
  syscall

  li $t3, 18
loop:
  beq $t3, $zero, exit

  add $t2, $t0, $t1

  li $v0, 1
  move $a0, $t2
  syscall

  li $v0, 4
  la $a0, espacio
  syscall

  move $t0, $t1
  move $t1, $t2

  addi $t3, $t3, -1
  j loop

exit:
  li        $v0, 10
  syscall                         # exit :D
