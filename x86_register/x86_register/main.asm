.386
.model flat,stdcall
.stack 4096

%include functions32bitLibrary.inc

.data
	;Place your variables and memory allocations here
	welcomeMessage		db	"Hello World!", 00h
	pEndMessage			db	"Program ending, have a great day!", 00h
	


.code
main PROC
	nop

	;Place your program code here
	push	OFFSET welcomeMessage
	call	PrintString
	call	Printendl

	mov		eax, 0ffffffffh
	mov		al,	11h
	mov		ah,	22h

	mov		eax,	0ffffffffh
	mov		ax,		3333h

	push	OFFSET pEndMessage
	call	PrintString
	call	Printendl

	nop
	INVOKE ExitProcess,0
main ENDP
END main