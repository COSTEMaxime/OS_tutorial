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

