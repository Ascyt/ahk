#Requires AutoHotkey v2.0
#SingleInstance

USE_TOOLTIP := true

is_running := false

ToggleScript(running)
{
    global USE_TOOLTIP

    if (running)
    {
        Run "8kt.exe"
        if USE_TOOLTIP
            Run "8kttooltip.exe"
            Run("python.exe ./overlay.py", "", "Hide")

        ToolTip "✅8KT ON✅"
        SetTimer () => ToolTip(), -1000
    }
    else
    {
        ProcessClose "8kt.exe"
        ProcessClose "8kttooltip.exe"
        if USE_TOOLTIP
            ProcessClose "python.exe"
        
        ToolTip "❌8KT OFF❌"
        SetTimer () => ToolTip(), -1000
    }

    global is_running
    is_running := running
}

^+Space::ToggleScript(!is_running)

#HotIf (is_running)
{
    Escape::ToggleScript(false)
}