#Euler6 ~ Sum square difference
import timeit
start = timeit.default_timer()

sumx = 0
for i in range(1,101):
    sumx = sumx + pow(i, 2)
    
sumy = 0
for j in range(1,101):
    sumy = sumy + j    
sumy = pow(sumy,2)
diff = sumy - sumx


stop = timeit.default_timer()
print("Solution: ",diff,"\n")
print("Program completed in","{0:.3f}".format(stop - start), "seconds.")