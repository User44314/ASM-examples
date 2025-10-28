/* ARM 64-bit assembly template */


.extern AddTwo
.section .data
msg:
.ascii "Hello, ARM64!\n"
len = . - msg

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
    nop
    
    
    ldr x1, = 0x10
    ldr x2, = 0x20
    bl AddTwo
    nop
    
	/* old variant 
	b AddTwo
	retAddTwo:
	//bunch of stuf
	b AddTwo
	retAddTwoB:
	*/
	
/* syscall exit(int status) */
    mov x0, #0 
    mov w8, #93 
    svc #0



/*

//description add the two integer argment
//inputs: x1 aand x2 will be used as afruments
// outputs: x0 will contain the result
//example:
	//ldr x1, = 0x10
	//ldr x2, = 0x20
	//bl AddTwo
    
AddTwo:
	sub sp, sp, 16  //backup our return address
	str x30, [sp]  //
	bl AddThree
	nop
	ldr x0, =0x0
	add x0, x1, x2
	nop
	ldr x30, [sp]  //restore our x30 return register
	add sp, sp, 16  //
	
ret


AddThree:
	sub sp, sp, 16  //backup our return address
	str x30, [sp]  //
	nop
	ldr x30, [sp]  //restore our x30 return register
	add sp, sp, 16  //
ret

//b	retAddTwo


*/


