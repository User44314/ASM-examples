;
;This program will test out the functions library to show the user of number formatted output
;

;
;Include our external functions library functions
%include "./functions64.inc"

SECTION .data
	openPrompt	db	"Welcome to my Program", 0h
	closePrompt	db	"Program ending, have a nice day", 0h
	printingSimpleWhileLoop db "printing with simple while loop", 0h
	printingWhileLoop db "prinint with while loop", 0h
	printingDoWhileLoop db "printing with do-while loop", 0h
	printingSimpleForLoop db "printing with simple for loop", 0h
	printingForLoop db "printing with for loop", 0h
	
SECTION .bss

	x resq 1
	i resq 1
	
SECTION     .text
	global      _start

_start:
	nop
	
    push	openPrompt
    call	PrintString
    call	Printendl

		;standard assmebler loop always countd down
		mov rcx, 10 
		standardLoop:
			push rcx
			call Print64bitNumDecimal
			call Printendl
			nop
		loop standardLoop
		
		;int x =0 
		;while(x<10){
		;	cout << x << endl;
		;	x++
		;} // while
		
	push printingSimpleWhileLoop
	call PrintString
	call Printendl
	
	mov qword [x], 0        ;x = 0
	;mov rax, 10
	;cmp rax, 10
	whileLoop:
	cmp qword [x], 10 		;while (x < 10)
	jb	contWLoop			;je - jump equail
	jmp leaveWLoop
	contWLoop:
		mov rax, [x]   		;cout << x << endl
		push rax
		call Print64bitNumDecimal
		call Printendl	
		inc qword [x]    ;x++
	jmp whileLoop
	leaveWLoop:
	
	
	push printingWhileLoop
	call PrintString
	call Printendl
	
	mov qword [x], 0        ;x = 0
	whileLoop1:
		cmp qword [x], 10 		;while (x < 10)
		jae	leaveWLoop1		 
		mov rax, [x]   		;cout << x << endl
		push rax
		call Print64bitNumDecimal
		call Printendl	
		inc qword [x]    ;x++
	jmp whileLoop1
	leaveWLoop1: 
	
	;int x =10
	;do {
	;	cout << x << endl;
	;	x--;
	;} while (x > 0);
	
	push printingDoWhileLoop
    call PrintString
    call Printendl
    
    mov qword[x], 10		;x=10
    doWhileLoop:    
		mov rax, [x]		;cout << x<< endl;
		push rax
		call Print64bitNumDecimal
		call Printendl
		dec qword[x]		;x--
		cmp qword[x], 0
    ja doWhileLoop
    
    ;for (int i =0; i <10; i++){
	;	cout << i << endl;
    ;}
    
    push printingSimpleForLoop
    call PrintString
    call Printendl
    
    mov qword[i], 0   ;for (i = 0
    ForLoop:
    cmp qword[i], 10   ; i < 10
    jb	contForLoop
    jmp endForLoop
    contForLoop:
		mov rax, [i]    ;cout << i << endl
		push rax
		call Print64bitNumDecimal
		call Printendl
		inc qword [i]    ;i++
	jmp ForLoop
    endForLoop:
    
    mov qword[i], 0   ;for (i = 0
    ForLoop1:
    cmp qword[i], 10   ; i < 10
    jae	endForLoop1
		mov rax, [i]    ;cout << i << endl
		push rax
		call Print64bitNumDecimal
		call Printendl
		inc qword [i]    ;i++
	jmp ForLoop1
    endForLoop1:
    
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
