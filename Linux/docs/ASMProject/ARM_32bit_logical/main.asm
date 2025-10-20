/* Assembler ARM 32bit template */
.section .data
msg:
.ascii "Hello, ARM32!\n"
len = . - msg

	dWordbynary1: .word	0b00100010111010101011110101110010
	dWordbynary2: .word 0b00000000000000000000000000001111
	dWordbynary3: .word 0b00000000000000000010000000000000
	dWordbynary4: .word 0b00000000000000000010000000000100
	



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
    
    @dWordbynary1: .word 0b00100010111010101011110101110010
	@dWordbynary2: .word 0b00000000000000000000000000001111
	@dWordbynary3: .word 0b00000000000000000010000000000000
	@dWordbynary4: .word 0b00000000000000000010000000000100
	
	
	
	@test the AND operation
	ldr r0, =dWordbynary1 	 @put the address of dwordbinary1 into r0
	ldr r1, [r0]			 @put the dwwordbinary value into r1
	ldr r0, =dWordbynary2	 @put the adress of dwordbinary2 into r0
	ldr r2, [r0]			@put the dWordbinary2 value into r2
	and r0, r1, r2			@and r1 and r2 and  place the value into r0
	
	
	@dWordbynary1: .word 0b00100010111010101011110101110010
	@dWordbynary2: .word 0b00000000000000000000000000001111
	@res or	result		 0b00100010111010101011110101111111
	@dWordbynary3: .word 0b00000000000000000010000000000000
	@dWordbynary4: .word 0b00000000000000000010000000000100
	
	
	@test the OR operation
	ldr r0, =dWordbynary1 	 @put the address of dwordbinary1 into r0
	ldr r1, [r0]			 @put the dwwordbinary value into r1
	ldr r0, =dWordbynary2	 @put the adress of dwordbinary2 into r0
	ldr r2, [r0]			 @put the dWordbinary2 value into r2
	orr r0, r1, r2			 @or r1 and r2 and  place the value into r0

	@dWordbynary1: .word 0b00100010111010101011110101110010
	@dWordbynary2: .word 0b00000000000000000000000000001111
	@res eor	result   0b00100010111010101011110101111101
	@dWordbynary3: .word 0b00000000000000000010000000000000
	@dWordbynary4: .word 0b00000000000000000010000000000100
	
	
	@test the XOR operation
	ldr r0, =dWordbynary1 	 @put the address of dwordbinary1 into r0
	ldr r1, [r0]			 @put the dwwordbinary value into r1
	ldr r0, =dWordbynary2	 @put the adress of dwordbinary2 into r0
	ldr r2, [r0]			 @put the dWordbinary2 value into r2
	eor r0, r1, r2			 @eor r1 and r2 and  place the value into r0

	@dWordbynary1: .word 0b00100010111010101011110101110010
	@the nt resultL      0b11011101000101010100001010001101
	@                       d   d    1   5   0   2    8  d
	@dWordbynary2: .word 0b00000000000000000000000000001111
	@res eor	result   0b00100010111010101011110101111101
	@dWordbynary3: .word 0b00000000000000000010000000000000
	@dWordbynary4: .word 0b00000000000000000010000000000100
	
	
	@test the XOR operation
	ldr r0, =dWordbynary1 	 @put the address of dwordbinary1 into r0
	ldr r1, [r0]			 @put the dwwordbinary value into r1
	mvn r1, r1
	
	
	@dWordbynary1: .word 0b00100010111010101011110101110010
	@dWordbynary2: .word 0b00000000000000000000000000001111
	@dWordbynary3: .word 0b00000000000000000010000000000000
	@dWordbynary4: .word 0b00000000000000000010000000000100

	@is the 14th bit turned on
	ldr r0, =dWordbynary1
	ldr r1, [r0]     @number to test
	ldr r0, =dWordbynary3
	ldr r0, [r0]      @our bit mask with bit 14th turned on
	ands r0, r1, r0   @and our r1 with r0 and set any flags
	beq bitIsNotSet   @beq = the zero flag is o so the bits were not together so branch
	mov r0, #1			@no branch so the zeo flag must be off so the bits was on
	bitIsNotSet:
	mov r0, #0
	
	
	@dWordbynary1: .word 0b00100010111010101011110101110010
	@dWordbynary2: .word 0b00000000000000000000000000001111
	@dWordbynary3: .word 0b00000000000000000010000000000000
	@dWordbynary4: .word 0b00000000000000000010000000000100
	
	@is the 14th and 3th bit turned on
	ldr r0, =dWordbynary1
	ldr r1, [r0]     @number to test
	ldr r0, =dWordbynary4
	ldr r2, [r0]      @our bit mask with bit 14th turned on
	and r0, r1, r2   @and our r1 with r0 and set any flags
	cmp r0, r2
	beq bothbitSet   @beq = the zero flag is o so the bits were not together so branch
	mov r0, #1			@no branch so the zeo flag must be off so the bits was on
	bothbitSet:
	mov r0, #0
	
	
	

/* syscall exit(int status) */
    mov r0, #0 
    mov r7, #1 
    svc #0

