# Working with if / else

groceries = ["apple", "mango", "harissa"]

pantry = ['kumquat']

check_groc = input("Check for item in grocery list: ")

if check_groc in groceries:
    print("Yes, added to list")
elif check_groc in pantry:
    print("You already have this in the pantry")
else:
    groceries.append(check_groc)
    print(f'{check_groc} was added to the list')

print(f'Grocery list includes {groceries}')