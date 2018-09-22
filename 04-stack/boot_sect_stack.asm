;using the stack in the boot sector

mov ah, 0x0e	;got to the teletype BIOS routine
mov bp, 0x8000 	;set the base of the stack
mov sp, bp	;set the current address of the top of the stack

push 'A'	;push values on the stack
push 'B'
push 'C'

pop bx		;we pop 16 bits but we only need the 8 low bits
mov al, bl
int 0x10

pop bx
mov al, bl
int 0x10

mov al, [0x7ffe]	;get the value two address from the bottom of the stack (0x8000 - 0x2)
int 0x10

jmp $

times 510-($-$$) db 0
dw 0xaa55
