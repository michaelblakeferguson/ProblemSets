//Euler22 ~ Names scores
import java.util.*;
import java.io.File;
import java.io.FileNotFoundException;

public class Euler22
{
    public static void main(String args[])
	{
		long startTime = System.nanoTime();
		
        try
        {
			Scanner nameList = new Scanner(new File("names.txt")).useDelimiter("[\",]+");
			ArrayList<String> names = new ArrayList<String>();
			while (nameList.hasNext())
			{
				names.add(nameList.next());
			}
			Collections.sort(names); //Alphabetically sort names in the list
            
			int w, x, y;
			int z = 0;
			for(int i = 0; i <= names.size() - 1; i ++)
			{
				x = 0;
				String letters = names.get(i);
				for(int j = 0; j <= letters.length() - 1; j ++)
				{
					w = points(letters.charAt(j));
					x += w;
				}
				y = x * (i + 1);
				z += y;
            }
		   
			long endTime = System.nanoTime();
			long timeElapsed = endTime - startTime;
			System.out.println("Solution: " + z + "\n");
			System.out.println("Program completed in " + timeElapsed/1000000000 + " seconds.");
        }
        catch(FileNotFoundException err)
        {
           System.out.println("File names.txt must be in the same directory");
        }
    }
    
    public static int points(char l)
    {
        String letter = Character.toString(l);
        Map<String, Integer> p = new HashMap<String, Integer>();
        p.put("A", 1);
        p.put("B", 2);
        p.put("C", 3);
        p.put("D", 4);
        p.put("E", 5);
        p.put("F", 6);
        p.put("G", 7);
        p.put("H", 8);
        p.put("I", 9);
        p.put("J", 10);
        p.put("K", 11);
        p.put("L", 12);
        p.put("M", 13);
        p.put("N", 14);
        p.put("O", 15);
        p.put("P", 16);
        p.put("Q", 17);
        p.put("R", 18);
        p.put("S", 19);
        p.put("T", 20);
        p.put("U", 21);
        p.put("V", 22);
        p.put("W", 23);
        p.put("X", 24);
        p.put("Y", 25);
        p.put("Z", 26);
        
        int value = p.get(letter);
        return value;
    }
}