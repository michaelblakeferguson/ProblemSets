/////////////////////////////////////////////////////////////////////
// Euler43 ~ Sub-string divisibility
// 
// Problem Statement:
// 
// The number, 1406357289, is a 0 to 9 pandigital number because it
// is made up of each of the digits 0 to 9 in some order, but it
// also has a rather interesting sub-string divisibility property.
// 
// Let d1 be the 1st digit, d2 be the 2nd digit, and so on. In this
// way, we note the following:
// 
//		d2d3d4  = 406 is divisible by 2
//		d3d4d5  = 063 is divisible by 3
//		d4d5d6  = 635 is divisible by 5
//		d5d6d7  = 357 is divisible by 7
//		d6d7d8  = 572 is divisible by 11
//		d7d8d9  = 728 is divisible by 13
//		d8d9d10 = 289 is divisible by 17
// 
// Find the sum of all 0 to 9 pandigital numbers with this property.
// 
/////////////////////////////////////////////////////////////////////

/////////////////////////////////////////////////////////////////////
// Algorithm Explanation:
// 
// Uses lexicographic sorting to iterate through permutations of
// digits 0-9 stored in a string. Each string is already pandigital
// and thus doesn't need to be checked again. The digit triples are
// extracted using substr and tested for divisibility of the primes.
// Lower bound is set to the 1st given value, upper bound is set to
// marginally above the largest found value.
// 
/////////////////////////////////////////////////////////////////////

#include <iostream>
#include <sstream>
#include <vector>
#include <string>
#include <chrono>

using namespace std;

int main()
{
	auto start = std::chrono::high_resolution_clock::now();
	long long int solution = 0;
	
	ostringstream os;
	string str = "1402356789";
	string s234, s345, s456, s567, s678, s789, s8910;
	
	int i, j, x, y, z;
	int numbers[] = { 1,4,0,2,3,5,6,7,8,9 };
	long long int max = 4200000000;
	while (stoll(str, nullptr, 10) < max)
	{
		for (i = 8; i >= 0; i--)
		{
			if (numbers[i] < numbers[i + 1])
			{
				x = i;
				break;
			}
		}

		for (i = 9; i >= 0; i--)
		{
			if (numbers[x] < numbers[i])
			{
				y = i;
				break;
			}
		}
		
		z = numbers[x];
		numbers[x] = numbers[y];
		numbers[y] = z;
		
		vector<int> reverse(9 - x);
		for (i = 9; i >= x + 1; i--)
		{
			reverse[9 - i] = numbers[i];
		}

		for (i = 0, j = x + 1; i < 9 - x; i++)
		{
			numbers[j] = reverse[i];
			j++;
		}

		os.str("");
		for (int u = 0; u <= 9; u++)
		{
			os << numbers[u];
		}
		
		str = os.str();
		s234  = str.substr(1, 3);
		s345  = str.substr(2, 3);
		s456  = str.substr(3, 3);
		s567  = str.substr(4, 3);
		s678  = str.substr(5, 3);
		s789  = str.substr(6, 3);
		s8910 = str.substr(7, 3);

		if (((stoi(s234,  nullptr, 10) %  2) == 0) &&
			((stoi(s345,  nullptr, 10) %  3) == 0) &&
			((stoi(s456,  nullptr, 10) %  5) == 0) &&
			((stoi(s567,  nullptr, 10) %  7) == 0) &&
			((stoi(s678,  nullptr, 10) % 11) == 0) &&
			((stoi(s789,  nullptr, 10) % 13) == 0) &&
			((stoi(s8910, nullptr, 10) % 17) == 0))
		{
			solution += stoll(str, nullptr, 0);
		}
		
	}

	auto done = std::chrono::high_resolution_clock::now();
	cout << "Solution: " << solution << endl << endl;
	cout << "Program completed in " << std::chrono::duration_cast<std::chrono::milliseconds>(done - start).count() << " milliseconds." << endl;
}
