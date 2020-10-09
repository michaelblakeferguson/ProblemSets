#Euler10 ~ Summation of primes
import timeit
start = timeit.default_timer()

def isPrime(n) : 
    if (n <= 1) : 
        return False
    if (n <= 3) : 
        return True
        
    if (n % 2 == 0 or n % 3 == 0) : 
        return False
  
    i = 5
    while(i * i <= n) : 
        if (n % i == 0 or n % (i + 2) == 0) : 
            return False
        i = i + 6
    return True

sum = 0
for i in range (2,200000):
    if(isPrime(i)):
        sum = sum + i

stop = timeit.default_timer()
print("Solution: ",sum,"\n")
print("Program completed in","{0:.3f}".format(stop - start), "seconds.")