# working with the list collection type

groceries = ['peanut butter', 'milk', 'eggs', 'fruits', 'tajin', 'cereal', 
             'bread', 'jelly', 'cheese', 'candy', 'chicken', 'beef', 'salmon', 'toilet paper']

print(groceries)

print(groceries[:10])
print(groceries[-5:])

print(len(groceries))

groceries.append("brussels sprouts")
print(groceries)

groceries.pop(-1)
groceries.append("cheesecake")
print(groceries)

groceries.insert(3, 'ramen')  # adds at a specific index position
print(groceries)

groceries.sort()  # sort the list items in place
print(groceries)

groceries.remove("beef")
print(groceries)

print(max(groceries))
print(min(groceries))

# list using numeric values

tues_sales = [12.37, 17, 4.38, 25.02]

print(tues_sales)

print(max(tues_sales))
print(min(tues_sales))
print(round(sum(tues_sales), 2))
print(len(tues_sales))


# back to working with strings in a list

print(groceries)
print(groceries[4])
print(groceries[4].upper())

print(groceries[4][-4:])