/* ARM 64-bit assembly template */

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
    
    
    mov x0, 0xffffffffffffffff  //first number lower-half
    mov x1, 0x00000000000001ff  //first number upper-half
		   // first number 0000000000000000 : ffffffffffffffff
    mov x2, 0x0000000000000001  //second number lower half
    mov x3, 0x0000000000000100  // second number upper half
		// second number 0000000000000100 : 0000000000000001
    
    adds x4, x0, x2 // add lower  half of the  two numbers setiing the setting carry flag
    adc x5, x1, x3 // add the upper of the two number as well as the carry flag
    
    mov x7, #0
    subs x2, x4, #1  // subtract 1 from the lower half x4 into x2
    sbc x1, x5, x7  //subtract zero from the upper half and the value in the carry
    
    
    
    

/* syscall exit(int status) */
    mov x0, #0 
    mov w8, #93 
    svc #0

