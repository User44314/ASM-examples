;extern AddTwo
;extern SubTwo

%include "./someFunctions.inc"

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
	push rbx ;backup our arguments in register
	push rcx ; 
	;push rax
	mov rbx, 10
	mov rcx, 20 
	call AddTwo
	;pop rax
	pop rcx ; restor our arguments register
	pop rbx
	
	
	nop
	;Do not remove/change the lines below
	;These exit out of the application and back
	;to linux in an orderly fashion
	mov		rax, 60					;60 = system exit
	mov		rdi, 0					;0 = return code
	syscall							;Poke the kernel


;description the function will siply add two numbers and return the sum
;inputs: ebx and ecx are agrumentns
;return value the sum of rbx and rcx in eax
;example:
	;mov ebx, 10
	;mov ecx, 20 
	;call AddTwo
	
;AddTwo:
;	mov rax, rbx
;	add rax, rcx
	
;ret
;end addtwo


;inputs: ebx and ecx are agrumentns
;return value the difference of rbx and rcx in eax
;example:
	;mov ebx, 10
	;mov ecx, 20 
	;call AddTwo
;description the function will siply subtract two numbers and return the subtruction

;SubTwo:
;	mov rax, rbx
;	sub rax, rcx
	
;ret
;end SubTwo
