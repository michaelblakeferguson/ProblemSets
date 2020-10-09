#Euler9 ~ Special Pythagorean triplet
import timeit
start = timeit.default_timer()

a = 1
b = 1
c = 1
product = 0
for i in range(1,999):
    for j in range(1,500):
        for k in range(1,500):
            if((i+j+k) == 1000):
                a = pow(i,2)
                b = pow(j,2)
                c = pow(k,2)
                
                if((a+b) == c):
                    product = i*j*k
                    stop = timeit.default_timer()
                    print("Solution: ",product,"\n")
                    print("Program completed in","{0:.3f}".format(stop - start), "seconds.")
                    exit()
                    

