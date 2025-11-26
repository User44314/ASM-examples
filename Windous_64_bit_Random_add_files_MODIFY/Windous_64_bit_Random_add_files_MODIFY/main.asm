%include functions64bitLibrary.inc

CreateFileA PROTO
CloseHandle PROTO
WriteFile PROTO
ReadFile PROTO
SetFilePointer PROTO

.data
	;Place your variables and memory allocations here
	welcomeMessage		db	"Hello World!", 00h
	pEndMessage			db	"Program ending, have a great day!", 00h
	fileCreateError		db "error creating the file", 0h
	fileOpenError		db "error opening the file", 0h
	fileWriteError		db "error writing to the output file", 0h
	inputOpenError		db "error openig the input file", 0h
	readingError		db "error reading from the file", 0h
	writtingMessage		db "writing the values from the file", 0h
	readingMessage		db "readjing the values from the file", 0h
	
	intEntryMessage		db "please enter the record to read -999 to quiet", 0h
	readErrorMessage	db "error you need to input a non negative integer", 0h
	entryErrorMessage	db "error the position you specified does not exit in the file", 0h
	
	;1.1) new message
	newValueMessaage db "now enter a new value for this position in the file", 0h

	
	fileName db "TestFile.bin", 0h
	fileNameSize dd ($-fileName)

	intValue				dq ?

	outputFileHandle		dq ?
	inputFileHandle			dq ?
	totalWritten			dq ?
	totalRead				dq ?
	newValue				dq ?
	saveFilePosition		dq ?

