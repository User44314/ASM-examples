/* ARM 64-bit assembly template */

.section .data
msg:
.ascii "Hello, ARM64!\n"
len = . - msg

	dWordVar:	.dword	0x1122334455667788
	wordVar:	.word 	0xaabbccdd
	byteVar:	.byte 	'A'
	sByteVar:	.byte 	-10
	hWordVar:	.hword	999
	
	dWordVar2:	.dword	0
	
	

.section .bss

.section .text
.global _start

_start:
/* syscall write(int fd, const void *buf, size_t count) */
    mov x0, #1     
    ldr x1, =msg 
    ldr x2, =len 
    mov w8, #64 
    svc #0


	//move some literales or immidiate values into our register
	
	mov x0,	#100 //move the decimal value 100 into x0
	mov x1, #0x100 // move the hexadecimal value 100 into x1
	
	//move some register values into other register
	
	mov x3,	x0
	mov x4, x1
	
	//move some data from variables into our registers
	//1) move the address of the variable into a registers
	//2) deference that register and  put that data into a register
	
	ldr x3, =dWordVar // put the address of dWordVar into x3
	ldr x0, [x3]
	
	//move a word into X0
	
	ldr x3, =wordVar
	ldr w0, [x3]
	
	//move a byte into x0
	
	ldr	x3, 	=byteVar
	ldrb	w0, [x3]

	//move a signed byte into x0
	ldr	x3, 	=sByteVar
	ldrsb	w0, [x3]
	
	ldr		x3, =hWordVar
	ldrh	w0, [x3]
	ldrsh	w0, [x3]
	
	ldr	x3,	=dWordVar2
	str	x0, [x3]
	
	
	strb	w0,	[x3]
	strh	w0,	[x3]
	
	
/* syscall exit(int status) */

    mov x0, #0 
    mov w8, #93 
    svc #0

