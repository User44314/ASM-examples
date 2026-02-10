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



# Test python code

install 
$ python -m pip install --upgrade pip
You can use this command to install many third-party packages:
$ python -m pip install --upgrade package_name

$ python -m pip install --user pytest
You can use this command to install many third-party packages:
$ python -m pip install --user package_name

powershell
    pip install pytest

start
    python -m pytest



This time, running pytest gives the following output:
$ pytest
========================= test session starts =========================
--snip--
1 test_name_function.py F [100%]  (The first item of note in the output is a single F, which tells us that one test failed)
2 ============================== FAILURES ===============================
3 ________________________ test_first_last_name _________________________
def test_first_last_name():
"""Do names like 'Janis Joplin' work?"""
4 > formatted_name = get_formatted_name('janis', 'joplin')
5 E TypeError: get_formatted_name() missing 1 required positional
argument: 'last
test_name_function.py:5: TypeError
======================= short test summary info =======================
FAILED test_name_function.py::test_first_last_name - TypeError:
get_formatted_name() missing 1 required positional argument: 'last'
========================== 1 failed in 0.04s ==========================