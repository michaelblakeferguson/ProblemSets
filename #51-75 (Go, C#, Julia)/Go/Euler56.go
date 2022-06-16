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

package main

import (
	"fmt"
	"time"
	"math/big"
)

func main() {
	start := time.Now()
	a := big.NewInt(0)
	b := big.NewInt(0)
	c := big.NewInt(0)
	m := big.NewInt(0)

	var solution = 0
	var str = ""
	var total = 0

	for i := 1; i < 100; i++ {
		a.SetUint64(uint64(i))
		for j := 1; j < 100; j++ {
			b.SetUint64(uint64(j))
			c.Exp(a, b, m)
			str = c.Text(10)

			for w := 0; w < len(str); w++ {
				total = total + int(str[w]) - 48 //subtract 48 for ASCII code
			}
		
			if total > solution {
				solution = total
			}
			total = 0
		}
	}
	duration := time.Since(start)
	fmt.Println("Solution: ", solution)
	fmt.Println("\nProgram completed in ", duration, "milliseconds.")
}
