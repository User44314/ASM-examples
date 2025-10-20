;
;This program will test out the functions library to show the user of number formatted output
;

;
;Include our external functions library functions
%include "./functions.inc"

SECTION .data
	openPrompt	db	"Welcome to my Program", 0h
	closePrompt	db	"Program ending, have a nice day", 0h
	
	wordArray dw 1111h, 2222h, 3333h, 4444h, 5555h, 6666h, 7777h
	.TYPE equ 2
	.SIZEOF equ $-wordArray
	.LENGHOF equ wordArray.SIZEOF/wordArray.TYPE
	
	dwordArray dd 11111111h, 22222222h, 33333333h, 44444444h, 55555555h, 66666666h, 77777777h
	.TYPE equ 4
	.SIZEOF equ $-dwordArray
	.LENGHOF equ dwordArray.SIZEOF/dwordArray.TYPE
	
SECTION .bss
	

SECTION     .text
	global      _start

_start:
	nop
	
    push	openPrompt
    call	PrintString
    call	Printendl
     
     ;inderect array procesing
     mov eax, 0h
     mov esi, wordArray
     add ax, [esi]
     add esi, wordArray.TYPE
     add ax, [esi]
     add esi, wordArray.TYPE
     add ax, [esi]
     
     push eax
     call Print32bitNumHex
     call Printendl
     
     
     mov eax, 0h
     mov esi, wordArray
     add esi, wordArray.TYPE *2
     add ax, [esi]
     add esi, wordArray.TYPE
     add ax, [esi]
     
     push eax
     call Print32bitNumHex
     call Printendl
     
     
     
     ;indexed array processing
     
     xor eax, eax
     add ax, [wordArray]
     add ax, [wordArray+2]
     add ax, [wordArray+4]
     push eax
     call Print32bitNumHex
     call Printendl
     
     xor eax, eax
     add ax, WORD wordArray[0]
     add ax, WORD wordArray[2]
     add ax, WORD wordArray[4]
     push eax
     call Print32bitNumHex
     call Printendl
     
     
     mov edi, 0h
     xor eax, eax
     add ax, wordArray[edi]
     add edi, wordArray.TYPE
     add ax, wordArray[edi]
     add ax, wordArray[edi]
     add edi, wordArray.TYPE
     add ax, wordArray[edi]
     
    mov edi, 0h
    xor eax, eax
    add ax, wordArray[edi*wordArray.TYPE]
    mov edi, 1h
    add ax, wordArray[edi*wordArray.TYPE]
    mov edi, 2h
    add ax, wordArray[edi*wordArray.TYPE]
    push eax
     call Print32bitNumHex
     call Printendl
    
    
    ;inderct method to sum an array
    mov ecx, wordArray.LENGHOF ;our counter for the loop
    mov esi, wordArray ; the adress of the array we're' summing up
    mov eax, 0 ; this will contain our sum
    inderctSum:
		movzx ebx, WORD [esi] ;
		;add ax, wordArray[edi*wordArray.TYPE]
		add eax, ebx  ;add the array value to eax
		add esi, wordArray.TYPE ;go to the next entry in the array
	loop inderctSum
    push eax
    call Print32bitNumHex
    call Printendl
    
    ;indexed method to sum an array
    mov ecx, wordArray.LENGHOF ;our counter for the loop
    mov esi, wordArray ; the adress of the array we're' summing up
    mov edi, 0 ; our index rigester
    mov eax, 0 ; this will contain our sum
    indexSum:
		movzx ebx, WORD wordArray[edi*wordArray.TYPE] ;or [edi*2]
		;add ax, wordArray[edi*wordArray.TYPE]
		add eax, ebx  ;add the array value to eax
		inc edi ;go to the next entry in the array
	loop indexSum
    push eax
    call Print32bitNumHex
    call Printendl


    push	closePrompt			;The prompt address - argument #1
    call  	PrintString
    call  	Printendl
    
    nop
;
;Setup the registers for exit and poke the kernel
	mov		eax,sys_exit				;What are we going to do? Exit!
	mov		ebx,0						;Return code
	int		80h							;Poke the kernel
