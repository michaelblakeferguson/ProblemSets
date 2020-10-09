//Euler9 ~ Special Pythagorean triplet
import java.util.concurrent.TimeUnit;

public class Euler9
{
    public static void main(String[] args) throws InterruptedException
	{
		long startTime = System.nanoTime();
		
		double a;
		double b;
		double c;
		double product = 0;
		for(int i = 1; i < 998; i++)
		{
			for(int j = 1; j < 500; j++)
			{
				for(int k = 1; k < 500; k++)
				{
					if(i+j+k == 1000)
					{
						a = Math.pow(i,2);
						b = Math.pow(j,2);
						c = Math.pow(k,2);
						
						if((a+b) == c)
						{
							product = i*j*k;
						}
					}
				}
			}
		}
		
		long endTime = System.nanoTime();
		long timeElapsed = endTime - startTime;
		System.out.printf("Solution: %.0f\n\n",product);
		System.out.println("Program completed in " + timeElapsed/1000000000 + " seconds.");
    }
}