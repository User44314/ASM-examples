ExitProcess PROTO
.data
	byteVaribale	db	11h
	wordVariable	dw	2233h
	dworldVariable	dd	44556677h
	qwordVariable	dq	9900112233445566h

	byteVaribale2	db	12h

.code
main PROC
	nop


	nop
	mov rcx, 0
	call ExitProcess
main ENDP
END