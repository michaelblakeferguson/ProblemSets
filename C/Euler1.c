//Euler1 ~ Multiples of 3 and 5
#include <time.h>
#include <stdio.h>

clock_t start, end;
double cpu_time_used;

int main()
{
	start = clock();
	
	int sum = 0;
	for(int i = 0; i < 1000; i++)
	{
		if(((i%3)==0) || ((i%5)==0))
		{
			sum = sum + i;
		}
	}
	
	end = clock();
	cpu_time_used = ((double) (end - start)) / CLOCKS_PER_SEC;
	
	printf("Solution: %d\n\n", sum);
	printf("Program completed in %f seconds.", cpu_time_used);
}