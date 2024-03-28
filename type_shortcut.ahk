#Requires AutoHotKey v2
#SingleInstance
A_MaxHotkeysPerInterval := 3000

keyList := ""
previousKeyList := ""
oldMouseX := 0
oldMouseY := 0

confirm := false
stop := false

OnPress(key) 
{
    global keyList
    keyList .= key
}
RemoveLast()
{
    global keyList
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
    keyList := SubStr(keyList, 1, StrLen(keyList) - amount)
}
ClearAll()
{
    global keyList
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
    global keyList
    if StartsWithNumber(keyList)
    {
        keylist := Calculate(keyList)
    }
    else 
    {
        global confirm
        confirm := true
    }
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

Calculate(str)
{
    ; Calculate expression from left to right
    result := 0
    operator := ""
    value := ""
    lastOperatorIndex := -1
    
    Loop parse, str, ""
    {
        char := A_LoopField
        i := A_Index
        if ((char == "+" || char == "-" || char == "*" || char == "/" || char == "^" || char == "%" || i == StrLen(str) + 1) && (i - lastOperatorIndex > 1))
        {
            ; evaluate expression
            if (value != "") ; ensure value is not empty
            {
                if (operator == "+")
                {
                    result += Float(value)
                }
                else if (operator == "-")
                {
                    result -= Float(value)
                }
                else if (operator == "*")
                {
                    result *= Float(value)
                }
                else if (operator == "/")
                {
                    result /= Float(value)
                }
                else if (operator == "^")
                {
                    result := result ** Float(value)
                }
                else if (operator == "%")
                {
                    result := Mod(result, Float(value))
                }
                else
                {
                    result := Float(value)
                }
            }
            value := "" ; reset value
            if (i != StrLen(str) + 1) ; only set operator if not end of string
            {
                operator := char
                lastOperatorIndex := i
            }
        }
        else 
        {
            value .= char
        }
    }

    ; handle last number
    if (value != "")
    {
        if (operator == "+")
        {
            result += Float(value)
        }
        else if (operator == "-")
        {
            result -= Float(value)
        }
        else if (operator == "*")
        {
            result *= Float(value)
        }
        else if (operator == "/")
        {
            result /= Float(value)
        }
        else if (operator == "^")
        {
            result := result ** Float(value)
        }
        else if (operator == "%")
        {
            result := Mod(result, Float(value))
        }
    }

    if Mod(result, 1) < 0.0000000000001 && Mod(result, 1) > -0.0000000000001
    {
        return String(Integer(result))
    }
    return String(result)
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
.::OnPress(".")
,::OnPress(",")
`;::OnPress(";")
+`;::OnPress(":")
'::OnPress("'")
[::OnPress("[")
]::OnPress("]")
\::OnPress("\")
-::OnPress("-")
=::OnPress("=")
+=::OnPress("+")
`::OnPress("``")

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
LButton::ExitStop()
RButton::ExitConfirm()
MButton::ExitCopy()

while !confirm && !stop
{
    mouseX := 0
    mouseY := 0
    MouseGetPos (&mouseX, &mouseY)

    if (keyList != previousKeyList || oldMouseX != mouseX || oldMouseY != mouseY)
    {
        Tooltip "> [" keyList "]"
        previousKeyList := keyList
        oldMouseX := mouseX
        oldMouseY := mouseY
    }
}

ToolTip

if confirm 
{
    Run "python.exe program_shortcuts.py " keyList
}
ExitApp