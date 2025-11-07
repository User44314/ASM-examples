; Assembler 32bit template

bits 32
section .data
;variables with values go here

	someString  db "this is some strig data", 0h
		.lengthof equ $-someString
		
	endl		db 0ah, 0dh
		.lengthof equ $-endl
		
	fileName	db "someData.bin", 0h
	
	intData1	dd 12345h
	intData2	dd 67890h
	
	
section .bss
;reserved memory goes here

	outputFileHandle	resd 1 
	inputFileHandle		resd 1 

section .text
;Your program code goes here

	global _start
_start:
    nop
	
	;Your program code should go here
	
	;open file for  output
	mov eax, 8h  ;create the file
	mov ebx, fileName   ;the name of the file
	mov ecx, 700o   ;file attributes
	int 80h   ;tickle the kernal
	cmp eax, 0h
	je	errorOpen
	mov 	[outputFileHandle], eax ;save the file handle
	
	
	;write data to the file
	
	mov eax, 4h					;write to the file
	mov ebx, [outputFileHandle] ; the file were we wish to write  to
	mov ecx, someString    ;what we wish to write to the fiel 
	mov edx, someString.lengthof   ;the length of the string
	int 80h    ; tickle the kernal
	
	
	;write data to the file
	
	mov eax, 4h					;write to the file
	mov ebx, [outputFileHandle] ; the file were we wish to write  to
	mov ecx, endl    ;what we wish to write to the fiel 
	mov edx, endl.lengthof   ;the length of the string
	int 80h    ; tickle the kernal
	cmp eax, 0h
	je errorWrite
	
	
	;write data to the file   int
	
	mov eax, 4h					;write to the file
	mov ebx, [outputFileHandle] ; the file were we wish to write  to
	mov ecx, intData1    ;what we wish to write to the fiel 
	mov edx, 4   ;the length of the string
	int 80h    ; tickle the kernal
	cmp eax, 0h
	je errorWrite
	mov eax, 4h					;write to the file
	mov ebx, [outputFileHandle] ; the file were we wish to write  to
	mov ecx, intData1    ;what we wish to write to the fiel 
	mov edx, 4   ;the length of the string
	int 80h    ; tickle the kernal
	cmp eax, 0h
	je errorWrite
	
	;close the file
	
	mov eax, 6h   ;cloth the file
	mov ebx, [outputFileHandle]   ;what file we will clothed
	
	
	;1) open the file for input only
	mov eax, 5h			;open the file for input
	mov ebx, fileName   ; the file name to open
	mov ecx, 0h			; the accsess specifire
	int 80h				; tickel the kernel
	cmp eax, 0
	jl errorOpen
	
	;2) read from the file
	mov [intData1], DWORD 0h
	mov [intData2], DWORD 0h
	
	mov eax , 3h   ;read
	mov ebx, [inputFileHandle]   ;the file we wish to read from
	mov ecx, intData1			; where to read the data into
	mov edx, 4				; the size of an integer
	int 80h				; tickel the kernel
	
	mov eax , 3h   ;read
	mov ebx, [inputFileHandle]   ;the file we wish to read from
	mov ecx, intData2			; where to read the data into
	mov edx, 4				; the size of an integer
	int 80h				; tickel the kernel
	
	
	;3)close the file
	mov eax, 6h   ;cloth the file
	mov ebx, [inputFileHandle]   ;what file we will clothed
	
	jmp endItAll
	
	errorOpen:
		nop 
	
	endItAll:
		nop
		jmp endItAll
	
	errorWrite:
		nop
		jmp endItAll
	
	;Do not remove/change the lines below here.
	;These exit out of the application and back
	;to linux in an orderly fashion
	nop
	mov eax,1      ; Exit system call value
	mov ebx,0      ; Exit return code
	int 80h        ; Call the kernel
