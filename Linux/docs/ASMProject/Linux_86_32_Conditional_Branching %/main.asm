; Assembler 32bit template

bits 32
section .data
;variables with values go here
section .bss
;reserved memory goes here
section .text
;Your program code goes here

	global _start
_start:
    nop
	
	mov eax, 0ffffffffh
	add eax, 1
	jnc someLabel
	nop
	mov eax, -1
	add eax, 1
	jno someLabel
	nop
	;push errorMsg
	;call Print32bitNumHex
	;call PrintString
	;call Printendl
	
	
	someLabel:
		nop
	
	;Your program code should go here

	;if (eax <10){
	;	inc eax;
	;}
	;else {
		;dec eax;
	;}
	
	;example hoe to use wrong jump
	mov eax, -5
	cmp eax, 10
	jg unsignedMess
	nop
	
	;unsigned above (a) and below (b)
	mov eax, 5
	cmp eax, 10
	je eaxEqualTo10     ;==
	jne eaxNotEqualTo10  ;!=
	jb eaxLessThan10   ;<
	ja eaxGreaterThan10   ;>
	jbe eaxLessThanEqual10 ;<=
	jae eaxGreaterThanEqual10   ;>=
	
	;signed greater (g) and less than (1)
	mov eax, -5
	cmp eax, 10
	je eaxEqualTo10     ;==
	jne eaxNotEqualTo10  ;!=
	jl eaxLessThan10   ;<
	jg eaxGreaterThan10   ;>
	jle eaxLessThanEqual10 ;<=
	jge eaxGreaterThanEqual10   ;>=
	
	
	eaxEqualTo10:
		nop
	eaxNotEqualTo10:
		nop
	eaxLessThan10:
		nop
	eaxGreaterThan10:
		nop
	eaxLessThanEqual10:
		nop
	eaxGreaterThanEqual10:
		nop
	unsignedMess:
		nop

	;Do not remove/change the lines below here.
	;These exit out of the application and back
	;to linux in an orderly fashion
	nop
	mov eax,1      ; Exit system call value
	mov ebx,0      ; Exit return code
	int 80h        ; Call the kernel
