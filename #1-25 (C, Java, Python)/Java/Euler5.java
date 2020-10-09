//Euler5 ~ Smallest multiple
import java.util.concurrent.TimeUnit;
import java.util.Scanner;
import java.lang.Math;

public class Euler5
{
    public static void main(String[] args) throws InterruptedException
	{
		long startTime = System.nanoTime();
		
		double[] primes = new double[]{2,3,5,7,11,13,17,19,23,29,31,37,41,43,47,53,59,61,67,71,73,79,83,89,97};
		
		Scanner s = new Scanner(System.in);
		System.out.println("Choose N < 100 to find LCM using Prime Factorization: ");
		String N = s.nextLine();
		
		double product = 1;
		double exp     = 0;
		double prime   = 0;
		double j       = 2;
		int i          = 0;
		while(true)
		{
			prime = primes[i];
			if(prime > Double.parseDouble(N))
			{
				break;
			}
			
			while(true)
			{
				exp = Math.pow(prime,j);
				if(exp > Double.parseDouble(N))
				{
					break;
				}
				j = j + 1;
			}
			product = product * Math.pow(prime,(j-1));
			i = i + 1;
			j = 2;
		}
		
		long endTime = System.nanoTime();
		long timeElapsed = endTime - startTime;
		System.out.printf("Solution: %.0f\n\n",product);
		System.out.println("Program completed in " + timeElapsed/1000000000 + " seconds.");
    }
}