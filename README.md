# OS Tutorial

**1. Installation**

Dependencies :
```
apt-get install nasm
apt-get install qemu
```

Project :
```
git clone git@github.com:COSTEMaxime/OS_tutorial.git
cd OS_tutorial/
```

**2. Compile .asm files into .bin files**
```
nasm -f bin example.asm -o example.bin
```

**3. Run the simulation**
```
qemu-system-x86_64 -curses example.bin
```

Quit the simulation without restarting :
```
Alt + 2
quit
```

**4. Compile C code**

Compile C code into .o file
```
gcc -ffreestanding -c main.c -o main.o
```

View object file (.0) content
```
objdump -d main.o
```

Link and generate binary file
```
ld -o main.bin -Ttext 0x0 --oformat binary main.o
```
