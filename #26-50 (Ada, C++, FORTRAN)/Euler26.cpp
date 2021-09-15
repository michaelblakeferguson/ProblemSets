//Euler 26 ~ Reciprocal cycles

//This question boils down to finding the highest full reptend prime < 1000.
//A list of these values can be found provided at "oeis.org/A001913"

#include <iostream>
#include <string>
#include <sstream>
#include <vector>

using namespace std;

int main(int argc, char *argv[])
{
	time_t start, end;
	time(&start);

	int p = 999;
	int a, b, c, solution;
	
	std::vector <int> decimals(0);
	
	int i;
	while (p > 1)
	{
		a = 10;
		b = p;
		i = 0;

		while ((a > 0) && (i < (b+9))) //use long division to get decimal expansion
		{
			decimals.resize(i);

			if (b > a)
			{
				a = a * 10;
				
				decimals.push_back(0);
			}
			else
			{
				c = a / b;
				a = a - b * c;
				a = a * 10;

				decimals.push_back(c);
			}
			i++;
		}

		if (a > 0) //check if it is a full reptend prime
		{
			std::stringstream stringDecimals;
			std::copy(decimals.begin(), decimals.end(), std::ostream_iterator<int>(stringDecimals, ""));
			string start = stringDecimals.str().substr(0, 10);
			string middle = stringDecimals.str().substr(10, p - 11);
			string end = stringDecimals.str().substr(p-1);

			if ((middle.find(start) == std::string::npos) && (end.find(start) != std::string::npos))
			{
				solution = p;
				break;
			}
		}
		p--;
	}

	time(&end);
	cout << "Solution: " << solution << endl << endl;
	cout << "Program completed in " << (start - end) << " seconds." << endl;

	return 0;
}