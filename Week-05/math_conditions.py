# Calculate a letter grade for an exam score

points_possible = 85

raw_score = int(input("Student score (raw points): "))

score = raw_score / points_possible

print(f'Raw percent score, unformatted: {score}')
print(f'Percentage score is {score:.0%}')

if score >= .90: 
    grade = 'A' 
elif score >= .80: 
    grade = 'B' 
elif score >= .70: 
    grade = 'C' 
elif score >= .60: 
    grade = 'D'
else: 
    grade = 'F'

print(f'Student exam grade is {grade}')

# this order will return incorrect / unexpected results b/c first condition is overly inclusive
# if score >= .60: 
#     grade = 'D' 
# elif score >= .70: 
#     grade = 'C' 
# elif score >= .80: 
#     grade = 'B' 
# elif score >= .90: 
#     grade = 'A'
# else: 
#     grade = 'F'






# Alternative version of script using match case

import math

points_possible = 85

raw_score = int(input("Student score (raw points): "))

score = raw_score / points_possible

print(f'Raw percent score, unformatted: {score}')
print(f'Percentage score is {score:.0%}')

score = math.floor(score * 10)
print(f'Score is greater than or equal to {score * 10}')

match score:
    case 9: 
        grade = 'A' 
    case 8: 
        grade = 'B' 
    case 7: 
        grade = 'C' 
    case 6: 
        grade = 'D'
    case other: 
        grade = 'F'

print(f'Student exam grade is {grade}')