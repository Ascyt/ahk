#Requires AutoHotkey v2.0
#SingleInstance force
A_MaxHotkeysPerInterval := 300

InCommand := false
IsEnabled := true

^!Space::
{
    global IsEnabled
    IsEnabled := !IsEnabled
}

#HotIf WinActive("ahk_exe javaw.exe") && IsEnabled
{
    XButton1::F18
    XButton2::F13

    #HotIf GetKeyState("F13") 
    {
        .::F14
        p::F15
        u::F16
        j::F17
    }

    #HotIf GetKeyState("F18") 
    {
        .::F19
        p::F20
        u::F21
        j::F22
    }
}

#HotIf WinActive("ahk_exe javaw.exe") && IsEnabled
{
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
        global firstCommandBeforeWait, commandCountBeforeWait

        SendInput "{Enter}"
        Sleep 75

        SendText command
        SendInput "{Enter}"
    }

    GetTabInfo(command)
    {
        SendInput "{Enter}"
        Sleep 75
        SendText command
        Sleep 150
        SendInput "{Tab}"
        Sleep 75
        SendInput "{Ctrl down}a{Ctrl up}"
        Sleep 75
        SendInput "{Ctrl down}j{Ctrl up}"
        Sleep 75
        SendInput "{Esc}"

        return SubStr(A_Clipboard, StrLen(command) + 1)
    }

    :*:m;copy::
    {
        SendInput "{Esc}"
        Sleep 75

        ; Get item name
        itemName := GetTabInfo("/itemname ")

        ; Get all item lores
        itemLores := []
        loresCount := 10
        index := 1
        while (index <= loresCount)
        {
            itemLore := GetTabInfo("/itemlore set " . index . " ")
            if (itemLore == "")
            {
                break
            }
            itemLores.Push(itemLore)
            index++
        }

        ; Move to next item
        SendInput "{WheelDown}"

        ; Set item name
        SendCommand ("/itemname " itemName) 
        
        ; Set all item lores
        index := 1
        while (index <= itemLores.Length)
        {
            Sleep 2500
            SendCommand ("/itemlore add " itemLores[index])
            index++
        }

        SendInput "{Space down}"
        Sleep 75
        SendInput "{Space up}"
    }

    F24 & c::
    {
        contents := ""
        lastClipboard := ""
        SEPERATOR := "`n`n################################`n`n"

        index := 1
        while (index <= 50)
        {
            SendInput "{Ctrl down}a{Ctrl up}"
            Sleep 30
            SendInput "{Ctrl down}j{Ctrl up}"
            Sleep 30

            if lastClipboard == A_Clipboard
            {
                break
            }
            lastClipboard := A_Clipboard

            contents .= A_Clipboard . SEPERATOR
            SendInput "{PgDn}"
            Sleep 200
            index++
        }

        A_Clipboard := SubStr(contents, 1, StrLen(contents) - StrLen(SEPERATOR))
    }

    PasteSinglePage(contents)
    {
        contents := StrSplit(contents, "§")
        A_Clipboard := "§" ; Because it has to be pasted in using ctrl+v and cannot simply be typed

        SendInput "{Ctrl down}a{Ctrl up}"

        index := 1
        while (index <= contents.Length)
        {
            SendText contents[index]
            if index < contents.Length
            {
                Sleep 25
                SendInput "{Ctrl down}k{Ctrl up}"
                Sleep 25
            }
            index++
        }
    }

    F24 & v::
    {
        fullContents := StrReplace(A_Clipboard, "`r", "")
        contents := StrSplit(fullContents, "`n`n################################`n`n")

        index := 1
        while (index <= contents.Length)
        {
            PasteSinglePage(contents[index])
            Sleep 75
            SendInput "{PgDn}"
            index++
        }

        A_Clipboard := fullContents
    }

    F24 & p::
    {
        SendCommand "/sethome __beacon_temp"

        SendCommand "/home beacon"

        KeyWait "Tab", "D"

        SendCommand "/home __beacon_temp"

        SendCommand "/delhome __beacon_temp"
    }

    F24 & 3::
    {
        SendCommand "/delhome __temp"
        SendCommand "/sethome __temp"
    }
    F24 & 4::
    {
        SendCommand "/home __temp"
    }
    F24 & i::
    {
        SendCommand "/home s"
    }

    F24 & q::
    {
        SendCommand "/home d"
    }

    F24 & 1::
    {
        SendCommand "/back"
    }


    F24 & u::
    {
        SendInput "{End}{Shift down}{Home}{Shift up}"
    }
    F24 & h::
    {
        SendInput "{Backspace}"
    }
    F24 & t::
    {
        SendInput "{Ctrl down}{Backspace}{Ctrl up}"
    }
    F24 & n:: 
    {
        SendInput "{Backspace 5}"
    }

    /::
    {
        global InCommand

        InCommand := true
        SendInput "{/}"
    }
    Up::
    {
        global InCommand

        InCommand := true
        SendInput "{Up}"
    }

    ;Enter::
    ;{
    ;    global InCommand

    ;    if InCommand
    ;    {
    ;        SendInput "{Enter}"
    ;        InCommand := false
    ;        return
    ;    }

    ;    InCommand := false

    ;    SendText " &f</&cAscyt&f>"

    ;    SendInput "{Home}"

    ;    SendText "&b"

    ;    SendInput "{Enter}"
    ;}
}

#HotIf WinActive("ahk_exe TS4_x64.exe") && IsEnabled
{
    Space::0

    !WheelUp::PgUp
    !WheelDown::PgDn

    `;::
    {
        PosX := 0
        PosY := 0

        MouseGetPos &PosX, &PosY

        MouseClick "Left", 2537, 71, 1, 0

        MouseMove PosX, PosY, 0
    }
}