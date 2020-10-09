//Euler10 ~ Summation of primes
#include <time.h>
#include <stdio.h>
#include <stdbool.h>

clock_t start, end;
double cpu_time_used;

//Very unoptimized implementation of primality test
bool primeCheck(long n)
{	
	if(n <= 1)
	{
		return 0;
	}
	if(n <= 3)
	{
		return 1;
	}
	
	if(((n % 2) == 0) || ((n % 3) == 0))
	{
		return 0;
	}
	
	int i = 5;
	while((i * i) <= n)
	{
		if(((n % i) == 0) || ((n % (i + 2)) == 0))
		{
			return 0;
		}
		i = i + 6;
	}
	
	return 1;
}

int main()
{
	start = clock();
	
	long sum = 0;
	for(long i = 2; i < 2000000; i++)
	{
		if(primeCheck(i))
		{
			sum = sum + i;
		}
	}
	
	end = clock();
	cpu_time_used = ((double) (end - start)) / CLOCKS_PER_SEC;
	printf("Solution: %ld\n\n",sum);
	printf("Program completed in %.3f seconds.", cpu_time_used);
}