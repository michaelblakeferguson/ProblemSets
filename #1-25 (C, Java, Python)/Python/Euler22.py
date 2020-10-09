#Euler22 ~ Names scores 
import timeit
start = timeit.default_timer()

nameList = open("names.txt",'r')
names = sorted(nameList.read().replace('"','').split(','),key=str)

points =  {"A":1, \
           "B":2, \
           "C":3, \
           "D":4, \
           "E":5, \
           "F":6, \
           "G":7, \
           "H":8, \
           "I":9, \
           "J":10, \
           "K":11, \
           "L":12, \
           "M":13, \
           "N":14, \
           "O":15, \
           "P":16, \
           "Q":17, \
           "R":18, \
           "S":19, \
           "T":20, \
           "U":21, \
           "V":22, \
           "W":23, \
           "X":24, \
           "Y":25, \
           "Z":26}

sum = 0
for i,word in enumerate(names):
    p = 0
    for l in word:
        p += points[l]
    sum += p*(i+1) #Multiply points by index position & add to sum
    
stop = timeit.default_timer()
print("Solution: ",sum,"\n")
print("Program completed in","{0:.3f}".format(stop - start), "seconds.")