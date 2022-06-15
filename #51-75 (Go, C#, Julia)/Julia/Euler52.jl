#####################################################################
## Euler 52 ~ Permuted multiples
##
## Problem Statement:
## 
## It can be seen that the number, 125874, and its double, 251748,
## contain exactly the same digits, but in a different order.
## 
## Find the smallest positive integer, x, such that 2x, 3x, 4x, 5x,
## and 6x, contain the same digits.
## 
#####################################################################


#####################################################################
## Algorithm Explanation:
## 
## Iterates through values of x checking if it contains the same
## number of digits for each numeral in the 2x, 3x, 4x, 5x, & 6x
## cases.
##
#####################################################################

using BenchmarkTools

function isPerm(x::Int, y::Int)
	
	numZeroX = 0
	numOneX = 0
	numTwoX = 0
	numThreeX = 0
	numFourX = 0
	numFiveX = 0
	numSixX = 0
	numSevenX = 0
	numEightX = 0
	numNineX = 0
	
	numZeroY = 0
	numOneY = 0
	numTwoY = 0
	numThreeY = 0
	numFourY = 0
	numFiveY = 0
	numSixY = 0
	numSevenY = 0
	numEightY = 0
	numNineY = 0
	
	strX = string(x,10,6)
	strY = string(y,10,6)
	
	for i in 1:length(strX)
		if cmp(strX[i:i],"0") > 0
			numZeroX = numZeroX + 1
		end
		if cmp(strX[i:i],"1") > 0
			numOneX = numOneX + 1
		end
		if cmp(strX[i:i],"2") > 0
			numTwoX = numTwoX + 1
		end
		if cmp(strX[i:i],"3") > 0
			numThreeX = numThreeX + 1
		end
		if cmp(strX[i:i],"4") > 0
			numFourX = numFourX + 1
		end
		if cmp(strX[i:i],"5") > 0
			numFiveX = numFiveX + 1
		end
		if cmp(strX[i:i],"6") > 0
			numSixX = numSixX + 1
		end
		if cmp(strX[i:i],"7") > 0
			numSevenX = numSevenX + 1
		end
		if cmp(strX[i:i],"8") > 0
			numEightX = numEightX + 1
		end
		if cmp(strX[i:i],"9") > 0
			numNineX = numNineX + 1
		end
	end
	
	for i in 1:length(strY)
		if cmp(strY[i:i],"0") > 0
			numZeroY = numZeroY + 1
		end
		if cmp(strY[i:i],"1") > 0
			numOneY = numOneY + 1 
		end
		if cmp(strY[i:i],"2") > 0
			numTwoY = numTwoY + 1
		end
		if cmp(strY[i:i],"3") > 0
			numThreeY = numThreeY + 1
		end
		if cmp(strY[i:i],"4") > 0
			numFourY = numFourY + 1
		end
		if cmp(strY[i:i],"5") > 0
			numFiveY = numFiveY + 1
		end
		if cmp(strY[i:i],"6") > 0
			numSixY = numSixY + 1
		end
		if cmp(strY[i:i],"7") > 0
			numSevenY = numSevenY + 1
		end
		if cmp(strY[i:i],"8") > 0
			numEightY = numEightY + 1
		end
		if cmp(strY[i:i],"9") > 0
			numNineY = numNineY + 1
		end
	end
	
	if numOneX == numOneY && numTwoX == numTwoY && numThreeX == numThreeY && numFourX == numFourY && numFiveX == numFiveY && numSixX == numSixY && numSevenX == numSevenY && numEightX == numEightY && numNineX == numNineY
		return 1
	end
	return 0
end

function twoXisPerm(p::Int)
	if isPerm(p,2*p) > 0
		return 1
	end
	return 0
end

function threeXisPerm(p::Int)
	if isPerm(p,3*p) > 0
		return 1
	end
	return 0
end

function fourXisPerm(p::Int)
	if isPerm(p,4*p) > 0
		return 1
	end
	return 0
end

function fiveXisPerm(p::Int)
	if isPerm(p,5*p) > 0
		return 1
	end
	return 0
end

function sixXisPerm(p::Int)
	if isPerm(p,6*p) > 0
		return 1
	end
	return 0
end

function main()
	x = 125874
	solution = 0
	while true
		if ((twoXisPerm(x) > 0) && (threeXisPerm(x) > 0) && (fourXisPerm(x) > 0) && (fiveXisPerm(x) > 0) && (sixXisPerm(x) > 0))
			global solution = x
			break
		end
		x = x + 1
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
