//ANNA CHIU 888641818
//CPSC 240 TU/THR 12:00pm
//Project 5

#include <stdio.h>
#include <iostream>
using namespace std;

extern "C" double resistance();


int main(){

	cout << "Welcome to Parallel Circuits by Anna Chiu.\n";
	double ret = resistance();
	cout << "Main received this number: " << ret ;
	cout << "\nMain will now return 0 to the operating system.\n";
	return 0;
}