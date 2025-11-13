%include functions64bitLibrary.inc

CreateFileA PROTO     ; Create a new file
CloseHandle PROTO     ; Close a File
WriteFile PROTO      ; Write to a File	
ReadFile PROTO      ; Read from a File


.data
	;Place your variables and memory allocations here
	welcomeMessage		db	"Hello World!", 00h
	pEndMessage			db	"Program ending, have a great day!", 00h
	
	exampleString db "this is an example striing to demonstration"
	esLengthof = ($-exampleString)

	fileName db "textFile.txt", 0h

	outputFileHandle dq ?
	inputFileHandle  dq ?
	totalWritten     dq ?
	totalRead        dq ?

	readBuffer       db 64 DUP(?)

	 
.code
main PROC
	nop

	;Place your program code here
	mov		rsi, OFFSET welcomeMessage
	push	rsi
	call	PrintString
	call	Printendl

	;1)open file for output
	;argument #1 rcx
	;argument #2 rdx
	;argumen #3 r8
	;argument #4 r9
	;argument #5 [RSP+32]
	;argument #6 [RSP+40]
	;argument #7 [RSP+48]


	mov rcx, OFFSET fileName    ;file name
	mov rdx, 40000000h		;access mode generric write
	mov r8, 0h      ;do not share this file
	mov r9, 0h    ; no securty needed
	mov QWORD PTR [rsp+32], 2h    ; always create
	mov QWORD PTR [rsp+40], 80h    ; file attribute normal
	mov QWORD PTR [rsp+48], 0h   ; otherwise save the value of the file handle
	call CreateFileA
	cmp rax, 0h
	jl openError
	mov [outputFileHandle] ,rax

	
	;2)prosess the file comtents
	mov rcx, [outputFileHandle]     ;file handle to write
	mov rdx, OFFSET exampleString  ; the address of the date to write
	mov r8, esLengthof      ; the lenth of this data
	mov r9, OFFSET totalWritten   ;how many bytes are actualy written 
	mov QWORD PTR [rsp+32], 0h   ; not used
	call WriteFile
		  
;commamd type .\TestFie.bin



	;3)close the file
	mov rcx, [outputFileHandle]
	call CloseHandle
		 
;---------------------------------------
;read the file one character at a time

	mov rcx, OFFSET fileName         ;the file name
	mov rdx, 80000000h   ;access mode generric read
	mov r8, 0h     ; do not share 
	mov r9, 0h   ; no security needed
	mov QWORD PTR [rsp+32], 3h     ;open an existing file
	mov QWORD PTR [rsp+40], 80h   ; file attribute normal
	mov QWORD PTR [rsp+48], 0h    ;tempate  file handle not sued
	call CreateFileA
	cmp rax, 0h
	jl openError
	mov [inputFileHandle] ,rax

	
	;2)prosess the file comtents
	readLoop:
	mov rcx, [inputFileHandle]   ;the file to read from
	mov rdx, OFFSET readBuffer   ; whrere to read it to
	mov r8, 1h     ;how many bytes to read
	mov r9, OFFSET totalRead    ;where should the read result
	mov QWORD PTR [rsp+32], 0h   ;not used
	call ReadFile 
	mov rax, [totalRead]  ;check to see the end of file
	cmp rax, 0  ;if zero bytes read than EOF
	je endOfFile

	;mov rax, [totalRead]    ;check to make sure the number  
	;cmp rax, 1
	;jne readError

	mov rsi, OFFSET readBuffer   ; print the character read  from the file 
	push rsi  
	mov rax, 1
	push rax
	call PrintText
	call Printendl
jmp readLoop


endOfFile:
	nop
		  
;commamd type .\TestFie.bin



	;3)close the file
	mov rcx, [inputFileHandle]
	call CloseHandle

	openError:
		nop
		jmp endItAll
	readError:
		nop
		jmp endItAll
	endItAll:
		nop 

	mov		rsi, OFFSET pEndMessage
	push	rsi
	call	PrintString
	call	Printendl

	nop
	sub		rsp, 28h		;Free up 40 bytes, 5 quad-words of stack memory
	mov		rcx, 0
	call	ExitProcess
main ENDP
END