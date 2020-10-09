#Euler19 ~ Counting Sundays
import timeit

def switch(month):
    switcher = {
        1: January,
        2: February,
        3: March,
        4: April,
        5: May,
        6: June,
        7: July,
        8: August,
        9: September,
        10: October,
        11: November,
        12: December
    }
    func = switcher.get(month)
    func()

def January():
    global month, monthDays
    if (monthDays == 31):
        month += 1
        monthDays = 0
    
def February():
    global month, monthDays, year
    if (((year % 4) == 0) & ((year != 1900))): 
        if (monthDays == 29): #Leap days
            month += 1
            monthDays = 0
    else:
        if (monthDays == 28):
            month += 1
            monthDays = 0
    
def March():
    global month, monthDays
    if (monthDays == 31):
        month += 1
        monthDays = 0

def April():
    global month, monthDays
    if (monthDays == 30):
        month += 1
        monthDays = 0

def May():
    global month, monthDays
    if (monthDays == 31):
        month += 1
        monthDays = 0

def June():
    global month, monthDays
    if (monthDays == 30):
        month += 1
        monthDays = 0

def July():
    global month, monthDays
    if (monthDays == 31):
        month += 1
        monthDays = 0

def August():
    global month, monthDays
    if (monthDays == 31):
        month += 1
        monthDays = 0

def September():
    global month, monthDays
    if (monthDays == 30):
        month += 1
        monthDays = 0

def October():
    global month, monthDays
    if (monthDays == 31):
        month += 1
        monthDays = 0

def November():
    global month, monthDays
    if (monthDays == 30):
        month += 1
        monthDays = 0

def December():
    global month, monthDays, year
    if (monthDays == 31):
        month = 1
        monthDays = 0
        year += 1

start = timeit.default_timer()

day = 3 #Jan 1st, 1901 is a Tuesday
sundays = 0
month = 1
monthDays = 1
year = 1901

while (year <= 2000):
    switch(month)
    if ((day == 1) & (monthDays == 1)): #Sunday is 1st day of the week
        sundays += 1
    
    if (day == 7):
        day = 0
    
    day += 1
    monthDays += 1

stop = timeit.default_timer()
print("Solution: ",sundays,"\n")
print("Program completed in","{0:.3f}".format(stop - start), "seconds.")

    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    