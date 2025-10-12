;
;This program will test out the functions library to show the user of number formatted output
;

;
;Include our external functions library functions
%include "./functions64.inc"

SECTION .data
	openPrompt	db	"Welcome to my Program", 0h
	closePrompt	db	"Program ending, have a nice day", 0h
	
	someByte		db	11h
	someWord		dw	2222h
	someDWord		dd	33333333h
	someQWord		dq	4444444444444444h

SECTION .bss

SECTION     .text
	global      _start

_start:
	nop
	
    push	openPrompt
    call	PrintString
    call	Printendl
    
    ;moving memory into register
    mov		rax,0h
    mov		al, [someByte]
    ;movzx		rax, BYTE [someByte]   ;mov		rax, [someByte]
    
    ;[]around a memory label 
    ;means go get the dataa (dereferencing)
    ;without the [], it will put the addresss 
    ;of the label into the register
    
    
    
    
    ;moving leterals to registers
    mov		rax, 01000011b
    mov		eax, 123h
    mov		ax,	55h
    mov 	al, 32h
    mov		ah, 12h
    mov		al, 'A'
    
    ;moving between registers
    mov		r8, rax
    mov 	rcx, r8
    movzx	rcx, al		;movzx - move zero extend moving something smaller 
						;into some bigger amd make all of teh more signnificat bits zeros Used for unsiggned data

	mov		rax, 0h
	mov		al, -12
	movzx	rcx, al  ;use sign number
	movsx	rcx,al		;use unsign number
	
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
