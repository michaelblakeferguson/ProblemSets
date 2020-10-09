#Euler7 ~ 10001st prime
import timeit
start = timeit.default_timer()

#Very unoptimized implementation of primality test
def is_prime_number(x):
    if x >= 2:
        for y in range(2,x):
            if not ( x % y ):
                return False
    else:
        return False
    return True

p = 0
i = 2
while(1):
    if is_prime_number(i):
        p = p + 1
        if p == 10001:
            break
    i = i + 1

stop = timeit.default_timer()
print("Solution: ",i,"\n")
print("Program completed in","{0:.3f}".format(stop - start), "seconds.")