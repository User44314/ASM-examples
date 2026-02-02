magicians = ['alice', 'david', 'carolina']
for magician in magicians:
    print(magician)


magicians2 = ['alice', 'david', 'carolina']
for magician2 in magicians2:
    print(f"{magician2.title()}, that was a great trick!")


#Using the range() Function
print("Using the range() Function")
for value in range(1, 5):  #range() function makes it easy to generate a series of numbers
    print(value)

#Using range() to Make a List of Numbers
print("Using range() to Make a List of Numbers")
numbers = list(range(1, 6)) #use list() to convert that same set of numbers into a list:
print(numbers)


#We can also use the range() function to tell Python to skip numbers in a
#given range.

even_numbers = list(range(2, 11, 2))
print(even_numbers) #[2, 4, 6, 8, 10]

squares = []
for value in range(1, 11):
    square = value ** 2
    squares.append(square)
print(squares)

#short variant
print("short variant")
squares2 = [value1**2 for value1 in range(1, 11)]
print(squares2)

digits = [1, 2, 3, 4, 5, 6, 7, 8, 9, 0]
print(min(digits))
print(max(digits))
print(sum(digits))


#Working with Part of a List
#Slicing a List
players = ['charles', 'martina', 'michael', 'florence', 'eli']
print(players)
print(players[0:3])
print(players[1:4])
print(players[:4])

#if we want to output the last three players on the roster, we can use the slice
#players[-3:]:

print(players[-3:])
#players = ['charles', 'martina', 'michael', 'florence', 'eli']
print("Here are the first three players on my team:")
for player in players[:3]:
    print(player.title())

#Copying a List
my_foods = ['pizza', 'falafel', 'carrot cake']
friend_foods = my_foods
#friend_foods = my_foods[:]
my_foods.append('cannoli')
friend_foods.append('ice cream')
print("My favorite foods are:")
print(my_foods)
print("\nMy friend's favorite foods are:")
print(friend_foods)


# a list of items that cannot change.
dimensions = (200, 50)
print(dimensions[0])
print(dimensions[1])
#loop
for dimension in dimensions:
    print(dimension)


dimensions1 = (200, 50)
print("Original dimensions:")
for dimension1 in dimensions1:
    print(dimension1)
dimensions1 = (400, 100)
print("\nModified dimensions:")
for dimension1 in dimensions1:
    print(dimension1)