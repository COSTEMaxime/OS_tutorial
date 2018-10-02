[bits 16]

switch_to_pm:
    cli				;disable interrupts
    lgdt [gdt_descriptor]	;load our global descriptor table

    mov eax, cr0		;set the first bit of CR0 to switch to protected mode
    or eax, 0x1
    mov cr0, eax

    jmp CODE_SEG:init_pm	;make a far jump (= to a new segment) to our 32bit code, the also flush the pipeline


[bits 32]

init_pm:
    mov ax, DATA_SEG		;update the segment registers
    mov ds, ax
    mov ss, ax
    mov es, ax
    mov fs, ax
    mov gs, ax

    mov ebp, 0x90000		;set the top of the stack
    mov esp, ebp

    call BEGIN_PM
