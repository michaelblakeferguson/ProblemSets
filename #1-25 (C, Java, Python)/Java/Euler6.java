//Euler6 ~ Sum square difference
import java.util.concurrent.TimeUnit;
import java.lang.Math; 

public class Euler6
{
    public static void main(String[] args) throws InterruptedException
	{
		long startTime = System.nanoTime();
		
		double sumx = 0;
		for(int i = 1; i <= 100; i++)
		{
			sumx = sumx + Math.pow(i, 2);
		}
		
		double sumy = 0;
		for(int j = 0; j <= 100; j++)
		{
			sumy = sumy + j;
		}
		sumy = Math.pow(sumy, 2);
		
		double diff = sumy - sumx;
		
		long endTime = System.nanoTime();
		long timeElapsed = endTime - startTime;
		System.out.printf("Solution: %f\n\n",diff);
		System.out.println("Program completed in " + timeElapsed/1000000000 + " seconds.");
    }
}