[org 0x7c00]

mov bx, name		; mov address of name to bx (print arguments)
call print_string






jmp $
; .text
name: db "jusmistic", 0



; .data
print_string:
; print_string(&string)
; bx = string
pusha

null_handler:
mov ah, 0x0e		; set ah to tty interrupt
mov al, [bx]		; mov value from bx ptr to al
cmp  al, 0		; is null? 
je eot			; out function

; not NULL print char from text

print_it:
mov al, [bx]	; mov value from bx to al
int 0x10
inc bx			; inc pointer to next char from string
jmp null_handler

eot:			; Found null then leave function
mov al, 0xa		; add newline 
int 0x10
popa
ret


times 510-($-$$) db 0 
dw 0xaa55
