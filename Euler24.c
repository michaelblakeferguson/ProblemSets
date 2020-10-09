//Euler24 ~ Lexicographic permutations
#include <time.h>
#include <stdio.h>

clock_t start, end;
double cpu_time_used;

int main(void)
{
	start = clock();
	
	int numbers[] = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9};
	int count = 1;
	
	while(count <= 1000000)
	{
		int i;
		int x = 0;
		for(i = 8; i >= 0; i--)
		{
			if(numbers[i] < numbers[i+1])
			{
				x = i;
				break;
			}
		}
	
		int y = 0;
		for(i=9;i>=0;i--)
		{
			if(numbers[x] < numbers[i])
			{
				y = i;
				break;
			}
		}
	
		int a = numbers[x];
		numbers[x] = numbers[y];
		numbers[y] = a;
	
		int reverse[9-(x)];
		for(i=9; i>= x+1; i--)
		{
			reverse[9-i] = numbers[i];
		}
	
		int j = x + 1;
		for(i=0; i<9-x; i++)
		{
			numbers[j] = reverse[i];
			j++;
		}
		count++;
	}
	
	end = clock();
	cpu_time_used = ((double) (end - start)) / CLOCKS_PER_SEC;
	
	printf("Solution: ");
	for(int loop = 0; loop < 10; loop++)
	{
		printf("%d", numbers[loop]);
	}
	printf("\n\nProgram completed in %.3f seconds.", cpu_time_used);
}