.386
.model flat, stdcall
.stack 4096
ExitProcess PROTO, dwExitCode:DWORD
.data

	byteVariable	db	192

.code
main PROC
	nop

	nop
	INVOKE ExitProcess,0
main ENDP
END main