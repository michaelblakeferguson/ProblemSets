//Euler10 ~ Summation of primes
import java.util.concurrent.TimeUnit;

public class Euler10
{
    public static void main(String[] args) throws InterruptedException
	{
		long startTime = System.nanoTime();
		
		long sum = 0;
		for(long i = 2; i < 2000000; i++)
		{
			if(primeCheck(i))
			{
				sum = sum + i;
			}
		}
		
		long endTime = System.nanoTime();
		long timeElapsed = endTime - startTime;
		System.out.println("Solution: " + sum + "\n");
		System.out.println("Program completed in " + timeElapsed/1000000000 + " seconds.");
    }
	
	//Very unoptimized implementation of primality test
	static boolean primeCheck(long n)
{	
	if(n <= 1)
	{
		return false;
	}
	if(n <= 3)
	{
		return true;
	}
	
	if(((n % 2) == 0) || ((n % 3) == 0))
	{
		return false;
	}
	
	int i = 5;
	while((i * i) <= n)
	{
		if(((n % i) == 0) || ((n % (i + 2)) == 0))
		{
			return false;
		}
		i = i + 6;
	}
	
	return true;
}
}