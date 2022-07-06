#####################################################################
## Euler 63 ~ Powerful digit counts
##
## Problem Statement:
## 
## The 5-digit number, 16807 = 7^5, is also a fifth power.
## Similarly, the 9-digit number, 134217728 = 8^9, is a ninth power.
##
## How many n-digit positive integers exist which are also an nth
## power?
## 
#####################################################################


#####################################################################
## Algorithm Explanation:
## 
## Loops a,b upwards calculating a^b up to some limit for each of
## the nested loops. If the result's number of digits is equal to b
## then solution is incremented by 1.
##
#####################################################################

using BenchmarkTools

function countDigits(p::BigInt)
	d = 0
	while p >= 10
		p = p/10
		d = d + 1
	end
	d = d + 1
	return d
end

function main()
	solution = 0

	a = 1
	while a < 10
		b = 1
		while b < 22
			r = big(a)^b
			digits = countDigits(r)
			if digits == big(b)
				solution = solution + 1
			end
			b = b + 1
		end
		a = a + 1
	end
	return solution
end

solution = main()
t = @elapsed main()
print("Solution: ", solution)
t = t * 1000;
print("\n\nProgram completed in ", round.(t; sigdigits=5), " milliseconds.")
