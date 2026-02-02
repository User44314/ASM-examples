name = "this text hi"
print(name.title())  #The title() method changes each word to title case, where each word
#begins with a capital letter. 
print(name.upper())
print(name.lower())


first_name = "ada33"
last_name = "lovelace33"
full_name = f"{first_name} {last_name}"  #strings are called f-strings. The f is for format, because Python
#formats the string by replacing the name of any variable in braces with its value
print(full_name)

print(f"Hello, {full_name}!")
print(f"Hello, {full_name.title()}!")

message1 = (f"Hello, {full_name.title()}!")
print(message1)

language = 'python '
print(language)
language1 = 'python '
language1.rstrip()
print(language1)


nostarch_url = 'https://nostarch.com'
newtext = nostarch_url.removeprefix('https://')
print(newtext)
