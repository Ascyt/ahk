#Requires AutoHotkey v2.0
#SingleInstance
A_MaxHotkeysPerInterval := 300

CapsLock::F13
^CapsLock::CapsLock
+CapsLock::CapsLock
!F13::CapsLock

; Homerow right
CapsLock & h::Backspace
CapsLock & t::^Backspace
CapsLock & n:: 
{
	SendInput "{Backspace 5}"
}
CapsLock & s:: 
{
	SendInput "{End}{Shift down}{Home}{Shift up}"
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
	SendInput "{End}{Enter}"
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
	Run "python.exe program_shortcuts.py"
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
