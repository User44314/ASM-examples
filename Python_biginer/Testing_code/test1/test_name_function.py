from name_function import get_formatted_name
# The name of a test file is important; it must start with test_.

def test_first_name():   # The name of a test file is important; it must start with test_.
    """do names like janis joplin work"""
    formatted_name = get_formatted_name('janis', 'joplin')
    assert formatted_name == 'janis joplin'


def test_first_last_middle_name():
    """Do names like 'Wolfgang Amadeus Mozart' work?"""
    formatted_name = get_formatted_name('wolfgang', 'mozart', 'amadeus')
    assert formatted_name == 'Wolfgang Amadeus Mozart'




""" $ pytest
========================= test session starts =========================
--snip--
test_name_function.py . [100%]
========================== 1 passed in 0.00s ========================== """