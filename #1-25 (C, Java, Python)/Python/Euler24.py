#Euler24 ~ Lexicographic permutations
import timeit
from math import factorial

#Use recursion to count all permutations
def perm(n, s):
    if(len(s) == 1):
        return s
    
    q, r = divmod(n, factorial(len(s)-1))
    return s[q] + perm(r, s[:q] + s[q+1:])

start = timeit.default_timer()

solution = perm(999999, '0123456789') #Get 1 millionth permutation

stop = timeit.default_timer()
print("Solution: ",solution,"\n")
print("Program completed in","{0:.3f}".format(stop - start), "seconds.")