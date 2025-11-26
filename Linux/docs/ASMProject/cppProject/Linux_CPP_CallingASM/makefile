all: main

main: main.o asmfuncs.o
	g++ -o main main.o asmfuncs.o
	
main.o: main.cpp
	g++ -c -g -F dwarf main.cpp
	
asmfuncs.o: asmfuncs.asm
	nasm -g -f elf64 -F dwarf asmfuncs.asm -l asmfuncs.lst
	
clean:
	rm -f ./main.o || true
	rm -f ./main || true
	rm -f ./asmfuncs.o || true
	rm -f ./asmfuncs.lst || true
