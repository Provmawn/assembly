#include <iostream>

extern "C" void reverse(long int* arr, long int start, long int end) {
   while (start < end) {
       long int temp = arr[start];
       arr[start] = arr[end];
       arr[end] = temp;
       start++;
       end--;
   }
}
