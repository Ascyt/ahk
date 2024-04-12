#Requires AutoHotkey v2.0
#SingleInstance force
A_MaxHotkeysPerInterval := 300

lastTooltip := ""
lastMouseX := 0
lastMouseY := 0

RunDialogue(arg, useSingleChar)
{
	SendText "{  }"
    SendInput("{Left 2}")

    ArgObj := FileOpen(".\type_shortcut_args.txt", "w")
    ArgObj.Write(arg "`n1" "`n" (useSingleChar?"1":"0")) 
    ArgObj.Close()

	RunWait "./type_shortcut.exe"

	OutputObj := FileOpen(".\type_shortcut_output.txt", "r")
	Line := OutputObj.Read()
	OutputObj.Close()

    SendInput("{Delete 2}{Backspace 2}")

    return Line
}
RunDialogueAnywhere(arg, useSingleChar)
{
    ArgObj := FileOpen(".\type_shortcut_args.txt", "w")
    ArgObj.Write(arg "`n0" "`n" (useSingleChar?"1":"0")) 
    ArgObj.Close()

	RunWait "./type_shortcut.exe"

	OutputObj := FileOpen(".\type_shortcut_output.txt", "r")
	Line := OutputObj.Read()
	OutputObj.Close()

	return Line
}

CapsLock::
{
	SetCapsLockState false
}

!CapsLock::CapsLock

CapsLock & u::
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
CapsLock & LButton::^v
CapsLock & RButton::^c
CapsLock & MButton::^x
CapsLock & WheelDown::Right
CapsLock & WheelUp::Left
CapsLock & WheelLeft::Backspace
CapsLock & WheelRight::Delete
CapsLock & XButton1::^z
CapsLock & XButton2::^y

ReplaceText(from, to)
{
	OldClipboard := A_Clipboard

	SendInput "^x"
	Sleep 10

	A_Clipboard := StrReplace(A_Clipboard, from, to)

	Sleep 10
	SendInput "^v"
	Sleep 10

	A_Clipboard := OldClipboard
}
UpperText()
{
	OldClipboard := A_Clipboard

	SendInput "^x"
	
	Sleep 10

	A_Clipboard := StrUpper(A_Clipboard)
	Sleep 10
	SendInput "^v"
	Sleep 10

	A_Clipboard := OldClipboard
}
LowerText()
{
	OldClipboard := A_Clipboard

	SendInput "^x"
	Sleep 10

	A_Clipboard := StrLower(A_Clipboard)
	Sleep 10
	SendInput "^v"
	Sleep 10

	A_Clipboard := OldClipboard
}
ReverseText()
{
	OldClipboard := A_Clipboard

	SendInput "^x"
	Sleep 10

	txt := A_Clipboard
	reversedText := ""
    Loop StrLen(txt)
    {
        reversedText .= SubStr(txt, -A_Index, 1)
    }
	A_Clipboard := reversedText

	Sleep 10
	SendInput "^v"
	Sleep 10

	A_Clipboard := OldClipboard
}
CountText()
{
	TrayTip
	OldClipboard := A_Clipboard

	SendInput "^c"
	Sleep 10

	TrayTip StrLen(StrReplace(A_Clipboard, "`r`n", "`n")) " characters in selection"

	A_Clipboard := OldClipboard
}
RepeatKey(key, times) 
{
	Loop times
	{
		SendInput "{" key "}"
	}
}

; Open special run dialogue
SpecialRunDialogue()
{
    ArgObj := FileOpen(".\type_shortcut_args.txt", "w")
    ArgObj.Write("RUN`n0")
    ArgObj.Close()

	RunWait "./type_shortcut.exe"

	OutputObj := FileOpen(".\type_shortcut_output.txt", "r")
	Line := OutputObj.Read()
	OutputObj.Close()

	if Line == "`b"
	{
		return
	}

	if Line == "timer"
	{
		Run "./timer.exe"
		return
	}

	if Line == "sw"
	{
		Run "./stopwatch.exe"
		return
	}

	if Line == "replace"
	{
		from := RunDialogueAnywhere("from", false)
		if from == "`b" || from == ""
			return

		to := RunDialogueAnywhere("to", false)
		if to == "`b" || to == ""
			return

		ReplaceText(from, to)
		return
	}
	if Line == "upper"
	{
		UpperText()
		return
	}
	if Line == "lower"
	{
		LowerText()
		return
	}
	if Line == "reverse"
	{
		ReverseText()
		return
	}
	if Line == "count"
	{
		CountText()
		return
	}
	if Line == "key"
	{
		key := RunDialogueAnywhere("key", false)
		if key == "`b" || key == ""
			return

		amount := RunDialogueAnywhere("amount", false)
		if amount == "`b" || amount == ""
			return

		RepeatKey(key, amount)
		return
	}


	Run "python.exe program_shortcuts.py " Line
}

CapsLock & ':: 
{
	SpecialRunDialogue()
}

CapsLock & m::
{
	character := RunDialogueAnywhere("umlaut", true)

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
	}

	SetCapsLockState false
}

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