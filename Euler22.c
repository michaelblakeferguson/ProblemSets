//Euler22 ~ Names scores
#include <time.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define FILE_SIZE 46450 //Size in Bytes
#define TOTAL_NAMES 5163

clock_t start, end;
double cpu_time_used;

int main()
{
	start = clock();
	
    char * nameList = "names.txt";
	char * names[TOTAL_NAMES];
    char input[FILE_SIZE] = {'\0'};
    FILE * file = fopen(nameList, "r");

    if(file == NULL)
	{
		printf("File names.txt must be in the same directory");
		exit(0);
    }
    fread(input, FILE_SIZE, 1, file);
	fclose(file);

    int count = 0;
    char * name;
    name = strtok(input, ",");
    do
	{
		int length = strlen(name);
		names[count] = (char *) malloc(length * sizeof(char));
    
		name[length - 1] = '\0';          //Remove last quotation mark
		strcpy(names[count++], &name[1]); //Insert name and remove first quotation mark

    }while(name = strtok(NULL, ","));

    char * key;
    int i;
    for(int j = 1; j < TOTAL_NAMES; j++)
	{
        key = names[j];
        i = j - 1;
        while(i >= 0 && strcmp(names[i], key) > 0)
		{
            names[i + 1] = names[i];
            i--;
        }
        names[i + 1] = key;
    }

	int points;
    int sum = 0;
    for(int i = 0; i < TOTAL_NAMES; i++)
	{
		points = 0;
		for(int j = 0; j < strlen(names[i]); j++)
		{
			points += (names[i][j] - 64);
		}
		sum += points*(i+1);
    }

    end = clock();
	cpu_time_used = ((double) (end - start)) / CLOCKS_PER_SEC;
	printf("Solution: %d\n\n",sum);
	printf("Program completed in %.3f seconds.", cpu_time_used);
}