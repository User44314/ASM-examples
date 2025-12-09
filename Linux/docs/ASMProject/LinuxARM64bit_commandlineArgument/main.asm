/* ARM 64-bit assembly template */

.section .data
Hellomsg: .ascii "Hello, ARM64!\n"
	Hellomsg_len = . - Hellomsg
	
Byemsg: .ascii "Programming anding have a nice day!\n"
	Byemsg_len = . - Byemsg 
	
Newline: .ascii "\n"
	Newline_len = . - Newline

.section .bss

.section .text
.global _start

_start:
/* syscall write(int fd, const void *buf, size_t count) */
    mov x0, #1     
    ldr x1, =Hellomsg 
    ldr x2, =Hellomsg_len 
    mov w8, #64 
    svc #0
    
    
    
    ldr x4, [sp]   /*copy the numner of arguments into x4*/
	mov x5, #8    /* adress offset from the stack poijnter to strt */
	
	mainLoop:
		mov x0, #1
		mov x2, sp
		add x2, x2, x5
		ldr x1, [x2]  /*put that de-refffernce adress  into x1*/
		ldr x3, [x2]   /*put that de-refffernce adress  into x3*/
		bl x3Length   /*get the lenght of the string in x3 into x2 */
		mov w8, #64   /*write to stdout */
		svc #0     /*tickle the kernel*/
		bl printNewLine 
		add x5, x5, #8   /* go to the next arguments */
		sub x4, x4, #1   /*subtract from out argument counter*/
		cmp x4, #00   /* are we in the end of our arguments */ 
		beq endAll   /*yes so lets end the loop */
   b mainLoop
   
   endAll:
	nop
	nop
    
    mov x0, #1     /*write */
    mov x2, sp    /*(stack pointer) The adress of the top pf the stack    */  
    add x2, x2, #8   /*go to the first agrument address in the stack*/
    ldr x1, [x2]  /*put that de-refffernce adress  into x1*/
    ldr x3, [x2]   /*put that de-refffernce adress  into x3*/
    bl x3Length   /*get the lenght of the string in x3 into x2 */
     
    mov w8, #64   /*write to stdout */
    svc #0     /*tickle the kernel*/
    
    bl printNewLine 
    
   
    
    mov x0, #1     /*write */
    mov x2, sp    /*(stack pointer) The adress of the top pf the stack    */  
    add x2, x2, #16   /*go to the secomd agrument address in the stack*/
    ldr x1, [x2]  /*put that de-refffernce adress  into x1*/
    ldr x3, [x2] 
    bl x3Length 
     
    mov w8, #64   /*write to stdout */
    svc #0     /*tickle the kernel*/
    bl printNewLine
    
    x3Length:
		/*input x3 will contain */
		/*output x2 will contain the lenght of the string */
		mov x2, #0   /*zero out our counter */
		xL_Start:
		   ldrsb W0, [x3]        /*put a single byte into w0*/
		   cmp W0, #00    /*are we at the end of multy terminated string */
		   beq xL_Endit
		   add x3, x3, #1   /*no so go to next byte */
		   add x2, x2, #1   /*increamnent our character counter */
		b xL_Start
		xL_Endit:
			
	
	ret

/* syscall exit(int status) */
    mov x0, #0 
    mov w8, #93 
    svc #0

printNewLine:   /*print a new line */
	mov x0, #1
	ldr x1, = Newline
	ldr x2, = Newline_len
	mov w8, #64
	svc #0
ret
