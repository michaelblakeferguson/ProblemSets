//Euler4 ~ Largest palindrome product
#include <time.h>
#include <stdio.h>
#include <string.h>

void reverse(char []);

clock_t start, end;
double cpu_time_used;

int main()
{
	start = clock();
	
	char result[7]; result[6] = '\0';
	char     s1[4]; s1[3]     = '\0'; 
	char     s2[4]; s2[3]     = '\0';
	int largest = 0;
	int length  = 0;
	int k       = 0;
	int x       = 0;
	int y       = 0;
	for(int i = 0; i <= 999; i++)
	{
		for(int j = 0; j <= 999; j++)
		{
			k = i*j;
			memset(&result[0], 0, sizeof(result));
			sprintf(result, "%d", k);
			length = strlen(result);
			
			if(length%2 == 0)
			{
				memset(&s1[0], 0, sizeof(s1));
				strncpy(s1, result, (length/2));
				
				memset(&s2[0], 0, sizeof(s2));
				for(x = (length/2), y = 0; x <= length; x++,y++)
				{
					s2[y] = result[x];
				}
				reverse(s2);
				
				if(strcmp(s1,s2) == 0)
				{
					if(k > largest)
					{
						largest = k;
					}
				}
			}
			else
			{
				if(length != 1)
				{
					memset(&s1[0], 0, sizeof(s1));
					strncpy(s1, result, (length/2));
				
					memset(&s2[0], 0, sizeof(s2));
					for(x = (length/2+1), y = 0; x <= length; x++,y++)
					{
						s2[y] = result[x];
					}
					reverse(s2);
					
					if(strcmp(s1,s2) == 0)
					{
						if(k > largest)
						{
							largest = k;
						}
					}
				}
			}
			
		}
	}
	
	end = clock();
	cpu_time_used = ((double) (end - start)) / CLOCKS_PER_SEC;
	printf("Solution: %d\n\n",largest);
	printf("Program completed in %.3f seconds.", cpu_time_used);
}

void reverse(char s[])
{
    int length = strlen(s) ;
    int c, i, j;

    for (i = 0, j = length - 1; i < j; i++, j--)
    {
        c = s[i];
        s[i] = s[j];
        s[j] = c;
    }
}