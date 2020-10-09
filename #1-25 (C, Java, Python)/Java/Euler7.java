//Euler7 ~ 10001st prime
import java.util.concurrent.TimeUnit;

public class Euler7
{
    public static void main(String[] args) throws InterruptedException
	{
		long startTime = System.nanoTime();
		
		int  p = 0;
		long i = 2;
		do
		{
			if(primeCheck(i))
			{
				p++;
				if(p==10001)
				{
					break;
				}
			}
			i++;
		} while(true);
		
		long endTime = System.nanoTime();
		long timeElapsed = endTime - startTime;
		System.out.println("Solution: " + i + "\n");
		System.out.println("Program completed in " + timeElapsed/1000000000 + " seconds.");
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