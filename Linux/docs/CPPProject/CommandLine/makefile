all: main

main: main.o  
	g++ -o main main.o 
	
main.o: main.cpp
	g++ -c -g -F dwarf main.cpp
 
clean:
	rm -f ./main.o || true
	rm -f ./main || true
