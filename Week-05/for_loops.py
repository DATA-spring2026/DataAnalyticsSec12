# for loops

# for i in ['a', 'b', 'c']:
#     print(f'At this step, the loop value is {i}')

# for i in '123':
#     print(f'At this step, the iterator value is {i}')

# for i in range(1, 4):
#     print(f'At this step, the iterator value is {i}')



# grocery cart example
# groceries = ["apples", "peaches", "bread"]

# basket = []

# for i in groceries:
#     if i == "apples":
#         print("How about them apples")
#         basket.append(i)
#     # elif i == "peaches":
#     #     print("Don't forget peaches")
#     elif i == "bread":
#         print("Get that bread")
#         basket.append(i)
#     print("End loop")

# print(f'Grocery basket includes {basket}')


# grading check

grades = (78, 87, 64, 92, 82)

student_grades = {"bilbo":78, "sam":87, "pippin":64, "merry":92, "boromir":82}

for i in student_grades.values():
    if i > 90:
        print('A')
    elif i > 80:
        print('B')
    elif i > 70:
        print('C')
    else:
        print('D')

