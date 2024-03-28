#Requires AutoHotkey v2.0
#SingleInstance
A_MaxHotkeysPerInterval := 300

#HotIf WinActive("ahk_exe javaw.exe")
{
    XButton2::j

    :*:m;sh::
    {
        SendText "/sethome "
    }

    :*:m;h::
    {
        SendText "/home "
    }

    :*:m;rmh::
    {
        SendText "/rmhome "
    }

    :*:m;w::
    {
        SendText "/warp "
    }

    :*:m;casino::
    {
        SendInput "{Esc}"
        Sleep 75
        SendCommand "/itemlore add &0"
        SendCommand "/itemlore add &8&oThis item is from &5&oAscyt's Casino&8&o."
        SendCommand "/itemlore add &8&oCheck it out using &2&o/warp ascyt-casino&8&o!"
    }

    SendCommand(command)
    {
        SendInput "{Enter}"
        Sleep 75
        SendText command
        SendInput "{Enter}"
    }

    CapsLock & p::
    {
        SendCommand "/sethome __beacon_temp"

        SendCommand "/home beacon"

        KeyWait "Tab", "D"

        SendCommand "/home __beacon_temp"

        SendCommand "/rmhome __beacon_temp"
    }

    CapsLock & 3::
    {
        SendCommand "/sethome __temp"
    }
    CapsLock & 4::
    {
        SendCommand "/home __temp"
    }
    CapsLock & i::
    {
        SendCommand "/home h"
    }

    CapsLock & q::
    {
        SendCommand "/home d"
    }
}
