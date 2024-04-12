import os
import random
import pyperclip
from math import *

USERNAME = 'filip'

commands = {
    'e': 'start explorer.exe {{+}}',
    'h': 'start explorer.exe C:\\Users\\'+USERNAME+'\\{{+}}',
    'd': 'start explorer.exe C:\\Users\\'+USERNAME+'\\Documents\\{{+}}',
    'p': 'start explorer.exe C:\\Users\\'+USERNAME+'\\Pictures\\{{+}}',
    'dl': 'start explorer.exe C:\\Users\\'+USERNAME+'\\Downloads\\{{+}}',
    'desktop': 'start explorer.exe C:\\Users\\'+USERNAME+'\\Desktop\\{{+}}',
    'ss': 'start explorer.exe C:\\Users\\'+USERNAME+'\\Pictures\\Screenshots\\{{+}}',
    'trash': 'start explorer.exe shell:RecycleBinFolder',

    'ff': '"C:\\ProgramData\\Microsoft\\Windows\\Start Menu\\Programs\\Firefox.lnk"',
    'vs': '"C:\\ProgramData\\Microsoft\\Windows\\Start Menu\\Programs\\Visual Studio 2022 Preview.lnk"',
    'vsi': '"C:\\ProgramData\\Microsoft\\Windows\\Start Menu\\Programs\\Visual Studio Installer.lnk"',
    'dc': '"C:\\Users\\'+USERNAME+'\\AppData\\Roaming\\Microsoft\\Windows\\Start Menu\\Programs\\Discord Inc\\Discord.lnk"',
    'npp': '"C:\\ProgramData\\Microsoft\\Windows\\Start Menu\\Programs\\Notepad++.lnk"',
    'steam': '"C:\\Users\\'+USERNAME+'\\AppData\\Roaming\\Microsoft\\Windows\\Start Menu\\Programs\\Steam\\Steam.lnk"',
    'chat': '"C:\\Users\\'+USERNAME+'\\AppData\\Roaming\\Microsoft\\Windows\\Start Menu\\Programs\\ezgpt.lnk"',
    'unity': '"C:\\ProgramData\\Microsoft\\Windows\\Start Menu\\Programs\\Unity Hub.lnk"',
    'vpn': '"C:\\ProgramData\\Microsoft\\Windows\\Start Menu\\Programs\\PrivateVPN\\PrivateVPN.lnk"',

    'code': 'cd "{{+}}" && code .',
    'vim': 'vim "{{+}}"',
    'py': 'python.exe "{{+}}"',
    't': 'cd "{{+}}" && "C:\\Windows\\System32\\WindowsPowerShell\\v1.0\\powershell.exe"',
    'ta': 'cd "{{+}}" && "C:\\Users\\filip\\AppData\\Roaming\\Microsoft\\Windows\\Start Menu\\Programs\\Windows PowerShell\\Windows PowerShell - Administrator.lnk"',
    'edit': 'code .',

    'yt': 'start https://www.youtube.com/{{+}}',
    'gh': 'start https://github.com/{{+}}',
    'ghp': 'start https://github.com/Ascyt/{{+}}',
    's': 'start https://{{+}}',
    'sp': 'start https://{{+}}.ascyt.com/',

    'sd': 'shutdown /s /t 0',
    'sr': 'shutdown /r /t 0',
    'sdf': 'shutdown /s /f /t 0',
    'srf': 'shutdown /r /f /t 0',
    'kill': 'taskkill /f /im {{+}}',

    '': 'exit',
}

def print_and_copy(value):
    print(value)
    pyperclip.copy(value)

base_conversion_arguments = ['bin', 'oct', 'dec', 'hex']
def base_conversion(args):
    args = args.split(' ')
    from_base = args[0]
    to_base = args[1]
    value = args[2]

    # Convert the value to decimal
    if from_base == 'bin':
        dec_value = int(value, 2)
    elif from_base == 'oct':
        dec_value = int(value, 8)
    elif from_base == 'dec':
        dec_value = int(value, 10)
    elif from_base == 'hex':
        dec_value = int(value, 16)
    else:
        print("Invalid from_base argument")

    # Convert the decimal value to the desired base
    if to_base == 'bin':
        print_and_copy(bin(dec_value).replace("0b", ""))
    elif to_base == 'oct':
        print_and_copy(oct(dec_value).replace("0o", ""))
    elif to_base == 'dec':
        print_and_copy(str(dec_value))
    elif to_base == 'hex':
        print_and_copy(hex(dec_value).replace("0x", ""))
    else:
        print("Invalid to_base argument")

    return 0

def randomizer(args): 
    args = args.split(' ')

    if len(args) == 0:
        print('No argument')
        return 1
    if len(args) > 1:
        print('Too many arguments')
        return 1

    value = get_random(args[0])
    print(value)
    pyperclip.copy(value)
    return 0

def get_random(arg):
    if ':' in arg:
        numA = int(arg[:arg.find(':')])
        numB = int(arg[arg.find(':') + 1:])
        return str(random.randint(numA, numB))

    return random.choice(arg.split(','))

def calc(args):
    os.system('python calc.py ' + args)
    with open('calc_output.txt', 'r') as f:
        output = f.read()
    print(output)
    pyperclip.copy(output)
    return 0

def quickshare(args):
    pyperclip.copy('https://quickshare.samsungcloud.com/' + args)
    os.system('start https://quickshare.samsungcloud.com/' + args)
    return 0

repeat = True
tried_arg = False

while repeat:
    repeat = False

    # If there are arguments, use them instead of input
    if len(os.sys.argv) > 1 and not tried_arg:
        full_arg = ' '.join(os.sys.argv[1:])
        print("> " + full_arg)
        tried_arg = True
    else: 
        full_arg = input('> ')
    
    arg = full_arg if ' ' not in full_arg else full_arg[:full_arg.find(' ')]
    extra_args = full_arg[len(arg) + 1:]

    match arg:
        case 'rand':
            repeat = randomizer(extra_args)
            repeat = True
            continue
        case 'calc':
            repeat = calc(extra_args)
            repeat = True
            continue
        case 'qs':
            repeat = quickshare(extra_args)
            repeat = True
            continue

    if arg in base_conversion_arguments:
        repeat = base_conversion(full_arg)
        repeat = True
        continue

    extra_args_first = extra_args.split(' ')[0] if ' ' in extra_args else extra_args
    if extra_args_first == 'h':
        extra_args_first = 'C:\\Users\\'+USERNAME+''
    if extra_args_first == 'd':
        extra_args_first = 'C:\\Users\\'+USERNAME+'\\Documents'
    if extra_args_first == 'p':
        extra_args_first = 'C:\\Users\\'+USERNAME+'\\Pictures'
    if extra_args_first == 'dl':
        extra_args_first = 'C:\\Users\\'+USERNAME+'\\Downloads'
    extra_args = extra_args_first + extra_args[extra_args.find(' '):] if ' ' in extra_args else extra_args_first

    extra_args = extra_args.replace(' ', '\\')

    if arg in commands:
        command = commands[arg].replace('{{+}}', extra_args)
        print('# '+command)
        repeat = os.system(command)
    else:
        repeat = True
