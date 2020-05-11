//ANNA CHIU 888641818
//CPSC 240 TU/THR 12:00pm
//Project 5

#include <stdio.h>
#include <iostream>
using namespace std;

extern "C" void show_resistance(double ohm);

void show_resistance(double ohm){
	cout << "The total resistance of the system is ";	
	cout << ohm << " ohms, ";
}