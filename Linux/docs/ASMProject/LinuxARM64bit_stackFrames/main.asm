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
    
    nop
   // bl someFunction  // branch link
    //nop
    
    mov x1, #0x100  //our first argument
    sub sp, sp, #16 /// make  room for my first argument
    str x1, [sp]	//store our first argument in the stack
    mov x2, #0x200  // our second argument
    sub sp, sp, #16 /// make  room for my second argument
    str x2, [sp]	//store our second argument in the stack
    bl addTwo2
    add sp, sp, #32  // clean our arguments in the stack
    nop
    
    nop
    

/* syscall exit(int status) */
    mov x0, #0 
    mov w8, #93 
    svc #0



addTwo2:
	//create the stack frame
	 sub sp, sp, #16 //#1 backup the link register
	 str lr, [sp]   //str x30, [sp] for returnig from the function
	 sub sp, sp, #16  //#2 backup the old frame pointer
	 str fp,[sp]  // so the calling function can operate correctley
	 mov fp, sp //now bring the old frame pointer up to the stack pointer
	 nop
	 
	 //create a local variable
	 sub sp, sp, #48
	 ldr x0 , =0x99
	 str x0, [fp]  //local variable #1 fp
	 str x0, [fp, #-16]  // local variable #2 [fp, #-16] 
	 str x0, [fp, #-32] // local variable #2 [fp, #-32] 
	 
	 
	  nop
	 
	 ldr x4, [fp, #48]  //grab our first argument
	 ldr x5, [fp, #32] // our second argument
	 mov x0, #0x0  // add the two arguments
	 add x0, x4, x5 // add the two arguments
	 ldr x1, [fp]
	 add x0, x0, x1   // our local variable - add it to x0
	 str x0, [fp, #-16] // store the sum into local variable #2
	 str x0, [fp, #-32] // store the sum into local variable #3
	 nop
	 
	 
	 
	 //destroy the stack frame
	 mov sp, fp //reset the stack pointer to were it was before the calling
	 ldr fp, [sp]	//restore the calling functions frame pointer from the stack
	 add sp, sp, #16 // go down one position to the next position in the stack
	 ldr lr, [sp], #16 // 
ret
    
addTwo:
	//create the stack frame
	 sub sp, sp, #16 //#1 backup the link register
	 str lr, [sp]   //str x30, [sp] for returnig from the function
	 sub sp, sp, #16  //#2 backup the old frame pointer
	 str fp,[sp]  // so the calling function can operate correctley
	 mov fp, sp //now bring the old frame pointer up to the stack pointer
	 nop
	 
	 sub sp, sp, #16   // backup x4 and x5 the register we'll be using
	 str x4, [sp]  //
	 sub sp, sp, #16 //
	 str x5, [sp]  //
	 nop
	 
	 
	 ldr x4, [fp, #48]
	 ldr x5, [fp, #32]
	 mov x0, #0x0
	 add x0, x4, x5
	 
	 nop
	 
	 ldr x5, [sp]   // restore x4 and x5 previously backed up
	 add sp, sp, #16 //
	 ldr x4, [sp]  //
	 add sp, sp, #16  //
	 
	 //destroy the stack frame
	 mov sp, fp //reset the stack pointer to were it was before the calling
	 ldr fp, [sp]	//restore the calling functions frame pointer from the stack
	 add sp, sp, #16 // go down one position to the next position in the stack
	 ldr lr, [sp], #16 // 
ret

someFunction:
	//create the stack frame
	 sub sp, sp, #16 //#1 backup the link register
	 str lr, [sp]   //str x30, [sp] for returnig from the function
	 sub sp, sp, #16  //#2 backup the old frame pointer
	 str fp,[sp]  // so the calling function can operate correctley
	 mov fp, sp //now bring the old frame pointer up to the stack pointer
	 nop
	 
	 //destroy the stack frame
	 mov sp, fp //reset the stack pointer to were it was before the calling
	 ldr fp, [sp]	//restore the calling functions frame pointer from the stack
	 add sp, sp, #16 // go down one position to the next position in the stack
	 ldr lr, [sp], #16 // 
ret
