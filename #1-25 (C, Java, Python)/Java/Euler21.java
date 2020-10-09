//Euler21 ~ Amicable numbers
import java.util.concurrent.TimeUnit;
import java.lang.Math;

public class Euler21
{
    public static void main(String[] args) throws InterruptedException
	{
		long startTime = System.nanoTime();
		
		int sumB;
		int b;
		int sum = 0;
		for(int a = 220; a < 10000; a++)
		{
			b = 1;
			sumB = 1;
			for (int i = 2; i <= Math.sqrt(a); i++)
			{
				if (a % i == 0)
				{
					b = b + i;
					b = b + a/i;
				}
			}
			
			for (int j = 2; j <= Math.sqrt(b); j++)
			{
				if (b % j == 0)
				{
					sumB = sumB + j;
					sumB = sumB + b/j;
				}
			}
			
			if((a == sumB) && (a != b))
			{
				sum = sum + a + b;
			}
		}
		
		//Remove double pairs
		sum = sum/2;
		
		long endTime = System.nanoTime();
		long timeElapsed = endTime - startTime;
		System.out.println("Solution: " + sum + "\n");
		System.out.println("Program completed in " + timeElapsed/1000000000 + " seconds.");
    }
}