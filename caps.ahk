#Requires AutoHotkey v2.0
#SingleInstance
A_MaxHotkeysPerInterval := 300

CapsLock::
{
	SetCapsLockState false
}

!CapsLock::CapsLock

CapsLock & u::
{
	if !GetKeyState("Shift")
	{
		SendInput "{Backspace}"
	}
	if GetKeyState("Shift")
	{
		SendInput "{Ctrl down}z{Ctrl up}"
	}
}

#HotIf WinActive("ahk_class CASCADIA_HOSTING_WINDOW_CLASS")
{
	; Homerow right
	CapsLock & h::
	{
		SendInput "{Backspace}"
	}
	CapsLock & t::
	{
		SendInput "{Ctrl down}{Backspace}{Ctrl up}"
	}
	CapsLock & n:: 
	{
		SendInput "{Backspace 5}"
	}

	CapsLock & s:: 
	{
		SendInput "{End}{Ctrl down}{Backspace 10}{Ctrl up}{Home}"
	}
}
#HotIf !WinActive("ahk_class CASCADIA_HOSTING_WINDOW_CLASS")
{
	; Homerow right
	CapsLock & h::
	{
		if !GetKeyState("Shift")
		{
			SendInput "{Shift down}{Left}{Shift up}"
		}
		if GetKeyState("Shift")
		{
			SendInput "{Shift down}{Right}{Shift up}"
		}
	}
	CapsLock & t::
	{
		if !GetKeyState("Shift")
		{
			SendInput "{Ctrl down}{Shift down}{Left}{Shift up}{Ctrl up}"
		}
		if GetKeyState("Shift")
		{
			SendInput "{Ctrl down}{Shift down}{Right}{Shift up}{Ctrl up}"
		}
	}
	CapsLock & n:: 
	{
		if !GetKeyState("Shift")
		{
			SendInput "{Shift down}{Left 5}{Shift up}"
		}
		if GetKeyState("Shift")
		{
			SendInput "{Shift down}{Right 5}{Shift up}"
		}
	}
	CapsLock & s:: 
	{
		SendInput "{End}{Shift down}{Home}{Shift up}"
	}
}

; Arrow keys
CapsLock & a::Left
CapsLock & `;::^Left
CapsLock & e::Right
CapsLock & j::^Right
CapsLock & ,::Up
CapsLock & o::Down
; Other faster keys
CapsLock & 1::Home
CapsLock & 2::End

CapsLock & Alt:: 
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

; German Umlaute
CapsLock & g::SendText "ä"
CapsLock & m::SendText "Ä"

CapsLock & c::SendText "ö"
CapsLock & w::SendText "Ö"

CapsLock & r::SendText "ü"
CapsLock & v::SendText "Ü"

CapsLock & -::SendText "ß"

; Mouse shortcuts
CapsLock & LButton::^v
CapsLock & RButton::^c
CapsLock & MButton::^x
CapsLock & WheelDown::Right
CapsLock & WheelUp::Left
CapsLock & WheelLeft::Backspace
CapsLock & WheelRight::Delete
CapsLock & XButton1::^z
CapsLock & XButton2::^y


; Open special run dialogue
RunDialogue()
{
    ArgObj := FileOpen(".\type_shortcut_arg.txt", "w")
    ArgObj.Write("run")
    ArgObj.Close()

	Run "./type_shortcut.exe"
	WinWait("ahk_exe type_shortcut.exe")
	WinWaitClose("ahk_exe type_shortcut.exe")

	OutputObj := FileOpen(".\type_shortcut_output.txt", "r")
	Line := OutputObj.Read()
	OutputObj.Close()

	if Trim(Line) != "" 
	{
		Run "python.exe program_shortcuts.py " Line
	}
}

CapsLock & ':: 
{
	RunDialogue()
}
