#Requires AutoHotkey v2.0
#SingleInstance force

SetWinDelay -1
CoordMode "Mouse", "Screen"

#MButton::!F4

#LButton:: {
    RestoreRequried := WinGetMinMax("A") != 0
    if RestoreRequried
    {
        WinRestore("A")
    }
    
    MouseGetPos(&StartMouseX, &StartMouseY)
    OldMouseX := StartMouseX
    OldMouseY := StartMouseY
    WinGetPos(&X, &Y, &Width, &Height, "A")

    while GetKeyState("LButton", "P") {
        global StartMouseX, StartMouseY
        global OldMouseX, OldMouseY

        MouseGetPos(&MouseX, &MouseY)

        if MouseX != OldMouseX || MouseY != OldMouseY
        {
            WinMove(X+(MouseX - StartMouseX), Y+(MouseY - StartMouseY), , , "A")
        }

        MouseGetPos(&OldMouseX, &OldMouseY)
    }

    if RestoreRequried
    {
        WinMaximize("A")
    }
}

ResizeWindow() 
{
    if WinGetMinMax("A") != 0
    {
        WinRestore("A")
    }

    MouseGetPos(&StartMouseX, &StartMouseY)
    WinGetPos(&X, &Y, &Width, &Height, "A")
    OldMouseX := StartMouseX
    OldMouseY := StartMouseY

    while GetKeyState("RButton", "P") 
    {
        global StartMouseX, StartMouseY
        MouseGetPos(&MouseX, &MouseY)

        if MouseX != OldMouseX || MouseY != OldMouseY
        {
            if !GetKeyState("Shift", "P")
            {
                WinMove(, , Width+(MouseX - StartMouseX), Height+(MouseY - StartMouseY), "A")
            }
            else 
            {
                WinMove(X+(MouseX - StartMouseX), Y+(MouseY - StartMouseY), Width-(MouseX - StartMouseX), Height-(MouseY - StartMouseY), "A")
            }
        }
        MouseGetPos(&OldMouseX, &OldMouseY)
    }
}

#RButton::ResizeWindow()
#+RButton::ResizeWindow()

#WheelDown::#Down
#+WheelDown::WinMinimize("A")
#WheelUp::WinMaximize("A")

^+WheelDown::^PgDn
^+WheelUp::^PgUp

#c::!F4