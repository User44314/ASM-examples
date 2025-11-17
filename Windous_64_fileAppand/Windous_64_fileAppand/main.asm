ExitProcess PROTO
CreateFileA PROTO  ; create a new file
CloseHandle PROTO  ; close the file
WriteFile PROTO    ; write to a file
ReadFile PROTO     ; read from a file
SetFilePointer PROTO   ; move the lseek pointer with in the file

.data  
	string1 db "a string shoe how to append to the file"
		s1lengthof = ($-string1)

	stirng2 db " and  this is the second sting of my sentens"
		s2lengthof = ($-stirng2)

	outputFileHanle dq ?
	inputFileHandle dq ?
	totalWritten    dq ?
	totalRead       dq ?

	fileName db   "testFile.txt", 0h


.code
main PROC
	nop
	
	;1)opwn the file for output
	;Argument #1   RCX
	;Argument #2    RDX
	;Argument #3    R8
	;Argument #4    R9
	;Argument #5   [RSP+32]
	;Argument #6    [RSP+40]
	;Argument #7    [RSP+48]
	;Argument #7    [RSP+48]

	;create the file 
	;1 open the file
	mov rcx, offset fileName    ;adress the file name
	mov rdx, 40000000h    ; generic write
	mov r8, 0h     ; no share
	mov r9, 0h     ;no security
	mov QWORD PTR [rsp+32], 2h    ; always create
	mov QWORD PTR [rsp+40], 80h    ; file atributs normal
	mov QWORD PTR [rsp+48], 0h    ; no template used

	call CreateFileA
	cmp rax, 0h    ; if the error
	jle errorOpeningFile    ; end the program
	mov [outputFileHanle], rax   ; otherwise save the file handle


	;2 process the file

	mov rcx, [outputFileHanle]   ; the file to write to
	mov rdx, offset string1    ;the address of the data to write to
	mov r8, s1Lengthof        ;lenght of the data to write
	mov r9, offset totalWritten   ;adress of vaariable to cotaine the
	mov QWORD PTR [rsp+32], 0h    ; not used
	call WriteFile
	mov rax, [totalWritten]
	cmp rax, 0h
	jle errorWritingFile


	

	
	;3 close the file

	mov rcx, [outputFileHanle]
	call CloseHandle


	;let append to the file -----------------------------------
	

	;open the file for input and output
	;1 open the file
	mov rcx, offset fileName    ;adress the file name
	mov rdx, 10000000h    ; all access input and output
	mov r8, 0h     ; no share
	mov r9, 0h     ;no security
	mov QWORD PTR [rsp+32], 3h    ; open an existing file
	mov QWORD PTR [rsp+40], 80h    ; file atributs normal
	mov QWORD PTR [rsp+48], 0h    ; no template used

	call CreateFileA
	cmp rax, 0h    ; if the error
	jle errorOpeningFile    ; end the program
	mov [outputFileHanle], rax   ; otherwise save the file handle


	;2 process the file

	;2.1 position the lseek pointer to the end of the file
	mov rcx, [outputFileHanle]  ; the file to position
	mov rdx, 0    ; lower 64-bits of how far to move
	mov r8, 0     ;upper 64-bits of how far to move
	mov r9, 2h    ; 0-biggiing 1 -  current position 2 - end
	call SetFilePointer


	;2.2 write to the file
	mov rcx, [outputFileHanle]   ; the file to write to
	mov rdx, offset stirng2    ;the address of the data to write to
	mov r8, s2Lengthof        ;lenght of the data to write
	mov r9, offset totalWritten   ;adress of vaariable to cotaine the
	mov QWORD PTR [rsp+32], 0h    ; not used
	call WriteFile
	mov rax, [totalWritten]
	cmp rax, 0h
	jle errorWritingFile


	;3 close the file

	mov rcx, [outputFileHanle]
	call CloseHandle

	jmp endItAll
	
	errorOpeningFile:
		nop
		jmp endItAll

	errorWritingFile:
		nop
		jmp endItAll
	
	endItAll:
		nop

	nop
	mov rcx, 0
	call ExitProcess
main ENDP
END