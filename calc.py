from math import *
import os

use_arg = len(os.sys.argv) > 1

full_arg = ' '.join(os.sys.argv[1:]) if use_arg else input('> ')
full_arg = full_arg.replace(' ', '')
full_arg = full_arg.replace('^', '**')

with open('calc_output.txt', 'w') as f:
    f.write("ERROR")

args = full_arg.split(';')

# 0.8'3 = 0.8333333333333333
new_args = []
for arg in args:
    pos = arg.find("'")
    if pos != -1:
        repeatArg = arg[pos+1:]
        repeatTimes = 18 // len(repeatArg)
        new_args.append(arg[:pos] + repeatArg * repeatTimes)
    else:
        new_args.append(arg)

args = new_args

current = None

for arg in args:
    current_arg = (str(current) + arg if 'x' not in arg else arg.replace('x', str(current))) if current != None else arg
    current = eval(current_arg)

with open('calc_output.txt', 'w') as f:
    f.write(str(current))

if not use_arg:
    print(current)  