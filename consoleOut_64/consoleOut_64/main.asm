ExitProcess PROTO 
GetStdHandle PROTO
WriteConsoleA PROTO  hConsoleOutput:Dword,lpBuffer:Ptr BYTE, nNumberOFCharsToWrite:Dword, lpNumberOfCharsWrite:DWORD, lpResrved:DWORD
ReadConsoleA PROTO  hConsoleInput:DWORD, lpBuffer:PTR BYTE, nNumberOfBytesToRead:DWORD, lpNumberCharsRead:DWORD, lpReserved:DWORD ; (not used)

OUTPUTHANDLE =-11
INPUTHANDLE =-10
SYS_WRITE = 4h
STDOUT = 1h



.data
	welcomePrompt db "welcom my first program", 0h   
	endl db 0ah, 0dh, 0h

stringLength dq 0h
screenHandle dq 0h   
stringAddr   dq 0h
outputCounter dq  ?

inputBuffer db  128 dup(?)

.code
main PROC
	nop

	;mov rdx, LENGTHOF welcomePrompt     ;length of our sring
	;mov [stringLength], rdx

	;mov rcx, OUTPUTHANDLE
	;call GetStdHandle  ; where will we write it to
	
	;mov [screenHandle], rax

	;mov rdi, OFFSET welcomePrompt    ;the adress of string
	;mov [stringAddr], rdi

	;call WriteConsoleA
	
	mov rdi, OFFSET welcomePrompt
	push rdi
	push LENGTHOF welcomePrompt
	call writeString

	mov rdi, OFFSET endl
	push rdi
	push LENGTHOF endl
	call writeString

	mov rdi, OFFSET inputBuffer
	push rdi
	push LENGTHOF inputBuffer
	call readString

	mov rdi, OFFSET inputBuffer
	push rdi
	mov rax, [outputCounter]
	dec rax
	push rax
	call writeString

	;mov rdx, LENGTHOF endl     ;length of our sring
	;mov [stringLength], rdx
	;;call GetStdHandle ; where will we write it to
	;mov [screenHandle], rax
	;mov rdi, OFFSET welcomePrompt    ;the adress of string
	;mov [stringAddr], rdi

	nop

	mov rcx, 0
	call ExitProcess
main ENDP


readString PROC
	push  rbp
	mov rbp, rsp

	mov rdx, [rbp+16] ;the size of the string
	mov [stringLength], rdx  ; 

	mov rcx, INPUTHANDLE
	call GetStdHandle   ; where will we write it to
	mov [screenHandle], rax 

	mov rdi , [rbp+24]  ; the adress of our string
	mov [stringAddr], rdi
	
	mov rcx, [screenHandle]
	mov rdx, [stringAddr]
	mov r8, [stringLength]
	mov r9, OFFSET [outputCounter]

	call ReadConsoleA
	 
	mov rsp, rbp
	pop  rbp
	ret

readString ENDP

writeString PROC
	push  rbp
	mov rbp, rsp

	mov rcx, [rbp+16] ;the size of the string
	mov [stringLength], rdx  ; 

	mov rcx, OUTPUTHANDLE
	call GetStdHandle   ; where will we write it to
	mov [screenHandle], rax

	mov rdi , [rbp+24]  ; the adress of our string
	mov [stringAddr], rdi
	mov rcx, [screenHandle]
	mov rdx, [stringAddr]
	mov r8, [stringLength]
	mov r9, OFFSET [outputCounter]

	call WriteConsoleA
	 
	mov rsp, rbp
	pop  rbp
	ret

writeString ENDP

END