from pathlib import Path

path = Path('pi_digits.txt')

contents = path.read_text()
contents = contents.rstrip() #remove the extra blank line by using rstrip() on the contents string

contents = path.read_text().rstrip()

print(contents)

lines = contents.splitlines() #splitlines() method to turn a long string into a set of lines
for line in lines:
    print(line)


pi_string = ''
for line in lines:
    pi_string += line.lstrip()
print(pi_string)
print(len(pi_string))


path = Path('pi_million_digits.txt')
contents = path.read_text()
lines = contents.splitlines()
pi_string = ''
for line in lines:
    pi_string += line.lstrip()
print(f"{pi_string[:52]}...")
print(len(pi_string))


for line in lines:
    pi_string += line.strip()
birthday = input("Enter your birthday, in the form mmddyy: ")
if birthday in pi_string:
    print("Your birthday appears in the first million digits of pi!")
else:
    print("Your birthday does not appear in the first million digits of pi.")


#build the path 
""" path = Path('text_files/filename.txt') """
#Absolute paths 
""" path = Path('/home/eric/data_files/text_files/filename.txt')"""

