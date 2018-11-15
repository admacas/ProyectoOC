CC = gcc
CFLAGS = -Wall -I ./include
LIB = -lm

.PHONY: all
all: calculator

calculator: src/calculator.o src/operaciones.o src/menu.o
	$(CC) $(CFLAGS) -o $@ $^ $(LIB)

calculator.o: src/calculator.c
	$(CC) $(CFLAGS) -c $^

funciones.o: src/operaciones.c
	$(CC) $(CFLAGS) -c $^

menu.o: src/menu.c
	$(CC) $(CFLAGS) -c $^

.PHONY: clean
clean:
	rm -f src/*.o calculator