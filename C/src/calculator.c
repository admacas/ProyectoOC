#include "funciones.h"

int main(){

	for (int i = 0; i < 11; ++i){
		printf("El numero %d en binario es %d\n", i, decimalToBinary(i));
	}

	long binarios[5] = {1010, 1011, 1000, 1111, 0000};
	for (int i = 0; i < 5; ++i){
		printf("El numero %ld en decimal es %d\n", binarios[i], binaryToDecimal(binarios[i]));
	}

	decimalToHexadecimal(260743947);
	printf("%d\n",hexadecimalToDecimal("F8AA30B"));

}