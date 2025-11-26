;
;This program will test out the functions library to show the user of number formatted output
;

;
;Include our external functions library functions
%include "./functions64.inc"

SECTION .data
	openPrompt	db	"Welcome to my Program", 0h
	closePrompt	db	"Program ending, have a nice day", 0h
	fileCreateError db "error creating the file", 0h
	fileOpenError db "error opening the file", 0h
	fileWriteError db "error writing to the output file", 0h
	inputOpenError db "error openig the input file", 0h
	wrintigMessage db "writing the values from the file", 0h
	readigMessage db "readj=ing the values from the file", 0h
	inputValueMsg db "please enter the record to read -999 to quiet", 0h
	inputErrorMSg db "error you need to input a non negative integer", 0h
	notFoundMsg db "error the position you specified does not exit in the file", 0h
	newValueMsg db "error new hexocanal for value huge have selection", 0h
	
	fileName db "intFile.bin", 0h

SECTION .bss

	fileHandle 		resq 1
	intValue 		resq 1
	newValue 		resq 1
	filePosition 	resq 1

	outputFileHandle 	resq 1
	inputFileHandle 	resq 1
	readBuffer 			resb 10
	totalRead 			resq 1
	;intValue 			resq 1

SECTION     .text
	global      _start

_start:
	nop
	
    push	openPrompt
    call	PrintString
    call	Printendl
    
    push wrintigMessage
    call PrintString
    call Printendl
    
    ;create the file and open it for output
    ;create the file to read later
    
    ;1 create the file
    mov rax, 85     ;crate the file
    mov rdi, fileName   ; the name of the file
    mov rsi, 777o   ; file sucurity attrabutes
    syscall    ;tickle the kernal 
    cmp rax, 0     ; if the return is zero file did not open
    je errorOpeningFile    ; error and end
    mov [outputFileHandle], rax   ; save the file handle
    
   ;2 writing a bunch of quard words to the file each 8 butes in size
    
   ;write our nunbers to the file
   mov rax, 1111h   ; the starting valu e
   mov rcx, 100   ;  let's write 100 values
   writeLoop:
		mov [intValue], rax    ; move the value to invalue'
		mov rax, 1    ; write to the file
		mov rdi, [outputFileHandle] ; the file to write to
		mov rsi, intValue   ; the addres of the memory to write
		mov rdx, 8    ; the number of bytes to write
		push rcx    ; save the loop counter
		syscall  ; tickle the kernal
		cmp rax, 8    ; make sure 8 bytes were writters 
		jne errorWritingFile    ;if not error and end 
		mov rax, [intValue]   ; place the value back into rax
		add rax, 1111h   ; add 1111h
		pop rcx    ;restore the loop counter
	loop writeLoop
	
	;close the output file
	mov rax, 3
	mov rdi, [outputFileHandle]
	syscall
	
	push readigMessage
	call PrintString
	call Printendl
	
	;3 open the input file for input
	;now read the file one characters at a time
	;open the file for input 
	
	
	mov rax, 2    ;open the file
	mov rdi, fileName  ; the file name to open 
	mov rsi, 2h   ; open for input/output 2h -input / output
	syscall  ; tickle the kenral
	cmp rax, 0h   ; if the returned handle is zero error 
	je   inputFileError   ; error and quit
	mov [fileHandle], rax   ; save the file handle
	
	;4 in a loop ask the user for a position in the file to read

	inputLoop:
		;;ask the user to type a relative position withhin the file
		push inputValueMsg
		call PrintString
		call InputSInt
		jc inputError     ;input error by the user
		cmp rax, -999   ; check to see if they want to leave 
		je leaveLoop  ;they do so leave the loop
		cmp rax, 0   ; make sure they didnt type some other negative number
		jl inputError   ; they typed some other negative number
		
		
	;5 to do
	
	;todo calculate the position in the file to read from
	 ;(item number -1) *size
	 sub rax, 1   ;the users types 1-100  subtract 1 first
	 mov rbx, 8   ;the size of a quard word
	 mul rbx   ;multyply that into rax 
	 mov [filePosition], rax ; save the position to use later
	 
	;todo position the read pointer withon the file
	mov rsi, rax   ; postion in the file we start read
	mov rax, 8   ; 8 means position read pointer
	mov rdi, [fileHandle]   ;the file to read from
	mov rdx, 0   ;from the begining
	syscall
	
	;todo read the quad value from the file
	mov rax, 0   ;read from the file
	mov rdi, [fileHandle]   ;the file to read from
	mov rsi, intValue    ;where to read the data into
	mov rdx, 8  ; the numbers of byted read
	syscall
	
	;todo are we at the end of file
	cmp rax, 0   ;check to see if zero bytes were read
	je notFound    ;go and display an error
	
	
	;print the number to the console
	push QWORD [intValue]  ;the memory location where the file read the data into
	call Print64bitNumHex  ; print it
	call Printendl 
	jmp inputLoop    ; continue the loop
	
	;now ask the user for a new value to replce the old one in the file then replce it 
	push newValueMsg
	call PrintString 
	call InputHex
	jc inputError
	
	;reposition the file pointer to the begining of the data wich we previosly read  from the file
	mov [newValue], rax   ;input hex stores the hexadecal naumber into rax let;s save it
	mov rsi, [filePosition]  ;the location in the file where we originaly read the data
	mov rax, 8   ;position the read pointer
	mov rdi, [fileHandle]  ;the file we wish to manipulate
	mov rdx, 0    ;0 - starting at begininng
	syscall
	
	;write a new value entered by the user into the file
	mov rax, 1  ; write to  the file
	mov rdi, [fileHandle]   ;the file write to 
	mov rsi, newValue       ; the adress  of data to write to the file 
	mov rdx, 8   ;the number of bytes to write
	syscall
	
	jmp inputLoop
	
	;the value specified by the user was not found
	notFound:
		push notFoundMsg
		call PrintString
		call Printendl
		jmp inputLoop
	
	;the user typed an invalid value on the size of the file
	inputError:
		push inputErrorMSg
		call PrintString
		call Printendl
	leaveLoop:
		
;close the output file
	mov rax, 3
	mov rdi, [outputFileHandle]
	syscall
	
	jmp endItAll
	
	;the input file failed to open
	inputFileError:
		push inputOpenError
		call PrintString
		call Printendl
		jmp endItAll

;writing to file failed for reason
	errorWritingFile:
		push fileWriteError
		call PrintString
		call Printendl
		jmp endItAll

;the creation and opening of the output failed		
	errorOpeningFile:
		push fileCreateError
		call PrintString
		call Printendl
		jmp endItAll


	endItAll:
		push closePrompt
		call PrintString
		call Printendl
		 
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
