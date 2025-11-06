
sys_write equ 01h
sys_read equ 00h
stdout equ 1h
stdin equ 0h


;bits 64
section .data
;variables with values go here
	welcomeString db "welcom to my program", 0h
		.lengthof equ $-welcomeString
		
	newline db 0ah, 0dh, 0h
 		.lengthof equ $-newline 
		
section .bss
;reserved memory goes here
	inputBuffer resb  128
		.lengthof equ $-inputBuffer
section .text
;Your program code goes here
	global  _start 
	_start:

	nop	
	;Your program code should go here
	push welcomeString
	push welcomeString.lengthof
	call writeSring
	
	
	push newline
	push newline.lengthof
	call writeSring
	
	push inputBuffer
	push inputBuffer.lengthof
	call readString

	nop
	;Do not remove/change the lines below
	;These exit out of the application and back
	;to linux in an orderly fashion
	mov		rax, 60					;60 = system exit
	mov		rdi, 0					;0 = return code
	syscall							;Poke the kernel


readString:
	push rbp
	mov rbp, rsp
	
	mov rax, sys_read ;write
	mov rdi, stdin ;where do write it -stdin
	mov rsi, [rbp+24] ; the adress of the input buffer
	mov rdx, [rbp+16] ; the length of the input buffer 
	syscall  ;poke the kernal
	
	mov rsp, rbp  ;remove our stack frame
	pop rbp   ;
ret 16


writeSring:
	push rbp
	mov rbp, rsp
	
	mov rax, sys_write ;write
	mov rdi, stdout ;where do write it -stdout
	mov rsi, [rbp+24]
	mov rdx, [rbp+16]
	syscall 
	
	mov rsp, rbp
	pop rbp
ret 16
