#Requires AutoHotkey v2.0
#SingleInstance

CapsLock & .::ToggleScript()

mouseMode := true

ToggleScript()
{
    global mouseMode
    if (mouseMode)
    {
        ProcessClose "mousemode.exe"
        run "caps.exe"

        mouseMode := false
        ToolTip "KEY"
        SetTimer () => ToolTip(), -1000
    }
    else
    {
        ProcessClose "caps.exe"
        run "mousemode.exe"
        
        mouseMode := true
        ToolTip "MOUSE"
        SetTimer () => ToolTip(), -1000
    }
}

ToggleScript()
