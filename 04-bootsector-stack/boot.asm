; Start Infinity loops

; define some global variable 
[org 0x7c00]
mov bp, 0x8000		; define stack at 0x8000 (Lower Boot section)
mov sp, bp		; define top of stack

mov ah, 0x0e		; tell bios interrupt to interrupt teletype

push 'a'
push 'b'
push 'c'

pop bx			; pop top of stack(c) to bx
mov al, bl		; mov lower byte to al
int 0x10		; call BIOS tty

pop bx			; pop b to bx
mov al, bl		
int 0x10

pop bx			; pop a to bx
mov al, bl
int 0x10

jmp $
; Fill zero for 510 bytes minus with the previous code
times 510-($-$$) db 0 	; $ is stand for this location 
			; $$ is stand for previous location

dw 0xaa55		; to tell the bios that this disk is bootable


