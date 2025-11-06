%include functions64bitLibrary.inc

.data
	;Place your variables and memory allocations here
	welcomeMessage		db	"Hello World!", 00h
	pEndMessage			db	"Program ending, have a great day!", 00h
	
	;aQuadArray	dq 100h, 200h, 300h, 400h, 500h, 600h, 700h
	aQuadArray	dq 100, 200, 300, 400, 500, 600, 700


.code
main PROC
	nop

	;Place your program code here
	mov		rsi, OFFSET welcomeMessage
	push	rsi
	call	PrintString
	call	Printendl

	mov rax, OFFSET aQuadArray  ;adress
	push rax
	mov rax, LENGTHOF aQuadArray ; lenth array
	push rax
	call AddQArray
	push rax
	;call Print64bitNumHex
	call Print64bitNumDecimal
	call Printendl
	

	mov		rsi, OFFSET pEndMessage
	push	rsi
	call	PrintString
	call	Printendl

	nop
	sub		rsp, 28h		;Free up 40 bytes, 5 quad-words of stack memory
	mov		rcx, 0
	call	ExitProcess
main ENDP

addQArray PROC
	;create our stack frame
	push rbp
	mov rbp, rsp

	;arguments #1 address of the array   [rbp+24]
	;argument #2 number of itemes size in the array [rbp+16]
	push rsi	;backup the register i plan on using
	push rcx	;

	mov rsi, [rbp+24] ;the address of our array
	mov rcx, [rbp+16] ;the number of itemes in the arrays
	mov rax, 0h ; zero out our accumulator
	aQA_Loop1:
		add rax, [rsi]  ; Add an array value to rax
		add rsi, 8    ; move to the next position array

	loop aQA_Loop1
	
	pop rcx    ; restore the previosly backed up registers
	pop rsi

	;destroy our stack frame
	mov rsp, rbp
	pop rbp
	ret 16

addQArray ENDP


END