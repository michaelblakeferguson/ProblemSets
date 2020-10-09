#Euler2 ~ Even Fibonacci numbers
import timeit
start = timeit.default_timer()

s  = 2
f1 = 1
f2 = 2
f3 = 0

while f3 < 4000000:
    f3 = f1 + f2
    f1 = f2
    f2 = f3
    if((f3%2) == 0):
        s = s + f3

stop = timeit.default_timer()
print("Solution: ",s,"\n")
print("Program completed in","{0:.3f}".format(stop - start), "seconds.")