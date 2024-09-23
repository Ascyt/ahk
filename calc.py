from math import *
import os
import traceback

recent_eval = 'None'

def get_result(line):
    global recent_eval

    args = line.split(';')

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

    ## Variables from clipboard.txt
    #with open('clipboard.txt', 'r') as f:
    #    clipboard_lines = f.read().splitlines()
#
    #for line in clipboard_lines:
    #    parts = line.split('\\:')
    #    if parts[0] == '\\-':
    #        parts[0] = '-'
#
    #    for i in range(len(args)):
    #        args[i] = args[i].replace('$$' + parts[0], parts[1])

    current = None

    # Calculate
    for arg in args:
        current_arg = (str(current) + arg if 'x' not in arg else arg.replace('x', str(current))) if current != None else arg
        global recent_eval
        recent_eval = current_arg

        current = eval(current_arg)
    
    return current

try: 
    use_arg = len(os.sys.argv) > 1

    full_arg = ' '.join(os.sys.argv[1:]) if use_arg else input('> ')

    full_arg.replace('\r', '')

    with open('calc_output.txt', 'w') as f:
        f.write("ERROR")

    variables = {}

    calculated_lines = []

    lines = full_arg.split('\n')

    for i in range(len(lines)):
        line = lines[i]

        if line.strip() == '':
            calculated_lines.append('')
            continue

        line = line.replace('\t', '')
        line = line.replace('\r', '')
        line = line.replace('\n', '')
        
        equals_index = line.find('=')
        # Find the first equals sign that is not part of a comparison
        while equals_index != -1 and equals_index < len(line)-1 and (line[equals_index+1] == '=' or (equals_index > 0 and line[equals_index-1] == '!')):
            equals_index = line.find('=', equals_index+2)
        line_with_whitespaces = line[:equals_index] if equals_index != -1 else line
        var_index = line.find('#')
        line_with_whitespaces = line_with_whitespaces[:var_index] if var_index != -1 else line_with_whitespaces

        line = line.replace(' ', '')
        
        line = line.replace('==', '`is`')
        line = line.replace('!=', '`isnot`')
        line = line.replace('||', ' or ')
        line = line.replace('&&', ' and ')
        line = line.replace('!', ' not ')
        line = line.replace('|', '')
        line = line.replace('&', '')
        line = line.replace('~', '')
        line = line.replace('^', '**')
        line = line.replace('`or`', '|')
        line = line.replace('`and`', '&')
        line = line.replace('`not`', '~')
        line = line.replace('`xor`', '^')

        equals_index = line.find('=')
        var_index = line.find('#')
        if var_index != -1:
            variable_name = line[var_index+1:]
            if variable_name.startswith('$'):
                variable_name = variable_name[1:]

            line = line[:var_index]

        if equals_index != -1:
            line = line[:equals_index]
        
        var_replaced_line = line
        for var in variables:
            var_replaced_line = var_replaced_line.replace('$' + var, str(variables[var]))

        calculated_line = get_result(var_replaced_line.replace('`is`', '==').replace('`isnot`', '!='))
        if (var_index != -1):
            variables[variable_name] = calculated_line

        if equals_index == -1 and var_index != -1:
            calculated_line = line_with_whitespaces.strip() + ' #' + variable_name
        else:
            if equals_index != -1:
                calculated_line = line_with_whitespaces.strip() + ' =' + str(calculated_line)
            if var_index != -1:
                calculated_line = str(calculated_line) + ' #' + variable_name 

        calculated_lines.append(str(calculated_line))
except Exception as e:
    full_exception = traceback.format_exc() + '\n' + 'Recent eval: \'' + str(recent_eval) + '\''

    with open('calc_output.txt', 'w') as f:
        f.write(full_exception)

    if not use_arg:
        print(e)  
    
    exit()

with open('calc_output.txt', 'w') as f:
    f.write('\n'.join(calculated_lines))

if not use_arg:
    print('\n'.join(calculated_lines))  