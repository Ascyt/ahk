from math import *
import os
import traceback

recent_eval = 'None'
recent_line = 0

def get_bracket_inside(line, index):
    start = index
    balance = 0
    for i in range(index, len(line)):
        if line[i] == '[':
            balance += 1
        elif line[i] == ']':
            balance -= 1
        if balance == 0:
            return line[start+1:i], i
    raise Exception('Bracket not closed')

def split_top_level_commas(line):
    parts = []
    current_part = ''
    balance = 0
    for c in line:
        if c == '[':
            balance +=1
            current_part += c
        elif c == ']':
            balance -=1
            current_part += c
        elif c == ',' and balance == 0:
            parts.append(current_part)
            current_part = ''
        else:
            current_part += c
    if current_part:
        parts.append(current_part)
    return parts

def get_bracket_parts_with_recursion(line):
    parts = split_top_level_commas(line)
    all_parts = []
    for part in parts:
        if '[' in part:
            # Need to expand further
            expanded_parts = expand_line(part)
            all_parts.extend(expanded_parts)
        elif ':' in part:
            # Process range
            start, end = part.split(':')
            start, end = int(start), int(end)
            if start > end:
                raise Exception('Start index is greater than end index')
            for j in range(start, end+1):
                all_parts.append(str(j))
        else:
            all_parts.append(part)
    return all_parts

def expand_line(line):
    if '[' not in line:
        return [line]
    index = line.index('[')
    inside, end_index = get_bracket_inside(line, index)
    parts = get_bracket_parts_with_recursion(inside)
    expanded_lines = []
    for part in parts:
        new_line = line[:index] + str(part) + line[end_index+1:]
        expanded_lines.extend(expand_line(new_line))
    return expanded_lines

#print(expand_line('$f([1:2,3])'))
#exit()

def get_result_single(line):
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

    current = None

    # Calculate
    for arg in args:
        current_arg = (str(current) + arg if 'x' not in arg else arg.replace('x', str(current))) if current != None else arg
        global recent_eval
        recent_eval = current_arg
        print('eval: ' + current_arg)

        current = eval(current_arg)
    
    return current

def get_full_line_result(line):
    global variables, functions

    if line.strip() == '' or line.startswith("@"):
        return line
    
    trimmed_line = line.strip()

    equals_index = trimmed_line.find('=')
    # Find the first equals sign that is not part of a comparison
    while equals_index != -1 and equals_index < len(trimmed_line)-1 and (trimmed_line[equals_index+1] == '=' or (equals_index > 0 and trimmed_line[equals_index-1] == '!')):
        equals_index = trimmed_line.find('=', equals_index+2)
    
    if equals_index != -1:
        trimmed_line = trimmed_line[:equals_index].strip()
    
    var_index = trimmed_line.find('#')

    if var_index != -1:
        variable_name = trimmed_line[var_index+1:]
        if variable_name.startswith('$'):
            variable_name = variable_name[1:]

        trimmed_line = trimmed_line[:var_index].strip()
    
    if var_index != -1 and ('(' in variable_name and variable_name.endswith(')')):
        # Function definition
        function_name = variable_name[:variable_name.find('(')]
        function_args = variable_name[len(function_name)+1:-1].replace(' ','').split(',')
        functions[function_name] = [trimmed_line.strip(), function_args]
        trimmed_line = trimmed_line.strip()
        return trimmed_line + ' #' + function_name + '(' + ', '.join(function_args) + ')'

    # Line calculation
    trimmed_line = trimmed_line.strip()
    expanded_lines = expand_line(trimmed_line)
    calculated_lines = []
    for expanded_line in expanded_lines:
        calculated_lines.append(get_line_result(expanded_line))

    final_result = str(calculated_lines) if len(calculated_lines) > 1 else calculated_lines[0]

    if var_index != -1:
        variables[variable_name] = final_result

    if equals_index != -1 and var_index != -1:
        return trimmed_line.strip() + ' #' + variable_name + ' =' + str(final_result)

    if equals_index != -1:
        return trimmed_line.strip() + ' =' + str(final_result)
    
    if var_index != -1:
        return str(trimmed_line) + ' #' + variable_name 
    
    return final_result


def get_line_result(line):
    global variables, functions

    line = line.replace('\t', '')
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

    var_replaced_line = line
    # Make sure longest item is first
    sorted_variables = dict(sorted(variables.items(), key=lambda item: len(item[0]), reverse=True))

    for var in sorted_variables:
        var_replaced_line = var_replaced_line.replace('$' + var, str(sorted_variables[var]))

    for func in functions:
        func_pos = None
        while func_pos != -1:
            func_pos = var_replaced_line.find('$' + func)
            if func_pos == -1:
                break
            arg_string = ''
            arg_parts = []
            in_arg = False
            index = -1
            end_pos = -1
            balance = 0
            for char in var_replaced_line[func_pos + len(func) + 1:]:
                index += 1
                if char == '(':
                    balance += 1
                    if balance > 1:
                        arg_string += char
                        continue
                    in_arg = True
                    continue
                if char == ')':
                    balance -= 1
                    if balance > 0:
                        arg_string += char
                        continue
                    in_arg = False
                    end_pos = func_pos + len(func) + 1 + index
                    break
                if in_arg:
                    if balance == 1 and char == ',':
                        arg_parts.append(arg_string)
                        arg_string = ''
                        continue
                    arg_string += char
                    continue
                if char != ' ':
                    break
            if end_pos == -1:
                raise Exception(f'Function call \'{func}\' is missing closing parenthesis')
            
            arg_parts.append(arg_string)
            arg_parts = [arg.strip() for arg in arg_parts]
            arg_parts = [f'({arg})' for arg in arg_parts]
            arg_names = functions[func][1]
            func_body = functions[func][0]
            for i in range(len(arg_parts)):
                func_body = func_body.replace('$' + arg_names[i], arg_parts[i])
            calculated_func = get_line_result(func_body)
            var_replaced_line = var_replaced_line[:func_pos] + str(calculated_func) + var_replaced_line[end_pos + 1:]
        
    var_replaced_line = var_replaced_line.replace('`is`', '==').replace('`isnot`', '!=')

    return get_result_single(var_replaced_line)

try: 
    use_arg = len(os.sys.argv) > 1

    full_arg = ' '.join(os.sys.argv[1:]) if use_arg else input('> ').replace('\\n', '\n')

    full_arg.replace('\r', '')

    with open('calc_output.txt', 'w') as f:
        f.write("ERROR")

    variables = {}
    functions = {
        #'square': ['$x*$x',['x']],
        #'f': ['$x^2',['x']],
    }

    calculated_lines = []

    full_arg = full_arg.replace('\r', '')

    lines = full_arg.split('\n')

    for i in range(len(lines)):
        line = lines[i]

        recent_line = i+1

        calculated_line = get_full_line_result(line)

        calculated_lines.append(str(calculated_line))
except Exception as e:
    full_exception = traceback.format_exc() + '\n' + \
    f'Recent eval: \'{recent_eval}\'\n' + \
    f'On line: {recent_line}'

    with open('calc_output.txt', 'w') as f:
        f.write(full_exception)

    if not use_arg:
        print(e)  
    
    exit()

with open('calc_output.txt', 'w') as f:
    f.write('\n'.join(calculated_lines))

if not use_arg:
    print('\n'.join(calculated_lines))  