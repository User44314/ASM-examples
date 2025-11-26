all: main

main: main.o asmfunc.o
	gcc -o main main.o asmfunc.o
	
main.o: main.c
	gcc -c -g -F dwarf main.c

asmfunc.o: asmfunc.asm
	nasm -g -f elf64 -F dwarf asmfunc.asm -l asmfunc.lst
	
	
clean:
	rm -f ./main.o || true
	rm -f ./main || true
	rm -f ./asmfunc.o || true
	rm -f ./asmfunc.lst || true
	
