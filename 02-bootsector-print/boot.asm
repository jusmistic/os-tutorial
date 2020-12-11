; start infinity loops

mov ah, 0x0e		; tell bios interrupt call use teletpye output(tty) mode.
mov al, 'j'		; write 'j'
int 0x10		; bios interrupt call.

mov al, 'u'
int 0x10

mov al, 's'
int 0x10

mov al, 'm'
int 0x10

mov al, 'i'
int 0x10

mov al, 's'
int 0x10

mov al, 't'
int 0x10

mov al, 'i'
int 0x10

mov al, 'c'
int 0x10


; infinity jmp loop
jmp $

; fill zero for 510 bytes minus with the previous code
times 510-($-$$) db 0 	; $ is stand for this location 
			; $$ is stand for previous location

dw 0xaa55		; to tell the bios that this disk is bootable

