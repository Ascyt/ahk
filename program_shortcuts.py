import os

repeat = True

while repeat:
    repeat = False

    arg = input('> ').lower()

    match arg:
        case 'documents':
            os.system('start explorer.exe %USERPROFILE%/Documents')

        case 'ff':
            os.system('"C:\\ProgramData\\Microsoft\\Windows\\Start Menu\\Programs\\Firefox.lnk"')
        case 'code':
            os.system('"C:\\Users\\filip\\AppData\\Roaming\\Microsoft\\Windows\\Start Menu\\Programs\\Visual Studio Code\\Visual Studio Code.lnk"')
        case 'vs':
            os.system('"C:\\ProgramData\\Microsoft\\Windows\\Start Menu\\Programs\\Visual Studio 2022 Preview.lnk"')
        case 'dc':
            os.system('"C:\\Users\\filip\\AppData\\Roaming\\Microsoft\\Windows\\Start Menu\\Programs\\Discord Inc\\Discord.lnk"')
        case 'npp':
            os.system('"C:\\ProgramData\\Microsoft\\Windows\\Start Menu\\Programs\\Notepad++.lnk"')
        case 'steam':
            os.system('"C:\\Users\\filip\\AppData\\Roaming\\Microsoft\\Windows\\Start Menu\\Programs\\Steam\\Steam.lnk"')
        case 'py':
            os.system('"C:\\Users\\filip\\AppData\\Roaming\\Microsoft\\Windows\\Start Menu\\Programs\\Python 3.11\\Python 3.11 (64-bit).lnk"')
        case 'chat':
            os.system('"C:\\Users\\filip\\AppData\\Roaming\\Microsoft\\Windows\\Start Menu\\Programs\\ezgpt.lnk"')
        case '':
            os.system('start cmd.exe C:/Windows/System32')

        case 'youtube':
            os.system('start https://www.youtube.com/')
        
        case _:
            repeat = True
