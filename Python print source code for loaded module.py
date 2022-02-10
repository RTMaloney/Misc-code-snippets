# This will allow you to locate and print out (in console) the source code of any imported module or function.
# See here for inspiration: https://stackoverflow.com/questions/6312495/edit-a-function-in-python-idle

from inspect import getsource

def helloworld():
    print('Hello, World!')

print( getsource(helloworld) )
