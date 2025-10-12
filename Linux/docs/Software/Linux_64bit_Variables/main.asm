;
;This program will test out the functions library to show the user of number formatted output
;

;
;Include our external functions library functions
%include "./functions64.inc"

SECTION .data
	openPrompt	db	"Welcome to my Program", 0h
	closePrompt	db	"Program ending, have a nice day", 0h
	
	;integers
	aByteVar	db 0h
	aWordVar	dw 0ffffh
	aDwordVar	dd 012345678h
	aQwordVar	dq 0123456789012345h
	
	;floating point numbers
	aDwordVar	dd	123.45	;single precision floating point
	aQwordVar	dq	123.45	;double precision floating poinnt
	aTwordFloat	dt	123.45	;extended pricision floating point

	;characters variables
	aChar	db	"A"
	aString	db	"hello there", 0h
	aString2	db "program error - try sgsin", 0ah, 0dh, 0h ;\n endl
	
	;arrays
	intArray	db	10,	20,	30, 40, 50
	wordArray	dw	100, 200, 300, 400, 500
	dWordArray  dd 1000, 2000, 3000
	qWordArray  dq 34, 'A', 22h
	charArray   db 'A', 'B', 'C'
	charArray2  db 'ABC'
	floatArray	dt 123.34, 567.89
	
	;repeating array initalizer
	bigByteArray times 1000 db 0h
	bigBiteArray2 db 0h
				  db 0h
				  db 0h

SECTION .bss
	;integers
	aByteVar2	resb	1
	aWordVar2	resw	20 ;reserve 20 words or 40 bytes 
	aDwordVar2	resd	1
	aQwordVar2 	resq	1
	
	allockMemory times 10 resb 1
	allockMemory resb 1

SECTION		.text
	global		_start

_start:
	nop
	
    push	openPrompt
    call	PrintString
    call	Printendl
    

    push	closePrompt			;The prompt address - argument #1
    call  	PrintString
    call  	Printendl
    
    nop
;
;Setup the registers for exit and poke the kernel
;Exit: 
Exit:
	mov		rax, 60					;60 = system exit
	mov		rdi, 0					;0 = return code
	syscall							;Poke the kernel
