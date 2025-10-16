%include functions64bitLibrary.inc

.data
	;Place your variables and memory allocations here
	welcomeMessage		db	"Hello World!", 00h
	pEndMessage			db	"Program ending, have a great day!", 00h
	
	;a 5 value byte array
	AByteArray	db	11h, 22h, 33h, 44h, 55h
	;4 value duble word array
	AWordArray dw 6666h, 7777h, 8888h, 9999h
	;3 value duble word array
	ADWordArray dd 0bbbbbbbbh, 0cccccccch, 0ddddddddh
	;7 value quiaword array
	AQWordArray dq 0eeeeeeeeeeeeeeeeh, 0ffffffffffffffffh, 0h, 1111111111111111h,
	               2222222222222222h, 3333333333333333h, 444444444444444h 

.code
main PROC
	nop

	;Place your program code here
	mov		rsi, OFFSET welcomeMessage
	push	rsi
	call	PrintString
	call	Printendl

	mov rax, 0h
	mov rsi, 0h

	movzx rax, AByteArray   ;copy the first byte in array into rax

	mov rsi, OFFSET AByteArray  ;put the adress of AByteArray into rsi
	movzx rax, BYTE PTR [rsi]	;PTR put the pointer to value into rax the size of wish in a byte
	add rsi, 1  ;take us to the next value. we cun write 1 or AByteArray
	movzx rax, BYTE PTR [rsi]	;PTR put the pointer to value into rax the size of wish in a byte

	mov rsi, OFFSET AWordArray
	movzx rax, WORD PTR [rsi]
	add rsi, 2
	movzx rax, WORD PTR [rsi]

	mov rsi, OFFSET ADWordArray
	movzx rax, WORD PTR [rsi]
	add rsi, TYPE ADWordArray  ;8
	movzx rax, WORD PTR [rsi]

	mov rsi, OFFSET AQWordArray
	mov rax, [rsi]
	add rsi,  TYPE AQWordArray 
	mov rax, [rsi]

	mov rax, SIZEOF AQWordArray
	mov rax, LENGTHOF AQWordArray

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