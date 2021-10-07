/////////////////////////////////////////////////////////////////////
// Euler46 ~ Goldbach's other conjecture
// 
// Problem Statement:
// 
// It was proposed by Christian Goldbach that every odd composite
// number can be written as the sum of a prime and twice a square.
// 
//		9  =  7 + 2×1^2
//		15 =  7 + 2×2^2
//		21 =  3 + 2×3^2
//		25 =  7 + 2×3^2
//		27 = 19 + 2×2^2
//		33 = 31 + 2×1^2
// 
// It turns out that the conjecture was false.
// 
// What is the smallest odd composite that cannot be written as the
// sum of a prime and twice a square?
// 
/////////////////////////////////////////////////////////////////////

/////////////////////////////////////////////////////////////////////
// Algorithm Explanation:
// 
// Iterates upwards looking for odd composite numbers. Then the value
// is tested using two nested for loops, one to find prime values and
// the other to test twice square values. If no twice squares are
// found for the prime, the loops break and the solution is set to i.
// 
/////////////////////////////////////////////////////////////////////

#include <iostream>
#include <string>
#include <chrono>

using namespace std;

bool prime(int num)
{
	for (int i = 2; i <= sqrt(num); i++)
	{
		if (num % i == 0)
		{
			return 0;
		}
	}
	return 1;
}

int main()
{
	auto start = std::chrono::high_resolution_clock::now();
	int solution = 0;
	
	int r;
	bool f = false;
	for (int i = 1; i < 10000; i = i + 2)
	{
		if (!prime(i))
		{
			for (int j = 2; j < i-1; j++)
			{
				if (prime(j))
				{
					r = i - j;
					for (int k = 1; k < (r/2+1); k++)
					{
						if (r == (2 * k * k))
						{
							f = true;
							break;
						}
					}
					if (f)
					{
						break;
					}
				}
			}
			if (!f)
			{
				solution = i;
				break;
			}
			f = false;
		}
	}

	auto done = std::chrono::high_resolution_clock::now();
	cout << "Solution: " << solution << endl << endl;
	cout << "Program completed in " << std::chrono::duration_cast<std::chrono::milliseconds>(done - start).count() << " milliseconds." << endl;
}
