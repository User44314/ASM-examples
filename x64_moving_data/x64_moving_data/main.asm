ExitProcess PROTO
.data
	openPrompt	db	"Welcome to my Program", 0h
	closePrompt	db	"Program ending, have a nice day", 0h
	
	someByte		db	11h
	someWord		dw	2222h
	someDWord		dd	33333333h
	someQWord		dq	4444444444444444h

.code
main PROC
	nop
    
    ;moving memory into register
    mov		rax,0h
    mov		al, [someByte]
    ;movzx		rax, BYTE [someByte]   ;mov		rax, [someByte]
    
    ;[]around a memory label 
    ;means go get the dataa (dereferencing)
    ;without the [], it will put the addresss 
    ;of the label into the register

	;moving leterals to registers
    mov		rax, 01000011b
    mov		eax, 123h
    mov		ax,	55h
    mov 	al, 32h
    mov		ah, 12h
    mov		al, 'A'
    
    ;moving between registers
    mov		r8, rax
    mov 	rcx, r8
    movzx	rcx, al		;movzx - move zero extend moving something smaller 
						;into some bigger amd make all of teh more sign


	nop
	mov rcx, 0
	call ExitProcess
main ENDP
END