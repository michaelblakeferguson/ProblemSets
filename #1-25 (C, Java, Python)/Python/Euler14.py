#Euler14 ~ Longest Collatz sequence
import timeit
start = timeit.default_timer()

solution = 0
num = 0
length = 0
largestL = 0

for i in range(13,1000000):
    num = i
    length = 1
    while[1]:
        if (num%2) == 0:
            num = num/2
            length += 1
        else:
            num = 3*num + 1
            length += 1
            
        if num == 1:
            break
    
    if length > largestL:
        largestL = length
        solution = i

stop = timeit.default_timer()
print("Solution: ",solution,"\n")
print("Program completed in","{0:.3f}".format(stop - start), "seconds.")