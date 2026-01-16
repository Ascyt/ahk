#Requires AutoHotkey v2.0
#SingleInstance force
A_MaxHotkeysPerInterval := 1000

#HotIf WinActive("ahk_exe firefox.exe")
{
    !t::
    {
        SendInput "{Ctrl down}l{Ctrl up}{Shift down}{Tab}{Tab}{Tab}{Tab}{F10}{Shift up}"
    }

    !u::
    {
        SendInput "{Ctrl down}{F13}{Ctrl up}"
    }
    !h::
    {
        SendInput "{Ctrl down}{F14}{Ctrl up}"
    }

    !w::
    {
        SendInput "{Ctrl down}w{Ctrl up}"
    }
}

#HotIf WinActive("ahk_exe Cities.exe") 
{
    RButton::MButton

    MButton::RButton
}