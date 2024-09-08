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

ClipboardFile := FileOpen("./clipboard.txt", "r")

ClipboardContents := ClipboardFile.Read()
Name := altPressed ? StrReplace(RunDialogue("clip.get"), "\", "\b") : "\-"
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
    Run "./caps.exe"
    return
}

ClipboardFile.Close()
FormattedClipboard := splitLine[2]
FormattedClipboard := StrReplace(FormattedClipboard, "\n", "`n")
FormattedClipboard := StrReplace(FormattedClipboard, "\b", "\")

A_Clipboard := FormattedClipboard
SendInput "{Ctrl Down}v{Ctrl Up}"

A_Clipboard := oldClipboard

Run "./caps.exe"

ExitApp