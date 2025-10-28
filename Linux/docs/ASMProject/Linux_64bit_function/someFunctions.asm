global AddTwo
global SubTwo


section .data
;variables with values go here
	temp db 'T'
section .bss
;reserved memory goes here
section .text

;description the function will siply add two numbers and return the sum
;inputs: ebx and ecx are agrumentns
;return value the sum of rbx and rcx in eax
;example:
	;mov ebx, 10
	;mov ecx, 20 
	;call AddTwo
	
AddTwo:
	mov rax, rbx
	add rax, rcx
	
ret
;end addtwo


;inputs: ebx and ecx are agrumentns
;return value the difference of rbx and rcx in eax
;example:
	;mov ebx, 10
	;mov ecx, 20 
	;call AddTwo
;description the function will siply subtract two numbers and return the subtruction

SubTwo:
	mov rax, rbx
	sub rax, rcx
	
ret
;end SubTwo
