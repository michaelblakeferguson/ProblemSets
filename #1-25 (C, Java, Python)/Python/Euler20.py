#Euler20 ~ Factorial digit sum
import timeit
start = timeit.default_timer()

factorial = 100
for i in range(99,0,-1):
    factorial = factorial*i

sum = 0
while factorial > 0:
    digit = factorial % 10
    sum = sum + digit
    factorial = factorial // 10

stop = timeit.default_timer()
print("Solution: ",sum,"\n")
print("Program completed in","{0:.3f}".format(stop - start), "seconds.")