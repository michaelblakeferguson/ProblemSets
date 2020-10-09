//Euler3 ~ Largest prime factor 
/* Euler requirements limit runtime to 60s. Limiting the runtime
   to 60s provides the correct answer in this case, but for other
   values this may not be true. In those cases, a precompiled list of
   primes can be created, circumventing the prime check for all values
   less than N/2. Alternatively, a more robust primality test can
   be implemented.*/
import java.util.concurrent.TimeUnit;

public class Euler3
{
    public static void main(String[] args) throws InterruptedException
	{
		long startTime    = System.nanoTime();
		long endTime      = 0;
		long timeElapsed  = 0;
		long runTime      = 0;
		long largestPrime = 1;
		long val          = 600851475143L;
		
		for(long i = 1; i < val/2; i++)
		{	
			if(runTime >= 60)
			{
				System.out.println("Runtime has exceeded requirement.\n");
				System.out.println("Possible solution: " + largestPrime + "\n");
				System.out.println("Program completed in " + timeElapsed/1000000000.0 + " seconds.");
				return;
			}
			
			if((val%i)==0)
			{
				if(primeCheck(i))
				{
					largestPrime = i;
				}
			}
			endTime = System.nanoTime();
			timeElapsed = endTime - startTime;
			runTime = timeElapsed/1000000000;
		}
		
		/* endTime = System.nanoTime();
		timeElapsed = endTime - startTime;
		System.out.println("Solution: " + largestPrime + "\n");
		System.out.println("Program completed in " + timeElapsed/1000000000.0 + " seconds."); */
    }
	
	//Very unoptimized implementation of primality test
	static boolean primeCheck(long n)
	{	
		for(long j = 2; j <= (n-1); j++)
		{
			if((n%j)==0)
			{
				return false;
			}
		}
		return true;
	}
}

