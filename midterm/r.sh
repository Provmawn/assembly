#!/bin/bash

rm *.o
rm *.out


echo "-----Assemble"
nasm -f elf64 -o control.o control.asm
nasm -f elf64 -o output_array.o output_array.asm

echo "-----Compile"
gcc -c -Wall -m64 -no-pie -o operator.o operator.c -std=c11
g++ -c -Wall -m64 -no-pie -o input_array.o input_array.cc -std=c++11
g++ -c -Wall -m64 -no-pie -o shift_left.o shift_left.cc -std=c++11
#g++ -c -Wall -m64 -no-pie -o cfile.o main.cc -std=c++11

echo "-----Link the object files"
#gcc -m64 -no-pie -o a.out -std=c11 control.o #cfile.o
g++ -m64 -no-pie -o a.out -std=c++11 control.o operator.o input_array.o output_array.o shift_left.o

./a.out

echo "The script file will terminate"


