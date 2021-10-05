/////////////////////////////////////////////////////////////////////
// Euler35 ~ Circular primes
// 
// Problem Statement:
// 
// The number, 197, is called a circular prime because all rotations
// of the digits: 197, 971, and 719, are themselves prime.
// 
// There are thirteen such primes below 100: 2, 3, 5, 7, 11, 13, 17,
// 31, 37, 71, 73, 79, and 97.
// 
// How many circular primes are there below one million?
//
/////////////////////////////////////////////////////////////////////

/////////////////////////////////////////////////////////////////////
// Algorithm Explanation:
// 
// Loops up to 1 million, checking if the number is prime. Rotate()
// is then called depending on the length of the number and each
// cycle is checked for primality. If all of the rotations pass then
// the total is incremented.
//
/////////////////////////////////////////////////////////////////////

#include <iostream>
#include <vector>
#include <math.h>
#include <chrono>

using namespace std;

int rotate(int r, int d)
{
	vector<int> digit(d);
	for (int i = 0; i < (d - 1); i++)
	{
		digit[d - 2 - i] = r % 10;
		r /= 10;
	}
	digit[d - 1] = r;

	r = 0;
	for (int i = d; i > 0; i--)
	{
		r = r * 10 + digit[d - i];
	}
	return r;
}

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

	bool allPrime = true;
	int j, digits = 0;
	for (int i = 2; i < 1000000; i++)
	{
		if (prime(i))
		{	
			j = i;
			digits = 1;
			while (j > 10)
			{
				digits++;
				j /= 10;
			}

			j = i;
			for (int k = 0; k <= (digits - 1); k++)
			{
				j = rotate(j, digits);
				if (!prime(j))
				{
					allPrime = false;
					break;
				}
			}
			if (allPrime)
			{
				solution++;
			}
			allPrime = true;
		}
	}

	auto done = std::chrono::high_resolution_clock::now();
	cout << "Solution: " << solution << endl << endl;
	cout << "Program completed in " << std::chrono::duration_cast<std::chrono::milliseconds>(done - start).count() << " milliseconds." << endl;
}
