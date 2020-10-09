//Euler2 ~ Even Fibonacci numbers
import java.util.concurrent.TimeUnit;

public class Euler2
{
    public static void main(String[] args) throws InterruptedException
	{
		long startTime = System.nanoTime();
		
		int sum = 2;
		int f1 = 1;
		int f2 = 2;
		int f3 = 0;
		
		do
		{
			f3 = f1 + f2;
			f1 = f2;
			f2 = f3;
			
			if((f3%2)==0)
			{
				sum = sum + f3;
			}
		} while(f3<4000000);
		
		long endTime = System.nanoTime();
		long timeElapsed = endTime - startTime;
		System.out.println("Solution: " + sum + "\n");
		System.out.println("Program completed in " + timeElapsed/1000000000 + " seconds.");
    }
}