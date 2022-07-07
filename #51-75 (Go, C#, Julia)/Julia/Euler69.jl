#####################################################################
## Euler 69 ~ Totient maximum
##
## Problem Statement:
## 
## Euler's Totient function, φ(n) [sometimes called the phi
## function], is used to determine the number of numbers less than n
## which are relatively prime to n. For example, as 1, 2, 4, 5, 7,
## and 8, are all less than nine and relatively prime to nine,
## φ(9)=6.
##
## It can be seen that n=6 produces a maximum n/φ(n) for n ≤ 10.
##
## Find the value of n ≤ 1,000,000 for which n/φ(n) is a maximum.
##
#####################################################################


#####################################################################
## Algorithm Explanation:
## 
## Uses the Primes.totient function to check the Euler totient of n.
## n/totient(n) is then found and compared to max. If it is greater
## then solution is set to n.
##
#####################################################################

using BenchmarkTools
using Primes

function main()
	solution = 0

	n = 1
	max = 0
	while n < 1000000
		r = (n/totient(n))::Float64
		if r > max
			max = r
			solution = n
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
