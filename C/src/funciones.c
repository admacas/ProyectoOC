#include "funciones.h"

int decimalToBinary(int decimal){
	if(decimal < 2){
		return decimal;
	}
	return ((decimal%2) + decimalToBinary(decimal/2)*10);
}

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

void decimalToHexadecimal(int n){    
	char* hexadecimal = malloc(sizeof(char*));
    int i = 0; 
    while(n!=0){
        int temp  = 0; 
        temp = n % 16; 
        if(temp < 10){ 
            hexadecimal[i] = temp + 48; 
        } 
        else{ 
            hexadecimal[i] = temp + 55; 
        } 
        i++;
        n = n/16; 
    } 
      
    for(int j=i-1; j>=0; j--){
        printf("%c", hexadecimal[j]); 
    }
    printf("\n");
    free(hexadecimal);
} 

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