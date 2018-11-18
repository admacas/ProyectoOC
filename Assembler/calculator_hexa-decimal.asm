.data
	msg: .asciiz "Ingrese numero decimal para convertir a hexadecimal: "
	ans: .asciiz "\nEquivalente en Hexadeciamal: "
	result: .space 8

.text
.globl main

main:
	la $a0, msg     
	li $v0, 4     
	syscall     

	li $v0, 5     
	syscall     

	move $t2, $v0     
	la $a0, ans     
	li $v0, 4     
	syscall     

	li $t0, 8               # Contador     
	la $t3, result 		# La respuesta sera almacenada aqui

Loop:
	beqz $t0, Exit		# Salta a Exit si el contador es igual a cero
	rol $t2, $t2, 4		# Rota 4 bits a la izquierda
	and $t4, $t2, 0xf	# Mascara con 1111
	ble $t4, 9, Sum		
	addi $t4, $t4, 55
	b End

Sum:
	addi $t4, $t4, 48   	# Sumo 48 al resultado

End: 
	sb $t4, 0($t3)		# Almaceno el digito hexadecimal en result
	addi $t3, $t3, 1 	# Incremento el counter de la direccion
	addi $t0, $t0, -1 	# Decremento el contador del loop
	j Loop

Exit:
	la $a0, result
	li $v0, 4
	syscall

	la $v0, 10
	syscall
