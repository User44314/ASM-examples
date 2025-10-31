;
;This program will test out the functions library to show the user of number formatted output
;

;
;Include our external functions library functions
%include "./functions64.inc"

SECTION .data
	openPrompt	db	"Welcome to my Program", 0h
	closePrompt	db	"Program ending, have a nice day", 0h

	array1	dd 10h, 20h, 30h, 40h, 50h, 60h
	array2	dd 11h, 22h, 33h, 44h, 55h, 66h
			dd 77h, 88h, 99h, 111h, 122h, 133h
			dd 144h, 155h, 166h, 177h, 188h, 199h
	.TYPE equ 4
	.SIZEOF equ $-array2
	.LENGTHOF equ array2.SIZEOF/array2.TYPE
	.NUMCOLS equ 6
	
	rowNumberIndex dd 2
	colNumberIndex dd 5
	
	
	;array2[1][4] = 122h
	;fileAdress = Address_array2 + (row-number * (col per row - size of each items)) + (col-number * size of eaxh items) 
	;pul out the size of each item giving...
	;fileAdress = Address_array2 + size of each item *((row-number * (col per row )) + col-number) 

	;; cell-adress = array address+ colomnsSize*((row-number*colsPerrow) + col-number
SECTION .bss

SECTION     .text
	global      _start

_start:
	nop
	
    push	openPrompt
    call	PrintString
    call	Printendl
    
    ;add code to ask user for the row/ colomn to print
    ;put ths=at into a loop
    ;add code to have them update a row / coloumn cell in the array
    mov rax, 0h
    
    
    ;fileAdress = Address_array2 + size of each item *((row-number * col per row ) + col-number) 
	mov eax, [rowNumberIndex]
	mov ebx, array2.NUMCOLS
	mul ebx
	add eax, DWORD[colNumberIndex]   ;(row-number * col per row ) + col-number
	mov ebx, array2.TYPE   ;size of eash item * ((row-number * col per row ) + col-number)
	mul ebx
	add eax, array2 ; addres_array2 + size of eash item * ((row-number * col per row ) + col-number)
	
	mov esi, eax
	mov eax, [esi]
	;mov DWORD[esi], 0
	
	push rax
	call Print64bitNumHex
	call Printendl
	
	;write a nested loop that prints each row / column number
	;10h, 20h, 30h, 40h
	;50h, 60h, 70h, 80h
	
	
	 
    push	closePrompt			;The prompt address - argument #1
    call  	PrintString			;row-number * col per row
    call  	Printendl
    
    nop
;
;Setup the registers for exit and poke the kernel
;Exit: 
Exit:
	mov		rax, 60					;60 = system exit
	mov		rdi, 0					;0 = return code
	syscall							;Poke the kernel
