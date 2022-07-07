/////////////////////////////////////////////////////////////////////
// Euler 63 ~ Powerful digit counts
//
// Problem Statement:
// 
// The 5-digit number, 16807 = 7^5, is also a fifth power.
// Similarly, the 9-digit number, 134217728 = 8^9, is a ninth power.
//
// How many n-digit positive integers exist which are also an nth
// power?
// 
/////////////////////////////////////////////////////////////////////


/////////////////////////////////////////////////////////////////////
// Algorithm Explanation:
// 
// Loops a,b upwards calculating a^b up to some limit for each of
// the nested loops. If the result's number of digits is equal to b
// then solution is incremented by 1.
//
/////////////////////////////////////////////////////////////////////

package main

import (
	"fmt"
	"time"
	"math/big"
)

func countDigits(p *big.Int) *big.Int {
	d := big.NewInt(0)
	ONE := big.NewInt(1)
	TEN := big.NewInt(10)
	
	for true {
		if (p.Cmp(TEN) < 0) {
			break
		}
		p.Div(p,TEN)
		d.Add(d,ONE)
	}
	d.Add(d,ONE)
	return d
}

func main() {
	start := time.Now()
	a := big.NewInt(1)
	b := big.NewInt(0)
	r := big.NewInt(0)
	m := big.NewInt(0)
	digits := big.NewInt(0)
	
	ONE := big.NewInt(1)
	TEN := big.NewInt(10)
	TWENTYTWO := big.NewInt(22)

	var solution = 0
	
	for true {
		if (a.Cmp(TEN) > 0) {
			break
		}
		b.SetUint64(1)
		for true {
			if (b.Cmp(TWENTYTWO) > 0) {
				break
			}
			r.Exp(a, b, m)
			digits.Set(countDigits(r))
			if digits.Cmp(b) == 0 {
				solution = solution + 1
			}
			b.Add(b,ONE)
		}
		a.Add(a,ONE)
	}
	
	duration := time.Since(start)
	fmt.Println("Solution: ", solution)
	fmt.Println("\nProgram completed in", duration)
}
