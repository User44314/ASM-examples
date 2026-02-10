from pathlib import Path
import json


numbers = [2, 3, 5, 7, 11, 13]
path = Path('numbers.json')
contents = json.dumps(numbers)
path.write_text(contents)


#number reader

path = Path('numbers.json')
contents = path.read_text()
numbers = json.loads(contents)
print(numbers)


#remember_me.

username = input("What is your name? ")
path = Path('username.json')
contents = json.dumps(username)
path.write_text(contents)
print(f"We'll remember you when you come back, {username}!")



#greet_user
path = Path('username.json')
contents = path.read_text()
username = json.loads(contents)
print(f"Welcome back, {username}!")