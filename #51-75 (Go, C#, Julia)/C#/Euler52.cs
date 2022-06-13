/////////////////////////////////////////////////////////////////////
// Euler 52 ~ Permuted multiples
//
// Problem Statement:
// 
// It can be seen that the number, 125874, and its double, 251748,
// contain exactly the same digits, but in a different order.
// 
// Find the smallest positive integer, x, such that 2x, 3x, 4x, 5x,
// and 6x, contain the same digits.
// 
/////////////////////////////////////////////////////////////////////


/////////////////////////////////////////////////////////////////////
// Algorithm Explanation:
// 
// Iterates through values of x checking if it contains the same
// number of digits for each numeral in the 2x, 3x, 4x, 5x, & 6x
// cases.
//
/////////////////////////////////////////////////////////////////////

using System;
using System.Diagnostics;

namespace Euler52
{
    public class Euler52
    {
        static bool isPerm(int x, int y)
        {
            int numZeroX = 0;
            int numOneX = 0;
            int numTwoX = 0;
            int numThreeX = 0;
            int numFourX = 0;
            int numFiveX = 0;
            int numSixX = 0;
            int numSevenX = 0;
            int numEightX = 0;
            int numNineX = 0;

            int numZeroY = 0;
            int numOneY = 0;
            int numTwoY = 0;
            int numThreeY = 0;
            int numFourY = 0;
            int numFiveY = 0;
            int numSixY = 0;
            int numSevenY = 0;
            int numEightY = 0;
            int numNineY = 0;

            string strX = x.ToString();
            string strY = y.ToString();

            for (int i = 0; i < strX.Length; i++) //count the number of each digit for X
            {
                if (strX[i] == '0')
                {
                    numZeroX++;
                }
                if (strX[i] == '1')
                {
                    numOneX++;
                }
                if (strX[i] == '2')
                {
                    numTwoX++;
                }
                if (strX[i] == '3')
                {
                    numThreeX++;
                }
                if (strX[i] == '4')
                {
                    numFourX++;
                }
                if (strX[i] == '5')
                {
                    numFiveX++;
                }
                if (strX[i] == '6')
                {
                    numSixX++;
                }
                if (strX[i] == '7')
                {
                    numSevenX++;
                }
                if (strX[i] == '8')
                {
                    numEightX++;
                }
                if (strX[i] == '9')
                {
                    numNineX++;
                }
            }

            for (int i = 0; i < strY.Length; i++) //count the number of each digit for Y
            {
                if (strY[i] == '0')
                {
                    numZeroY++;
                }
                if (strY[i] == '1')
                {
                    numOneY++;
                }
                if (strY[i] == '2')
                {
                    numTwoY++;
                }
                if (strY[i] == '3')
                {
                    numThreeY++;
                }
                if (strY[i] == '4')
                {
                    numFourY++;
                }
                if (strY[i] == '5')
                {
                    numFiveY++;
                }
                if (strY[i] == '6')
                {
                    numSixY++;
                }
                if (strY[i] == '7')
                {
                    numSevenY++;
                }
                if (strY[i] == '8')
                {
                    numEightY++;
                }
                if (strY[i] == '9')
                {
                    numNineY++;
                }
            }

            if ((numZeroX == numZeroY) && (numOneX == numOneY) && (numTwoX == numTwoY) &&
               (numThreeX == numThreeY) && (numFourX == numFourY) && (numFiveX == numFiveY) &&
               (numSixX == numSixY) && (numSevenX == numSevenY) && (numEightX == numEightY) &&
               (numNineX) == (numNineY))
            {
                return true;
            }
            return false;
        }

        static bool twoXisPerm(int p)
        {
            if (isPerm(p, 2 * p))
            {
                return true;
            }
            return false;
        }
        static bool threeXisPerm(int p)
        {
            if (isPerm(p, 3 * p))
            {
                return true;
            }
            return false;
        }
        static bool fourXisPerm(int p)
        {
            if (isPerm(p, 4 * p))
            {
                return true;
            }
            return false;
        }
        static bool fiveXisPerm(int p)
        {
            if (isPerm(p, 5 * p))
            {
                return true;
            }
            return false;
        }
        static bool sixXisPerm(int p)
        {
            if (isPerm(p, 6 * p))
            {
                return true;
            }
            return false;
        }

        public static void Main(string[] args)
        {
            Stopwatch stopwatch = new Stopwatch();
            stopwatch.Start();

            int x = 125874;
            while (true)
            {
                if ((twoXisPerm(x)) && threeXisPerm(x) && fourXisPerm(x) && fiveXisPerm(x) &&
                   (sixXisPerm(x)))
                {
                    Console.WriteLine("Solution: {0}\n", x);
                    stopwatch.Stop();
                    break;
                }
                x++;
            }
            Console.WriteLine("Program completed in {0} milliseconds.", stopwatch.ElapsedMilliseconds);
        }
    }
}
