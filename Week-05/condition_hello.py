# conditional logic example of a friendly greeting:
# What I want: I want a program that greets the user, and then the user replies
# and the program replies back again to the user

# first part of greeting

user_reply = input('Hello! (Enter "hi"): ')   # What if user enters HI or hi!!!!!!!


#if user_reply[0:2].lower() == 'hi':   # for the value of user_reply, we only want the first 2 characters, in lower case
if 'hi' in user_reply.lower():  # using in to check inside the string user_reply
    print("Nice to see you!")
else: 
    print("Harrumph. ")


# second part of greeting
user_reply2 = input('How are you? ')

positive_resp = ["fine", "good", "great", "wonderful", "ok", "okay", "alright"]

if user_reply2.lower().replace("!", '').replace(".","").replace(",", '') in positive_resp:
    print("That's good")
else:
    print("Lovely weather we're having")

# testing our string manipulation and the condition we want to use
# print(user_reply2.lower().replace("!", '').replace(".","").replace(",", ''))
# print(user_reply2.lower().replace("!", '').replace(".","").replace(",", '') in positive_resp)

# NOT example
# if user_reply != 'hi':
#     print("Sorry, what what that?")

# examples of alternative conditions
# if 'hi' in user_reply.lower():  # using in to check inside the string user_reply
#     print("Nice to see you!")
# elif user_reply == 'HI':
#     print("Nice to see you!")
# elif user_reply == "Hi!":
#         print("Nice to see you!")