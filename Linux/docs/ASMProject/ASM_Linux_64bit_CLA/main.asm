;
;This program will test out the functions library to show the user of number formatted output
;

;
;Include our external functions library functions
%include "./functions64.inc"

SECTION .data
	openPrompt	db	"Welcome to my Program", 0h
	closePrompt	db	"Program ending, have a nice day", 0h
	
	totalArgsPromt db  "the total argruments sent to this progrm is ", 0h
	errorArgs      db  "*** Error THE COMMANF SHULD ONLY TAKE TWO ARGUMENTS", 0h
	

SECTION .bss
	totalArgs resq 1
	arg1      resq 1
	arg2      resq 1
	arg3      resq 1
	
	
SECTION     .text
	global      _start

_start:
	nop
	
    push	openPrompt
    call	PrintString
    call	Printendl
    
    
    push totalArgsPromt    ;total arguments ptint message
    call PrintString
    
    mov rax, [rsp]     ; the total number argruments sent to our programm 
    mov [totalArgs], rax   ;save  the total arguments
    cmp rax, 2
    jne errorText
    push rax           ;now print the total arguments sent
    call Print64bitNumDecimal
    call Printendl
    
    ;push QWORD [rsp+8]
    ;call PrintString
    ;call Printendl
    
    
    mov rsi, [rsp+16]
    mov [arg1], rsi
    push QWORD [rsp+16]
    call PrintString
    call Printendl
    
    mov rsi, [rsp+24]
    mov [arg1], rsi
    push QWORD [rsp+24]
    call PrintString
    call Printendl
    
    mov rsi, [rsp+32]
    mov [arg1], rsi
    push QWORD [rsp+32]
    call PrintString
    call Printendl
    
    jmp endItAll
    
    
    errorText:
		push errorArgs
		call PrintString
		call Printendl

	endItAll:
		nop

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
