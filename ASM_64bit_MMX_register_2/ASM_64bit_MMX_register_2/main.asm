%include functions64bitLibrary.inc

.data
	;Place your variables and memory allocations here
	welcomeMessage		db	"Hello World!", 00h
	pEndMessage			db	"Program ending, have a great day!", 00h
	
	doubleFloat dq 123.45
	;doubleFloat REAL8 1.0
	doubleInt dq 100

	singlFloat dd 234.56
	singlInt	dd 99

	tempFloat2 dd ?
	tempFloat dq ?




.code
main PROC
	nop

	;Place your program code here
	mov		rsi, OFFSET welcomeMessage
	push	rsi
	call	PrintString
	call	Printendl

	movsd xmm0, [doubleFloat]  ;for float
	;movss xmm0, [singlFloat]   ;for int
	;movss [tempFloat2], xmm0
	movsd [tempFloat], xmm0
	
	movsd xmm1, [doubleFloat]
	movsd [tempFloat], xmm1

	cvtsi2sd xmm1, [doubleInt]
	movsd [tempFloat], xmm1

	addsd xmm0, xmm1
	movsd [tempFloat], xmm0
	
	vaddsd xmm3, xmm0, xmm1
	movsd [tempFloat], xmm3
	
	vsubsd xmm3 , xmm1, xmm1  ;dest subtract xmm0 from xmm1 and place into xmm3
	movsd [tempFloat], xmm3

	vmulsd xmm3, xmm0, xmm1   ; xmm3 = xmm0 * xmm1
	vdivsd xmm3, xmm0, xmm1  ;xmm3 = xmm0/xmm1
	movsd [tempFloat], xmm3

	sqrtsd xmm3, xmm0  ; xmm3 = sqrt(xmm0) 
	rcpss xmm3, xmm0   ; xmm3 = 1/ xmm0


	;compare two values

	ucomisd xmm3, xmm0  ; is complete
	inc [doubleInt]

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