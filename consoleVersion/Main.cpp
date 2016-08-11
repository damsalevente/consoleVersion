#include <iostream>
#include "Fugvenyek.h"
int main()
{
	Duplex dup;
	dup.alapAdatok();
	dup.alapszamit();
	dup.print();
	int lala[10][2];
	for (int i = 0; i <= 10; i++)
	{
		lala[i][1] = 0;
	}
	return 0;
}