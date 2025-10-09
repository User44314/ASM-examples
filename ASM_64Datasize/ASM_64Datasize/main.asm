ExitProcess PROTO
.data

;define a single byte
byteVaribale	db	12h
;define word
vordVarible		dw	1112h
;define a double word
dwordVariable	dd	11223344h
quadWordVarabie	dq	1122334455667788h

sbyteVariable	db	-125
swordVariable	dw	-2567
sdwordVariable	dd	-326768
sqwordVariable	dq	-7476523459

.code
main PROC
	nop


	nop
	mov rcx, 0
	call ExitProcess
main ENDP
END