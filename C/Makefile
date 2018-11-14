CC = gcc
CFLAGS = -Wall -I ./include
LIB = -lm

.PHONY: all
all: calculator

calculator: src/calculator.o src/funciones.o 
	$(CC) $(CFLAGS) -o $@ $^ $(LIB)

calculator.o: src/calculator.c
	$(CC) $(CFLAGS) -c $^

funciones.o: src/funciones.c
	$(CC) $(CFLAGS) -c $^

.PHONY: clean
clean:
	rm -f src/*.o calculator