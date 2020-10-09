#Euler12 ~ Highly divisible triangular number
import timeit
import math
start = timeit.default_timer()

largestD = 0
triangle = 0
i = 1
while [1]:
    divisors = 0
    triangle = triangle + i
    for j in range(1, int(math.sqrt(triangle))):
        if (triangle%j) == 0:
            divisors = divisors + 1
            if j != (triangle/j):
                divisors = divisors + 1
    
    if divisors > largestD:
        largestD = divisors
        
        if divisors >= 500:
            break;
    
    i = i + 1

stop = timeit.default_timer()
print("Solution: ",triangle,"\n")
print("Program completed in","{0:.3f}".format(stop - start), "seconds.")