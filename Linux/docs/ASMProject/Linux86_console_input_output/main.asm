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

	inputPrompt db "please enter some date ", 0h
		.lengthof equ $-inputPrompt
		
	inputInteger db "please enter am integer ", 0h
		.lengthof equ $-inputInteger
		
	newline	db 0ah, 0dh, 0h
		.lengthof equ $-newline
	
	theTotal dd 0h
	
section .bss
;reserved memory goes here

	inputBuffer resb 128
		.lengthof equ $-inputBuffer
		
section .text
;Your program code goes here

	global _start
_start:
    nop
    
    push welcomeString
    push welcomeString.lengthof
    call writeSring
    
    ;write out our inputed string
    push newline
    push newline.lengthof
    call writeSring
    
    ;push inputPrompt
    ;push inputPrompt.lengthof
    ;call writeSring
    
    ;push inputBuffer
    ;push inputBuffer.lengthof
    ;call readString
 
	
	;write out our inputed string 
	push inputBuffer
	push eax
	call writeSring

	push inputInteger
	push inputInteger.lengthof
	call writeSring
	push inputBuffer
	push inputBuffer.lengthof
	call readString
	
	;123
	mov ecx, eax  ;safe the number digital enters
	dec ecx    ;ignore \n the enter by the used
	mov esi, inputBuffer   ;the adresss of the input enteres
	add esi ,ecx   ;point the last digit
	dec esi
	mov ebx, 1   ;power of 10 counter
	mov eax, 0    ; initialize our acumulatore register
	convertLoop:
		mov al, [esi]   ;place an ascii digit into al
		;make sure the value is between 30h and 39h (0 - 9)
		;if not set the carry flag and leave the loop
		mov ah, 30
		cmp al, ah
		jb  entryError
		sub al, 30h    ;remove the asxii portion
		mul ebx    ;multipy by power of ten to deal with destion position
		add [theTotal], eax  ;add the value to our total variable
		dec esi    ;point to the next power of the digital
		mov eax, ebx   ;setting up oir next power of 10
		mov ebx, 10
		mul ebx
		mov ebx, eax
	loop convertLoop
	
	mov eax, [theTotal]
	inc eax
	jmp endProgram
	
	entryError:
		;display an error message
	
	endProgram:
		 
	
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
