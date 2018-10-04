;Ensures that we jump straight into the kernel's entry function
[bits 32]		;we use 32-bt instructions
[extern main]		;Declare tha we will be referencing the external symbol 'main'
			;so the linker can substitute the final address

call main		;call main() in our C kernel
jmp $
