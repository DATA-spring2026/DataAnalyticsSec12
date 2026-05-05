# Import math library

import math


# Working with math functions

print("The result of my calculation, rounded to 2 decimal places, is " + str(round(3.4567, 2)))
print(type(round(3.4567, 2)))

print("The result of my calculation, rounded to 0 places, is " + str(round(3.4567)))
print(type(round(3.4567)))

print("The result of my calculation, rounded to 6 decimal places, is " + str(round(3.4567, 6)))
print(type(round(3.4567, 6)))

print("The result of my calculation is " + format(3.4567, ".2f"))
print(type(format(3.4567, ".2f")))

# print("The floor rounding result of my calculation is " + str(floor(3.4567, 2)))
# print(type(round(3.4567, 2)))

print("The result of my calculation using floor division is " + str(3.4567 // 1))
print(type(3.4567 // 1))


# Using math library

print(r"The result of my calculation is " + str(math.floor(3.4567)))
print(type(math.floor(3.4567)))

print("Pi rounded to 6 digits is " + str(round(math.pi, 6)))



# Playing with assignment operators

a = 1
print(a)

a += 2  # simplified way of typing a = a + 2
print(a) # should output 3

a += 2 * 3  # (2 * 3) happens first, then is added to a
print(a)


# Example of checking books out of a library

# Define the known

library_user = 0

# Simple checkout formula

library_user += 1 # first visit
library_user += 1 # second visit
library_user += 1 # third visit

print("Books checked out: " + str(library_user))



# Casting values

x = 1
y = 0
z = ''
zz = '1'
zzz = 'banana'

print(type(x))
print(type(y))
print(type(z))
print(type(zz))

print(bool(x))
print(bool(y))
print(bool(z))
print(bool(zz))

print(bool(1))
print(bool(0))

print("zz equals " + str(bool(zz)))
print("zzz equals " + str(bool(zzz)))