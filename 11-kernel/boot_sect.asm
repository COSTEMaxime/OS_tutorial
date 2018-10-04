[org 0x7c00]
KERNEL_OFFSET equ 0x1000	;memory offset to which we will load the kernel

mov [BOOT_DRIVE], dl	;the BIOS set the boot drive in dl on boot

mov bp, 0x9000		;set up the stack
mov sp, bp

mov bx, MSG_REAL_MODE	;print that we are starting booting from 16-bit mode
call print_string

call load_kernel	;Load our kernel

call switch_to_pm	;switch to protected mode

jmp $

%include "../05-functions/print_string.asm"
%include "../05-functions/print_hex.asm"
%include "../07-disk/disk_load.asm"
%include "../08-32bit-print/print_string_pm.asm"
%include "../09-32bit-GDT/gdt.asm"
%include "../09-32bit-GDT/switch_to_pm.asm"

[bits 16]

load_kernel:
    mov bx, MSG_LOAD_KERNEL
    call print_string

    mov bx, KERNEL_OFFSET	;set up parameters fr the disk load routine
    mov dh, 15			;we load the first 15 sectors
    mov dl, [BOOT_DRIVE]	;from the BOOT_DRIVE to the KERNEL_OFFSET address
    call disk_load

    ret

[bits 32]
;after the switch to protected mode

BEGIN_PM:
    mov ebx, MSG_PROT_MODE		;use the 32bit functin to announce that we
    call print_string_pm		;are in protected mode

    call KERNEL_OFFSET			;Jump to the address of our loaded kernel code
    jmp $

;Global variables
BOOT_DRIVE	db 0
MSG_REAL_MODE	db "Started in 16-bit real mode", 0
MSG_PROT_MODE	db "Successfully landed into 32-bit Protected Mode", 0
MSG_LOAD_KERNEL	db "Loading kernel into memory", 0

;padding with zeros
times 510-($-$$) db 0
dw 0xaa55
