#Euler1 ~ Multiples of 3 and 5
import timeit
start = timeit.default_timer()

sum = 0;
for x in range(0,1000):
    if (x%3 == 0) or (x%5 == 0):
        sum = sum + x;

stop = timeit.default_timer()
print("Solution: ",sum,"\n")
print("Program completed in","{0:.3f}".format(stop - start), "seconds.")