#Requires AutoHotkey v2.0
#SingleInstance

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
:*:;wdym::what do you mean
:*:;wby::what about you
:*:;afaik::as far as i know
:*:;iirc::if i remember correctly
:*:;imo::in my opinion

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
:*:;spanishn::
{
	SendRmLast("ñ")
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
	Send FormatTime(, "HH:mm")
}
:*:;coin::
{
	Send Random(0, 1) ? "heads" : "tails"
}
:*:;rand::
{
	Send Random(0.0, 1.0)
}
:*:;hash::
{
	hash := ""
	Loop 32
	{
		value := Random(0, 15)
		hash .= (value < 10) ? value : Chr(value + 87)
	}
	Send hash
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