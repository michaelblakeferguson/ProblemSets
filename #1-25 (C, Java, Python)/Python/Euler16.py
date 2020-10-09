#Euler16 ~ Power digit sum
import timeit
start = timeit.default_timer()

digit = 0
sum   = 0
power = pow(2,1000)
length = len(str(power))
while length > 1:
    digit = power % 10
    sum = sum + digit
    power = (power//10)
    length = len(str(power))

#Add last digit 1    
sum += 1

stop = timeit.default_timer()
print("Solution: ",sum,"\n")
print("Program completed in","{0:.3f}".format(stop - start), "seconds.")