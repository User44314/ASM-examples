ExitProcess PROTO
INCLUDE functions64bitLibrary.inc
.data
	welcomPromt db "welcom to project ",0h
.code
main PROC
	nop

	mov rsi, OFFSET welcomPromt
	push rsi
	call PrintString
	call Printendl
	call Printendl

	nop
	mov rcx, 0
	call ExitProcess
main ENDP
END