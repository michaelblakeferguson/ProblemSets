/////////////////////////////////////////////////////////////////////
// Euler 55 ~ Lychrel numbers
//
// Problem Statement:
// 
// If we take 47, reverse and add, 47 + 74 = 121, which is
// palindromic.
//
// Not all numbers produce palindromes so quickly. For example,
// 
// 		349 + 943 = 1292
//		1292 + 2921 = 4213
//		4213 + 3124 = 7337
//
// That is, 349 took three iterations to arrive at a palindrome.
//
// Although no one has proved it yet, it is thought that some
// numbers, like 196, never produce a palindrome. A number that
// never forms a palindrome through the reverse and add process
// is called a Lychrel number. Due to the theoretical nature of
// these numbers, and for the purpose of this problem, we shall
// assume that a number is Lychrel until proven otherwise. In
// addition you are given that for every number below ten-thousand,
// it will either (i) become a palindrome in less than fifty
// iterations, or, (ii) no one, with all the computing power that
// exists, has managed so far to map it to a palindrome. In fact,
// 10677 is the first number to be shown to require over fifty
// iterations before producing a palindrome:
// 4668731596684224866951378664 (53 iterations, 28-digits).
// 
// Surprisingly, there are palindromic numbers that are themselves
// Lychrel numbers; the first example is 4994.
// 
// How many Lychrel numbers are there below ten-thousand?
// 
/////////////////////////////////////////////////////////////////////


/////////////////////////////////////////////////////////////////////
// Algorithm Explanation:
// 
// Loops n upwards to 10,000 checking if n + rev(n) is a palindrome
// and repeating up to the 50th addition. If a palindrome is not
// found then solution is incremented.
//
/////////////////////////////////////////////////////////////////////

using System;
using System.Diagnostics;
using System.Numerics;

namespace Euler55
{
    public class Euler55
    {
        static bool isPalindrome(string str)
        {
            for (int i = 0; i < str.Length / 2; i++)
            {
                if (str[i] != str[str.Length - i - 1])
                {
                    return false;
                }
            }
            if(str.Length == 1)
            {
                return false;
            }
            return true;
        }

        static string Reverse(string Input)
        {
            char[] charArray = Input.ToCharArray();
            string reversedString = String.Empty;

            for (int i = charArray.Length - 1; i > -1; i--)
            {
                reversedString += charArray[i];
            }
            return reversedString;
        }

        public static void Main(string[] args)
        {
            Stopwatch stopwatch = new Stopwatch();
            stopwatch.Start();

            BigInteger n = 1;
            BigInteger x = 0;
            BigInteger y = 0;
            int count = 0;
            int solution = 0;
            while (n < 10000)
            {
                x = n;
                while (count < 50)
                {
                    y = x + BigInteger.Parse(Reverse(x.ToString()));
                    if (isPalindrome(y.ToString()))
                    {
                        break;
                    }
                    else
                    {
                        count++;
                    }

                    if(count == 50)
                    {
                        solution++;
                        break;
                    }
                    x = y;
                }

                count = 0;
                n++;
            }
            Console.WriteLine("Solution: {0}\n", solution);
            Console.WriteLine("Program completed in {0} milliseconds.", stopwatch.ElapsedMilliseconds);
        }
    }
}
