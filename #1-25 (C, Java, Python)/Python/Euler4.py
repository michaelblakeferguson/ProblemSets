#Euler4 ~ Largest palindrome product
import timeit
start = timeit.default_timer()

result  = ""
largest = 0
length  = 0
k       = 0
for i in range(1,1000):
    for j in range(1,1000):
        k = i*j
        result = str(k)
        length = len(result)
        
        if((length%2) == 0):
            s1 = result[0:length//2]
            s2 = result[length//2:length]
            s2 = s2[::-1]
            
            if(s1 == s2):
                if(k > largest):
                    largest = k
        else :
            if(length!= 1):
                s1 = result[0:length//2]
                s2 = result[(length//2+1):length]
                s2 = s2[::-1]
                
                if(s1 == s2):
                    if(k > largest):
                        largest = k
        
        
stop = timeit.default_timer()
print("Solution: ",largest,"\n")
print("Program completed in","{0:.3f}".format(stop - start), "seconds.")