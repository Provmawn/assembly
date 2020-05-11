#include <stdio.h>
#include <stdint.h>

long int file();

int main(void) {
    printf("Welcome to your friendly area calculator\n");
    printf("The main program will now call the area function\n");
    long int x = file();
    printf("The main received this integer: %ld\n", x);
    printf("Have a nice day. Main will now return 0 to the operating system\n");
    return 0;
}

