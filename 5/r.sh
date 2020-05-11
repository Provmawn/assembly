#!/bin/bash
rm *.o
rm *.out

nasm -f elf64 -o compute_resistance.o compute_resistance.asm
nasm -f elf64 -o resistance.o resistance.asm

g++ -c -m64 -Wall -o ohm.o ohm.cc -fno-pie -no-pie -std=c++14
g++ -c -m64 -Wall -o show_resistance.o show_resistance.cc -fno-pie -no-pie -std=c++14

gcc -c -m64 -Wall -o get_resistance.o get_resistance.c -fno-pie -no-pie -std=c11
#g++ -m64 -Wall -o a.out compute_area.o triangle.o heron.o show_results.o get_sides.o -fno-pie -no-pie -std=c++14
g++ -m64 -Wall -o a.out resistance.o ohm.o get_resistance.o compute_resistance.o show_resistance.o -fno-pie -no-pie -std=c++14

echo 'running a.out'
./a.out	
