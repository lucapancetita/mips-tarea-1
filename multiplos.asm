.data
numbers: .word 300, 500
espacio: .asciiz "\n"
prompt: .asciiz "Elija una de las siguientes opciones:\n"
prompt2: .asciiz "Escriba 3 si quiere ver los multiplos de 3\n"
prompt3: .asciiz "Escriba 5 si quiere ver los multiplos de 5\n"
prompt4: .asciiz "Escriba 2 si quiere ver los multiplos de ambos\n"
prompt5: .asciiz "3\n"
prompt6: .asciiz "5\n"
titulo1: .asciiz "Multiplos de 3 \n"
titulo2: .asciiz "Multiplos de 5 \n"

.text
  .globl main
    main:
#Un programa que muestre los múltiplos de 3 y de 5 (o de ambos) para los primeros 100 números naturales.
      la        $t0, numbers       # guardo en $t0 la direccion de numbers
      lw        $t1, 0($t0)        # guardo en $t1 el 300
      lw        $t2, 4($t0)        # guardo en $t2 el 500

      addi $t3, $t3, 3
      addi $t4, $t4, 5

      li $v0, 4       # syscall code para imprimir un string
      la $a0, prompt  # cargamos la direccion del string
      syscall

      li $v0, 4       # syscall code para imprimir un string
      la $a0, espacio  # cargamos la direccion del string
      syscall

      li $v0, 4       # syscall code para imprimir un string
      la $a0, prompt2  # cargamos la direccion del string
      syscall

      li $v0, 4       # syscall code para imprimir un string
      la $a0, espacio  # cargamos la direccion del string
      syscall

      li $v0, 4       # syscall code para imprimir un string
      la $a0, prompt3  # cargamos la direccion del string
      syscall

      li $v0, 4       # syscall code para imprimir un string
      la $a0, espacio  # cargamos la direccion del string
      syscall

      li $v0, 4       # syscall code para imprimir un string
      la $a0, prompt4  # cargamos la direccion del string
      syscall

      li $v0, 5       # sycall code para leer un int
      syscall         # leemos el entero y el resultado esta en $v0
      move $t5, $v0   # movemos lo de v0 a t0 (el resultado de leer el entero)

      beq $t5, 3, hub3
      beq $t5, 5, hub5
      beq $t5, 2, hub3

    loop1:
      beq  $t3, $t1, revision

      li $v0, 4       # syscall code para imprimir un string
      la $a0, espacio  # cargamos la direccion del string
      syscall

      addi $t3, $t3, 3 #mutiplico  y lo guardo en t0

      li $v0, 4       # syscall code para imprimir un string
      la $a0, espacio  # cargamos la direccion del string
      syscall

      li $v0, 1
      move $a0, $t3 #muevo lo que esta en t3 a a0
      syscall


      j loop1

    hub3:
    li $v0, 4       # syscall code para imprimir un string
    la $a0, espacio  # cargamos la direccion del string
    syscall

    li $v0, 4       # syscall code para imprimir un string
    la $a0, titulo1  # cargamos la direccion del string
    syscall

    li $v0, 4       # syscall code para imprimir un string
    la $a0, espacio  # cargamos la direccion del string
    syscall

    li $v0, 4       # syscall code para imprimir un string
    la $a0, prompt5  # cargamos la direccion del string
    syscall

    j loop1


    hub5:
    li $v0, 4       # syscall code para imprimir un string
    la $a0, espacio  # cargamos la direccion del string
    syscall

    li $v0, 4       # syscall code para imprimir un string
    la $a0, titulo2  # cargamos la direccion del string
    syscall

    li $v0, 4       # syscall code para imprimir un string
    la $a0, espacio  # cargamos la direccion del string
    syscall

    li $v0, 4       # syscall code para imprimir un string
    la $a0, prompt6  # cargamos la direccion del string
    syscall

    j loop2


    revision:
    beq $t5, 3, exit
    beq $t5, 5, exit
    beq $t4,$t2, exit
    beq $t5, 2, hub5


    loop2:
      beq  $t4, $t2, revision

      li $v0, 4       # syscall code para imprimir un string
      la $a0, espacio  # cargamos la direccion del string
      syscall

      addi $t4, $t4, 5 #mutiplico  y lo guardo en t0

      li $v0, 4       # syscall code para imprimir un string
      la $a0, espacio  # cargamos la direccion del string
      syscall

      li $v0, 1
      move $a0, $t4 #muevo lo que esta en t3 a a0
      syscall
      j loop2





    exit:
      li        $v0, 10
      syscall                         # exit :D
