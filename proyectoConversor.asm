.data
	mensajeEntrada:.asciiz "--------Menu---------\n"
	msgBinario: .asciiz "1:Convertir de decimal a binario\n"
	msgdecimal: .asciiz "2:Convertir de binario a decimal\n"
	msgOpcion: .asciiz "Escoja una opcion: "
	msgResultado: .asciiz "\nEl resultado es: "
	msgIngreso: .asciiz "\nIngrese un numero: "
	cont: .word 1
	acu: .word 0
	suma: .word 0
.text
	main:
		#Menu del proyecto
		addi $s0,$s0,1 #Guardo el valor 1 en el resgistro s0 para luego compararlo
		addi $s1,$s1,2 #Guardo el valor 2 en el resgistro s1 para luego compararlo 
		addi $s5,$s5,10# variable la cual me permitira realizar una division para 10
		la $s6,cont # cargando la direccion de memoria de la variable cont
		la $s7,acu # cargando la direccion de memoria de la variable acu
		la $t8,suma # cargando la direccion de memoria de la variable suma
		li $s6,1 
		li $s7,0
		li $t8,0
#-------------------Funciones para imprimir un mensaje en consola------------------------------------------------------		
		jal printMenu 
		jal printOp1
		jal printOp2
		jal printEscogerOpcion
		jal ingresoOpcion
#--------------------------------------------------------------------------------------------------------------------
		move $t0,$v0 # variable a la cual se le asigna el valor pedido para luego comparar la opcion
#-------------------------Bloque en el cual se llaman a las funciones correspondientes para la conversion-----------------------------
		beq $t0,$s0,printbinario
		beq $t0,$s1,printdecimal
#------------------------------------------------------------------------------------------------------------------
		jal exit		
	exit:# funcion que permite terminar el programa
		li $v0,10
		syscall
#-------------------------Funciones que permiten imprimir un mensaje por consola------------------------------
	printMenu: # impreme por consola el mensaje "Menu"
		li $v0,4
		la $a0,mensajeEntrada
		syscall
		jr $ra
	printOp1: # impreme por consola el mensaje de primera opcion
		li $v0,4
		la $a0,msgBinario
		syscall
		jr $ra

	printOp2: # impreme por consola el mensaje de segunda opcion
		li $v0,4
		la $a0,msgdecimal
		syscall
		jr $ra
	printEscogerOpcion: # impreme un mensaje indicando ingresar un numero
		li $v0,4
		la $a0,msgOpcion
		syscall
		jr $ra
	ingresoOpcion:
		li $v0,5
		syscall
		jr $ra
	printIngresarNumero: # impreme un mensaje indicando ingresar un numero
		li $v0,4
		la $a0,msgIngreso
		syscall
		jr $ra
	ingresoNumero:
		li $v0,5
		syscall
		jr $ra
	printbinario: # permite accerder a la funcion respectiva para la conversion de deciaml a binario
		jal printIngresarNumero
		jal ingresoNumero
		move $t1,$v0
		jal binario
		jal exit
	printdecimal:# permite accerder a la funcion respectiva para la conversion de binario a decimal
		jal printIngresarNumero
		jal ingresoNumero
		move $t1,$v0
		jal decimal
#------------------------------------------------------------------------------------------------------------------------------
	binario: # funcion recursiva la cual me permite transformar un decimal a binario
		addi $sp, $sp, -8	# separo espacio en la memoria de sp para las variables $ra $s1
		sw	$ra, 4($sp)	
		sw	$s1, 0($sp)
		div $t1,$s1 #division del numero ingresado para obtener el cociente y residuo
		beq $t1,$zero,finalizarbinario # comparo si el cociente es igual a cero para terminar la funcion recursiva
		mflo $t1 # cociente
		mfhi $t2 #resisduo
		li $v0,1
		move $a0,$t2# muestro por consola el valor obtenido
		syscall
		jal	binario	# llamada recursiva
 	finalizarbinario: # funcion que permite terminar la conversion de deciaml a binario
		lw	$s1, 0($sp) # libero la memoria separada anteriormente 
		lw	$ra, 4($sp)	
		addi $sp, $sp, 8
		jr $ra	#retorno al proceso pirncipal "printbinario"
	decimal: # funcion recursiva para convertir un binario a decimal
		addi $sp,$sp,-8 #  separo espacio en la memoria de sp para las variables $ra $s5
		sw $ra,4($sp)
		sw $s5,0($sp)
		div $t1,$s5 #division del numero ingresado para obtener el cociente y residuo
		beq $t1,$zero,finalizardecimal # comparo si el cociente es igual a cero para terminar la funcion recursiva
		mflo $t1 #cociente
		mfhi $t2#residuo
		jal potencia #llamada al funcion que permite calcular la potencia
		jal decimal #llamada recursiva
	finalizardecimal:#funcion que me permite terminar la funcion
		lw $s5,0($sp)# libero la memoria separada anteriormente 
		lw $ra,4($sp)
		addi $sp,$sp,8
		li $v0,1
		move $a0,$t8#muestro el valor obtenido de la conversion 
		syscall
		jal exit #llamada a la funcion para terminar el proceso
	potencia:# funcion que me permite calcular y acumular el valor correspondiente segun la iteracion
		beq $s6,$s0,inicio# comparo si es la primera iteracion
		mul $t4,$t2,$s7 # multiplico el residuo obtenido el la division
		add $t8,$t8,$t4 #sumo el valor obtenido para ocumularse
		mul $t5,$s7,$s1 #incremneto la iteracion
		move $s7,$t5 #guardo el valor en un acumulador
		jr $ra# llamada la funcion principa "decimal"
	inicio:
		mul $t3,$t2,$s6 # multiplico el residuo obtenido el la division
		add $t8,$t8,$t3# multiplico el residuo obtenido el la division
		addi $s6,$s6,1#incremento la iteracion
		addi $s7,$s7,2#incremnto el acumualdor
		jal decimal #llamada la funcion principal
			
	
	
