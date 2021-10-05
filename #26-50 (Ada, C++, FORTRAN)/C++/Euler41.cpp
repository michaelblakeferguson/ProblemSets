/////////////////////////////////////////////////////////////////////
// Euler41 ~ Pandigital prime
// 
// Problem Statement:
// 
// We shall say that an n-digit number is pandigital if it makes use
// of all the digits 1 to n exactly once. For example, 2143 is a
// 4-digit pandigital and is also prime.
// 
// What is the largest n-digit pandigital prime that exists?
//
/////////////////////////////////////////////////////////////////////

/////////////////////////////////////////////////////////////////////
// Algorithm Explanation:
// 
// Searching from 2143 upwards for pandigital primes and printing to
// command line gives us the answer after ~40 seconds. Knowing the
// upper limit of 7 digits, we can then search from 7654321
// downwards to get the answer within milliseconds.
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

bool pandigital(string str, int n)
{
	int zero = 0;
	int one = 0;
	int two = 0;
	int three = 0;
	int four = 0;
	int five = 0;
	int six = 0;
	int seven = 0;

	for (int i = 0; i < str.size(); i++)
	{
		if (str.at(i) == '0')
		{
			zero++;
		}
		else if (str.at(i) == '1')
		{
			one++;
		}
		else if (str.at(i) == '2')
		{
			two++;
		}
		else if (str.at(i) == '3')
		{
			three++;
		}
		else if (str.at(i) == '4')
		{
			four++;
		}
		else if (str.at(i) == '5')
		{
			five++;
		}
		else if (str.at(i) == '6')
		{
			six++;
		}
		else if (str.at(i) == '7')
		{
			seven++;
		}
	}

	if (n == 7)
	{
		if ((zero == 0) && (one == 1) && (two == 1) && (three == 1) && (four == 1) &&
			(five == 1) && (six == 1) && (seven == 1))
		{
			return 1;
		}
	}
	else if (n == 6)
	{
		if ((zero == 0) && (one == 1) && (two == 1) && (three == 1) && (four == 1) &&
			(five == 1) && (six == 1))
		{
			return 1;
		}
	}
	else if (n == 5)
	{
		if ((zero == 0) && (one == 1) && (two == 1) && (three == 1) && (four == 1) &&
			(five == 1))
		{
			return 1;
		}
	}
	else if (n == 4)
	{
		if ((zero == 0) && (one == 1) && (two == 1) && (three == 1) && (four == 1))
		{
			return 1;
		}
	}
	return 0;
}

int main()
{
	auto start = std::chrono::high_resolution_clock::now();
	int solution = 0;

	string s1;
	int length = 0;
	for (int i = 7654321; i > 2143; i--)
	{
		s1 = to_string(i);
		if (pandigital(s1,s1.length()))
		{
			if (prime(i))
			{
				solution = i;
				break;
			}
		}
	}

	auto done = std::chrono::high_resolution_clock::now();
	cout << "Solution: " << solution << endl << endl;
	cout << "Program completed in " << std::chrono::duration_cast<std::chrono::milliseconds>(done - start).count() << " milliseconds." << endl;
}
