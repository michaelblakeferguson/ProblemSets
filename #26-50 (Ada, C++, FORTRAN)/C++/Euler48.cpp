/////////////////////////////////////////////////////////////////////
// Euler48 ~ Self powers
// 
// Problem Statement:
// 
// The series, 1^1 + 2^2 + 3^3 + ... + 10^10 = 10405071317.
//
// Find the last ten digits of the series, 1^1 + 2^2 + 3^3 + ...
// + 1000^1000.
// 
/////////////////////////////////////////////////////////////////////

/////////////////////////////////////////////////////////////////////
// Algorithm Explanation:
// 
// Trivial problem when using gmp. Loop through 1 to 1000 adding
// each rop output to sum. Extract the last 10 digits using substr.
//
/////////////////////////////////////////////////////////////////////

#include <iostream>
#include <chrono>
#include "gmp.h"

using namespace std;

int main()
{
	auto start = std::chrono::high_resolution_clock::now();
	string solution;
	
	mpz_t rop; mpz_init(rop);
	mpz_t sum; mpz_init(sum);
	for(int i = 1; i <= 1000; i++)
	{
		mpz_ui_pow_ui(rop,i,i);
		mpz_add(sum,sum,rop);
	}
	solution = mpz_get_str(NULL,10,sum);
	solution = solution.substr(solution.length()-10,solution.length());
	
	auto done = std::chrono::high_resolution_clock::now();
	cout << "Solution: " << solution << endl << endl;
	cout << "Program completed in " << std::chrono::duration_cast<std::chrono::milliseconds>(done - start).count() << " milliseconds." << endl;
}
