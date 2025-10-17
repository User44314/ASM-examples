;
;This program will test out the functions library to show the user of number formatted output
;

;
;Include our external functions library functions
%include "./functions64.inc"

SECTION .data
	openPrompt	db	"Welcome to my Program", 0h
	closePrompt	db	"Program ending, have a nice day", 0h

SECTION .bss

SECTION     .text
	global      _start

_start:
	nop
	
    push	openPrompt
    call	PrintString
    call	Printendl
    
    mov	rdx, 000000000000001ffh ;upper half of our external
    mov rax, 0ffffffffffffffffh ;lower half of our external
    mov rbx, 0000000000000010h ; upper half of our external
    mov rcx, 0000000000000001h ;lower half of our external
    
    add rax, rcx ;add the lower half #2 to lower half #1 setting the carry flag
    adc	rdx, rbx ;add the upper half #2 to the upp half #1 including the carry flag
    
    sub rax, 1h ;subtract from the lower half 1
    sbb rdx, 0h	;subtract from the upper half 0 and 1 from the carry flag
    

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
