//Euler23 ~ Non-abundant sums
//Note - This program doesn't meet the time req. needs to be redone using Euler23.py's impl.
#include <time.h>
#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>

clock_t start, end;
double cpu_time_used;

int main()
{
	start = clock();
	
	//Find abundant numbers (6965 total)
	int abundants[6965];
	int factorSum;
	int abundantNums = 0;
	for(int i = 12; i < 28123; i++)
	{
		factorSum = 1;
		for(int j = 2; j < i; j++)
		{
			if((i%j) == 0)
			{
				factorSum += j;
			}
		}
		if(factorSum > i)
		{
			abundants[abundantNums] = i;
			abundantNums++;
		}
	}
	
	//Add all combinations of 2 abundant numbers (6495^2 - values > 28123 = 24294132)
	int *abundantSums = calloc(24294132, sizeof (int)); //This array includes duplicate values... really dumb
	int sumCount = 0;
	for(int x = 0; x < 6965; x++)
	{
		for(int y = 0; y < 6965; y++)
		{
			if((abundants[x] + abundants[y]) < 28123)
			{
				abundantSums[sumCount] = abundants[x] + abundants[y];
				sumCount++;
			}
		}
	}
	
	//Check if n is not in abundantSums and add to sum
	bool found = 0;
	int sum = 0;
	for(int n = 0; n < 28123; n++)
	{
		for(int z = 0; z < 24294132; z++)
		{
			if(n == abundantSums[z])
			{
				found = 1;
				break;
			}
		}
		
		if(found == 0)
		{
			sum += n;
		}
		else
		{
			found = 0;
		}
	}
	
	end = clock();
	cpu_time_used = ((double) (end - start)) / CLOCKS_PER_SEC;
	printf("Solution: %d\n\n",sum);
	printf("Program completed in %.3f seconds.", cpu_time_used);
}