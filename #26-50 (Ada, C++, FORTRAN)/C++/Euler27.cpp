// Euler27 ~ Quadratic primes

/////////////////////////////////////////////////////////////////////
// Algorithm Explanation:
// 
// The two given quadratics "n^2 + n + 41" & "n^2 - 79n + 1601"
// are the same equation where the latter can be written as
// "(n-40)^2 + (n-40) + 41". They both output the same primes
// and thus we can find the solution for a,b < 1000 by setting
// the quadratic "n^2 + an + b" equal to 41 and iterating over
// odd values of a to find b.
/////////////////////////////////////////////////////////////////////

#include <iostream>
#include <stdio.h>

using namespace std;

int main()
{
    time_t start, end;
    time(&start);

    int solution;
    int a = 1;
    int b = 0;
    int max = 1000;
    while (b < max)
    {
        b = a * (a/2) - (a/2) * (a/2) + 41;
        if (b < max)
        {
            solution = a * b;
        }
        a = a + 2;
    }

    //add factor of -1 because a is negative in "n^2 + an + b"
    solution = solution * (-1);

    time(&end);
    cout << "Solution: " << solution << endl << endl;
    cout << "Program completed in " << start - end << " seconds.";

    return 0;
}