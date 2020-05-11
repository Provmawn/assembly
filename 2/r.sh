#!/bin/bash

rm *.o
rm *.out
rm *.lis

nasm -f elf64 -l debug.lis -o debug.o debug.asm

# -f format
# -l assembly listing file
# -o output filename
nasm -f elf64 -o display_array.o display_array.asm
nasm -f elf64 -o manager.o manager.asm

# -c compile
# -Wall all warnings
# -m64 64-bit ABI
# -no-pie don't produce a position independent executable
# -o output filename
# -std=c11 set the language standard to c11
gcc -c -Wall -m64 -no-pie -o c.o main.c -std=c11

# -c compile
# -Wall all warnings
# -m64 64-bit ABI
# -no-pie don't produce a position independent executable
# -o output filename
# -std=c11 set the language standard to c11
g++ -c -Wall -m64 -no-pie -o reverse.o reverse.cc -std=c++11

# -m64 64-bit ABI
# -no-pie don't produce a position independent executable
# -o output filename
# -std=c11 set the language standard to c11
g++ -m64 -no-pie -o a.out -std=c11 display_array.o manager.o c.o reverse.o debug.o

./a.out 

