[org 0x7c00]

    mov bp, 0x8000		;Stack base
    mov sp, bp

    mov bx, 0x9000		;the address where the sectors will be stored
    mov dh, 2			;load 2 sectors
    call disk_load

    mov dx, [0x9000]
    call print_hex		;print the result from the first loaded sector

    mov dx, [0x9000 + 512]	;print from the second loaded sector
    call print_hex

    jmp $

    %include "../05-functions/print_string.asm"
    %include "../05-functions/print_hex.asm"
    %include "disk_load.asm"

    times 510 - ($-$$) db 0
    dw 0xaa55

    ;we add 2 sectors to the disk so we can read them and check our program
    times 256 dw 0xdada
    times 256 dw 0xface
