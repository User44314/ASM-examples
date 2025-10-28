/* ARM 64-bit assembly template */

.section .data
msg:
.ascii "Hello, ARM64!\n"
len = . - msg

//alocate a seven double word (8-bytes) array
AQWordArray: .dword 0x0bbbbbbbbbbbbbbbb, 0x0cccccccccccccccc, 0x0dddddddddddddddd
	         .dword 0x0eeeeeeeeeeeeeeee, 0x0ffffffffffffffff, 0x00000000000000000
	         .dword 0x01111111111111111
	AQWordArray.TYPE = 8
	AQWordArray.SIZEOF = (. - AQWordArray)
	AQWordArray.LENGTHOF = (AQWordArray.SIZEOF/AQWordArray.TYPE)


//alocate a seven double word (8-bytes) array
AQWordArray2: .dword 0x0111111111111111, 0x0222222222222222, 0x0333333333333333
	          .dword 0x0444444444444444, 0x0555555555555555,  0x6666666666666666
	          .dword 0x0777777777777777
	AQWordArray2.TYPE = 8
	AQWordArray2.SIZEOF = (. - AQWordArray2)
	AQWordArray2.LENGTHOF = (AQWordArray2.SIZEOF/AQWordArray2.TYPE)
.section .bss
	SumQWordArray: .skip AQWordArray.SIZEOF

.section .text
.global _start

_start:
/* syscall write(int fd, const void *buf, size_t count) */
    mov x0, #1     
    ldr x1, =msg 
    ldr x2, =len 
    mov w8, #64 
    svc #0
    /*
    //inderct array manipulation
    ldr x1, =AQWordArray  //put the address of AQwordarray into x1
    ldr x0, [x1]   /// put our first array value into x0
    add x1, x1, AQWordArray.TYPE // will add the size of an 8 byte value to x1
    ldr x0, [x1]
    add x1, x1, AQWordArray.TYPE // will add the size of an 8 byte value to x1
    ldr x0, [x1]
    add x1, x1, AQWordArray.TYPE // will add the size of an 8 byte value to x1
    ldr x0, [x1]
    */
    
    //index array manipulation
    //using constans imediates
    ldr x0, =AQWordArray
    ldr x1, [x0, #0]
    ldr x1, [x0, #8]
    ldr x1, [x0, #16]
    ldr x1, [x0, #24]
    
    
    // using an index register
    ldr x0, =AQWordArray
    mov x2, #0
    ldr x1, [x0, x2]
    add x2, x2, #8
    ldr x1, [x0, x2]
    add x2, x2, #8
    ldr x1, [x0, x2]
    add x2, x2, #8
    ldr x1, [x0, x2]
    add x2, x2, #8
    
    //an indexed loop 
    // x0 is our accumulator
    // x1 is the address of our array
    // x2 is our index register
    // x3 is or loop counter
    // x4 is our temporary register
    ldr x1, = AQWordArray
    mov x2, #0
    mov x3, AQWordArray.LENGTHOF
    eor x0, x0, x0
    indexedLoop:
		ldr x4, [x1, x2]
		add x0, x0, x4
		sub x3, x3, 1
		cmp x3, #0
		beq indexedLoopExit
		add x2, x2, AQWordArray.TYPE
		b indexedLoop
	indexedLoopExit:
		
    
    
    //inderect array loop
    // x0 will be our accumulator
    // x1 willl cotain the adress
    // x2 is our temporary rigister
    // x3 is our loop counter
    
    ldr x1, =AQWordArray
    mov x3, AQWordArray.LENGTHOF
    eor x0, x0, x0
    intirectLoop:
		ldr x2, [x1]  //load  a value into x2
		add x0, x0, x2 // add our value to x0
		sub x3, x3, #1 // reduce our counter by 1
		cmp x3, #0 // if x3 is zero  we are done
		beq indirectLoopExit  // so branch out of the loop
		add x1, x1, AQWordArray.TYPE // go to the next value of the array
		b intirectLoop
    indirectLoopExit:
    
    
    //an index sum two arrays loop
    //x0 is our accumulator
    // x1 is the adress for each array
    // x2 is our index register
    // x3 is our loop counter
    // x4 is our temporary register
    mov x2, #0
    mov x3, AQWordArray.LENGTHOF
    eor x0, x0, x0
    intirectSumLoop:
		ldr x1, =AQWordArray
		ldr x0, [x1, x2]
		ldr x1, =AQWordArray2
		ldr x4, [x1, x2]
		add x0, x0, x4
		ldr x0, x0, x4
		ldr x1, =SumQWordArray
		str x0, [x1, x2]
		sub  x3, x3, #1
		cmp x3, #0
		beq indexedSumLoopExit
		add x2, x2, AQWordArray.TYPE
		b indexedSumLoop
		
    
    
    
    indexedSumLoopExit:
    
    
    
    
    
/* syscall exit(int status) */
    mov x0, #0 
    mov w8, #93 
    svc #0

