#include <iostream>

extern "C" void shift_left(long int *arr, long int size);
void shift_left(long int *arr, long int size) {
    long int temp = arr[0];
    for (int i = 0; i < size; ++i) {
        if (i < size - 1) {
        arr[i] = arr[i + 1];
        } else {
            arr[i] = temp;
            temp = arr[0];
        }
    }

}
