/**
 * calculator.c
 * @author Ricardo Serrano
 * @author Alex Macas
 */

/**
 *Includes 
 */
#include "menu.h"

int main(){
	system("clear");
	int option = 0;
	
	do{
		showMenu();
		scanf("%d",&option);
		switch(option){
			case 1:
				opDecimalToBinary();
				break;
			case 2:
				opBinaryToDecimal();
				break;
			case 3:
				opDecimalToHexadecimal();
				break;
			case 4:
				opHexadecimalToDecimal();
				break;
			case 5:
				printf("Saliendo...\n");
				break;
			default:
				printf("Opcion incorrecta!\n");
		}
		
	}
	while(option != 5);

}