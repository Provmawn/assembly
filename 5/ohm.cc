#include <iostream>
extern "C" double triangle();

int main() {
	printf("%s", "Welcome to CPSC 240 Assignment 4 brought to you by Amman Sandhu\n");
	double n = triangle();
	printf("HERON: %lf\n", n);
	return 0;
}
