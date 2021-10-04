/////////////////////////////////////////////////////////////////////
// Euler33 ~ Digit cancelling fractions
// 
// Problem Statement:
// 
// The fraction 49/98 is a curious fraction, as an inexperienced
// mathematician in attempting to simplify it may incorrectly
// believe that 49/98 = 4/8, which is correct, is obtained by
// cancelling the 9s.
//
// We shall consider fractions like, 30/50 = 3/5, to be trivial
// examples.
//
// There are exactly four non-trivial examples of this type of
// fraction, less than one in value, and containing two digits
// in the numerator and denominator.
//
// If the product of these four fractions is given in its lowest
// common terms, find the value of the denominator.
//
/////////////////////////////////////////////////////////////////////

/////////////////////////////////////////////////////////////////////
// Algorithm Explanation:
// 
// Two for loops iterate through the possible values for the 2-digit
// numerator and denominator. The digits are then extracted and
// compared to check for equality. The decimal form is then found
// for the digits that aren't cancelled and checked for equality
// to q. The last step is to calculate the product and reduce the
// denominator.
//
/////////////////////////////////////////////////////////////////////

#include <iostream>
#include <chrono>
#include <math.h>
#include <limits.h>

using namespace std;

bool CompareDoubles2(double A, double B)
{
	double diff = A - B;
	return (diff < std::numeric_limits<double>::epsilon()) && (-diff < std::numeric_limits<double>::epsilon());
}

int main()
{
	auto start = std::chrono::high_resolution_clock::now();
	int solution = 0;

	int a, b, c, d;
	int numer = 1;
	int denom = 1;
	double q;

	for (int i = 11; i < 100; i++)
	{
		for (int j = i + 1; j < 100; j++)
		{
			a = (i / 10) % 10;
			b = i % 10;
			c = (j / 10) % 10;
			d = j % 10;
			
			q = double(i) / double(j);
			if (q < 1)
			{
				if ((b != 0) && (d != 0))
				{
					if (a == c)
					{
						if (CompareDoubles2(((double)b / (double)d), q))
						{
							numer = numer * i;
							denom = denom * j;
						}
					}
					else if (a == d)
					{
						if (CompareDoubles2(((double)b/(double)c), q))
						{
							numer = numer * i;
							denom = denom * j;
						}
					}
					if (b == c)
					{
						if (CompareDoubles2(((double)a/(double)d), q))
						{
							numer = numer * i;
							denom = denom * j;
						}
					}
					else if (b == d)
					{
						if (CompareDoubles2((double)a/(double)c, q))
						{
							numer = numer * i;
							denom = denom * j;
						}
					}
				}
			}
		}
	}

	//The numerator divides evenly into the denominator
	solution = denom / numer;

	auto done = std::chrono::high_resolution_clock::now();
	cout << "Solution: " << solution << endl << endl;
	cout << "Program completed in " << std::chrono::duration_cast<std::chrono::milliseconds>(done - start).count() << " milliseconds." << endl;
}
