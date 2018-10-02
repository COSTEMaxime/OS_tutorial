[bits 32]

;Constants
VIDEO_MEMORY equ 0xb8000
WHITE_ON_BLACK equ 0x0f

print_string_pm:
    pusha
    mov edx, VIDEO_MEMORY	;Set edx to the start of the v memory

print_string_pm_loop:
    mov al, [ebx]		;Store the char at ebx at al
    mov ah, WHITE_ON_BLACK	;Store the attribute of the char

    cmp al, 0			;Check for the end of the string
    je print_string_pm_done

    mov [edx], ax		;Store char + attr at the current chart cell
    add ebx, 1			;Next char in the string
    add edx, 2			;Next char cell in the v memory

    jmp print_string_pm_loop

print_string_pm_done:
    popa
    ret
