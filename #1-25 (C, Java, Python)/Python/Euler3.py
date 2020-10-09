#Euler3 ~ Largest prime factor
import timeit
start = timeit.default_timer()

cpu_time     = 0
largestPrime = 1
val          = 600851475143

#Very unoptimized implementation of primality test
def is_prime_number(x):
    if x >= 2:
        for y in range(2,x):
            if not ( x % y ):
                return False
    else:
        return False
    return True

r = int(val/2)
for i in range(1,r):
    stop = timeit.default_timer()
    cpu_time = stop - start
    if(cpu_time > 60):
        print("Runtime has exceeded requirement.\n")
        print("Possible solution:",largestPrime,"\n")
        print("Program completed in",cpu_time,"seconds.")
        exit()
        
    if((val%i) == 0):
        if is_prime_number(i):
            largestPrime = i
            
            
#stop = timeit.default_timer()
# print("Solution: ","\n")
# print("Program completed in","{0:.3f}".format(stop - start), "seconds.")