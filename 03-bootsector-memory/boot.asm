; Start Infinity loops

mov ah, 0x0e		; tell bios interrupt to interrupt teletype

; First Attempt
mov al, the_mark	; 
int 0x10

; Second Attempt
mov al, the_mark
int 0x10

; Third Attempt 
; This is work !!! 
mov bx, the_mark	; offset + xx that refer to our 'X' value
add bx, 0x7c00		; That BIOS Always load the boot
mov al, [bx]		; Load an Address of bx to al (to print)
int 0x10

; Fourth Attempt
mov al, [0x7c1e]
int 0x10

jmp $			; jmp infinity loop

the_mark:
 db 'x'

; Fill zero for 510 bytes minus with the previous code
times 510-($-$$) db 0 	; $ is stand for this location 
			; $$ is stand for previous location

dw 0xaa55		; to tell the bios that this disk is bootable


