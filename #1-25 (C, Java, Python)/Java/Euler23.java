//Euler23 ~ Non-abundant sums
import java.util.concurrent.TimeUnit;

public class Euler23
{
    public static void main(String[] args) throws InterruptedException
	{
		long startTime = System.nanoTime();
		
		//Find abundant numbers (6965 total)
		int[] abundants = new int[6965];
		int factorSum;
		int abundantNums = 0;
		for(int i = 12; i < 28123; i++)
		{
			factorSum = 1;
			for(int j = 2; j < i; j++)
			{
				if((i%j) == 0)
				{
					factorSum += j;
				}
			}
			if(factorSum > i)
			{
				abundants[abundantNums] = i;
				abundantNums++;
			}
		}
		
		//Add all combinations of 2 abundant numbers (6495^2 - values > 28123 = 24294132)
		int[] abundantSums = new int[24294132]; //This array includes duplicate values... really dumb
		int sumCount = 0;
		for(int x = 0; x < 6965; x++)
		{
			for(int y = 0; y < 6965; y++)
			{
				if((abundants[x] + abundants[y]) < 28123)
				{
					abundantSums[sumCount] = abundants[x] + abundants[y];
					sumCount++;
				}
			}
		}
		
		//Check if n is not in abundantSums and add to sum
		boolean found = false;
		int sum = 0;
		for(int n = 0; n < 28123; n++)
		{
			for(int z = 0; z < 24294132; z++)
			{
				if(n == abundantSums[z])
				{
					found = true;
					break;
				}
			}
			
			if(found == false)
			{
				sum += n;
			}
			else
			{
				found = false;
			}
		}
		
		long endTime = System.nanoTime();
		long timeElapsed = endTime - startTime;
		System.out.println("Solution: " + sum + "\n");
		System.out.println("Program completed in " + timeElapsed/1000000000 + " seconds.");
    }
}