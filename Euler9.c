//Euler9 ~ Special Pythagorean triplet
#include <time.h>
#include <stdio.h>
#include <math.h>
#include <stdlib.h>

clock_t start, end;
double cpu_time_used;

int main()
{
	start = clock();
	
	double a;
	double b;
	double c;
	double product = 0;
	for(int i = 1; i < 998; i++)
	{
		for(int j = 1; j < 500; j++)
		{
			for(int k = 1; k < 500; k++)
			{
				if((i+j+k) == 1000)
				{
					a = pow(i,2);
					b = pow(j,2);
					c = pow(k,2);
					
					if((a+b) == c)
					{
						product = i*j*k;
						end = clock();
						cpu_time_used = ((double) (end - start)) / CLOCKS_PER_SEC;
						printf("Solution: %f\n\n",product);
						printf("Program completed in %.3f seconds.", cpu_time_used);
						exit(0);
					}
				}
			}
		}
	}
}