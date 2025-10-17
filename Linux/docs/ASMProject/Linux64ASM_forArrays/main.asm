;
;This program will test out the functions library to show the user of number formatted output
;

;
;Include our external functions library functions
%include "./functions64.inc"

SECTION .data
	openPrompt	db	"Welcome to my Program", 0h
	closePrompt	db	"Program ending, have a nice day", 0h
	
	;a 5 value byte array
	AByteArray	db	11h, 22h, 33h, 44h, 55h
	
	.TYPE equ 1
	.SIZEOF equ $-AByteArray
	.LENGTHOF equ AByteArray.SIZEOF/AByteArray.TYPE
	
	;4 value duble word array
	AWordArray dw 6666h, 7777h, 8888h, 9999h
	
	.TYPE equ 2
	.SIZEOF equ $-AWordArray
	.LENGTHOF equ AWordArray.SIZEOF/AWordArray.TYPE
	
	;3 value duble word array
	ADWordArray dd 0bbbbbbbbh, 0cccccccch, 0ddddddddh
	
	.TYPE equ 4
	.SIZEOF equ $-ADWordArray
	.LENGTHOF equ ADWordArray.SIZEOF/ADWordArray.TYPE
	
	;7 value quiaword array
	AQWordArray dq 0eeeeeeeeeeeeeeeeh, 0ffffffffffffffffh, 0h, 1111111111111111h
	            dq 2222222222222222h, 3333333333333333h, 444444444444444h 
	.TYPE equ 8
	.SIZEOF equ $-AQWordArray
	.LENGTHOF equ AQWordArray.SIZEOF/AQWordArray.TYPE

SECTION .bss

SECTION     .text
	global      _start

_start:
	nop
	
    push	openPrompt
    call	PrintString
    call	Printendl
    
    mov rax, 0h
	mov rsi, 0h

	movzx rax, BYTE [AByteArray]   ;copy the first byte in array into rax

;move the value in our byte array using rsi

	mov rsi, AByteArray  ;put the adress of AByteArray into rsi
	movzx rax, BYTE [rsi]	;PTR put the pointer to value into rax the size of wish in a byte
	add rsi, 1  ;take us to the next value. we cun write 1 or AByteArray
	movzx rax, BYTE [rsi]	;PTR put the pointer to value into rax the size of wish in a byte

	mov rsi, AWordArray
	movzx rax, WORD  [rsi]
	add rsi, 2  ;2
	movzx rax, WORD [rsi]

	mov rsi, ADWordArray
	movzx rax, WORD  [rsi]
	add rsi, ADWordArray.TYPE  ;4
	movzx rax, WORD  [rsi]

	mov rsi, AQWordArray
	mov rax, [rsi]
	add rsi, AQWordArray.TYPE ;8
	mov rax, [rsi]
;how many bytes are in the array
	mov rax, AQWordArray.SIZEOF
	
	mov	rsi, AQWordArray    ;move the qwordarray address into rsi
	mov rax, [rsi]  ; ->
	
	mov rax, QWORD [rsi] ;move qword into rax
	add rsi, AQWordArray.TYPE
	mov rax, QWORD [rsi]
	
	
	;find out how many items are acturaly in the array'
	mov rax, AQWordArray.LENGTHOF

    push	closePrompt			;The prompt address - argument #1
    call  	PrintString
    call  	Printendl
    
    nop
;
;Setup the registers for exit and poke the kernel
;Exit: 
Exit:
	mov		rax, 60					;60 = system exit
	mov		rdi, 0					;0 = return code
	syscall							;Poke the kernel
