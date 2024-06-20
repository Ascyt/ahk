#Requires AutoHotkey v2.0
#SingleInstance force
A_MaxHotkeysPerInterval := 1000

lastTooltip := ""
lastMouseX := 0
lastMouseY := 0

F24 & u::
{
	SendInput "{End}{Shift down}{Home}{Shift up}"
}

; Arrow keys
F24 & a::Left
F24 & `;::^Left
F24 & e::Right
F24 & j::^Right
F24 & ,::Up
F24 & o::Down
; Other faster keys
F24 & 1::Home
F24 & 2::End

F24 & Alt:: 
{
    if !GetKeyState("Shift", "P")
    {
        SendInput "{End}{Enter}"
    }
    else
    {
        SendInput "{Home}{Enter}{Up}"
    }
}

; Mouse shortcuts
F24 & LButton::^v
F24 & RButton::^c
F24 & MButton::Enter
F24 & WheelDown::Right
F24 & WheelUp::Left
F24 & WheelLeft::Backspace
F24 & WheelRight::Delete
F24 & XButton1::^z
F24 & XButton2::^y

F24 & '::
{
    Run "./special_dialogue.exe run"
}

F24 & m::
{
    Run "./special_dialogue.exe umlaut"
}

; Homerow right
F24 & h::
{
	SendInput "{Backspace}"
}
F24 & t::
{
	SendInput "{Ctrl down}{Backspace}{Ctrl up}"
}
F24 & n:: 
{
	SendInput "{Backspace 5}"
}
F24 & s::
{
    SendInput "{Shift down}{Home}{Shift up}{Backspace}"
}

mouseMode := false
ToggleMousemode(toMouseMode)
{
    global mouseMode

    if mouseMode == toMouseMode
        return

    if mouseMode
    {
        ProcessClose "mousemode.exe"

        ToolTip "..."
        KeyWait "F24"

        mouseMode := false
        ToolTip "KEY"
        SetTimer () => ToolTip(), -1000
    }
    else
    {
        run "mousemode.exe"
        
        mouseMode := true
        ToolTip "MOUSE"
        SetTimer () => ToolTip(), -1000
    }
}

F24 & .::ToggleMouseMode(!mouseMode)

#HotIf mouseMode 
{
	F24::ToggleMousemode(false)
}

SetCapsLockState false