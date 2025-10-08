.386
.model flat, stdcall
.stack 4096
ExitProcess PROTO, dwExitCode:DWORD
.data


.code
main PROC
	nop

	nop
	INVOKE ExitProcess,0
main ENDP
END main