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

    CapsLock & c::
    {
        contents := ""
        lastClipboard := ""
        SEPERATOR := "`n`n================`n`n"

        index := 1
        while (index <= 10)
        {
            SendInput "{Ctrl down}a{Ctrl up}"
            Sleep 75
            SendInput "{Ctrl down}j{Ctrl up}"
            Sleep 75

            if lastClipboard == A_Clipboard
            {
                break
            }
            lastClipboard := A_Clipboard

            contents .= A_Clipboard . "`n`n================`n`n"
            SendInput "{PgDn}"
            Sleep 75
            index++
        }

        A_Clipboard := SubStr(contents, 1, StrLen(contents) - StrLen(SEPERATOR))
    }

    PasteSinglePage(contents)
    {
        contents := StrSplit(contents, "§")
        A_Clipboard := "§" ; Because it has to be pasted in using ctrl+v and cannot simply be typed

        index := 1
        while (index <= contents.Length)
        {
            SendText contents[index]
            if index < contents.Length
            {
                SendInput "{Ctrl down}k{Ctrl up}"
            }
            index++
        }
    }

    CapsLock & v::
    {
        fullContents := A_Clipboard
        contents := StrSplit(fullContents, "`n`n================`n`n")

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
        SendCommand "/home s"
    }

    CapsLock & q::
    {
        SendCommand "/home d"
    }
}
