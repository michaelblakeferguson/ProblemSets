//Euler20 ~ Factorial digit sum
import java.util.concurrent.TimeUnit;
import java.math.BigInteger;

public class Euler20
{
    public static void main(String[] args) throws InterruptedException
	{
		long startTime = System.nanoTime();
		
		BigInteger digit = BigInteger.ZERO;
		BigInteger zero  = BigInteger.ZERO;
		BigInteger sum   = BigInteger.ZERO;
		BigInteger one   = BigInteger.ONE;
		BigInteger ten   = BigInteger.TEN;
		BigInteger factorial = new BigInteger("100");
		
		for(int i = 99; i > 0; i--)
		{
			factorial = factorial.multiply(BigInteger.valueOf(i));
		}
		
		while((factorial.compareTo(zero)) > 0)
		{
			digit = factorial.mod(ten);
			sum = sum.add(digit);
			factorial = factorial.divide(ten);
		}
		
		long endTime = System.nanoTime();
		long timeElapsed = endTime - startTime;
		System.out.println("Solution: " + sum + "\n");
		System.out.println("Program completed in " + timeElapsed/1000000000 + " seconds.");
    }
}