; Start Infinity loops

; define some global variable 
[org 0x7c00]
mov bp, 0x8000		; define stack at 0x8000 (Lower Boot section)
mov sp, bp		; define top of stack

mov bx, 30
cmp bx, 4
jle bx_le_4
cmp bx, 40
jl bx_l_40
jmp other
bx_le_4:
	mov al, 'A'
	jmp write_out

bx_l_40:
	mov al, 'B'
	jmp write_out
other:
	mov al, 'C'


write_out:
mov ah, 0x0e		; tell bios interrupt to interrupt teletype
int 0x10



jmp $
; Fill zero for 510 bytes minus with the previous code
times 510-($-$$) db 0 	; $ is stand for this location 
			; $$ is stand for previous location

dw 0xaa55		; to tell the bios that this disk is bootable


