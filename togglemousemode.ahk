#Requires AutoHotkey v2.0
#SingleInstance

mouseMode := true

CapsLock & .::ToggleScript(true)
CapsLock::ToggleScript(false)

ToggleScript(toMouseMode)
{
    global mouseMode

    if mouseMode == toMouseMode
        return

    if mouseMode
    {
        ProcessClose "mousemode.exe"

        ToolTip "..."
        KeyWait "CapsLock"
        SetCapsLockState false

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

ToggleScript(false)
