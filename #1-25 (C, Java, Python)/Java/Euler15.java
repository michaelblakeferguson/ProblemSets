//Euler15 ~ Lattice paths
import java.util.concurrent.TimeUnit;
import java.math.BigInteger;

public class Euler15
{
    public static void main(String[] args) throws InterruptedException
	{
		long startTime = System.nanoTime();
		
		//Lattice Paths of Cube N --> Central Binomial Coefficients: (2n)!/(n!)^2
		int cubeSize = 20;
		
		//Find the numerator value
		int factorialN = cubeSize*2;
		BigInteger numerator = new BigInteger("1");
		BigInteger iBig = new BigInteger("1");
		for(int i = 1;i <= factorialN; i++)
		{
			iBig = BigInteger.valueOf(i);
			numerator = numerator.multiply(iBig);
		}
		
		//Find the denominator value
		BigInteger denominator = new BigInteger("1");
		BigInteger jBig = new BigInteger("1");
		for(int j = 1;j <= cubeSize; j++)
		{
			jBig = BigInteger.valueOf(j);
			denominator = denominator.multiply(jBig);
		}
		denominator = denominator.multiply(denominator);
		
		//Find path count
		BigInteger solution = numerator.divide(denominator);
		
		long endTime = System.nanoTime();
		long timeElapsed = endTime - startTime;
		System.out.println("Solution: " + solution + "\n");
		System.out.println("Program completed in " + timeElapsed/1000000000 + " seconds.");
    }
}