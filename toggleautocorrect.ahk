#Requires AutoHotkey v2.0
#SingleInstance

:*:;act::
{
    ToggleScript
}

running := false

ToggleScript()
{
    global running
    if (running)
    {
        ProcessClose "autocorrect.exe"
        running := false
        ToolTip "❌AUTOCORRECT OFF❌"
        SetTimer () => ToolTip(), -1000
    }
    else
    {
        Run "autocorrect.exe"
        running := true
        ToolTip "✅AUTOCORRECT ON✅"
        SetTimer () => ToolTip(), -1000
    }
}

ToggleScript
