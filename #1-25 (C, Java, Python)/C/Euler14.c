//Euler14 ~ Longest Collatz sequence
#include <time.h>
#include <stdio.h>

clock_t start, end;
double cpu_time_used;

int main()
{
	start = clock();
	
	long solution = 0;
	long num = 0;
	long length = 0;
	long largestL = 0;
	for(long i = 13; i < 1000000;  i++)
	{
		num = i;
		length = 1;
		do
		{	
			if((num%2) == 0)
			{
				num = num/2;
				length++;
			}
			else
			{
				num = 3*num + 1;
				length++;
			}
			
			if(num == 1)
			{
				break;
			}
		}while(1);
		
		if(length > largestL)
		{
			largestL = length;
			solution = i;
		}
	}
	
	end = clock();
	cpu_time_used = ((double) (end - start)) / CLOCKS_PER_SEC;
	printf("Solution: %d\n\n",solution);
	printf("Program completed in %.3f seconds.", cpu_time_used);
}