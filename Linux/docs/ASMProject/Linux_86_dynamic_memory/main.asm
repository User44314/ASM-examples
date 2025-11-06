;
;This program will test out the functions library to show the user of number formatted output
;

;
;Include our external functions library functions
%include "./functions.inc"

SECTION .data
	openPrompt	db	"Welcome to my Program", 0h
	closePrompt	db	"Program ending, have a nice day", 0h
	
	arraySize dd 20
	
	;intPtr dd 0
	
SECTION .bss
	bssBass resd 1 ;contain the original limit of my .bss section
	intPtr resd 1   ;contain the adress of dynamic integer
	arrayPtr resd 1 ;the adress of our array

SECTION     .text
	global      _start

_start:
	nop
	
    push	openPrompt
    call	PrintString
    call	Printendl
    
    ;obtain and save limit of my cuurent .bss section
    mov ebx, 0   ;get the limit of the curent bss section
		;rdi =0
    mov eax, 45  ;execute the sys_brk function within the OS
		;rax =0ch
    int 80h ;tickle the kernel
		;syscall
	mov [bssBass], eax ;save the original bss section limit
    mov [intPtr], eax
    
    mov ebx, [intPtr]   ; Allocated the 4 bytes at the bottom of the .bss
    add ebx, 4   		;
    mov eax, 45			;
    int 80h				;
    cmp eax, 0			; check to be sure it work
    je memoryAllocationError
    
    mov esi, [intPtr]
    mov [esi], DWORD 99h
    
    
    mov ebx, [bssBass]   ;delete out integer variable
    mov eax, 45
    int 80h
    mov [intPtr], DWORD 0h  ; null out the pointer
    
    
    jmp endItAll
    memoryAllocationError:
		nop
    
   
    
    ;Dynamically allocated an array
    ;obtain and save limit of my cuurent .bss section
    mov ebx, 0   ;get the limit of the curent bss section
		;rdi =0
    mov eax, 45  ;execute the sys_brk function within the OS
		;rax =0ch
    int 80h ;tickle the kernel
		;syscall
	mov [bssBass], eax ;save the original bss section limit
    mov [arrayPtr], eax ; the adress of our dynamic allocated integer
    
    
    mov eax, [arraySize]
    mov ebx, 4
    mul ebx 
    mov ebx, [arrayPtr ]   ; Allocated the 4 bytes at the bottom of the .bss   
    add ebx, eax 		;
    mov eax, 45			;
    int 80h				;
    cmp eax, 0			; check to be sure it work
    je memoryAllocationError
    
    mov ecx, [arraySize]
    mov esi, [arrayPtr]
    fillLoop:
		mov [esi], DWORD 99h
		add esi, 4
	loop fillLoop
    
    
    
    endItAll:
    mov ebx, [bssBass]
    mov eax, 45
    int 80h
    mov [intPtr], DWORD 0h  ;null out the pointer
    mov [arrayPtr], DWORD 0h  ; null out the pointer
    
    
    push	closePrompt			;The prompt address - argument #1
    call  	PrintString
    call  	Printendl
    
    nop
;
;Setup the registers for exit and poke the kernel
	mov		eax,sys_exit				;What are we going to do? Exit!
	mov		ebx,0						;Return code
	int		80h							;Poke the kernel
