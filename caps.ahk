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
CapsLock & ':: 
{
	Run "type_shortcut.exe"
}

; Send without space
SendRmLast(text) 
{
	SendInput("{Backspace}")
	SendText text
}

; Personal shortcuts
:*:;mail::account@ascyt.com
:*:;website::https://ascyt.com/
:*:;gh::https://github.com/Ascyt/

; Shortcuts for faster writing
:*:;sth::something
:*:;ig::i guess
:*:;idk::i don't know
:*:;idc::i don't care

; Stuff that is a pain to spell
:*:;def::definitely
:*:;misc::miscellaneous

; Symbols
:*:;euro::
{
	SendRmLast("€")
}
:*:;tm::
{
	SendRmLast("™")
}
:*:;copyright::
{
	SendRmLast("©")
}
:*:;zws::
{
	SendRmLast("​")
}

; Emojis
:*:;skull::
{
	SendRmLast("💀")
}
:*:;nerd::
{
	SendRmLast("🤓")
}
:*:;tu::
{
	SendRmLast("👍")
}
:*:;td::
{
	SendRmLast("👎")
}

; System info shorthands
:*:;date::
{
	Send FormatTime(, "dd.MM.yyyy")
}
:*:;time::
{
	Send FormatTime(, "hh:mm")
}

; Commands and system shortcuts
:*:;home::
{
	SendText "%USERPROFILE%/"
}
:*:;docs::
{
	SendText "%USERPROFILE%/Documents/"
}
:*:;pics::
{
	SendText "%USERPROFILE%/Pictures/"
}
:*:;downloads::
{
	SendText "%USERPROFILE%/Downloads/"
}

GitCommitM()
{
	SendText "git commit -m `"`""
	SendInput "{Left}"
}
:*:;gitcm::
{
	GitCommitM()
}
:*:;gitacm::
{
	SendText "git add ."
	SendInput "{Enter}"
	GitCommitM()
}