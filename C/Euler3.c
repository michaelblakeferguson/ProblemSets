//Euler3 ~ Largest prime factor
/* Euler requirements limit runtime to 60s. Limiting the runtime
   to 60s provides the correct answer in this case, but for other
   values this may not be true. In those cases, a precompiled list of
   primes can be created, circumventing the prime check for all values
   less than N/2. Alternatively, a more robust primality test can
   be implemented.*/
#include <time.h>
#include <stdio.h>
#include <stdbool.h>

clock_t start, end;
double cpu_time_used;

bool primeCheck(long n);

int main()
{
	start = clock();
	
	long val = 600851475143;
	long largestPrime = 1;
	
	for(long i = 1; i < val/2; i++)
	{
		end = clock();
		cpu_time_used = ((double) (end - start)) / CLOCKS_PER_SEC;
		if(cpu_time_used >= 60.0)
		{
			printf("Runtime has exceeded requirement.\n\n");
			printf("Possible solution: %lu\n\n", largestPrime);
			printf("Program completed in %f seconds.", cpu_time_used);
			return 0;
		}
		
		if((val%i)==0)
		{
			if(primeCheck(i))
			{
				largestPrime = i;
			}
		}
	}
	
	/* end = clock();
	cpu_time_used = ((double) (end - start)) / CLOCKS_PER_SEC;
	printf("Solution: %lu\n\n", largestPrime);
	printf("Program completed in %.3f seconds.", cpu_time_used); */
}

//Very unoptimized implementation of primality test
bool primeCheck(long n)
{	
	for(long j = 2; j <= n - 1; j++)
	{
		if((n%j)==0)
		{
			return 0;
		}
	}
	return 1;
}