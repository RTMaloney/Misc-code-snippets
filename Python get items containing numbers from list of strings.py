# Given a mixed list of strings, with some items containing numbers/digits and some not, one way to return just those strings that contain a digit might be:

[x for x in my_list_of_strings if x[0].isdigit()]

# NOTE: this is just checking the first value in the string: [0], so this might be different depending on where you expect the digit/number to be within the string.
