mov ah, 0x0e

;Print the address
mov al, "1"
int 0x10
mov al, the_secret
int 0x10

;Print the value without offset
mov al, "2"
int 0x10
mov al, [the_secret]
int 0x10

;Print the correct value
mov al, "3"
int 0x10
mov bx, the_secret
add bx, 0x7c00
mov al, [bx]
int 0x10

;Print the correct value with precalculated offset
mov al, "4"
int 0x10
mov al, [0x7c2d]
int 0x10

jmp $

the_secret:
    db "X"

times 510-($-$$) db 0
dw 0xAA55
