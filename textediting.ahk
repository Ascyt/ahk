#Requires AutoHotkey v2.0
#SingleInstance force

RunDialogue(arg, useSingleChar)
{
    SendText "{  }"
    SendInput("{Left 2}")

    ArgObj := FileOpen(".\type_shortcut_args.txt", "w")
    ArgObj.Write(arg "`n1" "`n" (useSingleChar?"1":"0")) 
    ArgObj.Close()

	RunWait "./type_shortcut.exe"

	OutputObj := FileOpen(".\type_shortcut_output.txt", "r")
	Line := OutputObj.Read()
	OutputObj.Close()

    SendInput("{Delete 2}{Backspace 2}")

    return Line
}

#HotIf !GetKeyState("Shift")
{
    CapsLock & f::MoveNext()
    CapsLock & b::SelectInside()
}
#HotIf GetKeyState("Shift")
{
    CapsLock & f::MovePrevious()
}

MoveNext()
{
    txt := RunDialogue("next", false)
    if txt == "`b" || txt == ""
        return

    position := FindNext(txt)

    if (position > 0) {
        SendInput "{Right " . (position - 1) . "}"
    }

    SendInput "{Ctrl down}{Up 10}{Ctrl up}"
}
MovePrevious()
{
    txt := RunDialogue("prev", false)
    if txt == "`b" || txt == ""
        return
    
    position := FindPrevious(txt)

    if (position > 0) {
        SendInput "{Left " . (position) . "}"
    }

    SendInput "{Ctrl down}{Down 10}{Ctrl up}"
}

FindNext(txt) 
{
    SendInput "{Ctrl down}{Shift down}{End}{Shift up}{Ctrl up}"
    Sleep 20
    SendInput "{Ctrl down}{c}{Ctrl up}"
    Sleep 20
    SendInput "{Left}"

    content := StrReplace(A_Clipboard, "`r", "")
    
    position := InStr(content, txt, true, 1)
    
    return position
}


FindPrevious(txt) 
{
    SendInput "{}"
    SendInput "{Ctrl down}{Shift down}{Home}{Shift up}{Ctrl up}"
    Sleep 20
    SendInput "{Ctrl down}{c}{Ctrl up}"
    Sleep 20
    SendInput "{Right}"

    content := StrReplace(A_Clipboard, "`r", "")
    
    position := InStr(content, txt, true, -1)
    position := (StrLen(content) - position) + 1 - StrLen(txt)
    return position
}

FindSecondPair(secondPair, firstPair) 
{
    if secondPair == firstPair
        return FindNext(secondPair)

    SendInput "{Ctrl down}{Shift down}{End}{Shift up}{Ctrl up}"
    Sleep 20
    SendInput "{Ctrl down}{c}{Ctrl up}"
    Sleep 20
    SendInput "{Left}"

    content := StrReplace(A_Clipboard, "`r", "")
    
    delta := 1
    For i, char in StrSplit(content, "") 
    {
        if char == firstPair
            delta++
        if char == secondPair
            delta--

        if delta == 0
            return i
    }
    
    return 0
}
FindFirstPair(firstPair, secondPair) 
{
    if firstPair == secondPair
        return FindPrevious(firstPair)

    SendInput "{Ctrl down}{Shift down}{Home}{Shift up}{Ctrl up}"
    Sleep 20
    SendInput "{Ctrl down}{c}{Ctrl up}"
    Sleep 20
    SendInput "{Right}"

    content := StrReplace(A_Clipboard, "`r", "")
    
    delta := 1
    i := StrLen(content) 
    
    While (i > 0)
    {
        char := SubStr(content, i, 1)
        if char == secondPair
            delta++
        if char == firstPair
            delta--

        if delta == 0
            return StrLen(content) - i
        
        i--
    }
    
    return -1
}

SelectInside() 
{
    a := RunDialogue("inside", true)
    if a == "`b" || a == ""
        return

    b := ""
    Switch a
    {
        Case "(":
            b := ")"
        Case "[":
            b := "]"
        Case "{":
            b := "}"
        Case "<":
            b := ">"
        Case "'":
            b := "'"
        Case "`"":
            b := "`""
    }

    if b == ""
        return

    posA := FindFirstPair(a, b)

    if (posA < 0) 
        return
    
    Sleep 20

    SendInput "{Left " . (posA) . "}"

    Sleep 100

    posB := FindSecondPair(b, a)

    if (posB <= 0) 
        return

    Sleep 20

    SendInput "{Shift down}{Right " . (posB - 1) . "}{Shift up}"

    SendInput "{Ctrl down}{Up 10}{Ctrl up}"
}