# Working with string indexing

name = "Peter Piper"

print(name[:5])
print(name[0:5])
print(len(name[0:5]))

print(name[6:11])
print(name[-5:])
print(name[-5:525])
print(len(name))

print(name[-5:10])
print(name[10:-5])

print(name[0])
print(name[1])
print(name[2])

print(name[-8])

name2 = "Mary Lamb"
print(name2[2:6])


# Working with .split()

fruits = "banana, apple, orange"

list_of_fruits = fruits.split()  # split at spaces by default
print(list_of_fruits)

list_of_fruits2 = fruits.split(", ")  # split by comma + space
print(list_of_fruits2)

list_of_fruits3 = fruits.split(",")  # split by only comma
print(list_of_fruits3)

print(list_of_fruits2[0])
print(list_of_fruits2[0:2])

grandma_bday = "02/23/48"
print(grandma_bday)
grandma_bday_parts = grandma_bday.split("/")
print(grandma_bday_parts)
print(f"Grandma was born in month number {grandma_bday_parts[0]}") # using split method to break up string, then call from resulting list

print(f"Grandma was born on {grandma_bday[0:5]}") # using string indexing


# split does not modify original value

fruits = "banana, apple, orange"

print(fruits.split(", "))
print(fruits)

print(grandma_bday)
print(grandma_bday.split("/"))
print(grandma_bday)


# working with .strip()

list_of_fruits3 = fruits.split(",")  # split by only comma
print(list_of_fruits3)
print(list_of_fruits3[1])
print(list_of_fruits3[1].strip())


# working with .upper() and .lower()

print(fruits)
print(fruits.upper())  # upper case
print(fruits.lower())  # lower case
print(fruits.title())  # title case

sarcasm = "vErry intERestTING"
print(sarcasm.upper())
print(sarcasm.lower())
print(sarcasm.title())
print(sarcasm)

# working with .replace()

corrected_sarcasm = sarcasm.replace("rr", "r").replace("tt", "t").lower()
print(corrected_sarcasm)

# using replace to clean up currency strings to use as numeric values

receipt_total = "$1,234.56"

receipt_total = float(receipt_total.replace("$", '').replace(",", ''))

print(receipt_total)
print(type(receipt_total))



# string indexing

# 012345 - positive index
# 654321 - negative index
# abcdef

print('abcdef'[2])
print('abcdef'[-4])

print('abcdef'[2:5])


# row data example

customer_info = '"Jeff Blum", "55 Eagle Drive", "Chicago", "11/01/2025"'
customer_info = customer_info.split()
print(f'Customer since month {customer_info[-1][1:3]}')
