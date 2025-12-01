%include functions64bitLibrary.inc

GetCommandLineA PROTO
GetCommandLineW PROTO

.data
	;Place your variables and memory allocations here
	welcomeMessage		db	"Hello World!", 00h
	pEndMessage			db	"Program ending, have a great day!", 00h
	
	argRequested BYTE "the argument you requaest is ", 00h
	totalArgs BYTE "the total arguments is ", 00h
	argError BYTE "*** Error invalid arguments number specifer", 00h
	allArgs BYTE "all arguments found (backwards)", 00h

	numberOfArgs	DQ	?
	arg1			db	512 dup(0)

.code
main PROC
	nop

	;Place your program code here
	mov		rsi, OFFSET welcomeMessage
	push	rsi
	call	PrintString
	call	Printendl

	call GetCommandLineA
	;call GetCommandLineW
	mov rsi, rax
	push rsi
	call PrintString
	call Printendl

	;-----------------------
	call GetArgCount
	mov [numberOfArgs], rax			;save our count
	mov rsi, OFFSET totalArgs		;print the total arguments found
	push rsi
	call PrintString
	mov rax, [numberOfArgs]
	push rax
	call Print64bitNumDecimal
	call Printendl
	call Printendl

	mov rsi, OFFSET allArgs
	push rsi
	call PrintString
	call Printendl
	mov rcx, [numberOfArgs]			; how many argumnets are we going to accsess
	mainLoop:
		mov rdi, offset arg1 ; where to put the arguments 
		mov r8, rcx   ;the argument number to get starting at 0
		dec r8
		call GetArgument  ; now get the argument and place it into 
		jnc printIt
		mov rdx, offset argError ; an error occured let the user know
		push rdx
		call PrintString 
		call Printendl
		call Printendl
		jmp endIt

		printIt:
		mov rdx, offset argRequested
		push rdx
		call PrintString
		mov rdx, offset arg1   ;now print the argument
		push rdx
		call PrintString
		call Printendl
	loop mainLoop
	
	endIt:
		mov rsi, offset pEndMessage
		push rsi
		call PrintString
		call Printendl

		nop
		mov rcx, 0
		call ExitProcess
	main ENDP

	GetArgCount PROC
		push rdi     ;backup our registers
		push rdx    ;
		push rbx    ;backup and clear our  counter register
		mov rbx, 1
		call GetCommandLineA   ;return an ascii string not unicode
		mov rdi, rax    ; rax will contain the address of the string  now  

		mov rdx, 0h				;clear our inQuote variable
		argloop:
			mov al, [rdi]     ;put a byte into al
			inc rdi				; move to the next byte in the argument string
			cmp al, 00				 ; are we at the end
			je GAC_EndIt			 ; yes so quit arfument processing
			cmp al, 22h				;is this a double quote
			jne keepGoing				; no so keep going
			cmp rdx, 22h			; yes it is a double quote is this the second
			jne setQuote		 ;no so lets keep going 
			mov rdx, 0h			; we are double of the double quyte
			jmp keepGoing

			setQuote:
			mov rdx, 22h			;set our quote register to indicate  we are inside a
			keepGoing:
			cmp al, 20h				; is there a space found 
			jne moveByte			 ; yes so lets process to the next argument
			cmp rdx, 22h			 ; are we in a double quote
			je moveByte				; yes so ignpre it
			ignoreSpaces:			 ;ignore multile spaces between arguments
				mov al, [rdi]			 ;	is it a space
				cmp al, 00h				; if we are at the end
				je GAC_EndIt			;we are done with all arguments
				cmp al, 20h				; if it isnt 00h but something other than  a space continue
				jne leaveLoop			 ; no so start processing again
				inc rdi					; yes so go the next character
				jmp ignoreSpaces			; continue testing for spaces
				leaveLoop:
				inc rbx					;we have another non-space argument, so we have another
			jmp argloop
			moveByte:
		jmp argloop


		GAC_EndIt:
		mov rax, rbx			;move our result into rax
		pop rbx					; restore our register
		pop rdx
		pop rdi
		ret
	GetArgCount ENDP

	GetArgument PROC
	;rdi will contain the adress of the arguments string
	;backup our register
	push rcx			;will contain our destination offset
	push rdx			; will contain a value if we are inside of a double arguments
	push rsi			; will point to the current byte in the argument string
	push rdi			; the adress of the destination string
	push r8				; the arguments number we are lookng for  
	push r9				 ; our argument counter

	call GetArgCount   ;find out how many argument there are
	dec rax				;subtract 1 since we start at arguments 0
	cmp r8, rax			; if the argumentd we are looking for is greate the total argument -1 error
	jbe startIt			; otherwise start working
	stc					;an error so set the carry flat
	jmp leaveFunc2		; leave the function

	startIt:
	call GetCommandLineA    ;returns an ascii string not unicode
	mov rsi, rax			 ; rax will contain the addres of the string now lets parse it  
	mov r9, 0				; initilize our counter register to  zero 

	mov rcx, 0    ;prepare the loop counter 
	mov rdx, 0h   ; cleare our inquote variable
	argloop:
		mov al, [rsi]		;put a byte into al
		inc rsi				;move to the next byte in the arguments 
		cmp al, 00			; are we at the end
		je leaveFunc		; yes so quit argument processing
		cmp al, 22h			; is this a dounle quote
		jne keepGoing		; no so keep going
		cmp rdx, 22h		; yes it is a diuble quote is this the second 
		jne setQuote		; no so lets keep going
		mov rdx, 0h			 ;we are out of the double quote
		jmp keepGoing


		setQuote:
		mov rdx, 22h  ;put the double quote ascii value into rdx
		keepGoing:    
		cmp al, 20h    ;is there a space found
		jne moveByte   ; yes so lets process the next atguments
		cmp rdx, 22h  ; are we in a double auote
		je moveByte   ; yes so ignore it
		inc r9   ; we are on the next argument to check
		mov rdx, 0h    ; clear our qoute register 
		ignoreSpaces:   ; ignore multiple spaces between arguments
			mov al, [rsi]    ; is it a space
			cmp al, 20h    ;
			jne argloop    ;no so start processing again
			inc rsi   ; yes so go to the next character
		jmp ignoreSpaces   ; continue tsting for  spaces
		moveByte:
		cmp r9, r8     ;are we looking at the arguments you are interesed in
		jne argloop    ;nope so go to  the next character
		mov [rdi+rcx], al  ;save the character
		inc rcx   ; move to the next destination lovacation
	jmp argloop
	leaveFunc:
	mov al, 0h
	mov [rdi+rcx], al    ;end it with a null terminated character
	leaveFunc2:
	pop r9    ;restore our registers
	pop r8
	pop rdi
	pop rsi
	pop rdx
	pop rcx
	ret

	GetArgument ENDP
END


	;mov		rsi, OFFSET pEndMessage
	;push	rsi
	;call	PrintString
	;call	Printendl

	nop
	sub		rsp, 28h		;Free up 40 bytes, 5 quad-words of stack memory
	mov		rcx, 0
	call	ExitProcess
main ENDP
END