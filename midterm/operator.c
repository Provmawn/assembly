#include <stdio.h>

long int control();

int main(int argc, const char *arvg[]) {
    printf("Welcome to CPSC 240 Midterm program brought to you by Amman Sandhu.\n");
    long int c = control();
    printf("The driver received this value: %ld.\n", c);
    printf("Have a nice day. The program will return control to the operating system.\n");
    return 0;
}
