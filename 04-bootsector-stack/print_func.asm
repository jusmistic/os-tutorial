; Start Infinity loops

; define some global variable 
[org 0x7c00]
mov bp, 0x8000		; define stack at 0x8000 (Lower Boot section)
mov sp, bp		; define top of stack

mov al, 'A'		; Set Arg to Function
call write_out

mov al, 'B'
call write_out		; Set Arg for make sure that program return from function

jmp $


write_out:
mov ah, 0x0e		; tell bios interrupt to interrupt teletype
int 0x10
ret

; Fill zero for 510 bytes minus with the previous code
times 510-($-$$) db 0 	; $ is stand for this location 
			; $$ is stand for previous location

dw 0xaa55		; to tell the bios that this disk is bootable


