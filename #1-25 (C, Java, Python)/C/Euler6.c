//Euler6 ~ Sum square difference
#include <time.h>
#include <stdio.h>
#include <math.h>

clock_t start, end;
double cpu_time_used;

int main()
{
	start = clock();
	
	double sumx = 0;
		for(int i = 1; i <= 100; i++)
		{
			sumx = sumx + pow(i, 2);
		}
		
		double sumy = 0;
		for(int j = 0; j <= 100; j++)
		{
			sumy = sumy + j;
		}
		sumy = pow(sumy, 2);
		
		double diff = sumy - sumx;
	
	end = clock();
	cpu_time_used = ((double) (end - start)) / CLOCKS_PER_SEC;
	printf("Solution: %f\n\n",diff);
	printf("Program completed in %.3f seconds.", cpu_time_used);
}