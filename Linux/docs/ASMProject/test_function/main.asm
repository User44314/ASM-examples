%include "../myLibs/someFunctions.inc"


section .data
;variables with values go here

section .bss
;reserved memory goes here
section .text
;Your program code goes here
	global  _start 
	_start:

	nop	
	;Your program code should go here
	mov rbx , 20h
	mov rcx, 30h
	call AddTwo

	nop
	;Do not remove/change the lines below
	;These exit out of the application and back
	;to linux in an orderly fashion
	mov		rax, 60					;60 = system exit
	mov		rdi, 0					;0 = return code
	syscall							;Poke the kernel
