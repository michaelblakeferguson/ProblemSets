//Euler19 ~ Counting Sundays
#include <time.h>
#include <stdio.h>

clock_t start, end;
double cpu_time_used;

int main()
{
	start = clock();
	
	int day = 3; //Jan 1st, 1901 is a Tuesday
	int sundays = 0;
	int month = 1;
	int monthDays = 1;
	int year = 1901;
	while(year <= 2000)
	{
		switch(month) //Case for each month
		{
			case 1:                   //January
				if(monthDays == 31) 
				{
					month++;
					monthDays = 0;
				}
				break;
			case 2:                                   //February
				if((year % 4 == 0) && (year != 1900)) //Leap days
				{
					if(monthDays == 29)
					{
						month++;
						monthDays = 0;
					}
				}
				else
				{
					if(monthDays == 28)
					{
						month++;
						monthDays = 0;
					}
				}
				break;
			case 3:                 //March
				if(monthDays == 31)
				{
					month++;
					monthDays = 0;
				}
				break;
			case 4:                //April
				if(monthDays == 30)
				{
					month++;
					monthDays = 0;
				}
				break;
			case 5:                 //May
				if(monthDays == 31)
				{
					month++;
					monthDays = 0;
				}
				break;
			case 6:                 //June
				if(monthDays == 30)
				{
					month++;
					monthDays = 0;
				}
				break;
			case 7:                 //July
				if(monthDays == 31)
				{
					month++;
					monthDays = 0;
				}
				break;
			case 8:                 //August
				if(monthDays == 31)
				{
					month++;
					monthDays = 0;
				}
				break;
			case 9:                 //September
				if(monthDays == 30)
				{
					month++;
					monthDays = 0;
				}
				break;
			case 10:                //October
				if(monthDays == 31)
				{
					month++;
					monthDays = 0;
				}
				break;
			case 11:                //November
				if(monthDays == 30)
				{
					month++;
					monthDays = 0;
				}
				break;
			case 12:                //December
				if(monthDays == 31)
				{
					month = 1;
					monthDays = 0;
					year++;
				}
				break;
		}
		
		if(day == 1 && monthDays == 1) //Sunday is 1st day of the week
		{
			sundays++;
		}
		
		if(day == 7)
		{
			day = 0;
		}
		day++;
		monthDays++;
	}
	
	end = clock();
	cpu_time_used = ((double) (end - start)) / CLOCKS_PER_SEC;
	printf("Solution: %d\n\n",sundays);
	printf("Program completed in %.3f seconds.", cpu_time_used);
}