#include <stdio.h>

long int *manager();

int main(int argc, const char *argv[]) {
    printf("Welcome to Arrays of Integers\n");
    printf("Brought to you by Amman Sandhu\n");
    long int *result = manager();
    printf("\nMain received this number: %ld\n", *result);
    printf("Main will now be returned to the main function\n");
    return 0;
}
