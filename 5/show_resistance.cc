#include <stdio.h>

extern "C" void show_results(double s1, double s2, double s3, double s4) {
	printf("side1: %lf side2: %lf side3: %lf area: %lf\n", s1, s2, s3, s4);
}


