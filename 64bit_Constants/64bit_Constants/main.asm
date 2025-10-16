ExitProcess PROTO

MY_COMSTANTS1 =22H

.data

.code
main PROC
	nop

	mov rax, MY_COMSTANTS1
	mov eax, MY_COMSTANTS1
	mov al, MY_COMSTANTS1

	nop
	mov rcx, 0
	call ExitProcess
main ENDP
END