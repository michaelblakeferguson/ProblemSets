#####################################################################
## Euler 58 ~ Spiral primes
##
## Problem Statement:
## 
## Starting with 1 and spiralling anticlockwise in the following way,
## a square spiral with side length 7 is formed.
##
##             	 	    37 36 35 34 33 32 31
##						38 17 16 15 14 13 30
##						39 18  5  4  3 12 29
##						40 19  6  1  2 11 28
##						41 20  7  8  9 10 27
##						42 21 22 23 24 25 26
##						43 44 45 46 47 48 49
##
## It is interesting to note that the odd squares lie along the
## bottom right diagonal, but what is more interesting is that 8 out
## of the 13 numbers lying along both diagonals are prime; that is,
## a ratio of 8/13 ≈ 62%.
##
## If one complete new layer is wrapped around the spiral above, a
## square spiral with side length 9 will be formed. If this process
## is continued, what is the side length of the square spiral for
## which the ratio of primes along both diagonals first falls below
## 10%?
##
#####################################################################


#####################################################################
## Algorithm Explanation:
## 
## Each diagonal has a pattern by which they are incremented with
## an increasing interval, all of which are increased by 8 each
## iteration. Loops through each newly generated number for each
## diagonal checking if it is a prime. If the percentage of primes
## found to total numbers generated is less than 10% the loop ends.
## The solution is then found by subtracting the center value (1),
## dividing by 4 (4 diagonals) then multiplying by 2 and adding 1.
##
#####################################################################

using BenchmarkTools
using Primes

function main()
	solution = 0
	
	total = 5
	primesFound = 3
	percentage = 0.62
	
	a = [3,5,7,9]
	c = [10,12,14,16]
	
	while percentage > 0.1
		i = 1
		while i <= 4
			b = a[i] + c[i]
			c[i] = c[i] + 8
			a[i] = b
			if isprime(a[i])
				primesFound = primesFound + 1
			end
			
			total = total + 1
			i = i + 1
		end
		
		newtotal = total
		newprimes = primesFound
		percentage = newprimes/newtotal
	end
	
	solution = ((total-1)/4)*2 + 1
	
	return solution
end

solution = main()
t = @elapsed main()
print("Solution: ", solution)
t = t * 1000;
print("\n\nProgram completed in ", round.(t; sigdigits=5), " milliseconds.")
