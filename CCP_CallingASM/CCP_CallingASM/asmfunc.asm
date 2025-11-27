.code


getFive PROC
	mov rax, 5
ret

getFive ENDP


addTwo PROC    ;, Arg1 : QWORD, Arg2 : QWORD
	mov rax, rcx   ;our first argument
	add rax, rdx  ;add our second argument
ret
addTwo ENDP


addArray PROC
	nop
	push rsi
	push rcx

	mov rsi, rcx			;the first argument / array pointer
	mov rcx,  rdx			;the second argument/ number of items in the array
	mov rax, 0              ;zero out of our accamulator
	AA_LOOP1:
		add rax, [rsi]    ;add an array value to rax
		add rsi, 8        ; go to the next array location
	loop AA_LOOP1
	pop rcx
	pop rsi
ret
addArray ENDP
	


END