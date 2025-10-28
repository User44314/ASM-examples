/* ARM 64-bit assembly template */


.include "../myARMLibs/someFunctions.inc"
//.extern AddTwo

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
    
    
    //mov x5, x1
    //mov x6, x2
    sub sp, sp, 16   //backup x1 and x2 register in the stack
    str x1, [sp]
    sub sp, sp, 16
    str x2, [sp]
    ldr x1, =0x10
    ldr x2, =0x20
    bl AddTwo
    ldr x2, [sp]    //restore our x1 and x2 register from stack
    add sp, sp, 16
    ldr x1, [sp]
    add sp, sp, 16
    //mov x2, x6
    //mov x1, x5
    nop
    

/* syscall exit(int status) */
    mov x0, #0 
    mov w8, #93 
    svc #0

