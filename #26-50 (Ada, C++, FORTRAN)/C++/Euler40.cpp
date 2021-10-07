/////////////////////////////////////////////////////////////////////
// Euler40 ~ Champernowne's constant
// 
// Problem Statement:
// 
// An irrational decimal fraction is created by concatenating the
// positive integers:
// 
//		0.123456789101112131415161718192021...
// 
// It can be seen that the 12th digit of the fractional part is 1.
// 
// If dn represents the nth digit of the fractional part, find the
// value of the following expression.
// 
//		d1 × d10 × d100 × d1000 × d10000 × d100000 × d1000000
// 
/////////////////////////////////////////////////////////////////////

/////////////////////////////////////////////////////////////////////
// Algorithm Explanation:
// 
// Iterates up to 1 million appending i to the string champ. When
// finished, it gets the digits at the specified indexes, casts them
// to ints and multiplies together into solution.
//
/////////////////////////////////////////////////////////////////////

#include <iostream>
#include <string>
#include <chrono>

using namespace std;

int main()
{
	auto start = std::chrono::high_resolution_clock::now();
	int solution = 0;
	
	string champ;
	int i = 0, length = 0;
	while (length <= 1000000)
	{
		i++;
		champ.append(to_string(i));
		length = champ.length();
	}

	solution = (int)(champ.at(0)-'0') * (int)(champ.at(9)-'0') * (int)(champ.at(99)-'0') * (int)(champ.at(999)-'0') *
		       (int)(champ.at(9999)-'0') * (int)(champ.at(99999)-'0') * (int)(champ.at(999999)-'0');

	auto done = std::chrono::high_resolution_clock::now();
	cout << "Solution: " << solution << endl << endl;
	cout << "Program completed in " << std::chrono::duration_cast<std::chrono::milliseconds>(done - start).count() << " milliseconds." << endl;
}
