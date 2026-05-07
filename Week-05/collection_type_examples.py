# Remember, this is a list:

veg_ls = ["carrot", "broccoli", "carrot"]

# This is a tuple

veg_t = ("carrot", "broccoli", "carrot")

print(veg_t)

# veg_t.append("pepper")  -- no append for tuples

print(veg_t[1])  # returns single value (in this case, a string)
print(veg_t[1:2])  # returns a range of values as a tuple

march_sales_nw = (
    ('empid', 'name', 'monthly_sales'),
    (1234, 'Joe Schmo', 125412.23),
    (2345, 'Betty Brink', 187654.11)
)


# Examples of unpacking

a, b, c = [1, 2, 3]

print(a)

veg1, veg2, _ = veg_t   # remember, veg_t = ("carrot", "broccoli", "carrot")

print(veg1)
print(veg2)
# print(_)  # we're not using this value, so the convention is to assign it to _

_, b, c = veg_t

print(b)
print(c)

lots_o_veg = ("carrot", "broccoli", "carrot", "carrot", "broccoli", "radish")

car, bro, _, _, _, rad = lots_o_veg

print()
print("Example of unpacking")
print(car)
print(bro)
print(rad)

# alt version not unpacking
# the long way
car2 = lots_o_veg[0]
bro2 = lots_o_veg[1]
rad2 = lots_o_veg[-1]

# print(car2)
# print(bro2)
# print(rad2)


x, y, *z = lots_o_veg   # asterisk lets us assign a list of remaining values to last variable

print()
print("Partially unpacking lots_o_veg with remaining values in a list")
print(x)
print(y)
print(z)


# adding a tuple to a tuple

veg_t = ("carrot", "broccoli", "carrot")
veg_t2 = ("broccoli", "carrot")

print("Adding a tuple to a tuple")
veg_t += veg_t2
print(veg_t)

# veg_t += 'lettuce'    -- won't work, can't concatenate a string to a tuple
veg_t += ('lettuce',)   # but can add a tuple of 1 item
print(veg_t)


# sets can only store unique (non-duplicate) values

lots_o_veg = ("carrot", "broccoli", "carrot", "carrot", "broccoli", "radish")

lots_o_veg = set(lots_o_veg)

print("After casting lots_o_veg tuple as a set")
print(lots_o_veg)


# guest list example using sets

guests = {"Tihitina", "Blake", "Luis O", "Dagmawi"}

seat1, seat2, seat3, seat4 = guests

print(seat1, seat2, seat3, seat4)


print("Blake" in guests)
print("Norma" not in guests)

guests.add("Alexus")

print(guests)

Luci_event_attendees = ["Lorah", "Corey", "Mohamed", "Luis O", "Alexus"]

guests.update(Luci_event_attendees)

print(guests)



# Working with dictionaries

print()
print("Dictionary time")

contact_bb = { 
    "name": "Bilbo Baggins", 
    "birthday": "1999-03-25", 
    "email": "bilbo.baggins@email.mail" 
    }

print(contact_bb)
print(contact_bb["name"])

exam_1 = {
    "baggins":.87, 
    "gamgee":.92, 
    "took":.78
    }

print(f"Score for Sam Gamgee: {exam_1['gamgee']}")

print(exam_1.keys())
print(exam_1.values())
print(exam_1.items())

print(type(exam_1.items()))

print(f"Score for Gandalf: {exam_1.get('gandalf', 'did not take exam')}")

exam_1["gandalf"] = .98  # adding a new key:value pair

print(exam_1.items())

exam_1.update({"baggins": .78})

print(exam_1.items())

exam_1.pop('took')

print(exam_1.items())

print('gandalf' in exam_1)
print('took' in exam_1)
print(0.78 in exam_1)    # returns false because .78 is a stored value belonging to 'baggins' key


 # nested collections

list_of_lists = [[1, 2, 3, 'a'], [2, 3, 4], [4, 5, 6, 7, 8]]
list_of_tuples = [(2, 3), ('a', 'b'), (veg1, veg2)]

print("first tuple", list_of_tuples[0])
print("first item from first tuple", list_of_tuples[0][0])

ut1, ut2, ut3 = list_of_tuples

print(ut1)