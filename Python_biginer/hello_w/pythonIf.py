cars = ['audi', 'bmw', 'subaru', 'toyota']
for car in cars:
    if car == 'bmw':
        print(car.upper())
    else:
        print(car.title())


requested_topping = 'mushrooms'
if requested_topping != 'anchovies':
    print("Hold the anchovies!")

car = 'audi'
print(car == 'bmw') #false

requested_toppings1 = ['mushrooms', 'onions', 'pineapple']
print('mushrooms' in requested_toppings1) #true


banned_users = ['andrew', 'carolina', 'david']
user = 'marie'
if user not in banned_users:
    print(f"{user.title()}, you can post a response if you wish.")

car = 'subaru'
print("Is car == 'subaru'? I predict True.")
print(car == 'subaru')  #true
print("\nIs car == 'audi'? I predict False.")
print(car == 'audi')  #false


age = 12
if age < 4:
    print("Your admission cost is $0.")
elif age < 18:
    print("Your admission cost is $25.")
else:
    print("Your admission cost is $40.")


requested_toppings = ['mushrooms', 'extra cheese']
if 'mushrooms' in requested_toppings:
    print("Adding mushrooms.")
if 'pepperoni' in requested_toppings:
    print("Adding pepperoni.")
if 'extra cheese' in requested_toppings:
    print("Adding extra cheese.")
print("\nFinished making your pizza!")


requested_toppings = ['mushrooms', 'green peppers', 'extra cheese']
for requested_topping in requested_toppings:
    print(f"Adding {requested_topping}.")
print("\nFinished making your pizza!1")



available_toppings1 = ['mushrooms', 'olives', 'green_peppers', 'pepperoni', 'pineapple', 'extra_cheese']

requested_toppings1 = ['mushrooms', 'french_fries', 'extra_cheese']

for requested_topping1 in requested_toppings1:
    if requested_topping1 in available_toppings1:
        print(f"Adding {requested_topping1}.")
    else:
        print(f"Sorry, we don't have {requested_topping1}.")
print("\nFinished making your pizza!2")