#####################################################################
## Euler 71 ~ Ordered fractions
##
## Problem Statement:
## 
## Consider the fraction, n/d, where n and d are positive integers.
##
## If n<d and HCF(n,d)=1, it is called a reduced proper fraction.
##
## If we list the set of reduced proper fractions for d ≤ 8 in
## ascending order of size, we get:
##
## 1/8, 1/7, 1/6, 1/5, 1/4, 2/7, 1/3, 3/8, 2/5, 3/7, 1/2, 4/7, 3/5,
## 5/8, 2/3, 5/7, 3/4, 4/5, 5/6, 6/7, 7/8
##
## It can be seen that 2/5 is the fraction immediately to the left
## of 3/7.
##
## By listing the set of reduced proper fractions for d ≤ 1,000,000
## in ascending order of size, find the numerator of the fraction
## immediately to the left of 3/7.
##
#####################################################################


#####################################################################
## Algorithm Explanation:
## 
## Loops n/d starting at 1/1000000 checking if q < 3/7. Continues to
## test values setting maxQ to the largest of these values found.
## The lower limit is arbitrarily set to 999000.
##
#####################################################################

using BenchmarkTools

function main()
	solution = 0

	q = 0
	maxQ = 0.0
	d = 1000000
	while d > 999000
		n = 1
		while n < d
			q = n/d
			if q < (3/7)
				if q > maxQ
					maxQ = n/d
					solution = n
				end
			end
			n = n + 1
		end
		d = d - 1
	end
	
	return solution
end

solution = main()
t = @elapsed main()
print("Solution: ", solution)
t = t * 1000;
print("\n\nProgram completed in ", round.(t; sigdigits=5), " milliseconds.")
