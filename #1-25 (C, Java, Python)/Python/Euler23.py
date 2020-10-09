#Euler23 ~ Non-abundant sums
import timeit
from math import sqrt

start = timeit.default_timer()

max = 20162        #All nums above 20162 can be represented as 2 abundant nums
abundant = set()   #Sets cannot store duplicates
factorSum = max*[1]

sum = 0
for i in range(2, int(sqrt(max))+1): #Store squares
    factorSum[i*i] += i

for i in range(2, int(sqrt(max))+1): #Iterate and add
    for j in range(i+1, max//i):
        factorSum[i*j] += i+j

for n in range(1, max):              #Sum up total non-abundants
    if factorSum[n] > n:
        abundant.add(n)
    
    if not any((n-a in abundant) for a in abundant):
        sum += n
 
stop = timeit.default_timer()
print("Solution: ",sum,"\n")
print("Program completed in","{0:.3f}".format(stop - start), "seconds.")