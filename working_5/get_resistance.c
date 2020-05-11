//ANNA CHIU 888641818
//CPSC 240 TU/THR 12:00pm
//Project 5

#include <stdio.h>
#include <iostream>
using namespace std;

extern "C" void get_resistance(double *a, double *b, 
			       double *c, double *d);

void get_resistance(double *a, double *b, double *c, double *d){
	cin >> *a;
	cin >> *b;
	cin >> *c;
	cin >> *d; 
}