#Requires AutoHotkey v2.0
#SingleInstance force
A_MaxHotkeysPerInterval := 1000

lastTooltip := ""
lastMouseX := 0
lastMouseY := 0

; Custom clipboard copy
F24 & c::
{
    Run "./clipboard_copy.exe"
    ExitApp ; Gets started again
}


; Custom clipboard paste
F24 & d::
{
    Run "./clipboard_select.exe"
    ExitApp ; Gets started again
}
F24 & v::
{
    Run "./clipboard_paste.exe"
    ExitApp ; Gets started again
}

; Arrow keys
F24 & a::
{
    if GetKeyState("Shift", "P")
    {
        SendInput ("{Shift down}")
    }

    if !GetKeyState("Alt", "P")
    {
        SendInput "{Left}"
    }
    else
    {
        SendInput "{Ctrl down}{Left}{Ctrl up}"
    }

    if GetKeyState("Shift", "P")
    {
        SendInput ("{Shift up}")
    }
}
F24 & e::
{
    if GetKeyState("Shift", "P")
    {
        SendInput ("{Shift down}")
    }

    if !GetKeyState("Alt", "P")
    {
        SendInput "{Right}"
    }
    else
    {
        SendInput "{Ctrl down}{Right}{Ctrl up}"
    }
    
    if GetKeyState("Shift", "P")
    {
        SendInput ("{Shift up}")
    }
}
F24 & ,::
{
    if GetKeyState("Shift", "P")
    {
        SendInput ("{Shift down}")
    }

    if !GetKeyState("Alt", "P")
    {
        SendInput "{Up}"
    }
    else
    {
        SendInput "{Home}"
    }

    if GetKeyState("Shift", "P")
    {
        SendInput ("{Shift up}")
    }
}
F24 & o::
{
    if GetKeyState("Shift", "P")
    {
        SendInput ("{Shift down}")
    }

    if !GetKeyState("Alt", "P")
    {
        SendInput "{Down}"
    }
    else
    {
        SendInput "{End}"
    }

    if GetKeyState("Shift", "P")
    {
        SendInput ("{Shift up}")
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

; Other shortcuts
F24 & j::SendInput "{End}{Enter}"

F24 & '::
{
    Run "./special_dialogue.exe run"
}

F24 & b::
{
    if GetKeyState("Alt", "P")
    {
        SendInput "^a"
    }
    Run "./special_dialogue.exe calc"
}

F24 & m::
{
    ; Run "./special_dialogue.exe umlaut"
    lastClipboard := A_Clipboard
    SendInput "{Shift down}{Left}{Shift up}{Ctrl down}c{Ctrl up}"

    timeToLive := 1000
    while timeToLive > 0 && A_Clipboard == lastClipboard
    {
        timeToLive -= 10
        Sleep 10
    }
    character := A_Clipboard

    if StrLen(character) > 1
    {
        MsgBox "Character is too long (" . character . ")"
        return
    }

    switch character 
    {
        case "a":
            SendInput "ä"
        case "A":
            SendInput "Ä"
        case "o":
            SendInput "ö"
        case "O":
            SendInput "Ö"
        case "u":
            SendInput "ü"
        case "U":
            SendInput "Ü"
        case "s":
            SendInput "ß"
        default:
            SendInput character
    }

    A_Clipboard := lastClipboard
}

; Homerow right
F24 & h::
{
    if !GetKeyState("Alt", "P")
    {
        SendInput "{Backspace}"
    }
    else
    {
        SendInput "{Shift down}{Left}{Shift up}"
    }
}
F24 & t::
{
    if !GetKeyState("Alt", "P")
    {
        SendInput "{Ctrl down}{Backspace}{Ctrl up}"
    }
    else
    {
        SendInput "{Shift down}{Ctrl down}{Left}{Ctrl up}{Shift up}"
    }
}
F24 & n:: 
{
    if !GetKeyState("Alt", "P")
    {
	    SendInput "{Backspace 4}"
    }
    else
    {
	    SendInput "{Shift down}{Left 4}{Shift up}"
    }
}
F24 & s::
{
    if !GetKeyState("Alt", "P")
    {
        SendInput "{Shift down}{Home}{Shift up}{Backspace}"
    }
    else
    {
        SendInput "{Shift down}{Home}{Shift up}"
    }
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

F24 & u::ToggleMouseMode(!mouseMode)

#HotIf mouseMode 
{
	F24::ToggleMousemode(false)
}

SetCapsLockState false