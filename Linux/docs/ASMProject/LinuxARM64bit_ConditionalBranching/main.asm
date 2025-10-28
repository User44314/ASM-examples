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
    
    
    mov x1, #-100
    mov x2, #50
    cmp x1, x2
    bhi strangeResult
    nop
    nop
    
    strangeResult:
    nop
    
    
    
    
    b labelname
    nop
    nop
    
    labelname:
    nop
    
    
    /*
    mov x1, #0xffffffffffffffff
    adds x1, x1, 1
    bvc carryFlagSet
    nop
    
    carryFlagSet:
		nop
	*/
	
	mov x1, #0xf1
	sub x1, x1, 1
    /*subs x1, x1, 1 */
    bpl zeroFlagSet
    nop
    
    zeroFlagSet:
		nop
	 
	
	mov x1, #0x0
	subs x1, x1, #1
    bmi negativeResult
    nop
    nop
    
    negativeResult:
		nop
		
	mov x1, #100
	mov x2, #50
	cmp x1, x2
	bgt someLabel
	/*blt someLabel*/
	nop
	nop
	
	 //ble: less than or equal
	 //bge: greater than or equal
	 //beq: equal 
	 //bne: no-equal
	 
	 
	someLabel:
	nop
	
	
	//unsigned : lo, hi
	mov x1, #100
	mov x2, #50
	cmp x1, x2
	bhi someLabelUS
	nop
	nop
	
	// bls: less than or equal to 
	// bhs: greater than or equal to
	 
	someLabelUS:
	nop
	
    

/* syscall exit(int status) */
    mov x0, #0 
    mov w8, #93 
    svc #0

