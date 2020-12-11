[org 0x7c00]

mov bx, 0x1020
call print_hex







jmp $

; .text
number: dw 0x0000

print_hex:
; 0 => 0x30 ASCII
; 9 => 0x39 
; A => 0x41
; F => 0x46

pusha

mov ah, 0xe
xor cx, cx              ; set counter to 0


; [1, 2, 3, 4] =ror=> [2, 3, 4, 1]
start_print:
cmp cx, 4
je  leave_func
shr bx, 4

mov al, bl              ; mov 1 to al

; is number is A to F ? 
cmp al, 9
jg print_char

; is number is 0 to 9 ?

print_num:
; print 0 to 9
add al, 0x30
jmp print

print_char:
; print A to Z
add al, 0x41
; leave func

print:
int 0x10
inc cx
jmp start_print


leave_func:
popa
ret

times 510-($-$$) db 0 
dw 0xaa55
