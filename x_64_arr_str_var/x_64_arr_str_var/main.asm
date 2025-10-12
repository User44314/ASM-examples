%include functions64bitLibrary.inc

.data
	;Place your variables and memory allocations here
	welcomeMessage		db	"Hello World!", 00h
	pEndMessage			db	"Program ending, have a great day!", 00h
	
	;intergers allocated
	byteVar		db 0ffh
	byteVar2	db ?
	byteVar3	BYTE	123

	wordVar	dw	0ffffh
	wordVar2 dw ?
	wordVar3 WORD 123h

	dwordVar	dd	0ffffh
	dwordVar2 DWORD 0h
	dwordVar3 dd ?

	qwordVar	dq	1234h
	qwordVar2 dq ?
	qwordVar3 QWORD	567h

	;floating pointers variebles
	aFloatSP	REAL4	123.45
	aFloatSP2	dd -123.45

	AFloatDP	REAL8	123.67
	AFloatDP2	dq	-123.67

	AFloatEP	REAL10	123.4784848798798
	AFloatEP2	dt     -123.8847484784794

	;Characters
	aChar	db 'A'
	aChar2 BYTE	"A"

	myName db "hello my darling", 0h
	maName2 BYTE "hello hi", 0h
	maName3 db "hello Alex", 0ah, 0dh, 0h ;endl \n

	;arrays
	array1 db 'ABC', 12, 0ffh  ;five bytes long
	array2 dq 123, 567, 899 ; 24bytes long 3 quads
	array3 db 10 dup(?)
	array4 dq 10000 dup(?)
	array5 dq 50000 dup(0)
	array6 dd 40 dup(99h)


.code
main PROC
	nop

	;Place your program code here
	mov		rsi, OFFSET welcomeMessage
	push	rsi
	call	PrintString
	call	Printendl

	
	

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