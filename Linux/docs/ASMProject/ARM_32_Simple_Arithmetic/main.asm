/* Assembler ARM 32bit template */
.section .data
	msg: .ascii "Hello, ARM32!\n"
		len = . - msg

	dWordVar1:	.word 0x100
	dWordVar2:	.word 0x200


.section .bss

.section .text
.global _start

_start:
/* syscall write(int fd, const void *buf, size_t count) */
    mov r0, #1 
    ldr r1, =msg 
    ldr r2, =len 
    mov r7, #4 
    svc #0
    
    mov r0, #100
    mov r1, #200
    add r0, r0, r1
    
    mov r0, #100
    add r0, r0, #200
    
    sub r0, r0, #300
    sub r0, r0, r1
    

    ldr r3, =dWordVar1
    ldr	r0,	[r3]
    
    ldr r3, =dWordVar2
    ldr r1, [r3]
    add r0, r0, r1
    
    mov r0, #0xffffffff
    adds r0,r0, #1
    bcs	PrintError
    b endAll
    
    PrintError:
		mov r0, #1
    
    
    endAll:
    

/* syscall exit(int status) */
    mov r0, #0 
    mov r7, #1 
    svc #0

