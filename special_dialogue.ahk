#Requires AutoHotkey v2.0
#SingleInstance force
A_MaxHotkeysPerInterval := 300
ReplaceText(from, to)
{
	OldClipboard := A_Clipboard

	SendInput "^x"
	Sleep 50

	A_Clipboard := StrReplace(A_Clipboard, from, to)

	Sleep 50
	SendInput "^v"
	Sleep 50

	A_Clipboard := OldClipboard
}
UpperText()
{
	OldClipboard := A_Clipboard

	SendInput "^x"
	
	Sleep 50

	A_Clipboard := StrUpper(A_Clipboard)
	Sleep 50
	SendInput "^v"
	Sleep 50

	A_Clipboard := OldClipboard
}
LowerText()
{
	OldClipboard := A_Clipboard

	SendInput "^x"
	Sleep 50

	A_Clipboard := StrLower(A_Clipboard)
	Sleep 50
	SendInput "^v"
	Sleep 50

	A_Clipboard := OldClipboard
}
ReverseText()
{
	OldClipboard := A_Clipboard

	SendInput "^x"
	Sleep 50

	txt := A_Clipboard
	reversedText := ""
    Loop StrLen(txt)
    {
        reversedText .= SubStr(txt, -A_Index, 1)
    }
	A_Clipboard := reversedText

	Sleep 50
	SendInput "^v"
	Sleep 50

	A_Clipboard := OldClipboard
}
CalculateText() 
{
	OldClipboard := A_Clipboard

	SendInput "^x"
	Sleep 50

	txt := A_Clipboard

	RunWait("python.exe calc.py " txt, , "Hide")

	OutputObj := FileOpen(".\calc_output.txt", "r")
	Line := OutputObj.Read()
	OutputObj.Close()

	A_Clipboard := Line

	Sleep 50
	SendInput "^v"
	Sleep 50

	A_Clipboard := OldClipboard
}
CountText()
{
	TrayTip
	OldClipboard := A_Clipboard

	SendInput "^c"
	Sleep 50

	TrayTip StrLen(StrReplace(A_Clipboard, "`r`n", "`n")) " characters in selection"

	A_Clipboard := OldClipboard
}
RepeatKey(key, times) 
{
	Loop times
	{
		SendInput "{" key "}"
		Sleep 50
	}
}

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

	if Line == "r"
	{
		from := RunDialogueAnywhere("from", false)
		if from == "`b" || from == ""
			return

		to := RunDialogueAnywhere("to", false)
		if to == "`b" 
			to := ""

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
	if Line == "calc"
	{
		CalculateText()
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

UmlautDialogue()
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
}

ProcessClose "caps.exe"

arg := A_Args[1]

switch arg
{
    case "run":
        SpecialRunDialogue()
	case "umlaut":
		UmlautDialogue()
	case "calc":
		CalculateText()
    default:
        TrayTip "Error", "Invalid argument: " arg, 1
}

Run "caps.exe"

ExitApp
