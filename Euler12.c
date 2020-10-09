//Euler12 ~ Highly divisible triangular number
#include <time.h>
#include <stdio.h>
#include <math.h>

clock_t start, end;
double cpu_time_used;

int main()
{
	start = clock();
	
	int largestD = 0;
	int triangle = 0;
	int divisors = 0;
	int i = 1;
	do
	{
		divisors = 0;
		triangle = triangle + i;
		for(int j = 1; j <= (int)sqrt(triangle); j++)
		{
			if((triangle % j) == 0)
			{
				divisors++;
				if(j != triangle/j)
				{
					divisors++;
				}
			}
		}
		if(divisors > largestD)
		{
			largestD = divisors;
			if(divisors >= 500)
			{
				break;
			}
		}
		i++;
	}
	while(1);
	
	end = clock();
	cpu_time_used = ((double) (end - start)) / CLOCKS_PER_SEC;
	printf("Solution: %d\n\n",triangle);
	printf("Program completed in %.3f seconds.", cpu_time_used);
}