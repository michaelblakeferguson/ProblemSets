/////////////////////////////////////////////////////////////////////
// Euler31 ~ Coin sums
// 
// Problem Statement:
// 
// In the United Kingdom the currency is made up of pound and pence.
// There are eight coins in general circulation:
// 
//      1p, 2p, 5p, 10p, 20p, 50p, $1, $2 (200p).
// 
// It is possible to make $2 in the following way:
// 
//      1x$1 + 1x50p + 2x20p + 1x5p + 1x2p + 3x1p
// 
// How many different ways can $2 be made using any number of coins?
//
/////////////////////////////////////////////////////////////////////

/////////////////////////////////////////////////////////////////////
// Algorithm Explanation:
// 
// Calls the countcoins() function with initial value of 200.
// The function then begins to test values of the coins array
// checking to see if they can be removed from the total to get
// zero indicating they evenly add up to 200. By recursively
// calling itself the function finds all possible iterations of the
// coins from a topdown approach.
// 
/////////////////////////////////////////////////////////////////////

#include <iostream>
#include <chrono>

using namespace std;

int coins[8] = { 200, 100, 50, 20, 10, 5, 2, 1 };

int countcoins(int total, int coin)
{
    int sum = 0;
    if (coin == 7)
    {
        return 1;
    }

    for (int i = coin; i < 8; i++)
    {
        if (total - coins[i] == 0)
        {
            sum = sum + 1;
        }
        if (total - coins[i] > 0)
        {
            sum = sum + countcoins((total-coins[i]), i);
        }
    }
    return sum;
}

int main()
{
    auto start = std::chrono::high_resolution_clock::now();

    int solution = 0;
    solution = countcoins(200, 0);

    auto done = std::chrono::high_resolution_clock::now();
    cout << "Solution: " << solution << endl << endl;
    cout << "Program completed in " << std::chrono::duration_cast<std::chrono::milliseconds>(done - start).count() << " milliseconds." << endl;
}
