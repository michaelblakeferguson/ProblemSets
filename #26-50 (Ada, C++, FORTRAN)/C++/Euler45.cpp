/////////////////////////////////////////////////////////////////////
// Euler45 ~ Triangular, pentagonal, and hexagonal
// 
// Problem Statement:
// 
// Triangle, pentagonal, and hexagonal numbers are generated by the
// following formulae:
// 
//      Triangle        T(n) = n(n+1)/2       1, 3,  6, 10, 15, ...
//      Pentagonal      P(n) = n(3n−1)/2      1, 5, 12, 22, 35, ...
//      Hexagonal       H(n) = n(2n−1)        1, 6, 15, 28, 45, ...
//
// It can be verified that T(285) = P(165) = H(143) = 40755.
// 
// Find the next triangle number that is also pentagonal and
// hexagonal.
// 
/////////////////////////////////////////////////////////////////////

/////////////////////////////////////////////////////////////////////
// Algorithm Explanation:
// 
// All hexagonal numbers are triangular numbers, so checking for
// triangular numbers can be ignored. Hexagonal numbers are generated
// according to the corresponding equation and then checked to see
// if the value is also a pentagonal number.
// 
/////////////////////////////////////////////////////////////////////

#include <iostream>
#include <chrono>

using namespace std;

bool isPentagonal(int p)
{
	long long int Pn = 0, n = 1;
	while (Pn < p)
	{
		Pn = n * (3*n - 1) / 2;
		if (Pn == p)
		{
			return 1;
		}
		n++;
	}
	return 0;
}

int main()
{
	auto start = std::chrono::high_resolution_clock::now();
	int solution = 0;

	int Hn;
	for (int i = 144; i < 30000; i++)
	{
		Hn = i * (2 * i - 1);
		if (isPentagonal(Hn))
		{
			solution = Hn;
			break;
		}
	}

	auto done = std::chrono::high_resolution_clock::now();
	cout << "Solution: " << solution << endl << endl;
	cout << "Program completed in " << std::chrono::duration_cast<std::chrono::milliseconds>(done - start).count() << " milliseconds." << endl;
}
