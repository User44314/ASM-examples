bicycles = ['trek', 'cannondale', 'redline', 'specialized']
print(bicycles)
print(bicycles[0])
print(bicycles[2])
print(bicycles[3].title())

print(bicycles[-1])   #last items in list 'specialized'
print(bicycles[-2])   #'specialized'


message3 = f"My first bicycle was a {bicycles[0].title()}."
print(message3)

#Modifying Elements in a List
motorcycles = ['honda', 'yamaha', 'suzuki']
print(motorcycles)
motorcycles[0]='ducati'
print(motorcycles)  #['ducati', 'yamaha', 'suzuki']

#Adding Elements to a List
motorcycles1 = ['honda', 'yamaha', 'suzuki']
print(motorcycles1)
motorcycles1.append('ducati')
print(motorcycles1)

#The append() method makes it easy to build lists dynamically. For example,
#you can start with an empty list and then add items to the list using a series
#of append() calls. 

motorcycles2 = []
motorcycles2.append('hondaW')
motorcycles2.append('yamaha@')
motorcycles2.append('suzuki#')
print(motorcycles2) #['hondaW', 'yamaha@', 'suzuki#']

#Inserting Elements into a List
motorcycles3 = ['honda', 'yamaha', 'suzuki']
motorcycles3.insert(0, 'ducati')
print(motorcycles3)  #['ducati', 'honda', 'yamaha', 'suzuki']

#Removing an Item Using the del Statement
motorcycles4 = ['honda', 'yamaha', 'suzuki']
print(motorcycles4)
del motorcycles4[0]
print(motorcycles4) #['yamaha', 'suzuki']

#Removing an Item Using the pop()
print("Removing an Item Using the pop()")
motorcycles5 = ['honda', 'yamaha', 'suzuki']
print(motorcycles5)
popped_motorcycle = motorcycles5.pop()
print(motorcycles5)
print(popped_motorcycle)


motorcycles6 = ['honda', 'yamaha', 'suzuki']
last_owned = motorcycles6.pop()
print(f"The last motorcycle I owned was a {last_owned.title()}.")

#Popping Items from Any Position in a List
motorcycles7 = ['honda', 'yamaha', 'suzuki']
first_owned = motorcycles7.pop(0)
print(f"The first motorcycle I owned was a {first_owned.title()}.")

#Removing an Item by Value
motorcycles8 = ['honda', 'yamaha', 'suzuki', 'ducati']
print(motorcycles8)
motorcycles8.remove('ducati')
print(motorcycles8)

print("Removing an Item by Value")
motorcycles9 = ['honda', 'yamaha', 'suzuki', 'ducati']
print(motorcycles9)
too_expensive = 'ducati'
motorcycles9.remove(too_expensive)
print(motorcycles9)
print(f"\nA {too_expensive.title()} is too expensive for me.")

#Sorting a List Permanently with the sort() Method
print("Sorting a List Permanently with the sort() Method")
cars = ['bmw', 'audi', 'toyota', 'subaru']
cars.sort()
print(cars)

cars1 = ['bmw', 'audi', 'toyota', 'subaru']
cars1.sort(reverse=True) #sort this list in reverse-alphabetical 
print(cars1)

#Sorting a List Temporarily with the sorted() Function
cars2 = ['bmw1', 'audi1', 'toyota1', 'subaru1']
print("Here is the original list:")
print(cars2)
print("\nHere is the sorted list:")
print(sorted(cars2))
print("\nHere is the original list again:")
print(cars2)

#Printing a List in Reverse Order
cars3 = ['bmw', 'audi', 'toyota', 'subaru']
print(cars3)
cars.reverse()
print(cars3)

print("\nFinding the Length of a List")
cars4 = ['bmw', 'audi', 'toyota', 'subaru']
print(len(cars4))
