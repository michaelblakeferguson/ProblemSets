#####################################################################
## Euler 53 ~ Combinatoric selections
##
## Problem Statement:
## 
## There are exactly ten ways of selecting three from five, 12345:
##
##      123, 124, 125, 134, 135, 145, 234, 235, 245, and 345
##
## In combinatorics, we use the notation, (5) = 10
##                                        (3)
##								
## It is not until n = 23, that a value exceeds one-million:
##    
##                         (23) = 1144066
##                         (10)
##
## How many, not necessarily distinct, values of (n) for 1<=n<=100,
## are greater than one-million?                 (r)
##
#####################################################################


#####################################################################
## Algorithm Explanation:
## 
## Loops from 23 up to 100 checking the output of the combinatorics
## equation. If the result is greater than 1000000, then solution
## is incremented.
##
#####################################################################

using BenchmarkTools

function main()
	solution = 0

	n = 23
	while n <= 100
		r = 1
		while r < n
			c = factorial(big(n))/(factorial(big(r))*factorial(big(n-r)))
			if c > big(1000000)
				solution = solution + 1
			end
			r = r + 1
		end
		n = n + 1
	end
	
	return solution
end

solution = main()
t = @elapsed main()
print("Solution: ", solution)
t = t * 1000;
print("\n\nProgram completed in ", round.(t; sigdigits=5), " milliseconds.")
