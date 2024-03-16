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
}