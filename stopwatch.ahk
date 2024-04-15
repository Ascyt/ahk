#Requires AutoHotkey v2.0
#SingleInstance
A_MaxHotkeysPerInterval := 300

FormatTime(ms) 
{
    hs := Mod(ms, 1000) // 10
    s := ms // 1000
    m := s // 60
    h := m // 60
    s := s - m * 60
    m := m - h * 60
    
    if h < 10
        h := "0" h
    if m < 10
        m := "0" m
    if s < 10
        s := "0" s
    
    if h == 0
        return m ":" s "." hs

    return h ":" m ":" s "." hs
}

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

while true 
{
    CustomTooltip("Press RightCtrl, Alt+BackSpace or LMB to start the stopwatch.")

    if GetKeyState("RCtrl", "P") || (GetKeyState("Alt") && GetKeyState("Backspace", "P")) || GetKeyState("LButton", "P")
    {
        KeyWait "RCtrl"
        KeyWait "Alt"
        break
    }
}

TrayTip ("Stopwatch started. RightCtrl or Alt+BackSpace to stop.")

timeStarted := A_TickCount

while true
{
    CustomToolTip (FormatTime(A_TickCount - timeStarted))

    if GetKeyState("RCtrl") || (GetKeyState("Alt") && GetKeyState("BackSpace"))
    {
        finalTime := FormatTime(A_TickCount - timeStarted)
        TrayTip
        TrayTip ("Stopwatch stopped.`nFinal time: " finalTime)
        A_Clipboard := finalTime

        ExitApp
    }
}
