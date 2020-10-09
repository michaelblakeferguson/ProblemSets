//EulerX ~ 10001st prime
#include <time.h>
#include <stdio.h>
#include <stdbool.h>

clock_t start, end;
double cpu_time_used;

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

int main()
{
	start = clock();
	
	int  p = 0;
	long i = 2;
	do
	{
		if(primeCheck(i))
		{
			p++;
			if(p==10001)
			{
				break;
			}
		}
		i++;
	} while(1);
	
	end = clock();
	cpu_time_used = ((double) (end - start)) / CLOCKS_PER_SEC;
	printf("Solution: %lu\n\n",i);
	printf("Program completed in %.3f seconds.", cpu_time_used);
}