.code
main PROC
	nop

	;Place your program code here
	mov		rsi, OFFSET welcomeMessage
	push	rsi
	call	PrintString
	call	Printendl

	mov rsi, OFFSET writtingMessage   ; print a message to say the file is being writing to
	push rsi 
	call PrintString 
	call Printendl

	;calling standard for MASM
	;agrument number one in rcx
	;afrument number teo in rdx
	;argument number three in r8
	;argument number four in r9
	;argemnent afterward : rsp+32, rsp+40, rsp+48, etc

	mov rcx, OFFSET fileName							;address of the file name
	mov rdx, 40000000h									;acsess mode generetic write
	mov r8, 0h											; do not share this file
	mov r9, 0h											; securyty none needed
	mov QWORD PTR [rsp+32], 2h							; create always
	mov QWORD PTR [rsp+40], 80h							; file attributes normal
	mov QWORD PTR [rsp+48], 0h							; template file handle not needed

	Call CreateFileA
	cmp rax, 0h								; if the resut is negative 
	jl errorOpeningFile						; error than end 
	mov [outputFileHandle], rax				; otherwise save the file handle returned

	;write numbers to the files
	mov rax, 1111h							; the staring value
	mov rcx, 100							;lets write 100 value
	writeLoop:
		mov r12, rcx						;save our loop counter
		mov [intValue], rax					; move the value to intValue variable
		mov rcx, [outputFileHandle]			; file to write to  
		mov rdx, OFFSET intValue			;address of the variaable to write
		mov r8, 8							; the number of bytes to write
		mov r9, OFFSET totalWritten			; the addresss of the total writeen varible
		mov QWORD PTR [rsp+32], 0h			; not used
		call WriteFile     
		cmp rax, 0							; make sure 8 bytes were writeen
		jl errorWritingFile					; if not error and end
		mov rax, [intValue]					; placee the value back into rax
		add rax, 1111h						; add 1111h
		mov rcx, r12						; restore the loop counter
	loop writeLoop

	;close the file
	mov rcx, outputFileHandle   ;the file to close
	Call CloseHandle			; close the file
	 
	mov rsi, OFFSET readingMessage ;print the message that the file is being read from
	push rsi
	call PrintString
	call Printendl

	;open the file for input
	mov rcx, OFFSET fileName   ;address of the file name
	mov rdx, 0C0000000h  ; accesss mode generetic read | generic write
	mov r8, 0h  ; do not share this file
	mov r9, 0h  ; securyty none neeede
	mov QWORD PTR [rsp+32], 3h  ;open an existing file
	mov QWORD PTR [rsp+40], 80h  ; file attribute normal
	mov QWORD PTR  [rsp+48], 0h  ; template file handle not need
	call CreateFileA     
	cmp rax, 0h      ;if the result is negative
	jl errorOpeningFile   ;error then end
	mov [inputFileHandle], rax   ; otherwise save the fiel handle returned


	

	readLoop:
	;1) in a loop ask the user in a position in the file to read
	mov rsi, offset intEntryMessage
	push rsi
	call PrintString 
	call InputSInt
	jc inputError
	cmp rax, -999
	je endLoop
	cmp rax, 0
	jl InputError



	;2) calculate the position in the file based on user input
	mov rbx, 8
	mul rbx
	mov [saveFilePosition], rax ;save the file position for later
	
	
	;3) position the read painter to that location
	mov rcx, [inputFileHandle]
	mov rdx, rax   ;position to move the pointer to lower
	mov r8, 0h ; upper  portion
	mov r9, 0h   ;0-beginig of the file 1- current of the position 2 - end
	call SetFilePointer  ;rax will contain the position in the file the pointer
	
	
	;4) read the data and disply
	mov rcx, [inputFileHandle]
	mov rdx, OFFSET intValue ; whrer will the read value to  be stored
	mov r8, 8  ;number of bytes to read 
	mov r9, OFFSET totalRead   ; how many bytes were actually read
	mov QWORD PTR [rsp+32], 0  ;not used
	call ReadFile
	mov rax, [totalRead]  ;totsl bytees read will be in total read
	cmp rax, 8   ;if it's not  equal to 8 an read error ocurere
	jne readError
	mov rax, [intValue]  ;lets prrint the value from the file
	push rax

	call Print64bitNumhex
	call Printendl


	;2.1) now ask the user for a new value to be written to the file
	mov rsi, OFFSET  newValueMessaage
	push rsi
	call PrintString
	call InputHex
	jc inputError
	mov [newValue], rax




	;3.1) position the read pointer in the file
	mov rcx, [inputFileHandle]   ;the file we wish to manipulate
	mov rdx, [saveFilePosition]  ; the position to be writing to (lower)
	mov r8, 0    ;(upper position)
	mov r9, 0     ;0= from the beginning of the file
	call SetFilePointer   ;


	;rax will contain the position in the file where the pointer is located
	;4.1) write the new value to the file
	mov rcx, [inputFileHandle]
	mov rdx, OFFSET newValue  ;the adress of the data to write
	mov r8, 8 ; the numbers of bytes to write to the file
	mov r9, OFFSET totalWritten
	mov QWORD PTR [rsp+32], 0   ; not used
	call WriteFile
	cmp rax, 0    ; check to see if the data was written ok
	jl errorWrittingInputFile



	jmp readLoop
		readError:
			mov rax, OFFSET readErrorMessage
			push rax
			call PrintString
			call Printendl
		
		jmp readLoop
			inputError:
			mov rax, OFFSET entryErrorMessage
			push rax
			call PrintString
			call Printendl
		jmp readLoop
		
		errorWrittingInputFile:
			mov rsi, offset fileWriteError
			push rsi
			call PrintString
			call Printendl

		endLoop:
			nop


	;close the file
	mov rcx, inputFileHandle
	Call CloseHandle

	jmp endItAll

	fileError:
		nop
		mov rsi, offset inputFileHandle
		push rsi
		call PrintString
		call Printendl
		jmp endItAll


	errorWritingFile:
		mov rsi, offset fileWriteError
		push rsi
		call PrintString
		call Printendl
		jmp endItAll

	errorOpeningFile:
		mov rsi, offset fileCreateError
		push rsi
		call PrintString
		call Printendl
		jmp endItAll
	
	endItAll:
		mov rsi, offset pEndMessage
		push rsi
		Call PrintString
		Call Printendl


	;mov		rsi, OFFSET pEndMessage
	;push	rsi 
	;call	PrintString
	;call	Printendl

	;nop
	;sub		rsp, 28h		;Free up 40 bytes, 5 quad-words of stack memory
	;mov		rcx, 0
	;call	ExitProcess
main ENDP
END