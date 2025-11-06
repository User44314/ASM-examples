; Assembler 32bit template

sys_write equ 4h
sys_read equ 3h
stdout equ 1h
stdin equ 0h

bits 32
section .data
;variables with values go here

	welcomeString db "welcom to my program", 0h
		.lengthof equ $-welcomeString
	newline db 0ah, 0dh, 0h
		.lengthof equ $-newline
	inputPrompt db "please enter some date ", 0h
		.lengthof equ $-inputPrompt
section .bss
;reserved memory goes here

	inputBuffer resb 128
		.lengthof equ $-inputBuffer
		
section .text
;Your program code goes here

	global _start
_start:
    nop
	
	;Your program code should go here
	;write out our welocome srceen promt
	push welcomeString
	push welcomeString.lengthof
	call writeSring
	
	push inputBuffer
	push inputBuffer.lengthof
	call readString
	
	;write out our inputed string 
	push inputBuffer
	push eax
	call writeSring
	;write out our velvom promt
	push newline
	push newline.lengthof
	call writeSring
	
	push inputPrompt
	push inputPrompt.lengthof
	call writeSring
	
	;write out our welcome promt
	mov eax, sys_write ;write
	mov ebx, stdout ;where do write it -stdout	
	mov ecx, welcomeString ; the adress of the string to write
	mov edx, welcomeString.lengthof ; the length of the string 
	int 80h ; poke the kernal
 

 	
	mov ecx, newline ; the adress of the string to write
	mov edx, newline.lengthof ; the length of the string 
    call writeSring
	
	;Do not remove/change the lines below here.
	;These exit out of the application and back
	;to linux in an orderly fashion
	nop
	mov eax,1      ; Exit system call value
	mov ebx,0      ; Exit return code
	int 80h        ; Call the kernel


readString:
	push ebp 
	mov ebp, esp
	
	mov eax, sys_read ;write
	mov ebx, stdin ;where do write it -stdout
	mov ecx, [ebp+12] ;the adress of the inpu t buffer
	mov edx, [ebp+8]  ; the length of the input buffer length
	int 80h ; poke the kernel
	
	mov esp, ebp  ; remove our stack frame
	pop ebp
ret


writeSring:
	push ebp
	mov ebp, esp
	
	mov eax, sys_write ;write
	mov ebx, stdout ;where do write it -stdout
	mov ecx, [ebp+12]
	mov edx, [ebp+8]
	int 80h
	
	mov esp, ebp
	pop ebp
ret
