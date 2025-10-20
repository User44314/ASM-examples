;
;This program will test out the functions library to show the user of number formatted output
;

;
;Include our external functions library functions
%include "./functions.inc"

SECTION .data
	openPrompt	db	"Welcome to my Program", 0h
	closePrompt	db	"Program ending, have a nice day", 0h
	
	testingAND db "testing the and funvtion ", 0h
	testingTEST db "testing the test function", 0h
	testingOR db "testing the or function", 0h
	testingXOR db "testing the XOR dunction", 0h
	zeroFlagSet db "the zero flag is set", 0h
	printEAX db "eax has  a value of ", 0h
	printEBX db "eax has a value of ", 0h
	
	
	
	
SECTION .bss
	

SECTION     .text
	global      _start

_start:
	nop
	
    push	openPrompt
    call	PrintString
    call	Printendl
     
    push testingAND
    call PrintString
    call Printendl
    mov	 eax, 1001000111010101b
    mov	 ebx, 0000000000000001b
    
    push printEAX
    call PrintString
    push eax
    call Print32bitNumBinary
    call Printendl
    
    push printEBX
    call PrintString
    push ebx
    call Print32bitNumBinary
    call Printendl
    
    
  ; /* push eax ;backup eax */
  
    ;and is a destructive logical operator
    and eax, ebx
   
    
    push printEAX
    call PrintString
    push eax
    call Print32bitNumBinary
    call Printendl 
    
   ; /*pop eax   ;restore eax*/
   
   ;test the test operator
    push testingTEST
    call PrintString
    call Printendl
    mov	 eax, 1001000111010101b
    mov	 ebx, 0000000000000000b
    
    push printEAX
    call PrintString
    push eax
    call Print32bitNumBinary
    call Printendl
    
    push printEBX
    call PrintString
    push ebx
    call Print32bitNumBinary
    call Printendl
    
    
  
    ;non-destructive and
    test eax, ebx
    jz zeroIsSet
    
    push printEAX
    call PrintString
    push eax
    call Print32bitNumBinary
    call Printendl 
    jmp testOR
    
    zeroIsSet:
		push zeroFlagSet
		call PrintString
		push printEAX
		call PrintString
		push eax
		call Print32bitNumBinary
		call Printendl
    
    testOR:
    push testingOR
    call PrintString
    call Printendl
    mov	 eax, 1001000111010101b
    mov	 ebx, 1111111111111111b
    
    push printEAX
    call PrintString
    push eax
    call Print32bitNumBinary
    call Printendl
    
    push printEBX
    call PrintString
    push ebx
    call Print32bitNumBinary
    call Printendl
    
    or eax, ebx
    
    push printEAX
    call PrintString
    push eax
    call Print32bitNumBinary
    call Printendl
    
    push printEBX
    call PrintString
    push ebx
    call Print32bitNumBinary
    call Printendl
    
    
    testXOR:
    push testingXOR
    call PrintString
    call Printendl
    mov	 eax, 1001000111010101b
    mov	 ebx, 11111111111111111111111111111111b
    
    push printEAX
    call PrintString
    push eax
    call Print32bitNumBinary
    call Printendl
    
    push printEBX
    call PrintString
    push ebx
    call Print32bitNumBinary
    call Printendl
    
    xor eax, ebx
    
    push printEAX
    call PrintString
    push eax
    call Print32bitNumBinary
    call Printendl
    
    push printEBX
    call PrintString
    push ebx
    call Print32bitNumBinary
    call Printendl
    
    push eax
    call Print32bitNumDecimal
    call Printendl
    push eax
    call Print32bitNumHex
    call Printendl
    
    
    
    
    mov eax ,0
    xor eax ,eax
    and eax, 0
    
    
    
    push	closePrompt			;The prompt address - argument #1
    call  	PrintString
    call  	Printendl
    
    nop
;
;Setup the registers for exit and poke the kernel
	mov		eax,sys_exit				;What are we going to do? Exit!
	mov		ebx,0						;Return code
	int		80h							;Poke the kernel
