//Euler1 ~ Multiples of 3 and 5
import java.util.concurrent.TimeUnit;

public class Euler1
{
    public static void main(String[] args) throws InterruptedException
	{
		long startTime = System.nanoTime();
		
		int sum = 0;
		for(int i = 0; i < 1000; i++)
		{
			if(((i%3)==0) || ((i%5)==0))
			{
				sum = sum + i;
			}
		}
		
		long endTime = System.nanoTime();
		long timeElapsed = endTime - startTime;
		System.out.println("Solution: " + sum + "\n");
		System.out.println("Program completed in " + timeElapsed/1000000000.0 + " seconds.");
    }
}