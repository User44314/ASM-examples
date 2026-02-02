alien_0 = {'color': 'green', 'points': 5}
print(alien_0['color'])
print(alien_0['points'])
new_points = alien_0['points']
print(f"\nYou just earned {new_points} points!")

alien_01 = {'color': 'green', 'points': 5}
print(alien_01)
alien_01['x_position'] = 0
alien_01['y_position'] = 25
print(alien_01)

#Starting with an Empty Dictionary
alien_02 = {}
alien_02['color'] = 'green'
alien_02['points'] = 5
print(alien_02)


#Modifying Values in a Dictionary
alien_03 = {'color': 'green'}
print(f"The alien is {alien_03['color']}.")
alien_03['color'] = 'yellow'
print(f"The alien is now {alien_03['color']}.")


alien_04 = {'x_position': 0, 'y_position': 25, 'speed': 'medium'}
print(f"Original position: {alien_04['x_position']}")
# Move the alien to the right.
# Determine how far to move the alien based on its current speed.
if alien_04['speed'] == 'slow':
    x_increment = 1
elif alien_04['speed'] == 'medium':
    x_increment = 2
else:
# This must be a fast alien.
    x_increment = 3
# The new position is the old position plus the increment.
alien_04['x_position'] = alien_04['x_position'] + x_increment
print(f"New position: {alien_04['x_position']}")


#Removing Key-Value Pairs
alien_05 = {'color': 'green', 'points': 5}
print(alien_05)
del alien_05['points']
print(alien_05)


favorite_languages = {
    'jen': 'python',
    'sarah': 'c',
    'edward': 'rust',
    'phil': 'python',
}

language = favorite_languages['sarah'].title()
print(f"Sarah's favorite language is {language}.")


alien_01 = {'color': 'green', 'speed': 'slow'}
point_value = alien_01.get('points', 'No point value assigned.')
print(point_value)


#Looping Through a Dictionary
user_0 = {
    'username': 'efermi',
    'first': 'enrico',
    'last': 'fermi',
}

for key, value in user_0.items():  # method items(), which returns a sequence of key-value pairs
    print(f"\nKey: {key}")
    print(f"Value: {value}")


#Looping Through All Key-Value Pairs
favorite_languages = {
    'jen': 'python',
    'sarah': 'c',
    'edward': 'rust',
    'phil': 'python',
}

for name, language in favorite_languages.items():
    print(f"{name.title()}'s favorite language is {language.title()}.")

#Looping Through All the Keys in a Dictionary
favorite_languages1 = {
    'jen': 'python',
    'sarah': 'c',
    'edward': 'rust',
    'phil': 'python',
}
for name in favorite_languages1.keys():
    print(name.title())

print("\n")
favorite_languages2 = {
    'jen': 'python',
    'sarah': 'c',
    'edward': 'rust',
    'phil': 'python',
}
friends = ['phil', 'sarah']
for name in favorite_languages2.keys():
    print(f"Hi {name.title()}.")
    if name in friends:
        language1 = favorite_languages2[name].title()
        print(f"\t{name.title()}, I see you love {language1}!")
    if 'erin' not in favorite_languages.keys():
        print("Erin, please take our poll!")
for name in sorted(favorite_languages.keys()):
    print(f"{name.title()}, thank you for taking the poll.")
print("The following languages have been mentioned:")
for language in favorite_languages.values():
    print(language.title())



#A List of Dictionaries
alien_00 = {'color': 'green', 'points': 5}
alien_11 = {'color': 'yellow', 'points': 10}
alien_22 = {'color': 'red', 'points': 15}
aliens = [alien_00, alien_11, alien_22]
for alien in aliens:
    print(alien)


# Make an empty list for storing aliens.
aliens = []
# Make 30 green aliens.
for alien_number in range(30):
    new_alien = {'color': 'green', 'points': 5, 'speed': 'slow'}
    aliens.append(new_alien)
for alien in aliens[:3]:
    if alien['color'] == 'green':
        alien['color'] = 'yellow'
        alien['speed'] = 'medium'
        alien['points'] = 10
    elif alien['color'] == 'yellow':
        alien['color'] = 'red'
        alien['speed'] = 'fast'
        alien['points'] = 15
# Show the first 5 aliens.
for alien in aliens[:5]:
    print(alien)
print("...")
# Show how many aliens have been created.
print(f"Total number of aliens: {len(aliens)}")



#A List in a Dictionary
# Store information about a pizza being ordered.
pizza = {
    'crust': 'thick',
    'toppings': ['mushrooms', 'extra cheese'],
}
# Summarize the order.
print(f"You ordered a {pizza['crust']}-crust pizza "
"with the following toppings:")
for topping in pizza['toppings']:
    print(f"\t{topping}")



favorite_languages = {
    'jen': ['python', 'rust'],
    'sarah': ['c'],
    'edward': ['rust', 'go'],
    'phil': ['python', 'haskell'],
}
for name, languages in favorite_languages.items():
    print(f"\n{name.title()}'s favorite languages are:")
    for language in languages:
        print(f"\t{language.title()}")




#A Dictionary in a Dictionary
print("A Dictionary in a Dictionary")
users = {
    'aeinstein': {
        'first': 'albert',
        'last': 'einstein',
        'location': 'princeton',
    },
    'mcurie': {
        'first': 'marie',
        'last': 'curie',
        'location': 'paris',
    },
}
for username, user_info in users.items():
    print(f"\nUsername: {username}")
    full_name = f"{user_info['first']} {user_info['last']}"
    location = user_info['location']
    print(f"\tFull name: {full_name.title()}")
    print(f"\tLocation: {location.title()}")






