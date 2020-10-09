//Euler14 ~ Longest Collatz sequence
import java.util.concurrent.TimeUnit;

public class Euler14
{
    public static void main(String[] args) throws InterruptedException
	{
		long startTime = System.nanoTime();
		
		long solution = 0;
		long num = 0;
		long length = 0;
		long largestL = 0;
		for(long i = 13; i < 1000000;  i++)
		{
			num = i;
			length = 1;
			do
			{	
				if((num%2) == 0)
				{
					num = num/2;
					length++;
				}
				else
				{
					num = 3*num + 1;
					length++;
				}
				
				if(num == 1)
				{
					break;
				}
			}while(true);
			
			if(length > largestL)
			{
				largestL = length;
				solution = i;
			}
		}
		
		long endTime = System.nanoTime();
		long timeElapsed = endTime - startTime;
		System.out.println("Solution: " + solution + "\n");
		System.out.println("Program completed in " + timeElapsed/1000000000 + " seconds.");
    }
}