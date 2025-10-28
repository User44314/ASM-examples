/* ARM 64-bit assembly template */

.macro PUSH Xn
	str \Xn, [sp]    // store x0 to the stack pointer memory acess
	sub sp, sp, 16   // go to the next location on the stack
.endm

.macro POP Xn
	add sp, sp, 16   // store x0 to the stack pointer memory acess
	ldr \Xn, [sp]   // go to the next location on the stack
.endm
	

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
    
    
    mov x0, 0x100  // initialize the register
    mov x1, 0x200
    mov x2, 0x300
    
//    str x0, [sp]  // store x0 to the stack pointer [sp] memory adress
  //  sub sp, sp, 16 // go to the next location on the stack
    PUSH x0
 //   str x1, [sp]  // store x1 to the stack pointer memory adress
 //   sub sp, sp, 16 // go to the next location on the stack
	PUSH x1
 //   str x2, [sp]  // store x2 to the stack pointer memory adress
 //   sub sp, sp, 16 // go to the next location on the stack
    PUSH x2
    
    
    mov x0, 0  //clear out registers
    mov x1, 0  //
    mov x2, 0  //
    
   // add sp, sp,16  //go to the begining of the previues value in the stack
  //  ldr x2, [sp]   // pop the data from the stack
  POP x2
  //  add sp, sp,16
   // ldr x1, [sp]
   POP x1
  //  add sp, sp,16
  //  ldr x4, [sp]
  POP x0

/* syscall exit(int status) */
    mov x0, #0 
    mov w8, #93 
    svc #0

