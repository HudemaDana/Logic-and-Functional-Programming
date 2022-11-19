#include "problem.h"
#include <iostream>

int main()
{
	Lista a,b,c;
	a = creareA();
	b = creareB();
	c = creareC();
	tipar(a,b);
	std::cout << '\n';
	tipar(a,c);
	std::cout << '\n';
	tipar_rec(removeElem(4, a._prim));
	std::cout << '\n';
	tipar_rec(removeElem(2, c._prim));
}
