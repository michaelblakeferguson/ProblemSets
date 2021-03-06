//Euler17 ~ Number letter counts
import java.util.concurrent.TimeUnit;

public class Euler17
{
    public static void main(String[] args) throws InterruptedException
	{
		long startTime = System.nanoTime();
		
		int r1 = 39;         //1-10
		int r2 = 67;         //11-19
		int r3 = 6*10 + 36;  //20-29
		int r4 = 6*10 + 36;  //30-39
		int r5 = 5*10 + 36;  //40-49
		int r6 = 5*10 + 36;  //50-59
		int r7 = 5*10 + 36;  //60-69
		int r8 = 7*10 + 36;  //70-79
		int r9 = 6*10 + 36;  //80-89
		int r10 = 6*10 + 36; //90-99
		
		//100-199   "one hundred"  "and"              20,30,80,90   40,50,60      70        1-9
		int r11 = (3+7)*100 + (3)*99 + r1 + r2 + (6*10)*4 + (5*10)*3 + (7*10) + (36)*8;
		
		//200-299   "two hundred"  "and"              20,30,80,90   40,50,60      70        1-9
		int r12 = (3+7)*100 + (3)*99 + r1 + r2 + (6*10)*4 + (5*10)*3 + (7*10) + (36)*8;
		
		//300-399 "three hundred"  "and"              20,30,80,90   40,50,60      70        1-9
		int r13 = (5+7)*100 + (3)*99 + r1 + r2 + (6*10)*4 + (5*10)*3 + (7*10) + (36)*8;
		
		//400-499  "four hundred"  "and"              20,30,80,90   40,50,60      70        1-9
		int r14 = (4+7)*100 + (3)*99 + r1 + r2 + (6*10)*4 + (5*10)*3 + (7*10) + (36)*8;
		
		//500-599  "five hundred"  "and"              20,30,80,90   40,50,60      70        1-9
		int r15 = (4+7)*100 + (3)*99 + r1 + r2 + (6*10)*4 + (5*10)*3 + (7*10) + (36)*8;
		
		//600-699   "six hundred"  "and"              20,30,80,90   40,50,60      70        1-9
		int r16 = (3+7)*100 + (3)*99 + r1 + r2 + (6*10)*4 + (5*10)*3 + (7*10) + (36)*8;
		
		//700-799 "seven hundred"  "and"              20,30,80,90   40,50,60      70        1-9
		int r17 = (5+7)*100 + (3)*99 + r1 + r2 + (6*10)*4 + (5*10)*3 + (7*10) + (36)*8;
		
		//800-899 "eight hundred"  "and"              20,30,80,90   40,50,60      70        1-9
		int r18 = (5+7)*100 + (3)*99 + r1 + r2 + (6*10)*4 + (5*10)*3 + (7*10) + (36)*8;
		
		//900-999  "nine hundred"  "and"              20,30,80,90   40,50,60      70        1-9
		int r19 = (4+7)*100 + (3)*99 + r1 + r2 + (6*10)*4 + (5*10)*3 + (7*10) + (36)*8;
		
		int r20 = (3+8); //1000
		
		int solution = r1+r2+r3+r4+r5+r6+r7+r8+r9+r10+r11+r12+r13+r14+r15+r16+r17+r18+r19+r20;
		
		long endTime = System.nanoTime();
		long timeElapsed = endTime - startTime;
		System.out.println("Solution: " + solution + "\n");
		System.out.println("Program completed in " + timeElapsed/1000000000 + " seconds.");
    }
}