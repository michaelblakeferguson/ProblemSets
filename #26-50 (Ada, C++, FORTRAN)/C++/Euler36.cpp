/////////////////////////////////////////////////////////////////////
// Euler36 ~ Double-base palindromes
// 
// Problem Statement:
// 
// The decimal number, 585 = 10010010012 (binary), is palindromic in
// both bases.
// 
// Find the sum of all numbers, less than one million, which are
// palindromic in base 10 and base 2.
// 
// (Please note that the palindromic number, in either base, may not
// include leading zeros.)
//
/////////////////////////////////////////////////////////////////////

/////////////////////////////////////////////////////////////////////
// Algorithm Explanation:
// 
// Converts the integer in base 10 to a string and checks if it is
// a palindrome. Then converts the integer to base 2 and repeats the
// process. If it passes both palindrome checks the integer value is
// added to the solution.
//
/////////////////////////////////////////////////////////////////////

#include <iostream>
#include <bitset>
#include <string>
#include <chrono>

using namespace std;

bool palindrome(string str)
{
	for (int i = 0; i < str.length() / 2; i++)
	{
		if (str.at(i) != str.at(str.length() - i - 1))
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

	string s1;
	for (int i = 1; i < 1000000; i++)
	{
		s1 = to_string(i);
		if (palindrome(s1))
		{
			s1 = bitset<32>(i).to_string();
			s1.erase(0, s1.find_first_not_of('0'));
			if (palindrome(s1))
			{
				solution = solution + i;
			}
		}
	}

	auto done = std::chrono::high_resolution_clock::now();
	cout << "Solution: " << solution << endl << endl;
	cout << "Program completed in " << std::chrono::duration_cast<std::chrono::milliseconds>(done - start).count() << " milliseconds." << endl;
}
