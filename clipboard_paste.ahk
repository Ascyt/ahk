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

CapsLock & d::
{
    Run "./clipboard_select.exe"
}

CapsLock & v::
{
    ClipboardFile := FileOpen("./clipboard.txt", "r")

    ClipboardContents := ClipboardFile.Read()
    Name := GetKeyState("Shift") ? StrReplace(RunDialogue("clip.get"), "\", "\b") : "\-"
    ClipboardLines := StrSplit(ClipboardContents, "`n")

    splitLineFound := false
    index := ClipboardLines.Length
    while index > 0
    {
        splitLine := StrSplit(ClipboardLines[index], "\:")

        if (splitLine.Length > 1 && splitLine[1] = Name)
        {
            splitLineFound := splitLine
            break
        }
        index--
    }

    if splitLineFound == false 
    {
        TrayTip
        TrayTip("Element `"" Name "`" not found")
        return
    }
    
    ClipboardFile.Close()
    FormattedClipboard := splitLine[2]
    FormattedClipboard := StrReplace(FormattedClipboard, "\n", "`n")
    FormattedClipboard := StrReplace(FormattedClipboard, "\b", "\")

    A_Clipboard := FormattedClipboard
    SendInput "{Ctrl Down}v{Ctrl Up}"
    return
}