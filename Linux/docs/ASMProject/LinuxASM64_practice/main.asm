;
;This program will test out the functions library to show the user of number formatted output
;

;
;Include our external functions library functions
%include "./functions64.inc"

SECTION .data
	openPrompt	db	"Welcome to my Program", 0h
	closePrompt	db	"Program ending, have a nice day", 0h
	
	VarA	dq 10h
	VarB	dq 20h
	VarC    dq 30h
	VarD	dq 40h
	VarE 	dq 50h

SECTION .bss

SECTION     .text
	global      _start


_start:
	nop
	
    push	openPrompt
    call	PrintString
    call	Printendl
    
    ;simple equality test  signed
    ;if (vara == varb)
    ;varc =32
    ;else
	;varc =-22
	
	mov rcx, 22    ;assume varA to varB
	mov rax, [VarA] ; move our data into the registers
	mov rbx, [VarB] ; 
	cmp rax, rbx ; do the if
	je ifelse1_End  ; if equal we already did the assignment
	mov rcx, -22 ; not equal to assign -22
	ifelse1_End:  
	mov [VarC], rcx  ; store the result
	
	
	mov rax, [VarA] ; move our data into the registers
	mov rbx, [VarB] ; 
	cmp rax, rbx ; do the if
	je ifelse2_End  ; if equal we already did the assignment
	mov rcx, -22 ; not equal to assign -22
	jmp something1
	ifelse2_End:  
	mov rcx, 22
	something1:
	mov [VarC], rcx  ; store the result
	
	
    push	closePrompt			;The prompt address - argument #1
    call  	PrintString
    call  	Printendl
    
    
    ;complex and equality test signed
    ;if ((varA == varB) and (varA > varC))
    ;	varD =33
    ;else
    ; VarD = -31
    mov rax, [VarA]  
    mov rbx, [VarB]
    mov rcx, [VarC]
    mov rdx, -31
    cmp rax, rbx
    jne ifelse3_End
    cmp rax, rcx
    jle ifelse3_End
    mov rdx, 33
    ifelse3_End:
    mov [VarD], rdx
    nop
    
    
    
    ;complex or equality test unsigned
    ;use rcx as the temporary rigester
    ;if ((varA < varB) or (varA < varC))
    ;	varD = VarA
    ;else
    ;	varD = varC
    mov rax, [VarA]
    mov rbx, [VarB]
    mov rcx, [VarC]
    mov rdx, rax
    cmp rax, rbx
    jb ifelse4_End
    cmp rax, rcx
    jb ifelse4_End
    mov rdx, rcx
    
    ifelse4_End:
    mov [VarD], rdx
    
    
    mov rax, [VarA]
    cmp rax, [VarB]
    
    
    ;if (VarA == VarB) AND (VarA > VarC) AND (VarC > VarD) AND (VarD > VarE)
    mov rax, [VarA]
    mov rbx, [VarB]
	mov rcx, [VarC]
	mov rdx, [VarD]
	cmp rdx, [VarE]
	
;
;Setup the registers for exit and poke the kernel
;Exit: 
Exit:
	mov		rax, 60					;60 = system exit
	mov		rdi, 0					;0 = return code
	syscall							;Poke the kernel
