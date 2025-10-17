;
;This program will test out the functions library to show the user of number formatted output
;

;
;Include our external functions library functions
%include "./functions64.inc"

SECTION .data
	openPrompt	db	"Welcome to my Program", 0h
	closePrompt	db	"Program ending, have a nice day", 0h
	carryError db "error in addition", 0h
	addOK	db "the addition worked", 0h

	integer1 dq 200h
	integer2 dq 55h
	
SECTION .bss

SECTION     .text
	global      _start

_start:
	nop
	
    push	openPrompt
    call	PrintString
    call	Printendl
    
    mov rax, 100h
    add rax, 200h
    sub	rax, 100h
    
    mov rax, [integer1]
    add rax, [integer2]
    
    dec	rax
    inc rax
    
    mov rax, 0ffffffffffffffffh
    add rax, 1h
    jc carryLabel     ;jump if the lost data
		nop
		push addOK
		call PrintString
		call Printendl
		jmp endAll
		
    carryLabel:
		nop
		push  carryError
		call 	PrintString
		call 	Printendl
		
		
		
	endAll:

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
