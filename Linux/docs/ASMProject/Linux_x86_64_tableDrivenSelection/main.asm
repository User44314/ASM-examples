;
;This program will test out the functions library to show the user of number formatted output
;

;
;Include our external functions library functions
%include "./functions64.inc"




;char menuSelection = '3';
;switch(menuSelection) {
;	case '1':
;		function1(): 
;		break;
;	case '2':
;		function2():
;		break;
;	default:
;		function3():
;		break;
;} //switch

SECTION .data
	openPrompt	db	"Welcome to my Program", 0h
	closePrompt	db	"Program ending, have a nice day", 0h
	invalidMenu db "invalid menu option selected", 0h
	f1Promt db "your selected option 1 ", 0h
	f2Promt db "your selected option 2", 0h
	f3Promt db "your selected option 3", 0h
	f4Promt db "your selected option 4", 0h
	exitPromt db "you desided to leave the program", 0h
	
	entryLoop:
		;have the user type something in on the keyboard
		caseTable db '1'
				  dq Function1
				   .entrySize equ $-caseTable
				  db '2'
				  dq Function2
				  db '3'
				  dq Function3
				  db '4'
				  dq Function4
				  db 'x'
				  dq ExitFunction
			  .numberOfEntries equ ($-caseTable)/caseTable.entrySize

SECTION .bss

SECTION     .text
	global      _start

_start:
	nop
	
    push	openPrompt
    call	PrintString
    call	Printendl
    
    mov al, '1'   ;testing value we are seaching for 
    mov rsi, caseTable  ;the adress of our case table
    mov rcx, caseTable.numberOfEntries  ;the number of enteries in the case table
    caseLoop:
		cmp al, [rsi]  ; campare our value in the case table with  al
		jne nextCaseLoop  ;if not the case go the next value in the case table
		call [rsi + 1]   ; it the same so call the function pointed in the case table
		
		jmp endCaseLoop  ; then leave the loop
		
		
    nextCaseLoop:
		cmp al, 'x'
		je endEntryLoop
		add rsi ,caseTable.entrySize  ;point rsi to next value in the next table
		loop caseLoop 
	push invalidMenu   ;default case
	call PrintString
	call Printendl
    
    
    endCaseLoop:
    jmp entryLoop
    endEntryLoop:

    push	closePrompt			;The prompt address - argument #1
    call  	PrintString
    call  	Printendl
    
    nop
;
;Setup the registers for exit and poke the kernel
;Exit: 
Exit:
	mov		rax, 60					;60 = system exit
	mov		rdi, 0					;0 = return code
	syscall							;Poke the kernel


Function1:
	nop
	push f1Promt
	call PrintString
	call Printendl
	nop
ret

Function2:
	nop
	push f2Promt
	call PrintString
	call Printendl
	nop
ret

Function3:
	nop
	push f3Promt
	call PrintString
	call Printendl
	nop
ret

Function4:
	nop
	push f4Promt
	call PrintString
	call Printendl
	nop
ret

ExitFunction:
	nop
	push exitPromt
	call PrintString
	call Printendl
	nop
ret

