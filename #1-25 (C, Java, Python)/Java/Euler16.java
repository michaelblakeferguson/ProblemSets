//Euler16 ~ Power digit sum
import java.util.concurrent.TimeUnit;
import java.math.BigInteger;

public class Euler16
{
    public static void main(String[] args) throws InterruptedException
	{
		long startTime = System.nanoTime();
		
		BigInteger one   = BigInteger.ONE;
		BigInteger ten   = BigInteger.TEN;
		BigInteger digit = BigInteger.ZERO;
		BigInteger sum   = BigInteger.ZERO;
		BigInteger base   = BigInteger.TWO;
		
		BigInteger power = base.pow(1000);
		
		int length = power.toString().length();
		while(length > 1)
		{
			digit = power.mod(ten);
			sum = sum.add(digit);
			power = power.divide(ten);
			length = power.toString().length();
		}
		
		//Add last digit 1
		sum = sum.add(one);
		
		long endTime = System.nanoTime();
		long timeElapsed = endTime - startTime;
		System.out.println("Solution: " + sum + "\n");
		System.out.println("Program completed in " + timeElapsed/1000000000 + " seconds.");
    }
}