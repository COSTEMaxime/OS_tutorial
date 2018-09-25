print_string:
    pusha		;push the content of all the registers on the stack


start:
    mov al, [bx]	;the content of bx is the char to be printed
    cmp al, 0		;compare the content of the acc with 0, aka our end of string delimiter
    je done		;jump if equal
   
    mov ah, 0x0e
    int 0x10

    add bx, 1		;increment our counter
    jmp start		;loop back to the start

done:
    popa		;pop all the registers from the stack
    ret			;return to the caller
