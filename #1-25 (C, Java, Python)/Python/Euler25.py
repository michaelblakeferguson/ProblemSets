#Euler25 ~ 1000-digit Fibonacci number
import timeit
start = timeit.default_timer()

fibonnaci = [1,1]
i = 2
while 1:
    next = fibonnaci[i-1] + fibonnaci[i-2]
    
    if(len(str(next)) == 1000):
        break
    else:
        fibonnaci.append(next)
    
    i += 1

solution = i + 1

stop = timeit.default_timer()
print("Solution: ",solution,"\n")
print("Program completed in","{0:.3f}".format(stop - start), "seconds.")