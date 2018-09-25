disk_load:
    pusha
    push dx		;push DX so we can later see how many sectors
			;were request to be read

    mov ah, 0x02	;BIOS read sector function
    mov al, dh		;Read dh sectors
    mov ch, 0x00	;Select cylinder 0
    mov dh, 0x00	;Select head 0
    mov cl, 0x02	;Start reading from the 2nd sector (after the boot)
    int 0x13		;BIOS interrupt

    jc disk_error	;Jump if carry (set on error)

    pop dx
    cmp dh, al		;If al (nb sectors read) != dh (nb sectors expected)
    jne disk_error
    popa
    ret

disk_error:
    mov bx, DISK_ERROR_MSG
    call print_string
    mov dh, ah		;error code
    call print_hex
    jmp $

DISK_ERROR_MSG: db "Disk read error!", 0
