ExitProcess PROTO
%include someFunction.inc

;AddTwo PROTO
;SubTwo PROTO

.data

.code
main PROC
	nop

;place your progrma code here
	push  rbx  ; save our argument register
	push  rcx  ; 
	mov rbx, 10h
	mov rcx, 20h
	call AddTwo
	pop rcx		;restore our aruments register
	pop rbx 


	nop
	mov rcx, 0
	call ExitProcess
main ENDP
END