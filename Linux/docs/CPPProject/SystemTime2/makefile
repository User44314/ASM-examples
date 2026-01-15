all: main

main: main.o  
	gcc -o main main.o 
	
main.o: main.c
	gcc -c -g -F dwarf main.c
 
clean:
	rm -f ./main.o || true
	rm -f ./main || true
