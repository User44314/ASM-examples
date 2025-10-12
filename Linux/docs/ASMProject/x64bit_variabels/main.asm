/* ARM 64-bit assembly template */

.section .data
msg:	.ascii "Hello, ARM64!\n"
len = . - msg

aByte:	.byte 18
aByte2:	.byte 0xff

/* byte =1 byte, half-world = 2 bytes, word = 4 bytes, double-world = 8 bytes */

aHWord:		.hword 0xffff
aHWord2:	.hword 22

aWord:	.word	0xffffffff

aDWord:	.dword	34
aDWord2:	.dword	0xff7856

/*floating points */

float16b: .float16 123.45  /*16bit float*/
float32b:	.float 123.4565  /*32bit float*/
float64b: .double 123.445567667 /*64bit float*/

/*strings*/

someStrings: .ascii	"hello hi", /*not a null terminated string*/
someStrings2: .asciz	"hello alex" /*null terminated string*/

array1:	.skip 50  /*array 50 bytes*/
array2:	.word	10, 20, 30 ,40, 50
array3: .byte	10, 20, 'A', 30


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

/* syscall exit(int status) */
    mov x0, #0 
    mov w8, #93 
    svc #0

