.data
hex:   .asciiz "0123456789ABCDEF"
msgingreso:  .asciiz "Ingrese un numero: "
msgsalida:  .asciiz  "Here is the output in hexadecimal: "
buffer: .space 100
salto:         .asciiz     "\n"
.text
 main:
 	li $v0,4
    	la $a0,msgingreso
    	syscall
    	li $v0,5
	syscall
	move $s0,$v0
	li $v0,4
	la $a0,msgsalida
    	jal hexadecimal
    	li  $v0,10
    	syscall
hexadecimal:
    li  $a2,4                   
    j   guardar
guardar:
    li      $t7,1
    sllv    $t7,$t7,$a2       
    subu    $t7,$t7,1              
    la      $t6,buffer            
    subu    $t6,$t6,1             
    sb      $zero,0($t6)            

    move    $t5,$s0                 
    j	    lazo
lazo:
    and     $t0,$t5,$t7            
    lb      $t0,hex($t0) 

    subu    $t6,$t6,1             
    sb      $t0,0($t6)             
    srlv    $t5,$t5,$a2            
    sub     $a1,$a1,$a2            
    bgtz    $a1,lazo      
    
imprimir:
    li      $v0,4
    syscall
    move    $a0,$t6           
    syscall
    la      $a0,salto
    syscall
    jr      $ra   


   	