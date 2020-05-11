#!/bin/bash
rm *.o
rm *.out

echo 'compiling triangle.asm'
nasm -f elf64 -o compute_area.o compute_area.asm
nasm -f elf64 -o triangle.o triangle.asm

echo 'compiling heron.cc'
g++ -c -m64 -Wall -o heron.o heron.cc -fno-pie -no-pie -std=c++14
g++ -c -m64 -Wall -o show_results.o show_results.cc -fno-pie -no-pie -std=c++14

echo 'compiling get_sides.c'
gcc -c -m64 -Wall -o get_sides.o get_sides.c -fno-pie -no-pie -std=c11
#g++ -m64 -Wall -o a.out compute_area.o triangle.o heron.o show_results.o get_sides.o -fno-pie -no-pie -std=c++14
echo 'linking triangle.o heron.o get_sides.o'
g++ -m64 -Wall -o a.out triangle.o heron.o get_sides.o compute_area.o show_results.o -fno-pie -no-pie -std=c++14

echo 'running a.out'
./a.out	
