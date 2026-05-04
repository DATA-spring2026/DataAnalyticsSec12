# Budget calculator

# monthly budget

income = 3800

rent = 1800
utilities = 200
internet = 100   # includes internet + phone
groceries = 500
credit_card = 100

recurring_exp = rent + utilities + internet + groceries + credit_card

print("Monthly income: " + str(income))
print("Recurring expenses: " + str(recurring_exp))
print("Income after expenses: " + str(income - recurring_exp))

print()

print("Estimated annual income: " + str(income * 12))
# print("Estimated annual income: " + str(income) * 12)  --> if we cast income first, then multiply, we see different results

print("Estimated annual income: " + str(income * 12))


# testing out some conditional logic:

# print(income == 3800)

# a = 'apple'
# aa = 'Apple'

# print(a == aa) # checking for case sensitivity

# ctrl+c is the shortcut to break the running of a program