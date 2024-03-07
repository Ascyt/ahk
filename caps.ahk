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

; Remove previous space 
CapsLock & ':: 
{
	SendInput("{Ctrl down}{Left}{Ctrl up}{Backspace}{Ctrl down}{Right}{Ctrl up}")
}

; Personal shortcuts
:*:;mail::account@ascyt.com
:*:;website::https://ascyt.com/

; Shortcuts for faster writing
:*:;sth::something
:*:;ig::i guess
:*:;idk::i don't know
:*:;idc::i don't care

; Stuff that is a pain to spell
:*:;def::definitely
:*:;misc::miscellaneous

; Symbols
:*:;euro::€
:*:;tm::™
:*:;copyright::©
:*:;zws::​

; Emojis
:*:;skull::💀
:*:;nerd::🤓
:*:;tu::👍
:*:;td::👎

; System info shorthands
:*:;date::
{
	Send FormatTime(, "dd.MM.yyyy")
}
:*:;time::
{
	Send FormatTime(, "hh:mm")
}
