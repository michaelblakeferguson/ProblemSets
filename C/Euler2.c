//Euler2 ~ Even Fibonacci numbers
#include <time.h>
#include <stdio.h>

clock_t start, end;
double cpu_time_used;

int main()
{
	start = clock();
	
	int sum = 2;
	int f1 = 1;
	int f2 = 2;
	int f3 = 0;
	
	do
	{
		f3 = f1 + f2;
		f1 = f2;
		f2 = f3;
		
		if((f3%2)==0)
		{
			sum = sum + f3;
		}
	} while(f3 < 4000000);
		
	end = clock();
	cpu_time_used = ((double) (end - start)) / CLOCKS_PER_SEC;
	printf("Solution: %d\n\n", sum);
	printf("Program completed in %f seconds.", cpu_time_used);
}