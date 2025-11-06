%include functions64bitLibrary.inc

.data
	;Place your variables and memory allocations here
	welcomeMessage		db	"Hello World!", 00h
	pEndMessage			db	"Program ending, have a great day!", 00h
	align 16
	floatArray dd 111.11
			   dd 222.22
			   dd 333.33
			   dd 444.44
	
	tempFloat real4 0.0


.code
main PROC
	nop

	;Place your program code here
	mov		rsi, OFFSET welcomeMessage
	push	rsi
	call	PrintString
	call	Printendl

	finit
	mov rsi, offset floatArray
	mov rcx, 4
	sumLoop:
		mov eax, [rsi]
		mov [tempFloat], eax
		fld tempFloat
		fld st(0)
		fadd
		fstp tempFloat
		mov eax, [tempFloat]
		mov [rsi], eax
		add rsi, 4
	loop sumLoop   ;116 clock ticks


	movaps xmm0, [floatArray]   ;4
	addps xmm0, xmm0			;4
	movaps [floatArray], xmm0	;4     12 clock ticks

	mov		rsi, OFFSET pEndMessage
	push	rsi
	call	PrintString
	call	Printendl

	nop
	sub		rsp, 28h		;Free up 40 bytes, 5 quad-words of stack memory
	mov		rcx, 0
	call	ExitProcess
main ENDP
END