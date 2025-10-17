/* ARM 64-bit assembly template */

.section .data
msg:
.ascii "Hello, ARM64!\n"
len = . - msg

	AByteArray: .byte 0x11, 0x22, 0x33, 0x44, 0x55
		AByteArray.TYPE   =1
		AByteArray.SIZEOF = (. - AByteArray)
		AByteArray.LENGHOF = (AByteArray.SIZEOF / AByteArray.TYPE)
		
		AWordArray:	.dword 0x66666666, 0x77777777, 0x88888888
		AWordArray.TYPE   =8
		AWordArray.SIZEOF = (. - AWordArray)
		AWordArray.LENGHOF = (AWordArray.SIZEOF / AWordArray.TYPE)

	ADWordArray:	.dword 0x6666666666666666, 0x7777777777777777, 0x8888888888888888
		ADWordArray.TYPE   =8
		ADWordArray.SIZEOF = (. - ADWordArray)
		ADWordArray.LENGHOF = (ADWordArray.SIZEOF / ADWordArray.TYPE)

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
    
    ;mov x0 ,AByteArray.TYPE
    
    /*mov rsi, OFFSET AByteArray ;in Microsoft*/
    /*mov rsi, AByteArray  ; in linux*/
    
    ldr x1, =AByteArray   /*in arm*/
    
   /* mov w0, BYTE PTR [x1]
    ldrb w0, [x1] */
    
    ldrb w0, [x1]
    add x1, x1, AByteArray.TYPE
    ldrb w0, [x1]
    
    ldr x1, =ADWordArray   /*in arm*/
    ldr x0, [x1]
    add x1, x1, ADWordArray.TYPE
    ldr x0, [x1]

/* syscall exit(int status) */
    mov x0, #0 
    mov w8, #93 
    svc #0

