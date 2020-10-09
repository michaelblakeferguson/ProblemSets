#Euler21 ~ Amicable numbers
import timeit
import math
start = timeit.default_timer()

sum = 0
for a in range(220,10000):
    b = 1
    sumB = 1
    for i in range(2,int(math.sqrt(a))):
        if((a % i) == 0):
            b = b + i
            b = b + a//i

    for j in range(2,int(math.sqrt(b))):
        if((b % j) == 0):
            sumB = sumB + j
            sumB = sumB + b//j

    if((a == sumB) & (a != b)):
        sum = sum + a + b

#Remove double pairs
sum = sum//2

stop = timeit.default_timer()
print("Solution: ",sum,"\n")
print("Program completed in","{0:.3f}".format(stop - start), "seconds.")