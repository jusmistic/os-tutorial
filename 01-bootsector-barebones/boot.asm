; Start Infinity loops

loop:
	jmp loop

; Fill zero for 510 bytes minus with the previous code
times 510-($-$$) db 0 	; $ is stand for this location 
			; $$ is stand for previous location

dw 0xaa55		; to tell the bios that this disk is bootable


