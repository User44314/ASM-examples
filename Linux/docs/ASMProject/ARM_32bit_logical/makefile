all: main

main: main.o
	arm-linux-gnueabihf-ld -static main.o -o main

main.o: main.asm
	arm-linux-gnueabihf-as -g -a main.asm -o main.o > main.lst

clean:
	rm -f ./main.o || true
	rm -f ./main.lst || true
	rm -f ./main || true

debug1:
	qemu-arm -L /usr/arm-linux-gnueabihf -g 1234 ./main

debug2:
	gdb-multiarch -q --nh -ex 'set architecture arm' -ex 'file main' -ex 'target remote localhost:1234' -ex 'layout split' -ex 'layout regs'

