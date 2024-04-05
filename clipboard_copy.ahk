#Requires AutoHotkey v2.0
#SingleInstance force
A_MaxHotkeysPerInterval := 300

RunDialogue(arg)
{
    ArgObj := FileOpen(".\type_shortcut_args.txt", "w")
    ArgObj.Write(arg "`n0")
    ArgObj.Close()

	RunWait "./type_shortcut.exe"

	OutputObj := FileOpen(".\type_shortcut_output.txt", "r")
	Line := OutputObj.Read()
	OutputObj.Close()

    return Line
}

Copy()
{
    
    A_Clipboard := ""
    SendInput "^c"
    ClipWait
    Clipboard := A_Clipboard
    Clipboard := StrReplace(Clipboard, "\", "\b")
    Clipboard := StrReplace(Clipboard, "`r`n", "`n")
    Clipboard := StrReplace(Clipboard, "`n", "\n")

    ClipboardFile := FileOpen("./clipboard.txt", "a")

    Name := GetKeyState("Shift") ? StrReplace(RunDialogue("clip.add"), "\", "\b") : "\-"
    
    ClipboardFile.Write(Name "\:" Clipboard "`n")
    ClipboardFile.Close()
}
CapsLock & c::Copy()
CapsLock & x::
{
    Copy()
    SendInput "{Backspace}"
}