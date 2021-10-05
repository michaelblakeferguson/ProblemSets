/////////////////////////////////////////////////////////////////////
// Euler34 ~ Digit factorials
// 
// Problem Statement:
// 
// 145 is a curious number, as 1! + 4! + 5! = 1 + 24 + 120 = 145.
// 
// Find the sum of all numbers which are equal to the sum of the
// factorial of their digits.
// 
// Note: As 1! = 1 and 2! = 2 are not sums they are not included.
//
/////////////////////////////////////////////////////////////////////

/////////////////////////////////////////////////////////////////////
// Algorithm Explanation:
// 
// Uses modulo to extract digits then calculates the factorial for
// each and summing together. If the sum equals the full number it
// is added to the total sum.
//
/////////////////////////////////////////////////////////////////////

#include <iostream>
#include <chrono>

using namespace std;

int main()
{
	auto start = std::chrono::high_resolution_clock::now();
	int solution = 0;
	
	int cur_sum, digit, f, j;
	for(int i = 3; i < 10000000; i++)
	{
		j = i;
		cur_sum = 0;
		while(1)
		{
			f = 1;
			digit = j % 10;
			for (int k = digit; k > 0; k--)
			{
				f = f * k;
			}
			cur_sum += f;
			
			if(j < 10)
			{
				break;
			}
			j /= 10;
		}
		
		if(cur_sum == i)
		{
			solution += cur_sum;
		}
	}

	auto done = std::chrono::high_resolution_clock::now();
	cout << "Solution: " << solution << endl << endl;
	cout << "Program completed in " << std::chrono::duration_cast<std::chrono::milliseconds>(done - start).count() << " milliseconds." << endl;
}
