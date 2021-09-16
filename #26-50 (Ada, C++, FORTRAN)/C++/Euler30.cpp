/////////////////////////////////////////////////////////////////////
// Euler30 ~ Digit fifth powers
// 
// Problem Statement:
// 
// Surprisingly there are only three numbers that can be written as
// the sum of fourth powers of their digits:
// 
//		1634 = 1^4 + 6^4 + 3^4 + 4^4
//		8208 = 8^4 + 2^4 + 0^4 + 8^4
//		9474 = 9^4 + 4^4 + 7^4 + 4^4
// 
// As 1 = 1^4 is not a sum it is not included.
// 
// The sum of these numbers is 1634 + 8208 + 9474 = 19316
// 
// Find the sum of all the numbers that can be written as the sum
// of fifth powers of their digits.
//
/////////////////////////////////////////////////////////////////////

/////////////////////////////////////////////////////////////////////
// Algorithm Explanation:
// 
// Loops up to 1 million checking if the number is a sum of fifth
// powers by using modulo 10 to extract each digit and raise to
// the fifth power, then adding its sum to total if it passes. 
// 
/////////////////////////////////////////////////////////////////////

#include <iostream>
#include <chrono>
#include <cmath>

using namespace std;

int main()
{
	auto start = std::chrono::high_resolution_clock::now();

	int size, digit, num;
	int sum = 0;
	int total = 0;
	for (int n = 2; n < 999999; n++)
	{
		num = n;
		size = trunc(log10(num)) + 1; //get length of num

		for (int i = 0; i < size; i++) //raise each digit to 5th power and add
		{
			digit = num % 10;
			
			sum = sum + int(pow(double(digit), 5.0));

			num /= 10;
		}

		if (sum == n)
		{
			total += sum;
		}
		sum = 0;
	}

	auto done = std::chrono::high_resolution_clock::now();
	cout << "Solution: " << total << endl << endl;
	cout << "Program completed in " << std::chrono::duration_cast<std::chrono::milliseconds>(done - start).count() << " milliseconds." << endl;

	return 0;
}