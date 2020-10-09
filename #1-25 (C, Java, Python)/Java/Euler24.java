//Euler24 ~ Lexicographic permutations
import java.util.ArrayList;
import java.util.Collections;
import java.util.concurrent.TimeUnit;

public class Euler24
{
	static ArrayList<Long> permutations = new ArrayList<Long>();

	public static void main(String args[])
	{
		long startTime = System.nanoTime();
		
		permutation("","0123456789");
		Collections.sort(permutations);
		long solution = permutations.get(1000000-1);

		long endTime = System.nanoTime();
		long timeElapsed = endTime - startTime;
		System.out.println("Solution: " + solution + "\n");
		System.out.println("Program completed in " + timeElapsed/1000000000 + " seconds.");		
	}

	//Use recursion to count all permutations
	public static void permutation(String prefix, String str)
	{
		int n = str.length();
		if (n == 0) 
		{
			permutations.add(Long.parseLong(prefix));
		}
		else
		{
			for (int i = 0; i < n; i++)
			{
				permutation(prefix + str.charAt(i), str.substring(0, i) + str.substring(i+1, n));
			}
		}
	}
}