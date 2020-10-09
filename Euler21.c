//Euler21 ~ Amicable numbers
#include <time.h>
#include <stdio.h>
#include <math.h>

clock_t start, end;
double cpu_time_used;

int main()
{
	start = clock();
	
	int sumB;
	int b;
	int sum = 0;
	for(int a = 220; a < 10000; a++)
	{
		b = 1;
		sumB = 1;
		for (int i = 2; i <= sqrt(a); i++)
		{
			if (a % i == 0)
			{
				b = b + i;
				b = b + a/i;
			}
		}
		
		for (int j = 2; j <= sqrt(b); j++)
		{
			if (b % j == 0)
			{
				sumB = sumB + j;
				sumB = sumB + b/j;
			}
		}
		
		if((a == sumB) && (a != b))
		{
			sum = sum + a + b;
		}
	}
		
	//Remove double pairs
	sum = sum/2;
	
	end = clock();
	cpu_time_used = ((double) (end - start)) / CLOCKS_PER_SEC;
	printf("Solution: %d\n\n",sum);
	printf("Program completed in %.3f seconds.", cpu_time_used);
}