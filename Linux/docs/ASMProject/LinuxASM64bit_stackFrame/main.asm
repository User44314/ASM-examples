
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
	call someFunction
	mov rax, 100h
	push rax
	mov rax, 200h
	push rax
	push 100h 
	pop rax
	;call addTwo
	call addTwo1

	nop
	;Do not remove/change the lines below
	;These exit out of the application and back
	;to linux in an orderly fashion
	mov		rax, 60					;60 = system exit
	mov		rdi, 0					;0 = return code
	syscall							;Poke the kernel

addTwo1:
	push rbp 
	mov rbp, rsp
	sub rsp, 8 ;local variabl 1: [rbp-8]
	sub rsp, 8 ; local variabl 2: [rbp -16]
	
	mov rax, [rbp+24] ;move our first agrument into our local variable
	mov [rbp-8], rax
	mov rax, [rbp+16] ;move our second argument into our locacl variable
	mov [rbp-16], rax
	mov rax, 0
	mov rax, [rbp-8]
	mov rax, [rbp-16]
	
	mov rax, [rbp+24]
	add rax, [rbp+16]

	mov rsp, rbp
	pop rbp

ret 16

addTwo:
;create the stack frame
	push rbp
	mov rbp, rsp
	push rcx
	
	mov rax, [rbp+24] ;move our first argument in rax
	mov rcx, [rbp+16]
	;add  rax, [rbp+16] ;add second argument to rax
	;or 
	add rax, rcx
	
	pop rcx
;destroy the stck frame
	mov rsp, rbp
	pop rbp

ret 16


someFunction:
	;create the stack frame
	push rbp    ;32 bit push
	mov rbp, rsp   ;mov ebp, esp
	push rcx   ;backup those registers
	push rdx
	
	;the function code
	push rax
	push rbx
	mov rbx, 0
	pop rbx
	pop rax
	
	pop rdx
	pop rcx
	
	;destroy the stack frame 
	mov rsp, rbp
	;pop rdx   ;restore our registers 
	;pop rcx
	pop rbp

ret
