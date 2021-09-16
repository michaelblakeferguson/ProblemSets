/////////////////////////////////////////////////////////////////////
// Euler 26 ~ Reciprocal cycles
//
// Problem Statement:
// 
// A unit fraction contains 1 in the numerator. The decimal
// representation of the unit fractions with denominators 2 to 10
// are given:
// 
// 1/2  = 0.5
// 1/3  = 0.(3)
// 1/4  = 0.25
// 1/5  = 0.2
// 1/6  = 0.1(6)
// 1/7  = 0.(142857)
// 1/8  = 0.125
// 1/9  = 0.(1)
// 1/10 = 0.1
// 
// Where 0.1(6) means 0.166666..., and has a 1-digit recurring
// cycle. It can be seen that 1/7 has a 6-digit recurring cycle.
// 
// Find the value of d < 1000 for which 1/d contains the longest
// recurring cycle in its decimal fraction part.
// 
/////////////////////////////////////////////////////////////////////


/////////////////////////////////////////////////////////////////////
// Algorithm Explanation:
// 
// This question boils down to finding the highest full reptend
// prime < 1000. Long division is used to store the decimals
// for each unit fraction up to the nth - 1 digit, +10 additional
// digits to check for repetition. If the 10 digits being checked
// aren't found in the middle of the expansion and match the end,
// we know we have found a full reptend prime. And since the larger
// the denominator the larger the reptend, we only need to find the
// first full reptend starting from 1000 to know we have the largest
// full reptend prime.
//
/////////////////////////////////////////////////////////////////////

#include <iostream>
#include <vector>
#include <string>
#include <sstream>
#include <chrono>

using namespace std;

int main(int argc, char* argv[])
{
	auto start = std::chrono::high_resolution_clock::now();

	int p = 999;
	int a, b, c, solution;

	std::vector <int> decimals(0);

	int i;
	while (p > 1)
	{
		a = 10;
		b = p;
		i = 0;

		while ((a > 0) && (i < (b + 9))) //use long division to get decimal expansion
		{
			decimals.resize(i);

			if (b > a)
			{
				a = a * 10;

				decimals.push_back(0);
			}
			else
			{
				c = a / b;
				a = a - b * c;
				a = a * 10;

				decimals.push_back(c);
			}
			i++;
		}

		if (a > 0) //check if it is a full reptend prime
		{
			std::stringstream stringDecimals;
			std::copy(decimals.begin(), decimals.end(), std::ostream_iterator<int>(stringDecimals, ""));
			string front = stringDecimals.str().substr(0, 10);
			string middle = stringDecimals.str().substr(10, p - 11);
			string end = stringDecimals.str().substr(p - 1);

			if ((middle.find(front) == std::string::npos) && (end.find(front) != std::string::npos))
			{
				solution = p;
				break;
			}
		}
		p--;
	}

	auto done = std::chrono::high_resolution_clock::now();
	cout << "Solution: " << solution << endl << endl;
	cout << "Program completed in " << std::chrono::duration_cast<std::chrono::milliseconds>(done - start).count() << " milliseconds." << endl;

	return 0;
}
