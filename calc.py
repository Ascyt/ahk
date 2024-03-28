from math import *
import os

arg = ' '.join(os.sys.argv[1:]) if len(os.sys.argv) > 1 else input('> ')

with open('calc_output.txt', 'w') as f:
    output = eval(arg)
    f.write(str(output))
