.386
.model flat, stdcall
.stack 4096
ExitProcess PROTO, dwExitCode:DWORD
INCLUDE functions32bitLibrary.inc
.data
	WelcomePromt db "Welcom to my project", 0h

	testingAND db "testing the and funvtion ", 0h
	testingTEST db "testing the test function", 0h
	testingOR db "testing the or function", 0h
	testingXOR db "testing the XOR dunction", 0h
	zeroFlagSet db "the zero flag is set", 0h
	printEAX db "eax has  a value of ", 0h
	printEBX db "eax has a value of ", 0h

.code
main PROC
	nop

	push OFFSET	WelcomePromt
	call PrintString
	call Printendl
	call Printendl

	push OFFSET testingAND
    call PrintString
    call Printendl
    mov	 eax, 1001000111010101b
    mov	 ebx, 0000000000000001b
    
    push OFFSET printEAX
    call PrintString
    push eax
    call Print32bitNumBinary
    call Printendl
    
    push OFFSET printEBX
    call PrintString
    push ebx
    call Print32bitNumBinary
    call Printendl
    
    
  ; /* push eax ;backup eax */
  
    ;and is a destructive logical operator
    and eax, ebx
   
    
    push OFFSET printEAX
    call PrintString
    push eax
    call Print32bitNumBinary
    call Printendl 
    
   ; /*pop eax   ;restore eax*/
   
   ;test the test operator
    push OFFSET testingTEST
    call PrintString
    call Printendl
    mov	 eax, 1001000111010101b
    mov	 ebx, 0000000000000000b
    
    push OFFSET printEAX
    call PrintString
    push eax
    call Print32bitNumBinary
    call Printendl
    
    push OFFSET printEBX
    call PrintString
    push ebx
    call Print32bitNumBinary
    call Printendl
    
    
  
    ;non-destructive and
    test eax, ebx
    jz zeroIsSet
    
    push OFFSET printEAX
    call PrintString
    push eax
    call Print32bitNumBinary
    call Printendl 
    jmp testOR
    
    zeroIsSet:
		push OFFSET zeroFlagSet
		call PrintString
		push OFFSET printEAX
		call PrintString
		push eax
		call Print32bitNumBinary
		call Printendl
    
    testOR:
    push OFFSET testingOR
    call PrintString
    call Printendl
    mov	 eax, 1001000111010101b
    mov	 ebx, 1111111111111111b
    
    push OFFSET printEAX
    call PrintString
    push eax
    call Print32bitNumBinary
    call Printendl
    
    push OFFSET printEBX
    call PrintString
    push ebx
    call Print32bitNumBinary
    call Printendl
    
    or eax, ebx
    
    push OFFSET printEAX
    call PrintString
    push eax
    call Print32bitNumBinary
    call Printendl
    
    push OFFSET printEBX
    call PrintString
    push ebx
    call Print32bitNumBinary
    call Printendl
    
    
    testXOR:
    push OFFSET testingXOR
    call PrintString
    call Printendl
    mov	 eax, 1001000111010101b
    mov	 ebx, 11111111111111111111111111111111b
    
    push OFFSET printEAX
    call PrintString
    push eax
    call Print32bitNumBinary
    call Printendl
    
    push OFFSET printEBX
    call PrintString
    push ebx
    call Print32bitNumBinary
    call Printendl
    
    xor eax, ebx
    
    push OFFSET printEAX
    call PrintString
    push eax
    call Print32bitNumBinary
    call Printendl
    
    push OFFSET printEBX
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



	nop
	INVOKE ExitProcess,0
main ENDP
END main