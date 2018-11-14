.data
	mensajeEntrada:.asciiz "--------Menu---------\n"
	msgBinario: .asciiz "1:Convertir de decimal a binario\n"
	msgHex: .asciiz "2:Convertir de decimal a Hexadecimal\n"
	msgOpcion: .asciiz "Escoja una opcion: "
	msgResultado: .asciiz "\nEl resultado es: "
	msgIngreso: .asciiz "\nIngrese un numero: "
.text
	main:
		#Menu del proyecto
		addi $s0,$s0,1 #Guardo el valor 1 en el resgistro s0 para luego compararlo
		addi $s1,$s1,2 #Guardo el valor 2 en el resgistro s1 para luego compararlo 
		jal printMenu
		jal printOp1
		jal printOp2
		jal printEscogerOpcion
		jal ingresoOpcion
		jal printIngresarNumero
		jal ingresoNumero
		li $v0,10
		syscall
	printMenu:
		li $v0,4
		la $a0,mensajeEntrada
		syscall
		jr $ra
	printOp1:
		li $v0,4
		la $a0,msgBinario
		syscall
		jr $ra

	printOp2:
		li $v0,4
		la $a0,msgHex
		syscall
		jr $ra
	printEscogerOpcion:
		li $v0,4
		la $a0,msgOpcion
		syscall
		jr $ra
	ingresoOpcion:
		li $v0,5
		move $t0,$v0
		syscall
		jr $ra
	printIngresarNumero:
		li $v0,4
		la $a0,msgIngreso
		syscall
		jr $ra
	ingresoNumero:
		li $v0,5
		move $t1,$v0
		syscall
		jr $ra
	
	