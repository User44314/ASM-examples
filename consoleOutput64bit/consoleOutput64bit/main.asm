.386
.model flat, stdcall
.stack 4096
ExitProcess PROTO, dwExitCode:DWORD
GetStdHandle PROTO, nStdHandle:DWORD
WriteConsoleA PROTO, hConsoleOutput:Dword,lpBuffer:Ptr BYTE, nNumberOFCharsToWrite:Dword, lpNumberOfCharsWrite:DWORD, lpResrved:DWORD
ReadConsoleA PROTO, hConsoleInput:DWORD, lpBuffer:PTR BYTE, nNumberOfBytesToRead:DWORD, lpNumberCharsRead:DWORD, lpReserved:DWORD ; (not used)

OUTPUTHANDLE =-11
INPUTHANDLE =-10
SYS_WRITE = 4h
STDOUT = 1h


.data

welcomePrompt db "welcom my first program", 0h   
endl db 0ah, 0dh, 0h

stringLength dd 0h
screenHandle dd 0h   
stringAddr   dd 0h
outputCounter dd ?

inputBuffer db 128 dup(?)

.code
main PROC
	nop


	push OFFSET welcomePrompt
	push LENGTHOF welcomePrompt
	call writeString

	push OFFSET endl
	push LENGTHOF endl
	call writeString

	push OFFSET inputBuffer
	push LENGTHOF inputBuffer
	call readString

	push OFFSET inputBuffer
	push [outputCounter]
	call writeString
	
	;mov edx, LENGTHOF welcomePrompt     ;length of our sring
	;mov [stringLength], edx
	;INVOKE GetStdHandle, OUTPUTHANDLE  ; where will we write it to
	;mov [screenHandle], eax
	;mov edi, OFFSET welcomePrompt    ;the adress of string
	;mov [stringAddr], edi

	;INVOKE WriteConsoleA, screenHandle, stringAddr, stringLength, ADDR outputCounter,0
	
	;push OFFSET welcomePrompt
	;push LENGTHOF welcomePrompt
	;call writeString

	;push OFFSET endl
	;push LENGTHOF endl
	;call writeString

	;push OFFSET inputBuffer
	;push LENGTHOF inputBuffer
	;call readString

	;mov edx, LENGTHOF endl     ;length of our sring
	;mov [stringLength], edx
	;INVOKE GetStdHandle, OUTPUTHANDLE  ; where will we write it to
	;mov [screenHandle], eax
	;mov edi, OFFSET welcomePrompt    ;the adress of string
	;mov [stringAddr], edi

	nop
	INVOKE ExitProcess,0

main ENDP

readString PROC
	push  ebp
	mov ebp, esp

	mov edx, [ebp+8] ;the size of the inputBuuffer
	mov [stringLength], edx  ; 
	INVOKE GetStdHandle, OUTPUTHANDLE  ; where will we write it to
	mov [screenHandle], eax
	mov edi, [ebp+12]  ; the adress of our input buffer
	mov [stringAddr], edi
	INVOKE ReadConsoleA, screenHandle, stringAddr, stringLength, ADDR outputCounter,0
	 
	mov esp, ebp
	pop  ebp
	ret

readString ENDP



writeString PROC
	push  ebp
	mov ebp, esp

	mov edx, [ebp+8] ;the size of the string
	mov [stringLength], edx  ; 
	INVOKE GetStdHandle, OUTPUTHANDLE  ; where will we write it to
	mov [screenHandle], eax
	mov edi , [ebp+12]  ; the adress of our string
	mov [stringAddr], edi
	INVOKE WriteConsoleA, screenHandle, stringAddr, stringLength, ADDR outputCounter,0
	 
	mov esp, ebp
	pop  ebp
	ret

writeString ENDP
END main



