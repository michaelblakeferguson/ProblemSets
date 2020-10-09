//Euler25 ~ 1000-digit Fibonacci number
import java.util.concurrent.TimeUnit;
import java.math.BigInteger;

public class Euler25
{
	public static void main(String[] args)
	{
		long startTime = System.nanoTime();
		
		BigInteger thousandDigits = new BigInteger("10").pow(999);
		BigInteger[] fibbonaci    = new BigInteger[3];
		fibbonaci[0] = BigInteger.ONE;
		fibbonaci[2] = BigInteger.ONE;
		
		int digits = 2;
		int i = 0;
		while(fibbonaci[i].compareTo(thousandDigits) < 0)
		{
			i = (i+1)%3;
			fibbonaci[i] = fibbonaci[(i+1)%3].add(fibbonaci[(i+2)%3]);
			digits++;
		}
		
		long endTime = System.nanoTime();
		long timeElapsed = endTime - startTime;
		System.out.println("Solution: " + digits + "\n");
		System.out.println("Program completed in " + timeElapsed/1000000000 + " seconds.");
	}
}