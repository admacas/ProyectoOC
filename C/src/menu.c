/**
 * menu.c
 * Implementacion de metodos para la interaccion con el usuario.
 * @author Ricardo Serrano
 * @author Alex Macas
 */

/**
 *Includes 
 */
#include "menu.h"

/**
 * Metodo que muestra por pantalla todas las opciones del programa
 */
void showMenu(){
    printf("===========================================\n");
    printf("||Calculadora Decimal-Binario-Hexadecimal||\n");
    printf("===========================================\n");
    printf("||1. Decimal a Binario                   ||\n");
    printf("||2. Binario a Decimal                   ||\n");
    printf("||3. Decimal a Hexadecimal               ||\n");
    printf("||4. Hexadecimal a Binario               ||\n");
    printf("||5. Salir                               ||\n");
    printf("===========================================\n");
    printf("Escoja una Opcion: ");
}

/**
 * Opcion para convertir de Decimal a Binario
 */
void opDecimalToBinary(){
    int decimal;
    printf("Ingrese un numero decimal entero positivo: ");
    scanf("%d", &decimal);
    printf("Binario: %ld\n", decimalToBinary(decimal));
}

/**
 * Opcion para convertir de Binario a Decimal
 */
void opBinaryToDecimal(){
    long binary;
    printf("Ingrese un numero binario: ");
    scanf("%ld", &binary);
    printf("Decimal: %d\n", binaryToDecimal(binary));
}

/**
 * Opcion para convertir de Decimal a Hexadecimal
 */
void opDecimalToHexadecimal(){
    int decimal;
    printf("Ingrese un numero decimal entero positivo: ");
    scanf("%d", &decimal);
    decimalToHexadecimal(decimal);
}

/**
 * Opcion para convertir de Hexadecimal a Decimal
 */
void opHexadecimalToDecimal(){
    char* hexadecimal = malloc(sizeof(char *));
    printf("Ingrese un numero hexadecimal: ");
    scanf("%s", hexadecimal);
    strUpper(hexadecimal);
    printf("Decimal: %d\n", hexadecimalToDecimal(hexadecimal));
    free(hexadecimal);
}

/**
 * Transforma una cadena a mayusculas
 * @param string, la cadena a transformar
 */
void strUpper(char* string){
    for(int i = 0; i < strlen(string); i++){
        string[i] = toupper(string[i]);
    }
}