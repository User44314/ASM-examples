message = input("Tell me something, and I will repeat it back to you: ")
print(message)


name = input("Please enter your name: ")
print(f"\nHello, {name}!")

#Sometimes you’ll want to write a prompt that’s longer than one line
prompt = "If you share your name, we can personalize the messages you see."
prompt += "\nWhat is your first name? "
name = input(prompt)
print(f"\nHello, {name}!")

age = input("How old are you? ")
age = int(age)
print(age >= 18)



height = input("How tall are you, in inches? ")
height = int(height)
if height >= 48:
    print("\nYou're tall enough to ride!")
else:
    print("\nYou'll be able to ride when you're a little older.")


#The Modulo Operator
print(4 % 3)
print(5 % 3)
print(6 % 3)
print(7 % 3)


number = input("Enter a number, and I'll tell you if it's even or odd: ")
number = int(number)
if number % 2 == 0:
    print(f"\nThe number {number} is even.")
else:
    print(f"\nThe number {number} is odd.")


current_number = 1
while current_number <= 5:
    print(current_number)
    current_number += 1


#Letting the User Choose When to Quit
prompt = "\nTell me something, and I will repeat it back to you:"
prompt += "\nEnter 'quit' to end the program. "
message = ""
while message != 'quit':
    message = input(prompt)
    print(message)



prompt1 = "\nTell me something, and I will repeat it back to you1:"
prompt1 += "\nEnter 'quit1' to end the program1. "

active = True
while active:
    message1 = input(prompt1)
    if message1 == 'quit1':
        active = False
    else:
        print(message1)

prompt2 = "\nTell me something, and I will repeat it back to you1:"
prompt2 += "\nEnter 'quit' to end the program2. "

while True:
    city = input(prompt2)
    if city == 'quit':
        break
    else:
        print(f"I'd love to go to {city.title()}!")


current_number1 = 0
while current_number1 < 10:
    current_number1 += 1
    if current_number1 % 2 == 0:
        continue
print(current_number1)   
#1 3 5 7 9


x = 1
while x <= 5:
    print(x)
    x += 1



# Start with users that need to be verified,
# and an empty list to hold confirmed users.
unconfirmed_users = ['alice', 'brian', 'candace']
confirmed_users = []
# Verify each user until there are no more unconfirmed users.
# Move each verified user into the list of confirmed users.
while unconfirmed_users:
    current_user = unconfirmed_users.pop()
    print(f"Verifying user: {current_user.title()}")
    confirmed_users.append(current_user)
# Display all confirmed users.
print("\nThe following users have been confirmed:")
for confirmed_user in confirmed_users:
    print(confirmed_user.title())


#Removing All Instances of Specific Values from a List
pets = ['dog', 'cat', 'dog', 'goldfish', 'cat', 'rabbit', 'cat']
print(pets)
while 'cat' in pets:
    pets.remove('cat')
print(pets)



responses = {}
# Set a flag to indicate that polling is active.
polling_active = True
while polling_active:
    # Prompt for the person's name and response.
    name1 = input("\nWhat is your name? ")
    response = input("Which mountain would you like to climb someday? ")
    # Store the response in the dictionary.
    responses[name1] = response
    # Find out if anyone else is going to take the poll.
    repeat = input("Would you like to let another person respond? (yes/ no) ")
    if repeat == 'no':
        polling_active = False
    # Polling is complete. Show the results.
print("\n--- Poll Results ---")
for name1, response in responses.items():
    print(f"{name1} would like to climb {response}.")