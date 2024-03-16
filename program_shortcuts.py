
import os

USERNAME = 'filip'

commands = {
    'h': 'start explorer.exe %USERPROFILE%\\{{+}}',
    'd': 'start explorer.exe %USERPROFILE%\\Documents\\{{+}}',
    'p': 'start explorer.exe %USERPROFILE%\\Pictures\\{{+}}',
    'dl': 'start explorer.exe %USERPROFILE%\\Downloads\\{{+}}',
    'desktop': 'start explorer.exe %USERPROFILE%\\Desktop\\{{+}}',
    'ss': 'start explorer.exe %USERPROFILE%\\Pictures\\Screenshots\\{{+}}',
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
    't': 'cd "{{+}}" && cmd.exe .',
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

repeat = True

while repeat:
    repeat = False

    full_arg = input('> ').lower()
    arg = full_arg if ' ' not in full_arg else full_arg[:full_arg.find(' ')]
    extra_args = full_arg[len(arg) + 1:]

    if ' ' in extra_args:
        extra_args_first = extra_args.split(' ')[0]
        if extra_args_first == 'h':
            extra_args_first = '%USERPROFILE%'
        if extra_args_first == 'd':
            extra_args_first = '%USERPROFILE%\\Documents'
        if extra_args_first == 'p':
            extra_args_first = '%USERPROFILE%\\Pictures'
        if extra_args_first == 'dl':
            extra_args_first = '%USERPROFILE%\\Downloads'
        extra_args = extra_args_first + extra_args[extra_args.find(' '):]

    extra_args = extra_args.replace(' ', '\\')

    if arg in commands:
        repeat = os.system(commands[arg].replace('{{+}}', extra_args))
    else:
        repeat = True
