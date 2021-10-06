/////////////////////////////////////////////////////////////////////
// Euler38 ~ Pandigital multiples
// 
// Problem Statement:
// 
// Take the number 192 and multiply it by each of 1, 2, and 3:
// 
//		192 × 1 = 192
//		192 × 2 = 384
//		192 × 3 = 576
// 
// By concatenating each product we get the 1 to 9 pandigital,
// 192384576. We will call 192384576 the concatenated product of 192
// and (1,2,3)
// 
// The same can be achieved by starting with 9 and multiplying by 1,
// 2, 3, 4, and 5, giving the pandigital, 918273645, which is the
// concatenated product of 9 and (1,2,3,4,5).
// 
// What is the largest 1 to 9 pandigital 9-digit number that can be
// formed as the concatenated product of an integer with
// (1,2, ... , n) where n > 1?
//
/////////////////////////////////////////////////////////////////////

/////////////////////////////////////////////////////////////////////
// Algorithm Explanation:
// 
// Tests values each from 1..n concatenating their substrings to a
// length of 9. If it is pandigital it casts it to an int and checks
// if it is larger than the previously found value.
//
/////////////////////////////////////////////////////////////////////

#include <iostream>
#include <string>
#include <chrono>

using namespace std;

bool pandigital(string str)
{
	int zero = 0;
	int one = 0;
	int two = 0;
	int three = 0;
	int four = 0;
	int five = 0;
	int six = 0;
	int seven = 0;
	int eight = 0;
	int nine = 0;

	for (int i = 0; i < str.size(); i++)
	{
		if (str.at(i) == '0')
		{
			zero++;
		}
		else if (str.at(i) == '1')
		{
			one++;
		}
		else if (str.at(i) == '2')
		{
			two++;
		}
		else if (str.at(i) == '3')
		{
			three++;
		}
		else if (str.at(i) == '4')
		{
			four++;
		}
		else if (str.at(i) == '5')
		{
			five++;
		}
		else if (str.at(i) == '6')
		{
			six++;
		}
		else if (str.at(i) == '7')
		{
			seven++;
		}
		else if (str.at(i) == '8')
		{
			eight++;
		}
		else if (str.at(i) == '9')
		{
			nine++;
		}
	}

	if ((zero == 0) && (one == 1) && (two == 1) && (three == 1) && (four == 1) &&
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

	string s1,s2;
	int total_length;
	for (int i = 9; i < 10000; i++)
	{
		s2 = "";
		total_length = 0;
		for (int j = 1; j < 3; j++)
		{
			s1 = to_string(i * j);
			s2 = s2.append(s1);
			total_length = total_length + s1.length();
			
			if (total_length == 9)
			{
				if (pandigital(s2))
				{
					if (solution < stoi(s2, nullptr,0))
					{
						solution = stoi(s2, nullptr, 0);
					}
				}
				else
				{
					break;
				}
			}
			else if (total_length > 9)
			{
				break;
			}
		}
	}

	auto done = std::chrono::high_resolution_clock::now();
	cout << "Solution: " << solution << endl << endl;
	cout << "Program completed in " << std::chrono::duration_cast<std::chrono::milliseconds>(done - start).count() << " milliseconds." << endl;
}
