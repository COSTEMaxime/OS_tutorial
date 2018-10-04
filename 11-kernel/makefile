# $^ is sbstitued with all of the target's dependancy files
# $< is the first dependancy and $@ is the target file

# Default target
all: os-image

run: all
	qemu-system-x86_64 -curses -fda os-image 

os-image: boot_sect.bin kernel.bin
	cat $^ > os-image

# Build the kernel binary
kernel.bin: kernel_entry.o kernel.o
	ld -m elf_i386 -o kernel.bin -Ttext 0x1000 $^ --oformat binary

# Build the kernel object file
kernel.o: kernel.c
	gcc -m32 -ffreestanding -c $< -o $@

# Build the kernel entry object file
kernel_entry.o: kernel_entry.asm
	nasm $< -f elf -o $@

boot_sect.bin: boot_sect.asm
	nasm $< -f bin -o $@

clean:
	rm -fr *.bin *.o *.dis *.map os-image

kernel.dis: kernel.bin
	ndisasm -b 32 $< > $@
