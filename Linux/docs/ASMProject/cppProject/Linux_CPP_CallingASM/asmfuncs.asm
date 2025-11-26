section .data

section .bss

section .text

global getAFive
global addTwo
global addArray

getAFive:
	nop
	mov rax, 5
	ret
; end getAFile'

addTwo:
	nop
	mov rax, rdi  ;our first argument
	add rax, rsi   ; our second argument
	
ret
;end addTwo

addArray:
	nop
	
	push rcx
	push rsi
	mov rcx, rsi ; move the second argument array size into rcx
	mov rsi, rdi  ; move the first argument -array adress into rsi
	mov rax, 0
	AA_Loop:
		add rax, [rsi]  ;add an array value to rax
		add rsi, 8  ; go to the next array position
	loop AA_Loop 
	pop rsi
	pop rcx
ret
;enf addArray

