/////////////////////////////////////////////////////////////////////
// Euler47 ~ Distinct primes factors
// 
// Problem Statement:
// 
// The first two consecutive numbers to have two distinct prime
// factors are:
// 
//		14 = 2 × 7
//		15 = 3 × 5
// 
// The first three consecutive numbers to have three distinct prime
// factors are:
// 
//		644 = 2^2 × 7 × 23
//		645 = 3   × 5 × 43
//		646 = 2   × 17 × 19.
// 
// Find the first four consecutive integers to have four distinct
// prime factors each. What is the first of these numbers?
//
/////////////////////////////////////////////////////////////////////

/////////////////////////////////////////////////////////////////////
// Algorithm Explanation:
// 
// Iterates upwards getting the factors of each number and checking
// if there are at least four prime factors. Increments consecutive
// when found and resets to zero if the next numbers do not contain
// four prime factors. Once consecutive reaches four the program
// breaks.
//
/////////////////////////////////////////////////////////////////////

#include <iostream>
#include <math.h>
#include <chrono>

using namespace std;

bool prime(int num)
{
	if (num == 1) return 0;
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

	int p, consecutive = 0;
	for (int i = 646; i < 1000000; i++)
	{
		p = 0;
		for (int j = 1; j <= i/2; j++)
		{
			if (i % j == 0)
			{
				if (prime(j))
				{
					p++;
				}
			}
		}
		if (p >= 4)
		{
			consecutive++;
		}
		else
		{
			consecutive = 0;
		}
		if (consecutive == 4)
		{
			solution = i;
			break;
		}
	}

	solution = solution - 3; //we want the first of the four consecutive numbers

	auto done = std::chrono::high_resolution_clock::now();
	cout << "Solution: " << solution << endl << endl;
	cout << "Program completed in " << std::chrono::duration_cast<std::chrono::milliseconds>(done - start).count() << " milliseconds." << endl;
}
