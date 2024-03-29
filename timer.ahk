#Requires AutoHotkey v2.0
#SingleInstance
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

FormatTime(ms) 
{
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
        return m ":" s

    return h ":" m ":" s
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

hrs := RunDialogue("hours")
if hrs == "`b" || hrs == ""
    hrs := 0
hrs := Integer(hrs)

mins := RunDialogue("minutes")
if mins == "`b" || mins == ""
    mins := 0
mins := Integer(mins)

secs := RunDialogue("seconds")
if secs == "`b" || secs == ""
    secs := 0
secs := Integer(secs)

msTotal := (hrs*3600 + mins*60 + secs) * 1000
startTime := A_TickCount

if msTotal > 0
{
    TrayTip ("Timer started for " FormatTime(msTotal) "`n[ RightCtrl to show time ]`n[ CapsLock + BackSpace to cancel ]")

    while (A_TickCount - startTime) < msTotal
    {
        if GetKeyState("RCtrl")
        {
            CustomToolTip (FormatTime(msTotal - (A_TickCount - startTime)))
        }
        else 
        {
            ToolTip
            lastTooltip := ""
            lastMouseX := 0
            lastMouseY := 0
        }

        if GetKeyState("CapsLock") && GetKeyState("BackSpace")
        {
            TrayTip
            TrayTip "Timer cancelled."
            ExitApp
        }
    }
    TrayTip
    TrayTip "Timer finished."
}
else
    TrayTip "Timer cancelled."

ExitApp