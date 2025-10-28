all: main

main: main.o someFunctions.o
	ld  main.o someFunctions.o -o main

main.o: main.asm
	nasm -g -f elf64 -F dwarf main.asm -l main.lst

someFunctions.o: someFunctions.asm
	nasm -g -f elf64 -F dwarf someFunctions.asm -l someFunctions.lst

clean:
	rm -f ./main.o || true
	rm -f ./someFunctions.o || true
	rm -f ./someFunctions.lst || true
	rm -f ./main.lst || true
	rm -f ./main || true
