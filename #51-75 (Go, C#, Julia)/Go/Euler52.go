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

package main

import (
	"fmt"
	"strconv"
	"time"
)

func isPerm(x int, y int) bool {
	var numZeroX = 0
	var numOneX = 0
	var numTwoX = 0
	var numThreeX = 0
	var numFourX = 0
	var numFiveX = 0
	var numSixX = 0
	var numSevenX = 0
	var numEightX = 0
	var numNineX = 0

	var numZeroY = 0
	var numOneY = 0
	var numTwoY = 0
	var numThreeY = 0
	var numFourY = 0
	var numFiveY = 0
	var numSixY = 0
	var numSevenY = 0
	var numEightY = 0
	var numNineY = 0

	var strX = strconv.Itoa(x)
	var strY = strconv.Itoa(y)

	for i := 0; i < len(strX); i++ { //count the number of each digit for X
		if strX[i] == '0' {
			numZeroX++
		}
		if strX[i] == '1' {
			numOneX++
		}
		if strX[i] == '2' {
			numTwoX++
		}
		if strX[i] == '3' {
			numThreeX++
		}
		if strX[i] == '4' {
			numFourX++
		}
		if strX[i] == '5' {
			numFiveX++
		}
		if strX[i] == '6' {
			numSixX++
		}
		if strX[i] == '7' {
			numSevenX++
		}
		if strX[i] == '8' {
			numEightX++
		}
		if strX[i] == '9' {
			numNineX++
		}
	}

	for i := 0; i < len(strX); i++ { //count the number of each digit for Y
		if strY[i] == '0' {
			numZeroY++
		}
		if strY[i] == '1' {
			numOneY++
		}
		if strY[i] == '2' {
			numTwoY++
		}
		if strY[i] == '3' {
			numThreeY++
		}
		if strY[i] == '4' {
			numFourY++
		}
		if strY[i] == '5' {
			numFiveY++
		}
		if strY[i] == '6' {
			numSixY++
		}
		if strY[i] == '7' {
			numSevenY++
		}
		if strY[i] == '8' {
			numEightY++
		}
		if strY[i] == '9' {
			numNineY++
		}
	}

	if (numZeroX == numZeroY) && (numOneX == numOneY) && (numTwoX == numTwoY) &&
		(numThreeX == numThreeY) && (numFourX == numFourY) && (numFiveX == numFiveY) &&
		(numSixX == numSixY) && (numSevenX == numSevenY) && (numEightX == numEightY) &&
		(numNineX) == (numNineY) {
		return true
	}
	return false
}

func twoXisPerm(p int) bool {
	if isPerm(p, 2*p) {
		return true
	}
	return false
}
func threeXisPerm(p int) bool {
	if isPerm(p, 3*p) {
		return true
	}
	return false
}
func fourXisPerm(p int) bool {
	if isPerm(p, 4*p) {
		return true
	}
	return false
}
func fiveXisPerm(p int) bool {
	if isPerm(p, 5*p) {
		return true
	}
	return false
}
func sixXisPerm(p int) bool {
	if isPerm(p, 6*p) {
		return true
	}
	return false
}

func main() {
	start := time.Now()
	var x = 125874
	for true {
		if twoXisPerm(x) && threeXisPerm(x) && fourXisPerm(x) && fiveXisPerm(x) && sixXisPerm(x) {
			fmt.Println("Solution: ", x)
			break
		}
		x++
	}
	duration := time.Since(start)
	fmt.Println("\nProgram completed in ", duration, "milliseconds.")
}
