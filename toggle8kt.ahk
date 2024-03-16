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
    }
    else
    {
        Run "8kt.exe"
        running := true
    }
}
