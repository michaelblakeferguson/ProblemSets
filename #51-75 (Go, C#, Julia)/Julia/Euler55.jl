#####################################################################
## Euler 55 ~ Lychrel numbers
##
## Problem Statement:
## 
## If we take 47, reverse and add, 47 + 74 = 121, which is
## palindromic.
##
## Not all numbers produce palindromes so quickly. For example,
## 
## 		349 + 943 = 1292
##		1292 + 2921 = 4213
##		4213 + 3124 = 7337
##
## That is, 349 took three iterations to arrive at a palindrome.
##
## Although no one has proved it yet, it is thought that some
## numbers, like 196, never produce a palindrome. A number that
## never forms a palindrome through the reverse and add process
## is called a Lychrel number. Due to the theoretical nature of
## these numbers, and for the purpose of this problem, we shall
## assume that a number is Lychrel until proven otherwise. In
## addition you are given that for every number below ten-thousand,
## it will either (i) become a palindrome in less than fifty
## iterations, or, (ii) no one, with all the computing power that
## exists, has managed so far to map it to a palindrome. In fact,
## 10677 is the first number to be shown to require over fifty
## iterations before producing a palindrome:
## 4668731596684224866951378664 (53 iterations, 28-digits).
## 
## Surprisingly, there are palindromic numbers that are themselves
## Lychrel numbers; the first example is 4994.
## 
## How many Lychrel numbers are there below ten-thousand?
## 
#####################################################################


#####################################################################
## Algorithm Explanation:
## 
## Loops n upwards to 10,000 checking if n + rev(n) is a palindrome
## and repeating up to the 50th addition. If a palindrome is not
## found then solution is incremented.
##
#####################################################################

using BenchmarkTools

function isPalindrome(s)
	if(length(s) > 1)
		s == reverse(s)
	else
		return 0
	end
end

function main()
	global solution = 0
	n = 1
	
	count = 0
	while (n < 10000)
		x = n
		while (count < 50)
			s = string(x)
			r = reverse(s)
			y = parse(BigInt,r)
			y = x + y
		
			if (isPalindrome(string(y)) > 0)
				break
			else
				count = count + 1
			end
			if(count == 50)
				global solution = solution + 1
				break
			end
			x = y
		end
		count = 0
		n = n + 1
	end
end

@elapsed begin
main()
end

#run @elapsed twice to ignore compilation overhead
t = @elapsed main()
print("Solution: ", solution)
t = t * 1000;
print("\n\nProgram completed in ", round.(t; sigdigits=5), " milliseconds.")
