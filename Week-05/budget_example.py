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