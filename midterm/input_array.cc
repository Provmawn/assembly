#include <iostream>
extern "C" long int input_array(long int arr[100]);

long int input_array(long int arr[100]) {
    long int input;
    long int i = 0;
    while (input != -1 && i < 100) {
        std::cin >> input;
        arr[i] = input;
        ++i;
    }
    return i - 1;
}
