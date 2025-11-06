.386
.model flat,stdcall
.stack 4096

%include functions32bitLibrary.inc

GetProcessHeap PROTO
HeapAlloc PROTO, hHeap:DWORD, dwFlags:DWORD, dwBytes:Dword
HeapCreate PROTO, flOptions:DWORD, dwInitialSize:Dword, dwMaximumsize:DWORD
HeapDestroy PROTO, hHeap:DWORD
HeapFree PROTO, hHeap:DWORD, dwFlags:DWORD, lpMem:DWORD
HeapSize PROTO, hHeap:DWORD, dwFlags:Dword, pMem:DWORD

.data
	;Place your variables and memory allocations here
	welcomeMessage		db	"Hello World!", 00h
	pEndMessage			db "Program ending have a great day", 00h

	heapPtr				dd ?
	intPtr				dd ?
	intArrayPtr			dd ?
	arraySize			dd 20
	arraySizeBytes		dd ?

.code
main PROC
	nop

	;Place your program code here
	push	OFFSET welcomeMessage
	call	PrintString
	call	Printendl

	;allcate a simple integer
	INVOKE GetProcessHeap
	mov [heapPtr], eax
	INVOKE HeapAlloc, HeapPtr, 08h, 4      ;allocated 4 byte and bild with zeros arrays
	mov [intPtr], eax  ;save our memory adress

	mov esi, [intPtr]			;save some data ino our allocated integer
	mov [esi], DWORD PTR 100h   ;save 100h in our variable

	INVOKE HeapFree, heapPtr, 0, intPtr   ;delete the intPtr memory from the heap

	;allocated an array
	mov eax, [arraySize]			;calculate the size in bytes of our array
	mov ebx, 4
	mul ebx
	mov [arraySizeBytes], eax
	INVOKE HeapAlloc, heapPtr, 08h, arraySizeBytes ;allocated the array
	cmp eax, 0
	je allocationError
	mov [intArrayPtr], eax

	mov ecx, [arraySize]				;the number of intergers in the array
	mov esi, [intArrayPtr]			;the adress of our array
	fillLoop:
		mov [esi], DWORD PTR 99h		;put 99h into the array location
		add esi, 4      ; go to the next item in the array
	loop fillLoop

	INVOKE HeapFree, heapPtr, 0, intArrayPtr      ;delete the array

	jmp endItAll


	allocationError:
		nop


	endItAll:
	push	OFFSET pEndMessage
	call	PrintString
	call	Printendl

	nop
	INVOKE ExitProcess,0
main ENDP
END main