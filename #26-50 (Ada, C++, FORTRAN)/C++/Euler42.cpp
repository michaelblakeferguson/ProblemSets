/////////////////////////////////////////////////////////////////////
// Euler42 ~ Coded triangle numbers
// 
// Problem Statement:
// 
// The nth term of the sequence of triangle numbers is given by,
// t_n = 1/2*n(n+1); so the first ten triangle numbers are:
// 
//		1, 3, 6, 10, 15, 21, 28, 36, 45, 55, ...
// 
// By converting each letter in a word to a number corresponding to
// its alphabetical position and adding these values we form a word
// value. For example, the word value for SKY is 19 + 11 + 25 = 55
// = t_10. If the word value is a triangle number then we shall call
// the word a triangle word.
// 
// Using words.txt, a 16K text file containing nearly two-thousand
// common English words, how many are triangle words?
// 
/////////////////////////////////////////////////////////////////////

/////////////////////////////////////////////////////////////////////
// Algorithm Explanation:
// 
// Loads words.txt into a vector and iterates checking for chars that
// are alphanumeric. When the start of a word is found, the length is
// determined, a value is calculated for it, it is checked for
// triangularity. If it passes, solution is incremented.
// 
/////////////////////////////////////////////////////////////////////

#include <iostream>
#include <fstream>
#include <vector>
#include <chrono>

using namespace std;

bool isTriangular(int val)
{
	if(val ==   1 || val ==   3 ||
	   val ==   6 || val ==  10 ||
	   val ==  15 || val ==  21 ||
	   val ==  28 || val ==  36 ||
	   val ==  45 || val ==  55 ||
	   val ==  66 || val ==  78 ||
	   val ==  91 || val == 105 ||
	   val == 120 || val == 136 ||
	   val == 153 || val == 171)
	   {
		   return 1;
	   }
	   return 0;
}

int main()
{
	auto start = std::chrono::high_resolution_clock::now();
	int solution = 0;
	
	vector<char> vec;
	ifstream file("words.txt");
	streampos SIZE;
	
	//load file into vector of chars
	if (!file.eof())
	{
		file.seekg(0, file.end);
		SIZE = file.tellg();
		vec.resize(SIZE);
		file.seekg(0, file.beg);
		file.read(&vec[0], SIZE);
	}
	
	int i = 0, j = 0, length = 0, value = 0;
	while(i < SIZE)
	{
		//find starting alphanumeric char of word
		if(vec.at(i) >= 65 && vec.at(i) <= 90)
		{
			//determine length of word
			j = 0;
			while(vec.at(i+j) >= 65 && vec.at(i+j) <= 90)
			{
				length++;
				j++;
			}
			
			//calculate value of word
			for(int k = i; k < i+j; k++)
			{
				value += vec.at(k) - 64;
			}
			
			//determine if word is triangular
			if(isTriangular(value))
			{
				solution++;
			}
			
			i = i + j - 1;
		}
		i++;
		length = 0;
		value = 0;
	}
	
	auto done = std::chrono::high_resolution_clock::now();
	cout << "Solution: " << solution << endl << endl;
	cout << "Program completed in " << std::chrono::duration_cast<std::chrono::milliseconds>(done - start).count() << " milliseconds." << endl;
}
