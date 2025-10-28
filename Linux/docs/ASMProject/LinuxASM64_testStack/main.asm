;
;This program will test out the functions library to show the user of number formatted output
;

;
;Include our external functions library functions
%include "./functions64.inc"

SECTION .data
	openPrompt	db	"Welcome to my Program", 0h
	closePrompt	db	"Program ending, have a nice day", 0h

	startPromt db "Stack point before push/pop ", 0h
	pushPromt dq "Stack pointer after Push ", 0h
	popPromt dq "Stack pointer after Pop ", 0h
	
	
	
SECTION .bss

SECTION     .text
	global      _start

_start:
	nop
	
    push	openPrompt
    call	PrintString
    call	Printendl
    
    mov rax, 100h
    mov rbx, 200h
    mov rcx, 300h
    
    push startPromt
    call PrintString
    push rsp 
    call Print64bitNumHex
    call Printendl
    
    push rax
    push pushPromt
    call PrintString
    push rsp 
    call Print64bitNumHex
    call Printendl
    
    push rbx
    push pushPromt
    call PrintString
    push rsp 
    call Print64bitNumHex
    call Printendl
    
    push rcx
    push pushPromt
    call PrintString
    push rsp 
    call Print64bitNumHex
    call Printendl
    
    mov rax, 0h
    mov rbx, 0h
    mov rcx, 0h
    
    pop rcx
    push popPromt
    call PrintString
    push  rsp
    call Print64bitNumHex
    call Printendl;
    
    pop rbx
    push popPromt
    call PrintString
    push  rsp
    call Print64bitNumHex
    call Printendl;
    
    pop rax
    push popPromt
    call PrintString
    push  rsp
    call Print64bitNumHex
    call Printendl;

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
