;
;This program will test out the functions library to show the user of number formatted output
;

;
;Include our external functions library functions
%include "./functions64.inc"

SECTION .data
	openPrompt	db	"Welcome to my Program", 0h
	closePrompt	db	"Program ending, have a nice day", 0h

SECTION .bss
;	1 1 1 0 1 1 0 0 
;	Shift left
;	<------ 1 bit
;	1 1 0 1 1 0 0 0
;	<------ 1 bit
;	1 0 1 1 0 0 0 0
;	carry flag = 1
;	shift left = 3
;	1 0 0 0 0 0 0 0
;	carry flag = 0 ; becase it's last the zero of edge 
;	;--------------------------------------------------
;	1 1 1 0 1 1 0 0 
;	Shift right 1
;	----------->
;	0 1 1 1 0 1 1 0
;	carry flag = 0
;	shift right = 2
;	0 0 0 1 1 1 0 1
;	carry flag = 1
	
	 
SECTION     .text
	global      _start

_start:
	nop
	
    push	openPrompt
    call	PrintString
    call	Printendl
    
    
    mov al, 2
    shl al, 1
    nop 
    shr al, 1
    
    
    mov al, 2
    shr al, 1
    shr al, 1
    nop
      
    mov eax, 0   ;clear eax
    mov al, 11100101b    ;move a binary number into al
    shr al, 1   ;001110010
    ;jc 	carrySet
    ;nop
    shr al, 1   ;000111001
    jc 	carrySet
    nop
    
    
    mov al, 11101010b
    sar al, 5
    jc carrySet
    nop
    
    
   ; mov eax, -2
   ; al = 1111101
   ; shr al, 1   ; if sar al, 1 
   ; al = 0111110 ; al = 1 1111110
   ; nop
    
    
    mov eax, -2
    sar eax, 1   ;or sal = shl
    nop
     
    shr al, 1
    nop
       
  ;     2**5 = 32
  ;     2**2 = 4
  ;     ---------
  ;				36
  
  mov eax, 300
  mov ebx, eax
  shl eax, 5   ;300 *32
  shl ebx, 2	;300 *4
  add eax, ebx ;300 *32 + 300 * 4
  ;9,600
  
  
  
    ;1 1 1 1 0 0 0 0   +1
	;1 1 1 0 0 0 0 1
	;1 1 0 0 0 0 1 1 
	;1 0 0 0 0 1 1 1
	
	
	nop
	mov al, 11100011b
	ror al, 6
	jc carrySet
	
	rol al, 1
	rol al, 1
	rol al, 1
	rol al, 1
	rol al, 1
	rol al, 1
	rol al, 1
	nop
	
	1 1 1 1 0 0 0 1      0(flag)
	rcr al, 1   ;to the right
	0 1 1 1 1 0 0 0      1 (flag)
	rcl al , 1
	1 1 1 1 0 0 0 0


	1 1 1 1 0 0 0 1      0(flag)
	rcl al , 1    ; to the left
	1 1 1 0 0 0 1 0      1 (flag)

    carrySet:
    rol al, 6
	nop
	
	
	
	
	
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
