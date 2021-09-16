/////////////////////////////////////////////////////////////////////
// Euler27 ~ Quadratic primes
//
// Problem Statement:
// 
// Euler discovered the remarkable quadratic formula:
// 
//                      n^2 + n + 41
// 
// It turns out that the formula will produce 40 primes for the
// consecutive integer values 0 <= n <= 39. However, when n = 40,
// 40^2 + 40 + 41 = 40(40 + 1) + 41 is divisible by 41, and
// certainly when n = 41, 41^2 + 41 + 41 is cleary divisible by 41.
// 
// The incredible formula n^2 - 79n + 1601 was discovered, which
// produces 80 primes for the consecutive values 0 <= n <= 79.
// The product of the coefficients, -79 and 1601, is -126479.
// 
// Considering quadratics of the form:
// 
//      n^2 + an + b, where |a| <= 1000 and |b| <= 1000
// 
//      where |n| is the modulus/absolute value of n
//      e.g. |11| = 11 and |-4| = 4
// 
// Find the product of the coefficients, a and b, for the quadratic
// expression that produces the maximum number of primes for
// consecutive values of n, starting with n = 0.
// 
/////////////////////////////////////////////////////////////////////

/////////////////////////////////////////////////////////////////////
// Algorithm Explanation:
// 
// The two given quadratics "n^2 + n + 41" & "n^2 - 79n + 1601"
// are the same equation where the latter can be written as
// "(n-40)^2 + (n-40) + 41". They both output the same primes
// and thus we can find the solution for a,b < 1000 by setting
// the quadratic "n^2 + an + b" equal to 41 and iterating over
// odd values of a to find b.
// 
/////////////////////////////////////////////////////////////////////

#include <iostream>
#include <chrono>

using namespace std;

int main()
{
    auto start = std::chrono::high_resolution_clock::now();

    int solution;
    int a = 1;
    int b = 0;
    int max = 1000;
    while (b < max)
    {
        b = a * (a / 2) - (a / 2) * (a / 2) + 41;
        if (b < max)
        {
            solution = a * b;
        }
        a = a + 2;
    }

    //add factor of -1 because a is negative in "n^2 + an + b"
    solution = solution * (-1);

    auto done = std::chrono::high_resolution_clock::now();
    cout << "Solution: " << solution << endl << endl;
    cout << "Program completed in " << std::chrono::duration_cast<std::chrono::milliseconds>(done - start).count() << " milliseconds." << endl;

    return 0;
}
