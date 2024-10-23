#Requires AutoHotkey v2.0
#SingleInstance force
A_MaxHotkeysPerInterval := 1000

#HotIf WinActive("ahk_exe firefox.exe")
{
    ^+f::
    {
        SendInput "{Ctrl down}l{Ctrl up}%{Space}"
        KeyWait "Enter", "D"
        SendInput "{Down}{Enter}"
    }
}