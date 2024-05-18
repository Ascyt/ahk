#Requires AutoHotkey v2.0
#SingleInstance
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

oldOutput := ""

while true
{
    mod1 := GetKeyState("u")
    mod2 := GetKeyState("e")
    mod3 := GetKeyState("o")
    mod4 := GetKeyState("a")
    keySPressed := GetKeyState("s")
    
    output := (mod4 ? "1" : "0") (mod3 ? "1" : "0") (mod2 ? "1" : "0") (mod1 ? "1" : "0")

    output .= keySPressed ? "1" : "0"

    if output == oldOutput
        continue

    oldOutput := output

    fileObj := FileOpen(".\8kt_pressed.txt", "w")
    fileObj.Write(output)
    fileObj.Close()
}