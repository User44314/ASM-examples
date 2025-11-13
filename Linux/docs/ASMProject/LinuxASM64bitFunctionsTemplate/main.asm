;
;This program will test out the functions library to show the user of number formatted output
;

;
;Include our external functions library functions
%include "./functions64.inc"

SECTION .data
	openPrompt	db	"Welcome to my Program", 0h
	closePrompt	db	"Program ending, have a nice day", 0h
	exampleSring db "this is an example string", 0h
		.lengthof equ ($-exampleSring)
	
	fileName db "textFile.txt", 0h
	

SECTION .bss
	outputFileHandle resq 1
	inputFileHandle   resq 1
	
	raedBuffer resb  64

SECTION     .text
	global      _start

_start:
	nop
	
    push	openPrompt
    call	PrintString
    call	Printendl
    
    ;1) open the file for output
    mov rax ,85
    mov rdi, fileName
    mov rsi, 700o
    syscall 
    cmp rax, 0h
    je errorOpen
    mov [outputFileHandle], rax
   
   ;2)WRITE DATA TO THE file
   mov rax,  1h
   mov rdi, [outputFileHandle]
   mov rsi, exampleSring
   mov rdx, exampleSring.lengthof
   syscall
   cmp rax, 0h
   je errorWrite
   
   ;3) close the file
   mov rax, 3h
   mov rdi, [outputFileHandle]
   syscall
   
   
   ;-------------------------------------
   ;open and read a file
   
   ;1) open the file for output
    mov rax, 2
    mov rdi, fileName
    mov rsi, 0h
    syscall 
    cmp rax, 0h
    je errorOpen
    mov [inputFileHandle], rax   ; save the file hanlde
   
   
   ;2)read the file
   readLoop: 
		mov rax, 0   ;read data
		mov rdi, [inputFileHandle]   ; the file to read from
		mov rsi, raedBuffer   ; where to read it to 
		mov rdx, 1   ;read one charracter
		syscall
		
		;check copare for end the file
		cmp rax, 0
		jle endOfFile
		;if not end of file print the character read
		
		
		
		push raedBuffer   ; what to print
		mov rax, 1   ; how many characteres to print
		push rax   ; 
		call PrintText   ;print it
		call Printendl   ;
   jmp readLoop
   
   endOfFile:
		nop
   
   ;3) close the file
   mov rax, 3h     ; close the file
   mov rdi, [inputFileHandle]   ; what file we will be closing
   syscall

    push	closePrompt			;The prompt address - argument #1
    call  	PrintString
    call  	Printendl
    
    jmp  endItAll
    
	errorOpen:
		nop
		
	errorWrite:
		nop
		
	endItAll:
    nop
;
;Setup the registers for exit and poke the kernel
;Exit: 
Exit:
	mov		rax, 60					;60 = system exit
	mov		rdi, 0					;0 = return code
	syscall							;Poke the kernel
