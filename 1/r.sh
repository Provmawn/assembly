#!/bin/bash

rm *.o
rm *.out


echo "-----Assemble"
nasm -f elf64 -l asm.lis -o asm.o main.asm

echo "-----Compile"
gcc -c -Wall -m64 -no-pie -o cfile.o main.c -std=c11
#g++ -c -Wall -m64 -no-pie -o cfile.o main.cc -std=c++11

echo "-----Link the object files"
gcc -m64 -no-pie -o math.out -std=c11 asm.o cfile.o
#g++ -m64 -no-pie -o math.out -std=c++11 asm.o cfile.o

#./math.out

echo "The script file will terminate"

