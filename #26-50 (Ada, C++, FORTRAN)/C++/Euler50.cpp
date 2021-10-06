/////////////////////////////////////////////////////////////////////
// Euler50 ~ Consecutive prime sum
// 
// Problem Statement:
// 
// The prime 41, can be written as the sum of six consecutive primes:
// 
//		41 = 2 + 3 + 5 + 7 + 11 + 13
// 
// This is the longest sum of consecutive primes that adds to a
// prime below one-hundred.
//
// The longest sum of consecutive primes below one-thousand that adds
// to a prime, contains 21 terms, and is equal to 953.
//
// Which prime, below one-million, can be written as the sum of the
// most consecutive primes?
//
/////////////////////////////////////////////////////////////////////

/////////////////////////////////////////////////////////////////////
// Algorithm Explanation:
// 
// Iterates upwards checking for primality and adding to sum. Once
// the sum becomes greater than 1 million the loop ends. This problem
// is straightforward, with one caveat: the consecutive primes do not
// need to start at 2. By increasing the starting prime from 2 to 3,
// we get a different result, and as it turns out, the greatest sum
// is reached by starting at 7.
//
/////////////////////////////////////////////////////////////////////

#include <iostream>
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
	if (num == 1)
	{
		return 0;
	}
	return 1;
}

int main()
{
	auto start = std::chrono::high_resolution_clock::now();
	int solution = 0;

	int i = 7;
	int sum = 0;
	while(sum <= 1000000)
	{
		if (prime(i))
		{
			sum += i;
			if (prime(sum))
			{
				if (sum > solution)
				{
					solution = sum;
				}
			}
		}
		i++;
	}

	auto done = std::chrono::high_resolution_clock::now();
	cout << "Solution: " << solution << endl << endl;
	cout << "Program completed in " << std::chrono::duration_cast<std::chrono::milliseconds>(done - start).count() << " milliseconds." << endl;
}
