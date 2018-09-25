print_hex:
    ;TODO: manipulate chars at HEX_OUT to reflect DX
    pusha
    mov cx, 0	;loop counter

loop:
    cmp cx, 4	;loop 4 times
    je end

    ;Convert the last char of dx to ascii
    mov ax, dx	;copy dx into ax
    and ax, 0x000F	;mask to get only the last char
    add al, 48		;ascii 0 is value 48
    cmp al, 57		;if > 57 == translate to a,b,c,d,e,f
    jle next_step
    add al, 7		;Add 7 to get to the ascii A (value 65)

next_step:
    ;get the correct position of our char
    ;bx = base address + string legth - loop index
    mov bx, HEX_OUT + 5
    sub bx, cx		;substract loop index
    mov [bx], al	;copy the char at al at the position pointed by bx
    ror dx, 4
    
    add cx, 1
    jmp loop

end:
    mov bx, HEX_OUT
    call print_string
    popa
    ret

HEX_OUT: db '0X0000', 0
