; Start Infinity loops

; define some global variable 
[org 0x7c00]



mov ah, 0x0e		; tell bios interrupt to interrupt teletype


; Third Attempt 
; This is work !!! 
mov al, [the_mark]	; Load an Address of bx to al (to print)
int 0x10


jmp $			; jmp infinity loop

the_mark:
 db 'x'

; Fill zero for 510 bytes minus with the previous code
times 510-($-$$) db 0 	; $ is stand for this location 
			; $$ is stand for previous location

dw 0xaa55		; to tell the bios that this disk is bootable


