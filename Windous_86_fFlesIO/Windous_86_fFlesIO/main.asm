.386
.model flat, stdcall
.stack 4096
ExitProcess PROTO, dwExitCode:DWORD

;File I/O Function Prototypes for Windows MASM:
CreateFileA PROTO,     ; Create a new file
 fileName:PTR BYTE,    ; Address of the filename
 accessMode:DWORD,    ; File access mode
 shareMode:DWORD,    ; File share mode
 securityAttribs:DWORD,   ; Security flag pointer
 creationOptions:DWORD,   ; File Creation Options
 fileFlags:DWORD,     ; File Attributes
 templateHandle:DWORD   ; Template File Handle

CloseHandle PROTO,     ; Close a File
 FileHandle:DWORD    ; File Handle

WriteFile PROTO,      ; Write to a File
 FileHandle:DWORD,    ; Output File Handle
 writeBuffer:PTR BYTE,   ; Buffer address to Write
 numBytesToWrite:DWORD,  ; Number of bytes to write
 numBytesWritten:PTR DWORD,  ; Result bytes written count
 AsyncDetails:PTR DWORD   ; Asynchronous information - not used

ReadFile PROTO,      ; Read from a File
 FileHandle:DWORD,    ; Input File Handle
 readBuffer:PTR BYTE,    ; Buffer address to Read i nto
 numBytesToRead:DWORD,   ; Number of bytes to read
 numBytesRead:PTR DWORD,  ; Result bytes read count
 AsyncDetails:PTR DWORD   ; Asynchronous information - not used


;Function Parameter Values for Creating/Opening, Writing files in Windows Assembly:

   ; Used for Access Mode in Calls

;Read Mode = 80000000h 
;Write Mode = 40000000h
;Execute Mode = 20000000h
;All Modes = 10000000h

   ; Used for Share Mode Values:

;Don’t Share = 0h
;Read Share = 1h
;Write Share = 2h
;Delete Share = 4h

  ;  File Creation Option Values:

;Create a new file, fails if already exists = 1h
;Create a new file whether it exists or not = 2h
;Open an already existing file, fails if not there = 3h
;Opens the file, if doesn’t exist, creates it = 4h
;Opens an existing file, but erases its contents  = 5h

   ; Used by SetFilePointer function:

;Start at beginning of the file =  0
;Start at the current position of the file =  1
;Start at the end of the file =  2

 ;   File Attribute values:

;File is a read-only file = 1h
;File is a hidden file = 2h
;File is a system file = 4h
;File is a directory = 10h
;File is an archive file = 20h
;File is a device file = 40h
;File is a normal file = 80h
;File is a temporary file = 100h
;File is a sparse file = 200h
;File is a reparse point = 400h
;File is compressed = 800h
;File is off-line = 1000h
;File is not indexed based on its content = 2000h
;File is encrypted = 4000h







.data

fileName db "TestFie.bin", 0h
fileNameSize dd ($-fileName)

someString db  "this is some string", 0h
someStringSize dd ($-someString)


intData1  dd 12345h
intData2  dd 67890h

outputFileHandle dd ?
inputFileHandle dd ?
totalwritten dd ?
totalRead dd ?

.code
main PROC
	nop

;1)open file for output
	INVOKE CreateFileA,
		ADDR fileName,      ;file name
		40000000h,          ;acceses mode Generic write
		0h,                 ;do not shar this file
		0h,                 ;securety none need
		2h,                  ; create always
		80h,                 ; file attributes normal
		0h                   ;template file handle not need
	cmp eax, 0h
	je openError
	mov [outputFileHandle] ,eax

	
	;2)prosess the file comtents
	INVOKE WriteFile,
		outputFileHandle,
		ADDR someString,
		someStringSize,
		ADDR totalWritten,
		0h
		  
;commamd type .\TestFie.bin

;work with int

	INVOKE WriteFile,
		outputFileHandle,
		ADDR intData1,
		4,
		ADDR totalWritten,
		0h

	INVOKE WriteFile,
		outputFileHandle,
		ADDR intData2,
		4,
		ADDR totalWritten,
		0h

		INVOKE CreateFileA,
			ADDR  fileName,   ;the adress our file name
			80000000h,   ;accesed mode: generic read
			0h,  ; don't share the fiel
			0h,   ;No securyty attribut
			3h,   ;open an existing file
			80h,    ;file attributs normal
			0h   ;templete handle -not needed
		mov [inputFileHandle], eax ; save the file handle


		mov [intData1], 0h
		mov [intData2], 0h

		INVOKE ReadFile,
			inputFileHandle,    ;file handle
			ADDR intData1,     ;where to read the file
			4,               ;number of bytes to read
			ADDR totalRead,   ; how many bytes were ectialy add
			0h      ; not used
		mov eax, [totalRead]
		cmp eax, 4
		jne readError



	;3)close the file
	 INVOKE CloseHandle,
		outputFileHandle

		jmp endItAll


	readError:
		nop
		jmp endItAll

	openError:
		nop

	endItAll:
		nop

	nop
	INVOKE ExitProcess,0
main ENDP
END main