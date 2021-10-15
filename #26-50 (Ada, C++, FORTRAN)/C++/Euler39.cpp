/////////////////////////////////////////////////////////////////////
// Euler39 ~ Integer right triangles
// 
// Problem Statement:
// 
// If p is the perimeter of a right angle triangle with integral
// length sides, {a,b,c}, there are exactly three solutions for
// p = 120.
// 
//		{20,48,52}, {24,45,51}, {30,40,50}
// 
// For which value of p ≤ 1000, is the number of solutions maximised?
// 
/////////////////////////////////////////////////////////////////////

/////////////////////////////////////////////////////////////////////
// Algorithm Explanation:
// 
// Iterates through values of a,b,c and checks if they are a
// pythagorean triplet. If they pass, then they form a right triangle
// and the perimeter is found from a+b+c. Then the triangles array
// uses the perimiter as an index and increments the number of found
// triangles.
// 
/////////////////////////////////////////////////////////////////////

#include <iostream>
#include <chrono>

using namespace std;

int main()
{
	auto start = std::chrono::high_resolution_clock::now();
	int solution = 0;
	
	int triangles_found_for_p[1000] = { 0 };
	for (int a = 4; a <= 500; a++)
	{
		for (int b = 1; b < a; b++)
		{
			for (int c = 1; c <= 999 - a - b; c++)
			{
				if ((a * a + b * b) == (c * c))
				{
					triangles_found_for_p[a + b + c]++;
				}
			}
		}
	}

	int max = 0;
	for (int p = 0; p < 999; p++)
	{
		if (triangles_found_for_p[p] > max)
		{
			max = triangles_found_for_p[p];
			solution = p;
		}
	}

	auto done = std::chrono::high_resolution_clock::now();
	cout << "Solution: " << solution << endl << endl;
	cout << "Program completed in " << std::chrono::duration_cast<std::chrono::milliseconds>(done - start).count() << " milliseconds." << endl;
}
