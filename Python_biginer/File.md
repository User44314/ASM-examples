To add a tab to your text, use the character combination \t
To add a newline in a string, use the character combination \n

*** Python can look for extra whitespace on the right and left sides of a
string. To ensure that no whitespace exists at the right side of a string, use
the rstrip() method

the left side of a string using the lstrip() method


# Here’s how to generate a random number between 1 and 6:
>>> from random import randint
>>> randint(1, 6)



>>> from random import choice
>>> players = ['charles', 'martina', 'michael', 'florence', 'eli']
>>> first_up = choice(players)
>>> first_up
'florence'