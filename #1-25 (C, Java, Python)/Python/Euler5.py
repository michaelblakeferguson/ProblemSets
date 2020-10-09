#Euler5 ~ Smallest multiple
import timeit
start = timeit.default_timer()

#List of primes < 100
primes = [2,3,5,7,11,13,17,19,23,29,31,37,41,43,47,53,59,61,67,71,73,79,83,89,97]

N = input("Choose N < 100 to find LCM using Prime Factorization: ") 

product = 1
i       = 0
j       = 2
while(1):
    if primes[i] > int(N):
        break
    
    while(1):
        exp = pow(primes[i],j)
        if exp > int(N):
            break
        j = j + 1
    
    product = product * pow(primes[i],j-1)
    i = i + 1
    j = 2

stop = timeit.default_timer()
print("Solution: ",product,"\n")
print("Program completed in","{0:.3f}".format(stop - start), "seconds.")