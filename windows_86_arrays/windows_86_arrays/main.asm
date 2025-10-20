.386
.model flat,stdcall
.stack 4096

%include functions32bitLibrary.inc

.data
	;Place your variables and memory allocations here
	welcomeMessage		db	"Hello World!", 00h
	pEndMessage			db	"Program ending, have a great day!", 00h

	wordArray dw 1111h, 2222h, 3333h, 4444h, 5555h, 6666h, 7777h
	;.TYPE equ 2
	;.SIZEOF equ $-wordArray
	;.LENGTHOF equ wordArray.SIZEOF/wordArray.TYPE
	
	dwordArray dd 11111111h, 22222222h, 33333333h, 44444444h, 55555555h, 66666666h, 77777777h
	;.TYPE equ 4
	;.SIZEOF equ $-dwordArray
	;.LENGTHOF equ dwordArray.SIZEOF/dwordArray.TYPE


.code
main PROC
	nop

	;Place your program code here
	push	OFFSET welcomeMessage
	call	PrintString
	call	Printendl

	 ;inderect array procesing
     mov eax, 0h
     mov esi, OFFSET wordArray
     add ax, [esi]
     add esi, TYPE wordArray
     add ax, [esi]
     add esi, TYPE wordArray
     add ax, [esi]
     
     push eax
     call Print32bitNumHex
     call Printendl
     
     
     mov eax, 0h
     mov esi, OFFSET wordArray
     add esi, TYPE wordArray *2
     add ax, [esi]
     add esi, TYPE wordArray
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
     add ax,  wordArray[0]
     add ax,  wordArray[2]
     add ax,  wordArray[4]
     push eax
     call Print32bitNumHex
     call Printendl
     
     
     mov edi, 0h
     xor eax, eax
     add ax, wordArray[edi]
     add edi, TYPE wordArray
     add ax, wordArray[edi]
     add ax, TYPE wordArray[edi]
     add edi, OFFSET wordArray
     add ax, TYPE wordArray[edi]
     push eax
     call Print32bitNumHex
     call Printendl
     
    mov edi, 0h
    xor eax, eax
    add ax,  wordArray[edi* TYPE wordArray]
    mov edi, 1h
    add ax,  wordArray[edi* TYPE wordArray]
    mov edi, 2h
    add ax,  wordArray[edi* TYPE wordArray]
    push eax
     call Print32bitNumHex
     call Printendl
    
    
    ;inderct method to sum an array
    mov ecx, LENGTHOF wordArray ;our counter for the loop
    mov esi, OFFSET wordArray ; the adress of the array we're' summing up
    mov eax, 0 ; this will contain our sum
    inderctSum:
        ;mov ebx, 0h
		mov  bx, [esi] ;
		;add ax, TYPE wordArray[edi*wordArray]
		add eax, ebx  ;add the array value to eax
		add esi, TYPE wordArray ;go to the next entry in the array
	loop inderctSum
    push eax
    call Print32bitNumHex
    call Printendl
    
    ;indexed method to sum an array
    mov ecx, LENGTHOF wordArray ;our counter for the loop
    mov esi, OFFSET wordArray ; the adress of the array we're' summing up
    mov edi, 0 ; our index rigester
    mov eax, 0 ; this will contain our sum
    indexSum:
		movzx ebx,  wordArray[edi* TYPE wordArray] ;or [edi*2]
		;add ax, TYPE wordArray[edi*wordArray]
		add eax, ebx  ;add the array value to eax
		inc edi ;go to the next entry in the array
	loop indexSum
    push eax
    call Print32bitNumHex
    call Printendl
	

	push	OFFSET pEndMessage
	call	PrintString
	call	Printendl

	nop
	INVOKE ExitProcess,0
main ENDP
END main