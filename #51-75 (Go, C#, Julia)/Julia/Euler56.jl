#####################################################################
## Euler 56 ~ Powerful digit sum
##
## Problem Statement:
## 
## A googol (10^100) is a massive number: one followed by one-hundred
## zeros; 100^100 is almost unimaginably large: one followed by
## two-hundred zeros. Despite their size, the sum of the digits
## in each number is only 1.
##
## Considering natural numbers of the form, ab, where a, b < 100,
## what is the maximum digital sum?
## 
#####################################################################


#####################################################################
## Algorithm Explanation:
## 
## Loops through 1 to 100 for both a & b, calculating a^b and then
## storing as a bigInt. Then converts to a string and adds up the
## digit at each index to find the total. Solution is set to the
## largest value found during this iteration.
##
#####################################################################

using BenchmarkTools

function main()
	solution = 0
	a = big"1"
	b = big"1"
	c = big"0"
	
	while a < 100
		while b < 100
			c = a^b
			s = string(c)
			total = 0
			for i in 1:length(s)
				total = total + Int(s[i]) - 48 
			end
			if total > solution
				solution = total
			end
			b = b + 1
		end
		b = 1
		a = a + 1
	end
	
	return solution
end

solution = main()
t = @elapsed main()
print("Solution: ", solution)
t = t * 1000;
print("\n\nProgram completed in ", round.(t; sigdigits=5), " milliseconds.")
