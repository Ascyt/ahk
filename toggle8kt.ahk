#Requires AutoHotkey v2.0
#SingleInstance

^+Space::ToggleScript()

running := false

ToggleScript()
{
    global running
    if (running)
    {
        ProcessClose "8kt.exe"
        running := false
        ToolTip "❌8KT OFF❌"
        SetTimer () => ToolTip(), -1000
    }
    else
    {
        Run "8kt.exe"
        running := true
        ToolTip "✅8KT ON✅"
        SetTimer () => ToolTip(), -1000
    }
}
