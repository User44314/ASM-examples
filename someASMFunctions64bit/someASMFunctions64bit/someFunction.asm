.data
	;data only available to your functionc
.code
AddTwo PROC
	push rbx
	push rcx
	mov rax, rbx
	add rax, rcx
	pop rcx
	pop rbx
	ret
AddTwo ENDP

SubTwo PROC
	mov rax, rbx
	sub rax, rcx
	ret
SubTwo ENDP
 END

