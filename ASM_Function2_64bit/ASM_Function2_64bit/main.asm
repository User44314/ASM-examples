%include functions64bitLibrary.inc

.data
	;Place your variables and memory allocations here
	welcomeMessage		db	"Hello World!", 00h
	pEndMessage			db	"Program ending, have a great day!", 00h


.code
main PROC
	nop

	;Place your program code here
	mov		rsi, OFFSET welcomeMessage
	push	rsi
	call	PrintString
	call	Printendl


	mov rbx, 10h
	mov rcx, 20h
	call AddTwo

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


;
;inputs: rbx and rcx will contain value to add
;return: rax will contain the sum of the two argument
;
 
AddTwo PROC
	mov rax, rbx
	add rax, rcx
	ret
AddTwo ENDP

END