/**
 * operaciones.c
 * @author Ricardo Serrano
 * @author Alex Macas
 */

/**
 *Includes 
 */
#include "operaciones.h"


/**
 * Metodo recursivo que convierte un numero decimal a binario
 * @param decimal, el numero decimal a convertir
 * @return el decimal convertido en binario
 */ 
long decimalToBinary(int decimal){
	if(decimal < 2){
		return decimal;
	}
	return ((decimal%2) + decimalToBinary(decimal/2)*10);
}

/**
 * Metodo que convierte un numero binario en decimal
 * @param binary, el numero binario a convertir
 * @return decimal, un numero decimal
 */
int binaryToDecimal(long binary){
	int decimal = 0; 
	int remainder;
	int temp = 0; 
    while (binary!=0){
        remainder = binary % 10;
        binary = binary / 10;
        decimal = decimal + remainder*pow(2,temp);
        temp++;
    }
    return decimal;
}

/**
 * Metodo que convierte un numero decimal en hexadecimal
 * @param decimal, el numero decimal a convertir
 */
void decimalToHexadecimal(int decimal){    
	char* hexadecimal = malloc(sizeof(char*));
    int i = 0; 
    while(decimal!=0){
        int temp  = 0; 
        temp = decimal % 16; 
        if(temp < 10){ 
            hexadecimal[i] = temp + 48; 
        } 
        else{ 
            hexadecimal[i] = temp + 55; 
        } 
        i++;
        decimal = decimal/16; 
    } 
      
    for(int j=i-1; j>=0; j--){
        printf("%c", hexadecimal[j]); 
    }
    printf("\n");
    free(hexadecimal);
} 

/**
 * Metodo que convierte un numero hexadecimal en decimal
 * @param hexadecimal, cadena que representa un numero hexadecimal
 * @return decimal, un numero decimal 
 */
int hexadecimalToDecimal(char* hexadecimal){    
    int len = strlen(hexadecimal); 
    int base = 1;   
    int decimal = 0; 
    for (int i = len-1; i >= 0; i--){     
        if (hexadecimal[i] >= '0' && hexadecimal[i] <= '9'){ 
            decimal += (hexadecimal[i] - 48)*base; 
        } 
        else if (hexadecimal[i] >= 'A' && hexadecimal[i] <= 'F'){ 
            decimal += (hexadecimal[i] - 55)*base; 
        } 
        base *= 16;
    } 
    return decimal; 
} 
