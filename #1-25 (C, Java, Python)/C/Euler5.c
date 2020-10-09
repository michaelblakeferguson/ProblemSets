//Euler5 ~ Smallest multiple
#include <time.h>
#include <stdio.h>
#include <math.h>

clock_t start, end;
double cpu_time_used;

int main()
{
	start = clock();
	
	double primes[25] = {2,3,5,7,11,13,17,19,23,29,31,37,41,43,47,53,59,61,67,71,73,79,83,89,97};
	
	printf("Choose N < 100 to find LCM using Prime Factorization: ");
	double N;
	scanf("%lf",&N);
	
	double product = 1;
	double exp     = 0;
	double prime   = 0;
	double j       = 2;
	int i          = 0;
	while(1)
	{
		prime = primes[i];
		if(prime > N)
		{
			break;
		}
		
		while(1)
		{
			exp = pow(prime,j);
			if(exp > N)
			{
				break;
			}
			j = j + 1;
		}
		product = product * pow(prime,(j-1));
		i = i + 1;
		j = 2;
	}
	
	end = clock();
	cpu_time_used = ((double) (end - start)) / CLOCKS_PER_SEC;
	printf("Solution: %.0lf\n\n",product);
	printf("Program completed in %.3f seconds.", cpu_time_used);
}