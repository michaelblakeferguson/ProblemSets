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

package main

import (
	"fmt"
	"time"
	"math/big"
)

func isPalindrome(s string) bool {
	if reverse(s) == s && len(s) > 1 {
		return true
	}
	return false
}

func reverse(s string) string {
    r := make([]byte, len(s))
    for i := 0; i < len(s); i++ {
        r[i] = s[len(s)-1-i]
    }
    return string(r)
}

func main() {
	start := time.Now()
	var solution = 0
	
	var s string
	var count = 0
	
	ONE := big.NewInt(1)
	ZERO := big.NewInt(0)
	limit := big.NewInt(10000)
	n := big.NewInt(1)
	y := big.NewInt(1)
	x := big.NewInt(0)
		
	for n.Cmp(limit) < 1 {
		x.Add(n,ZERO)
		
		for count < 50 {
			s = x.String()
			s = reverse(s)
			y, ok := y.SetString(s,10)
			if ok {
				y.Add(x,y)
			}
			
			if isPalindrome(y.String()) {
				break
			} else {
				count = count + 1
			}
			
			if (count == 50) {
				solution = solution + 1
				break
			}
			x.Add(y,ZERO)
		}
		count = 0
		n.Add(n,ONE)
	}
	duration := time.Since(start)
	fmt.Println("Solution: ", solution)
	fmt.Println("\nProgram completed in ", duration, "milliseconds.")
}
