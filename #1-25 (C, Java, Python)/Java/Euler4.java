//Euler4 ~ Largest palindrome product
import java.util.concurrent.TimeUnit;
import java.lang.*;

public class Euler4
{
    public static void main(String[] args) throws InterruptedException
	{
		long startTime = System.nanoTime();
		
		String result = "0";
		int largest = 0;
		int length  = 0;
		int k       = 0;
		for(int i = 0; i <= 999; i++)
		{
			for(int j = 0; j <= 999; j++)
			{
				k             = i*j;
				result = Integer.toString(k);
				length        = result.length();
				
				if(length%2 == 0)
				{
					String s1 = result.substring(0,(length/2));
					String s2 = result.substring((length/2),length);
					s2 = new StringBuilder(s2).reverse().toString();
					
					if(s1.equals(s2))
					{
						if(k > largest)
						{
							largest = k;
						}
					}
					
				}
				else
				{
					if(length != 1)
					{
						String s1 = result.substring(0,(length/2));
						String s2 = result.substring((length/2+1),length);
						s2 = new StringBuilder(s2).reverse().toString();
						
						if(s1.equals(s2))
						{
							if(k > largest)
							{
								largest = k;
							}
						}
					}
				}
			}
		}

		long endTime = System.nanoTime();
		long timeElapsed = endTime - startTime;
		System.out.println("Solution: " + largest + "\n");
		System.out.println("Program completed in " + timeElapsed/1000000000 + " seconds.");
    }
}