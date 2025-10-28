.global AddTwo
.global AddTree

.section .data

.section .bss

.section .text




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


