//Euler12 ~ Highly divisible triangular number
import java.util.concurrent.TimeUnit;
import java.lang.Math;

public class Euler12
{
    public static void main(String[] args) throws InterruptedException
	{
		long startTime = System.nanoTime();
		
		int largestD = 0;
		int triangle = 0;
		int divisors = 0;
		int i = 1;
		do
		{
			divisors = 0;
			triangle = triangle + i;
			for(int j = 1; j <= Math.sqrt(triangle); j++)
			{
				if((triangle % j) == 0)
				{
					divisors++;
					if(j != triangle/j)
					{
						divisors++;
					}
				}
			}
			if(divisors > largestD)
			{
				largestD = divisors;
				if(divisors >= 500)
				{
					break;
				}
			}
			i++;
		}
		while(true);
		
		long endTime = System.nanoTime();
		long timeElapsed = endTime - startTime;
		System.out.println("Solution: " + triangle + "\n");
		System.out.println("Program completed in " + timeElapsed/1000000000 + " seconds.");
    }
}