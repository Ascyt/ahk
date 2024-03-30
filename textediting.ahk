#Requires AutoHotkey v2.0
#SingleInstance force

RunDialogue(arg)
{
    SendText "{  }"
    SendInput("{Left 2}")

    ArgObj := FileOpen(".\type_shortcut_args.txt", "w")
    ArgObj.Write(arg "`n1")
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
}
#HotIf GetKeyState("Shift")
{
    CapsLock & f::MovePrevious()
}

MoveNext()
{
    txt := RunDialogue("next")
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
    txt := RunDialogue("prev")
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
    Sleep 10
    SendInput "{Ctrl down}{c}{Ctrl up}"
    Sleep 10
    SendInput "{Left}"

    content := StrReplace(A_Clipboard, "`r", "")
    
    position := InStr(content, txt, true, 1)
    
    return position
}

FindPrevious(txt) 
{
    SendInput "{Ctrl down}{Shift down}{Home}{Shift up}{Ctrl up}"
    Sleep 10
    SendInput "{Ctrl down}{c}{Ctrl up}"
    Sleep 10
    SendInput "{Right}"

    content := StrReplace(A_Clipboard, "`r", "")
    
    position := InStr(content, txt, true, -1)
    position := (StrLen(content) - position) + 1 - StrLen(txt)
    return position
}

SelectInside() 
{

}