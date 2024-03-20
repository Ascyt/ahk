#Requires AutoHotkey v2.0
#SingleInstance

mouseMode := true

#HotIf !mouseMode 
{
    CapsLock & .::ToggleScript()
}
#HotIf mouseMode 
{
    CapsLock::ToggleScript()
}

ToggleScript()
{
    global mouseMode
    if (mouseMode)
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

ToggleScript()
