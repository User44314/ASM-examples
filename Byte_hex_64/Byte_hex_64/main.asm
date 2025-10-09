ExitProcess PROTO
.data

	byteVariable	db	0ffh

.code
main PROC
	nop

	mov rax, 0h
	movzx	rax,	[byteVariable]
	sub	rax,	1
	add	rax,	1
	add	rax,	1

	mov rcx, 0
	call ExitProcess
main ENDP
END