/////////////////////////////////////////////////////////////////////
// Euler37 ~ Truncatable primes
// 
// Problem Statement:
// 
// The number 3797 has an interesting property. Being prime itself,
// it is possible to continuously remove digits from left to right,
// and remain prime at each stage: 3797, 797, 97, and 7. Similarly
// we can work from right to left: 3797, 379, 37, and 3.
// 
// Find the sum of the only eleven primes that are both truncatable
// from left to right and right to left.
// 
// NOTE: 2, 3, 5, and 7 are not considered to be truncatable primes.
//
/////////////////////////////////////////////////////////////////////

/////////////////////////////////////////////////////////////////////
// Algorithm Explanation:
// 
// Iterates upwards checking if the number truncates from the left
// and right side while maintaining primality. Uses recursion to
// accept arbitrary length integers. When found the integers are
// added to the solution.
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
	if (num == 1)
	{
		return 0;
	}
	return 1;
}

bool truncatable_left(int num)
{
	if (prime(num))
	{
		string s1 = to_string(num);

		if (s1.length() > 2)
		{
			s1 = s1.substr(1, s1.length() - 1);
		}
		else
		{
			s1 = s1.substr(1, 1);
		}
		num = stoi(s1, nullptr, 0);
		
		if (num > 10)
		{
			return truncatable_left(num);
		}
		else
		{
			if (prime(num))
			{
				return 1;
			}
		}
	}
	return 0;
}

bool truncatable_right(int num)
{
	if (prime(num))
	{
		string s1 = to_string(num);

		if (s1.length() > 2)
		{
			s1 = s1.substr(0, s1.length() - 1);
		}
		else
		{
			s1 = s1.substr(0, 1);
		}
		num = stoi(s1, nullptr, 0);

		if (num > 10)
		{
			return truncatable_right(num);
		}
		else
		{
			if (prime(num))
			{
				return 1;
			}
		}
	}
	return 0;
}

int main()
{
	auto start = std::chrono::high_resolution_clock::now();
	int solution = 0;

	int i = 10;
	int primes = 0;
	while (primes < 11)
	{
		if (truncatable_left(i))
		{
			if (truncatable_right(i))
			{
				primes++;
				solution += i;
			}
		}
		i++;
	}

	auto done = std::chrono::high_resolution_clock::now();
	cout << "Solution: " << solution << endl << endl;
	cout << "Program completed in " << std::chrono::duration_cast<std::chrono::milliseconds>(done - start).count() << " milliseconds." << endl;
}
