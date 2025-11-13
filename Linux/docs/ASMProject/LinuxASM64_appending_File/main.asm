
section .data
;variables with values go here

	string1 db "this is the first part of string", 0h
		.lengthof equ $-string1
	string2 db " and this the second part of string", 0h
		.lengthof equ $-string2
	
	fileName db "textFile.txt", 0h

section .bss
;reserved memory goes here
	
	inputFileHandle resq 1
	outputFileHandle resq 1

section .text
;Your program code goes here
	global  _start 
	_start:

	nop	
	;Your program code should go here
	
	;create the file and put some date into it
	;1)CREATE the file
	mov rax, 85    ; create the file 
	mov rdi, fileName   ; adress of the file name string
	mov rsi, 777o    ;access to all
	syscall
	cmp rax, 0     ; error
	jle errorOpeningFile  ; yes error and end the file
	mov [outputFileHandle], rax  ; no error, so save the file handle
	
	
	;2)write to  the file
	mov rax, 1    ;write
	mov rdi, [outputFileHandle]   ; the file to write
	mov rsi, string1    ;the adresss to write to the file
	mov rdx, string1.lengthof  ; the length of the string
	syscall
	
	
	;3)close the file
	mov rax, 3    ; close the file 
	mov rdi, [outputFileHandle] ; the file to close
	syscall
	
	;-------------------------------------------------------------------
	;APPEND TO THE FILE
	;1)OPEN the file fo input / output
	mov rax, 2    ; open the file
	mov rdi, fileName   ; adress of the file name string
	mov rsi, 2h   ;file open flag   0- read only, 1 - write only, 2 - read/write 
	syscall
	cmp rax, 0     ; error
	jle errorOpeningFile  ; yes error and end the file
	mov [outputFileHandle], rax  ; no error, so save the file handle
	
	;2)posstiton to the end of the file to append it later
	mov rax, 8   ;mov to the postion pointer
	mov rdi, [outputFileHandle]   ; the file to move the pointer
	mov rsi, 0h   ; move 'n' bytes from below
	mov rdx, 2    ; 0 - begining 1 - current position, 2 -end
	syscall
	
	
	;3)write to  the file
	mov rax, 1    ;write
	mov rdi, [outputFileHandle]   ; the file to write
	mov rsi, string2    ;the adresss to write to the file
	mov rdx, string2.lengthof  ; the length of the string
	syscall
	
	
	;3)close the file
	mov rax, 3    ; close the file 
	mov rdi, [outputFileHandle] ; the file to close
	syscall
	
	jmp endItAll
	
	errorOpeningFile:
		nop
		jmp endItAll
	
	endItAll:
		nop
	

	nop
	;Do not remove/change the lines below
	;These exit out of the application and back
	;to linux in an orderly fashion
	mov		rax, 60					;60 = system exit
	mov		rdi, 0					;0 = return code
	syscall							;Poke the kernel


;./main
;cat ./textFile.txt
