from math import *
import os

arg = ' '.join(os.sys.argv[1:]) if len(os.sys.argv) > 1 else input('> ')
arg = arg.replace('^', '**')

with open('calc_output.txt', 'w') as f:
    f.write("ERROR")

args = arg.split(';')

current = None

for arg in args:
    current_arg = str(current) + arg if current != None else arg
    current = eval(current_arg)

with open('calc_output.txt', 'w') as f:
    f.write(str(current))
