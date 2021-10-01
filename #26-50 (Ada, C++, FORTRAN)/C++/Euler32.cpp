/////////////////////////////////////////////////////////////////////
// Euler32 ~ Pandigital products
// 
// Problem Statement:
// 
// We shall say that an n-digit number is pandigital if it makes
// use of all the digits 1 to n exactly once; for example, the
// 5-digit number, 15234, is 1 through 5 pandigital.
//
// The product 7254 is unusual, as the identity, 39 × 186 = 7254,
// containing multiplicand, multiplier, and product is 1 through 9
// pandigital.
//
// Find the sum of all products whose multiplicand/multiplier/
// product identity can be written as a 1 through 9 pandigital.
//
// HINT: Some products can be obtained in more than one way so be
// sure to only include it once in your sum.
//
/////////////////////////////////////////////////////////////////////

/////////////////////////////////////////////////////////////////////
// Algorithm Explanation:
// 
// Figuring out the max limit to calculate values is the biggest
// hurdle in reducing the run time. By inspection, when churning
// out values without an upper limit we can tell that the factors
// begin to repeat in opposite order, e.g. 39 x 186 and 186 x 39
// give the same product 7254. It can also be seen that for integers
// 1-9 there are not factors of products greater than 50 and 2000,
// so those can serve as our upper limit. We just then need to make
// sure no repeats are added into the product vector and calculate
// the sum when finished.
//
/////////////////////////////////////////////////////////////////////

#include <iostream>
#include <algorithm>
#include <string>
#include <vector>
#include <chrono>

using namespace std;

bool pandigital(string a_str, string b_str, string c_str)
{
	string str[3] = {a_str, b_str, c_str};
	int zero  = 0;
	int one   = 0;
	int two   = 0;
	int three = 0;
	int four  = 0;
	int five  = 0;
	int six   = 0;
	int seven = 0;
	int eight = 0;
	int nine  = 0;
	
	for(int s = 0; s < 3; s++)
	{
		for(int i = 0; i < str[s].size(); i++)
		{
			if(str[s].at(i) == '0')
			{
				zero++;
			}
			else if(str[s].at(i) == '1')
			{
				one++;
			}
			else if(str[s].at(i) == '2')
			{
				two++;
			}
			else if(str[s].at(i) == '3')
			{
				three++;
			}
			else if(str[s].at(i) == '4')
			{
				four++;
			}
			else if(str[s].at(i) == '5')
			{
				five++;
			}
			else if(str[s].at(i) == '6')
			{
				six++;
			}
			else if(str[s].at(i) == '7')
			{
				seven++;
			}
			else if(str[s].at(i) == '8')
			{
				eight++;
			}
			else if(str[s].at(i) == '9')
			{
				nine++;
			}
		}
	}
	
	if((zero == 0) && (one == 1) && (two == 1)   && (three == 1) && (four == 1) &&
	   (five == 1) && (six == 1) && (seven == 1) && (eight == 1) && (nine == 1))
	{
		return 1;
	}
	return 0;
}

int main()
{
	auto start = std::chrono::high_resolution_clock::now();
	int solution = 0;
	
	int a, b, c = 1;
	vector<int> products;
	vector<char> Avec, Bvec, Cvec;
	string Astr, Bstr, Cstr;
	
	for(int a = 1; a < 50; a++)
	{
		for(int b = 1; b < 2000; b++)
		{
			c = a*b;
			Astr = to_string(a);
			Bstr = to_string(b);
			Cstr = to_string(c);
			
			if(pandigital(Astr,Bstr,Cstr))
			{
				if(find(products.begin(), products.end(), c) == products.end())
				{
					products.push_back(c);
				}
			}
		}
	}
	
	for(int i = 0; i < products.size(); i++)
	{
		solution = solution + products.at(i);
	}
	
	auto done = std::chrono::high_resolution_clock::now();
    cout << "Solution: " << solution << endl << endl;
    cout << "Program completed in " << std::chrono::duration_cast<std::chrono::milliseconds>(done - start).count() << " milliseconds." << endl;
}
