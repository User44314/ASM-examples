.386
.model flat, stdcall
.stack 4096
ExitProcess PROTO, dwExitCode:DWORD
INCLUDE functions32bitLibrary.inc
.data
	WelcomePromt db "Welcom to my project", 0h

.code
main PROC
	nop

	push OFFSET	WelcomePromt
	call PrintString
	call Printendl
	call Printendl

	nop
	INVOKE ExitProcess,0
main ENDP
END main