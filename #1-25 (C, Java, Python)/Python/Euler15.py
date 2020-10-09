#Euler15 ~ Lattice paths
import timeit
start = timeit.default_timer()

#Lattice Paths of Cube N --> Central Binomial Coefficients: (2n)!/(n!)^2
cubeSize = 20

#Find the numerator value
factorialN = cubeSize*2
numerator = 1
for i in range(1,(factorialN+1)):
    numerator = numerator*i
    
denominator = 1
for j in range(1,(cubeSize+1)):
    denominator = denominator*j

denominator = denominator*denominator

solution = numerator/denominator

stop = timeit.default_timer()
print("Solution: ",solution,"\n")
print("Program completed in","{0:.3f}".format(stop - start), "seconds.")