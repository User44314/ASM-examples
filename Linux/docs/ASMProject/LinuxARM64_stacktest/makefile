all: main

main: main.o
	aarch64-linux-gnu-ld main.o -o main


main.o: main.asm
	aarch64-linux-gnu-as -g -a main.asm -o main.o > main.lst

clean:
	rm -f ./main.o || true
	rm -f ./main.lst || true
	rm -f ./main || true

debug1: main.o
	qemu-aarch64 -L /usr/aarch64-linux-gnu/ -g 1234 ./main

debug2: main.o
	gdb-multiarch -q --nh -ex 'set architecture arm64' -ex 'file main' -ex 'target remote localhost:1234' -ex 'layout split' -ex 'layout regs'	

