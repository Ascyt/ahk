from math import *
import os

full_arg = ' '.join(os.sys.argv[1:]) if len(os.sys.argv) > 1 else input('> ')

with open('calc_output.txt', 'w') as f:
    f.write("ERROR")

args = full_arg.split(';')

current = None

for arg in args:
    current_arg = (str(current) + arg if 'x' not in arg else arg.replace('x', str(current))) if current != None else arg
    current = eval(current_arg)

with open('calc_output.txt', 'w') as f:
    f.write(str(current))
