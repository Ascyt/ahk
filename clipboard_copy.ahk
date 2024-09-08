#SingleInstance force

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

altPressed := GetKeyState("Alt")

oldClipboard := A_Clipboard

A_Clipboard := ""
SendInput "^c"
ClipWait

Clipboard := A_Clipboard
Clipboard := StrReplace(Clipboard, "\", "\b")
Clipboard := StrReplace(Clipboard, "`r`n", "`n")
Clipboard := StrReplace(Clipboard, "`n", "\n")

ClipboardFile := FileOpen("./clipboard.txt", "a")

Name := altPressed ? StrReplace(RunDialogue("clip.add"), "\", "\b") : "\-"

ClipboardFile.Write(Name "\:" Clipboard "`n")
ClipboardFile.Close()

A_Clipboard := oldClipboard

Run "./caps.exe"

ExitApp