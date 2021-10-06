/////////////////////////////////////////////////////////////////////
// Euler49 ~ Prime permutations
// 
// Problem Statement:
// 
// The arithmetic sequence, 1487, 4817, 8147, in which each of the
// terms increases by 3330, is unusual in two ways: (i) each of the
// three terms are prime, and, (ii) each of the 4-digit numbers are
// permutations of one another.
// 
// There are no arithmetic sequences made up of three 1-, 2-, or
// 3-digit primes, exhibiting this property, but there is one other
// 4-digit increasing sequence.
// 
// What 12-digit number do you form by concatenating the three terms
// in this sequence?
//
/////////////////////////////////////////////////////////////////////

/////////////////////////////////////////////////////////////////////
// Algorithm Explanation:
// 
// Iterates upwards looking for prime numbers, when found it checks
// to see if p + 3330 is a permutation & prime. Then it checks if
// p + 2*3330 is a permutation & prime. The integers are then
// cast to strings and appended to the solution.
//
/////////////////////////////////////////////////////////////////////

#include <iostream>
#include <array>
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

bool isPermutation(string a, string b)
{
	string str[2] = { a,b };
	
	array<int, 10> aDigits = { 0,0,0,0,0,0,0,0,0,0 };
	array<int, 10> bDigits = { 0,0,0,0,0,0,0,0,0,0 };

	for (int i = 0; i < a.size(); i++)
	{
		if (a.at(i) == '0')
		{
			aDigits[0]++;
		}
		else if (a.at(i) == '1')
		{
			aDigits[1]++;
		}
		else if (a.at(i) == '2')
		{
			aDigits[2]++;
		}
		else if (a.at(i) == '3')
		{
			aDigits[3]++;
		}
		else if (a.at(i) == '4')
		{
			aDigits[4]++;
		}
		else if (a.at(i) == '5')
		{
			aDigits[5]++;
		}
		else if (a.at(i) == '6')
		{
			aDigits[6]++;
		}
		else if (a.at(i) == '7')
		{
			aDigits[7]++;
		}
		else if (a.at(i) == '8')
		{
			aDigits[8]++;
		}
		else if (a.at(i) == ' 9')
		{
			aDigits[9]++;
		}
	}

	for (int i = 0; i < b.size(); i++)
	{
		if (b.at(i) == '0')
		{
			bDigits[0]++;
		}
		else if (b.at(i) == '1')
		{
			bDigits[1]++;
		}
		else if (b.at(i) == '2')
		{
			bDigits[2]++;
		}
		else if (b.at(i) == '3')
		{
			bDigits[3]++;
		}
		else if (b.at(i) == '4')
		{
			bDigits[4]++;
		}
		else if (b.at(i) == '5')
		{
			bDigits[5]++;
		}
		else if (b.at(i) == '6')
		{
			bDigits[6]++;
		}
		else if (b.at(i) == '7')
		{
			bDigits[7]++;
		}
		else if (b.at(i) == '8')
		{
			bDigits[8]++;
		}
		else if (b.at(i) == ' 9')
		{
			bDigits[9]++;
		}
	}

	if (aDigits == bDigits)
	{
		return 1;
	}
	return 0;
	
}

int main()
{
	auto start = std::chrono::high_resolution_clock::now();
	string solution;

	int j, k;
	for (int i = 1488; i < 9999; i++)
	{
		if (prime(i))
		{
			j = i + 3330;
			if (isPermutation(to_string(i), to_string(j)))
			{
				if (prime(j))
				{
					k = j + 3330;
					if (isPermutation(to_string(i), to_string(k)))
					{
						if (prime(k))
						{
							solution.append(to_string(i));
							solution.append(to_string(j));
							solution.append(to_string(k));
						}
					}
				}
			}
		}
	}

	auto done = std::chrono::high_resolution_clock::now();
	cout << "Solution: " << solution << endl << endl;
	cout << "Program completed in " << std::chrono::duration_cast<std::chrono::milliseconds>(done - start).count() << " milliseconds." << endl;
}
