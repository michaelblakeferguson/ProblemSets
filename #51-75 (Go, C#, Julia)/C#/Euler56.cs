/////////////////////////////////////////////////////////////////////
// Euler 56 ~ Powerful digit sum
//
// Problem Statement:
// 
// A googol (10^100) is a massive number: one followed by one-hundred
// zeros; 100^100 is almost unimaginably large: one followed by
// two-hundred zeros. Despite their size, the sum of the digits
// in each number is only 1.
//
// Considering natural numbers of the form, ab, where a, b < 100,
// what is the maximum digital sum?
// 
/////////////////////////////////////////////////////////////////////


/////////////////////////////////////////////////////////////////////
// Algorithm Explanation:
// 
// Loops through 1 to 100 for both a & b, calculating a^b and then
// storing as a bigInt. Then converts to a string and adds up the
// digit at each index to find the total. Solution is set to the
// largest value found during this iteration.
//
/////////////////////////////////////////////////////////////////////

using System;
using System.Diagnostics;
using System.Numerics;

namespace Euler56
{
    public class Euler56
    {
        public static void Main(string[] args)
        {
            Stopwatch stopwatch = new Stopwatch();
            stopwatch.Start();

            BigInteger a = 0;
            BigInteger c = 0;

            string s;
            int total = 0;
            int solution = 0;

            for (int i = 1; i < 100; i++)
            {
                a++;
                for (int j = 1; j < 100; j++)
                {
                    c = BigInteger.Pow(a,j);
                    s = c.ToString();
                    for (int k = 0; k < s.Length; k++)
                    {
                        total = total + s[k] - '0';
                    }
                    if (total > solution)
                    {
                        solution = total;
                    }
                    total = 0;
                }
                
            }
            Console.WriteLine("Solution: {0}\n", solution);
            Console.WriteLine("Program completed in {0} milliseconds.", stopwatch.ElapsedMilliseconds);
        }
    }
}
