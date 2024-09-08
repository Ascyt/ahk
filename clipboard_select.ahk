#Requires AutoHotkey v2.0
#SingleInstance force
A_MaxHotkeysPerInterval := 300

lastTooltip := ""
lastMouseX := 0
lastMouseY := 0
CustomTooltip(content)
{
    global lastTooltip, lastMouseX, lastMouseY

    mouseX := 0
    mouseY := 0
    MouseGetPos (&mouseX, &mouseY)

    if (content != lastTooltip || lastMouseX != mouseX || lastMouseY != mouseY)
    {
        ToolTip(content)

        lastTooltip := content
        lastMouseX := mouseX
        lastMouseY := mouseY
    }
}

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

ClipboardLines := []
currentLine := -1
selectorSuccess := false

Up()
{
    global currentLine

    currentLine := currentLine - 1
    if currentLine < 1
    {
        currentLine := 1
    }
}
Down()
{
    global currentLine, ClipboardLines

    currentLine := currentLine + 1
    if currentLine > ClipboardLines.Length
    {
        currentLine := ClipboardLines.Length
    }
}

Enter()
{
    global selectorSuccess, inSelector

    selectorSuccess := true
    inSelector := false
}

Escape()
{
    global selectorSuccess, inSelector

    selectorSuccess := false
    inSelector := false
}
Backspace()
{
    global currentLine, ClipboardLines

    ClipboardLines.RemoveAt(currentLine)
    if currentLine > 1
    {
        currentLine := currentLine - 1
    }

    if ClipboardLines.Length == 0
    {
        Escape()
    }
}
DelAll()
{
    global currentLine, ClipboardLines

    ClipboardLines := []
    currentLine := 0
    Escape()
}
Space()
{
    global currentLine, ClipboardLines
    A_Clipboard := ClipboardLines[currentLine]
    Backspace()
    Escape()
}

Up::Up()
Down::Down()
,::Up()
o::Down()
F24 & ,::Up()
F24 & o::Down()
WheelUp::Up()
WheelDown::Down()

Enter::Enter()
LButton::Enter()
Escape::Escape()
RButton::Escape()

Backspace::Backspace()
MButton::Backspace()
^Backspace::DelAll()
Space::Space()

ClipboardFile := FileOpen("./clipboard.txt", "r")
ClipboardContents := ClipboardFile.Read()
ClipboardFile.Close()

if ClipboardContents == ""
{
    TrayTip
    TrayTip "Clipboard is empty."

    Run "./caps.exe"
    ExitApp
}

ClipboardLinesUnformatted := StrSplit(ClipboardContents, "`n")
ClipboardLines := []

for Index, Line in ClipboardLinesUnformatted.Clone()
{
    if Line != ""
    {
        ClipboardLines.Push(Line)
    }
}

currentLine := ClipboardLines.Length
inSelector := true
selectorSuccess := false
while inSelector 
{
    splitLine := StrSplit(ClipboardLines[currentLine], "\:")
    contents := SubStr(splitLine[2], 1, 50)
    formattedLine := splitLine[1] == "\-" ? ("`"" contents "`"") : (splitLine[1] ": `"" contents "`"")

    CustomTooltip(formattedLine)
}
ToolTip

NewClipboardContents := ""
for Index, Line in ClipboardLines
{
    NewClipboardContents .= Line "`n"
}

ClipboardFile := FileOpen("./clipboard.txt", "w")
ClipboardFile.Write(NewClipboardContents)
ClipboardFile.Close()

if !selectorSuccess
    ExitApp 
FormattedClipboard := splitLine[2]
FormattedClipboard := StrReplace(FormattedClipboard, "\n", "`n")
FormattedClipboard := StrReplace(FormattedClipboard, "\b", "\")

A_Clipboard := FormattedClipboard
SendInput "{Ctrl Down}v{Ctrl Up}"

Run "./caps.exe"

ExitApp