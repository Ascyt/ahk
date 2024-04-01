#Requires AutoHotKey v2
#SingleInstance
A_MaxHotkeysPerInterval := 3000

keyList := ""
previousKeyList := "{empty}"
oldMouseX := 0
oldMouseY := 0

confirm := false
stop := false

OnPress(key) 
{
    global keyList
    keyList .= key
    
    global maxLength
    if maxLength > 0 && StrLen(keyList) >= maxLength
    {
        ExitConfirm()
    }

    global useTextInput
    if useTextInput
    {
        SendText(key)

        if key == "("
        {
            SendText ")"
            SendInput("{Shift down}{Backspace}{Shift up}")
        }
        if key == "["
        {
            SendText "]"
            SendInput("{Shift down}{Backspace}{Shift up}")
        }
        if key == "{"
        {
            SendText "}"
            SendInput("{Shift down}{Backspace}{Shift up}")
        }
        if key == "<"
        {
            SendText ">"
            SendInput("{Shift down}{Backspace}{Shift up}")
        }
        if key == "`""
        {
            SendText "`""
            SendInput("{Shift down}{Backspace}{Shift up}")
        }
        if key == "'"
        {
            SendText "'"
            SendInput("{Shift down}{Backspace}{Shift up}")
        }
        if key == "``"
        {
            SendText "``"
            SendInput("{Shift down}{Backspace}{Shift up}")
        }
    }
}
SendClipboard()
{
    global keyList, useTextInput, maxLength

    keyList .= A_Clipboard
    if maxLength > 0 && StrLen(keyList) >= maxLength
    {
        keyList := SubStr(keyList, 1, maxLength)

        ExitConfirm()
    }


    if useTextInput
    {
        SendText(A_Clipboard)
    }
}
RemoveLast()
{
    global keyList

    global useTextInput
    if useTextInput && StrLen(keyList) > 0
    {
        SendInput("{Shift down}{Backspace}{Shift up}")
    }

    keyList := SubStr(keyList, 1, StrLen(keyList) - 1)
}
RemoveUntilSpace()
{
    global keyList
    ; Remove last if space 
    if (SubStr(keyList, -1) == " ")
    {
        RemoveLast()
        return
    }

    while (StrLen(keyList) > 0 && SubStr(keyList, -1) != " ")
    {
        RemoveLast()
    }
}
RemoveAmount(amount)
{
    global keyList

    global useTextInput
    if useTextInput
    {
        SendInput("{Shift down}{Backspace " Min(StrLen(keyList), amount) "}{Shift up}")
    }

    keyList := SubStr(keyList, 1, StrLen(keyList) - amount)
}
ClearAll()
{
    global keyList

    global useTextInput
    if useTextInput
    {
        SendInput("{Shift down}{Backspace " StrLen(keyList) "}{Shift up}")
    }

    keyList := ""
}

ExitCopy() 
{
    global keyList
    A_Clipboard := keyList
    ExitStop()
}
ExitConfirm() 
{
    global confirm
    confirm := true
}
ExitStop() 
{
    global stop
    stop := true
}

StartsWithNumber(str)
{
    return RegExMatch(SubStr(str, 1, 1), "^\d")
}

a::OnPress("a")
b::OnPress("b")
c::OnPress("c")
d::OnPress("d")
e::OnPress("e")
f::OnPress("f")
g::OnPress("g")
h::OnPress("h")
i::OnPress("i")
j::OnPress("j")
k::OnPress("k")
l::OnPress("l")
m::OnPress("m")
n::OnPress("n")
o::OnPress("o")
p::OnPress("p")
q::OnPress("q")
r::OnPress("r")
s::OnPress("s")
t::OnPress("t")
u::OnPress("u")
v::OnPress("v")
w::OnPress("w")
x::OnPress("x")
y::OnPress("y")
z::OnPress("z")
+a::OnPress("A")
+b::OnPress("B")
+c::OnPress("C")
+d::OnPress("D")
+e::OnPress("E")
+f::OnPress("F")
+g::OnPress("G")
+h::OnPress("H")
+i::OnPress("I")
+j::OnPress("J")
+k::OnPress("K")
+l::OnPress("L")
+m::OnPress("M")
+n::OnPress("N")
+o::OnPress("O")
+p::OnPress("P")
+q::OnPress("Q")
+r::OnPress("R")
+s::OnPress("S")
+t::OnPress("T")
+u::OnPress("U")
+v::OnPress("V")
+w::OnPress("W")
+x::OnPress("X")
+y::OnPress("Y")
+z::OnPress("Z")

1::OnPress("1")
+1::OnPress("!")
2::OnPress("2")
+2::OnPress("@")
3::OnPress("3")
+3::OnPress("#")
4::OnPress("4")
+4::OnPress("$")
5::OnPress("5")
+5::OnPress("%")
6::OnPress("6")
+6::OnPress("^")
7::OnPress("7")
+7::OnPress("&")
8::OnPress("8")
+8::OnPress("*")
9::OnPress("9")
+9::OnPress("(")
0::OnPress("0")
+0::OnPress(")")

/::OnPress("/")
+/::OnPress("?")
.::OnPress(".")
+.::OnPress(">")
,::OnPress(",")
+,::OnPress("<")
`;::OnPress(";")
+`;::OnPress(":")
'::OnPress("'")
+'::OnPress("`"")
[::OnPress("[")
+[::OnPress("{")
]::OnPress("]")
+]::OnPress("}")
\::OnPress("\")
+\::OnPress("|")
-::OnPress("-")
+-::OnPress("_")
=::OnPress("=")
+=::OnPress("+")
`::OnPress("``")
+`::OnPress("~")

Space::OnPress(" ")
BackSpace::RemoveLast()
^BackSpace::RemoveUntilSpace()
CapsLock & H::RemoveLast()
Capslock & T::RemoveUntilSpace()
CapsLock & N::RemoveAmount(5)
CapsLock & S::ClearAll()

Enter::ExitConfirm()
+Enter::ExitCopy()
Alt::ExitCopy()
Esc::ExitStop()
LButton::ExitConfirm()
RButton::ExitStop()
MButton::ExitCopy()

^v::SendClipboard()

Left::Return
Right::Return
Up::Return
Down::Return
CapsLock & a::Return
CapsLock & e::Return
CapsLock & ,::Return
CapsLock & o::Return

ArgObj := FileOpen(".\type_shortcut_args.txt", "r")
args := StrSplit(ArgObj.Read(), "`n")
name := args[1]
useTextInput := args[2] == "1" 
maxLength := args.Length >= 3 ? args[3] : -1

if useTextInput
{
    SendText(name " > []")
    SendInput("{Left}")
}

ArgObj.Close()

while !confirm && !stop
{
    if !useTextInput
    {
        mouseX := 0
        mouseY := 0
        MouseGetPos (&mouseX, &mouseY)
    }

    if keyList != previousKeyList || (!useTextInput && (oldMouseX != mouseX || oldMouseY != mouseY))
    {
        if !useTextInput 
        {
            Tooltip name " > [" keyList "]"
            oldMouseX := mouseX
            oldMouseY := mouseY
        }
        previousKeyList := keyList
    }
}

ToolTip
if useTextInput
{
    SendInput("{Right}{Shift down}{Backspace " StrLen(name) + StrLen(keyList) + 5 "}{Shift up}")
}

if confirm
    output := keyList
else if stop
    output := "`b"

OutputObj := FileOpen(".\type_shortcut_output.txt", "w")
OutputObj.Write(output)
OutputObj.Close()
ExitApp