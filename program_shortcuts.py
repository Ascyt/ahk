import os

arg = input('> ')

match arg:
    case 'documents':
       os.system('start explorer.exe %USERPROFILE%/Documents')

